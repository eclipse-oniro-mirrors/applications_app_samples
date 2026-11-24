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
  expectedProgressAfter,
  expectedCompletedProgress,
  clampInt,
  isTerminalStatus,
  progressLabel,
  completionTrace,
  RunSnapshot,
  countOf,
  PROGRESS_TOTAL,
  PROGRESS_INITIAL,
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
  ERROR_NETWORK,
  ERROR_TIMEOUT
} from '../Shared/SharedDriver';

/**
 * Boundary suite for the three progress values and the index helpers of the page.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-64    progressValueA/B/C start at 0, isTaskFinished starts true
 *   68-76    updateProgress writes exactly 100 for one task
 *   98-107   gate between A, B and C
 *   211-247  Progress total is 100 for all three rows
 *
 * The oracle used here (expectedProgressAfter) is bounded and monotone, so the
 * boundary cases below never trust the task class to define its own limits.
 */
export default function boundaryTransfersTest(): void {
  describe('BoundaryTransfers', () => {
    beforeAll(() => {
      logSuite('BoundaryTransfers', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('BoundaryTransfers', 'end');
    });

    /**
     * @tc.name   freshTaskStartsAtZeroIdle
     * @tc.desc   A task constructs idle at progress 0 with no attempts, error or timestamps.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshTaskStartsAtZeroIdle', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      expect(task.progress).assertEqual(PROGRESS_INITIAL);
      expect(task.progress).assertEqual(0);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.isIdle()).assertTrue();
      expect(task.attempts).assertEqual(0);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   zeroProgressKeepsZero
     * @tc.desc   Reporting the lower boundary keeps a fresh task at exactly zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('zeroProgressKeepsZero', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      const value: number = task.reportProgress(0);
      expect(value).assertEqual(0);
      expect(task.progress).assertEqual(0);
      expect(task.progressRatio()).assertEqual(0);
      expect(task.isRunning()).assertFalse();
      expect(task.label()).assertEqual('任务B当前进度 0%');
      expect(expectedProgressAfter(0, 0)).assertEqual(value);
    });

    /**
     * @tc.name   totalProgressReachesHundred
     * @tc.desc   Reporting the upper boundary lands exactly on the page total of 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('totalProgressReachesHundred', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      const value: number = task.reportProgress(PROGRESS_TOTAL);
      expect(value).assertEqual(PROGRESS_TOTAL);
      expect(task.progress).assertEqual(100);
      expect(task.progressRatio()).assertEqual(1);
      expect(value).assertEqual(expectedCompletedProgress());
      expect(task.label()).assertEqual('任务C当前进度 100%');
      expect(task.status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   negativeOneClampsToZero
     * @tc.desc   The first negative boundary value is clamped up to the lower bound.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('negativeOneClampsToZero', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      const value: number = task.reportProgress(-1);
      expect(value).assertEqual(0);
      expect(value).assertEqual(PROGRESS_INITIAL);
      expect(task.progress >= 0).assertTrue();
      expect(task.progress).assertEqual(0);
      expect(task.progressRatio()).assertEqual(0);
      expect(task.progress === -1).assertFalse();
    });

    /**
     * @tc.name   negativeHundredClampsToZero
     * @tc.desc   A far negative value is still clamped to zero rather than wrapped or rejected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('negativeHundredClampsToZero', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      const value: number = task.reportProgress(-100);
      expect(value).assertEqual(PROGRESS_INITIAL);
      expect(value).assertEqual(clampInt(-100, PROGRESS_INITIAL, PROGRESS_TOTAL));
      expect(task.progress).assertEqual(0);
      expect(task.progress).assertLess(PROGRESS_TOTAL);
      expect(task.label().indexOf('0%')).assertLarger(0);
      expect(task.status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   oneAboveTotalClampsToHundred
     * @tc.desc   A value immediately above the range is clamped down to the total.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oneAboveTotalClampsToHundred', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      const value: number = task.reportProgress(PROGRESS_TOTAL + 1);
      expect(value).assertEqual(PROGRESS_TOTAL);
      expect(value).assertEqual(100);
      expect(task.progress).assertEqual(100);
      expect(task.progress <= PROGRESS_TOTAL).assertTrue();
      expect(task.progressRatio()).assertEqual(1);
      expect(task.progress === 101).assertFalse();
    });

    /**
     * @tc.name   farAboveTotalClampsToHundred
     * @tc.desc   Even an outsized number is saturated at the total instead of overflowing the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('farAboveTotalClampsToHundred', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      const value: number = task.reportProgress(10000);
      expect(value).assertEqual(PROGRESS_TOTAL);
      expect(value).assertEqual(clampInt(10000, 0, 100));
      expect(task.progress).assertEqual(100);
      expect(task.progressRatio() <= 1).assertTrue();
      expect(task.label()).assertEqual(progressLabel(TASK_A, 100));
      expect(task.progress > PROGRESS_TOTAL).assertFalse();
    });

    /**
     * @tc.name   equalValueIsIdempotent
     * @tc.desc   Reporting the same value twice leaves the stored progress unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('equalValueIsIdempotent', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      const first: number = task.reportProgress(50);
      const second: number = task.reportProgress(50);
      expect(first).assertEqual(50);
      expect(second).assertEqual(50);
      expect(second).assertEqual(first);
      expect(task.progress).assertEqual(50);
      expect(task.progressRatio()).assertEqual(0.5);
      expect(task.label()).assertEqual('任务B当前进度 50%');
    });

    /**
     * @tc.name   lowerValueNeverMovesBackwards
     * @tc.desc   The monotone rule keeps the high water mark when a smaller value arrives.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lowerValueNeverMovesBackwards', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      expect(task.reportProgress(40)).assertEqual(40);
      const value: number = task.reportProgress(25);
      expect(value).assertEqual(40);
      expect(task.progress).assertEqual(40);
      expect(task.progress >= 25).assertTrue();
      expect(value).assertEqual(expectedProgressAfter(40, 25));
      expect(task.progress === 25).assertFalse();
    });

    /**
     * @tc.name   repeatedDescentsStayAtHighWaterMark
     * @tc.desc   Several descending reports never lower the value below the earlier peak.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedDescentsStayAtHighWaterMark', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.reportProgress(90);
      expect(task.reportProgress(80)).assertEqual(90);
      expect(task.reportProgress(10)).assertEqual(90);
      expect(task.reportProgress(0)).assertEqual(90);
      expect(task.progress).assertEqual(90);
      expect(task.progressRatio()).assertEqual(0.9);
      expect(task.label()).assertEqual('任务A当前进度 90%');
      logStep('boundaryTransfers', 'descending reports keep the high water mark');
    });

    /**
     * @tc.name   progressRatioTracksBoundedValue
     * @tc.desc   The ratio reported for each boundary input equals the bounded value divided by the total.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressRatioTracksBoundedValue', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      const inputs: number[] = [-50, 0, 25, 50, 100, 250];
      const expected: number[] = [0, 0, 0.25, 0.5, 1, 1];
      for (let index = 0; index < inputs.length; index++) {
        task.reset();
        const stored: number = task.reportProgress(inputs[index]);
        expect(stored).assertEqual(clampInt(inputs[index], 0, PROGRESS_TOTAL));
        expect(task.progressRatio()).assertEqual(expected[index]);
        expect(task.progress).assertEqual(stored);
      }
      expect(task.progressRatio()).assertEqual(1);
      expect(inputs.length).assertEqual(expected.length);
    });

    /**
     * @tc.name   progressRatioIsZeroForUntouchedTasks
     * @tc.desc   All three untouched tasks report a zero ratio and a zero percentage label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressRatioIsZeroForUntouchedTasks', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let index = 0; index < graph.tasks.length; index++) {
        const task: DownloadTask = graph.taskAt(index);
        expect(task.progress).assertEqual(0);
        expect(task.progressRatio()).assertEqual(0);
        expect(task.label().indexOf('0%')).assertLarger(0);
        expect(task.isIdle()).assertTrue();
      }
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.averageProgress()).assertEqual(0);
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   completionWritesExactlyHundred
     * @tc.desc   Completing a running task writes the page constant 100 for every task number.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionWritesExactlyHundred', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let index = 0; index < graph.tasks.length; index++) {
        const task: DownloadTask = graph.taskAt(index);
        expect(task.start(100)).assertTrue();
        expect(task.isRunning()).assertTrue();
        expect(task.attempts).assertEqual(1);
        expect(task.complete(200)).assertTrue();
        expect(task.progress).assertEqual(expectedCompletedProgress());
        expect(task.progress).assertEqual(100);
        expect(task.isComplete()).assertTrue();
        expect(task.finishedAt).assertEqual(200);
      }
      expect(graph.allCompleted()).assertTrue();
      expect(graph.totalProgress()).assertEqual(300);
    });

    /**
     * @tc.name   completionOverridesPartialProgress
     * @tc.desc   A task that only reached part of the bar still finishes at exactly 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionOverridesPartialProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const task: DownloadTask = graph.taskAt(0);
      task.start(10);
      expect(task.reportProgress(37)).assertEqual(37);
      expect(task.progress).assertLess(PROGRESS_TOTAL);
      const done: boolean = task.complete(500);
      expect(done).assertTrue();
      expect(task.progress).assertEqual(100);
      expect(task.progress > 37).assertTrue();
      expect(task.progressRatio()).assertEqual(1);
      expect(task.isComplete()).assertTrue();
      expect(task.isRunning()).assertFalse();
    });

    /**
     * @tc.name   completedTaskIgnoresLaterProgress
     * @tc.desc   After completion every later progress report is discarded, even a valid one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completedTaskIgnoresLaterProgress', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.complete(1);
      const values: number[] = [0, 25, 50, 75, 100];
      for (let index = 0; index < values.length; index++) {
        expect(task.reportProgress(values[index])).assertEqual(100);
        expect(task.progress).assertEqual(100);
      }
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.progressRatio()).assertEqual(1);
      expect(task.finishedAt).assertEqual(1);
      expect(isTerminalStatus(task.status)).assertTrue();
    });

    /**
     * @tc.name   completedTaskIgnoresNegativeProgress
     * @tc.desc   A negative report cannot pull a completed task below the total.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completedTaskIgnoresNegativeProgress', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(0);
      task.complete(2);
      expect(task.reportProgress(-1)).assertEqual(100);
      expect(task.reportProgress(-1000)).assertEqual(100);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.progress > 0).assertTrue();
      expect(task.progressRatio()).assertEqual(1);
      expect(task.label()).assertEqual('任务C当前进度 100%');
      expect(isTerminalStatus(task.status)).assertTrue();
    });

    /**
     * @tc.name   completionTwiceRejectsSecondCall
     * @tc.desc   complete() is idempotent: the second call reports false and keeps the first timestamp.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionTwiceRejectsSecondCall', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      expect(task.complete(50)).assertTrue();
      expect(task.complete(99)).assertFalse();
      expect(task.finishedAt).assertEqual(50);
      expect(task.progress).assertEqual(100);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.isComplete()).assertTrue();
      expect(task.attempts).assertEqual(1);
    });

    /**
     * @tc.name   failedTaskFreezesProgressAtLastValue
     * @tc.desc   A failure keeps the last partial progress instead of forcing it to the total.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedTaskFreezesProgressAtLastValue', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      expect(task.reportProgress(60)).assertEqual(60);
      expect(task.fail(ERROR_NETWORK)).assertTrue();
      expect(task.isFailed()).assertTrue();
      expect(task.lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(task.progress).assertEqual(60);
      expect(task.progress).assertLess(100);
      expect(task.progressRatio()).assertEqual(0.6);
      expect(isTerminalStatus(task.status)).assertTrue();
    });

    /**
     * @tc.name   failedTaskIgnoresProgressIncrease
     * @tc.desc   A failed task reports its frozen value even when a larger progress arrives.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedTaskIgnoresProgressIncrease', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(0);
      task.reportProgress(20);
      task.fail(ERROR_TIMEOUT);
      expect(task.reportProgress(80)).assertEqual(20);
      expect(task.reportProgress(100)).assertEqual(20);
      expect(task.progress).assertEqual(20);
      expect(task.progress === 80).assertFalse();
      expect(task.lastErrorCode).assertEqual(ERROR_TIMEOUT);
      expect(task.progressRatio()).assertEqual(0.2);
      expect(task.label()).assertEqual('任务C当前进度 20%');
    });

    /**
     * @tc.name   failAfterCompletionIsRejected
     * @tc.desc   A completed task cannot be turned into a failed one by a late error callback.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failAfterCompletionIsRejected', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.complete(10);
      expect(task.fail(ERROR_NETWORK)).assertFalse();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.isComplete()).assertTrue();
      expect(task.isFailed()).assertFalse();
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
      expect(task.progress).assertEqual(100);
      expect(task.finishedAt).assertEqual(10);
    });

    /**
     * @tc.name   startAfterFailureIsRejected
     * @tc.desc   Failure is terminal for the task instance, so a restart needs a reset first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startAfterFailureIsRejected', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      expect(task.start(0)).assertTrue();
      task.fail(ERROR_TIMEOUT);
      expect(task.start(5)).assertFalse();
      expect(task.attempts).assertEqual(1);
      expect(task.isFailed()).assertTrue();
      expect(task.startedAt).assertEqual(0);
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.progress).assertEqual(0);
    });

    /**
     * @tc.name   startRejectsSecondStart
     * @tc.desc   A running task ignores a second start and does not count another attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startRejectsSecondStart', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      expect(task.start(10)).assertTrue();
      expect(task.attempts).assertEqual(1);
      expect(task.start(20)).assertFalse();
      expect(task.attempts).assertEqual(1);
      expect(task.startedAt).assertEqual(10);
      expect(task.isRunning()).assertTrue();
      expect(task.isIdle()).assertFalse();
    });

    /**
     * @tc.name   startAfterResetIsAllowed
     * @tc.desc   reset() returns the task to the idle boundary, after which start() succeeds again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startAfterResetIsAllowed', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.complete(5);
      expect(task.start(9)).assertFalse();
      task.reset();
      expect(task.progress).assertEqual(0);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.start(30)).assertTrue();
      expect(task.attempts).assertEqual(2);
      expect(task.startedAt).assertEqual(30);
      expect(task.isRunning()).assertTrue();
    });

    /**
     * @tc.name   terminalStatusPredicateMatrix
     * @tc.desc   Only completed and failed count as terminal over the whole status vocabulary.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('terminalStatusPredicateMatrix', 0, () => {
      const statuses: string[] = [STATUS_IDLE, STATUS_RUNNING, STATUS_COMPLETED, STATUS_FAILED, '', 'pending'];
      const expected: boolean[] = [false, false, true, true, false, false];
      for (let index = 0; index < statuses.length; index++) {
        expect(isTerminalStatus(statuses[index])).assertEqual(expected[index]);
      }
      expect(isTerminalStatus(STATUS_COMPLETED)).assertTrue();
      expect(isTerminalStatus(STATUS_FAILED)).assertTrue();
      expect(isTerminalStatus(STATUS_IDLE)).assertFalse();
      expect(isTerminalStatus(STATUS_RUNNING)).assertFalse();
      expect(statuses.length).assertEqual(6);
    });

    /**
     * @tc.name   terminalStatusIsCaseSensitive
     * @tc.desc   Mixed-case spellings of completed and failed are not terminal statuses.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('terminalStatusIsCaseSensitive', 0, () => {
      expect(isTerminalStatus('Completed')).assertFalse();
      expect(isTerminalStatus('COMPLETED')).assertFalse();
      expect(isTerminalStatus('Failed')).assertFalse();
      expect(isTerminalStatus('FAILED')).assertFalse();
      expect(isTerminalStatus(STATUS_COMPLETED.toUpperCase())).assertFalse();
      expect(isTerminalStatus(STATUS_FAILED.toUpperCase())).assertFalse();
      expect(isTerminalStatus(STATUS_COMPLETED)).assertTrue();
      expect(isTerminalStatus(STATUS_FAILED)).assertTrue();
      logStep('boundaryTransfers', 'terminal predicate is case sensitive');
    });

    /**
     * @tc.name   clampIntAtLowerEdge
     * @tc.desc   The clamp helper returns the lower bound for every value beneath it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clampIntAtLowerEdge', 0, () => {
      expect(clampInt(-1, 0, 100)).assertEqual(0);
      expect(clampInt(-100, 0, 100)).assertEqual(0);
      expect(clampInt(-999999, 0, 100)).assertEqual(0);
      expect(clampInt(0, 0, 100)).assertEqual(0);
      expect(clampInt(-1, 0, 100)).assertEqual(PROGRESS_INITIAL);
      expect(clampInt(-5, 10, 20)).assertEqual(10);
      expect(clampInt(-5, 10, 20) === 20).assertFalse();
    });

    /**
     * @tc.name   clampIntAtUpperEdge
     * @tc.desc   The clamp helper saturates every value above the range at the upper bound.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clampIntAtUpperEdge', 0, () => {
      expect(clampInt(101, 0, 100)).assertEqual(100);
      expect(clampInt(1000, 0, 100)).assertEqual(100);
      expect(clampInt(100, 0, 100)).assertEqual(PROGRESS_TOTAL);
      expect(clampInt(21, 10, 20)).assertEqual(20);
      expect(clampInt(1000, 0, 100) === 1000).assertFalse();
      expect(clampInt(101, 0, 100)).assertEqual(expectedCompletedProgress());
      expect(clampInt(100, 0, 100)).assertLess(101);
    });

    /**
     * @tc.name   clampIntInsideRangeIsUnchanged
     * @tc.desc   Values already inside the range pass through the clamp untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clampIntInsideRangeIsUnchanged', 0, () => {
      const values: number[] = [0, 1, 25, 50, 75, 99, 100];
      for (let index = 0; index < values.length; index++) {
        expect(clampInt(values[index], 0, 100)).assertEqual(values[index]);
      }
      expect(clampInt(33, 10, 20)).assertEqual(20);
      expect(clampInt(11, 10, 20)).assertEqual(11);
      expect(clampInt(50, 0, 100)).assertEqual(50);
      expect(values.length).assertEqual(7);
    });

    /**
     * @tc.name   clampIntWithDegenerateRangeReturnsBound
     * @tc.desc   When both bounds coincide the clamp always returns that shared value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clampIntWithDegenerateRangeReturnsBound', 0, () => {
      expect(clampInt(5, 3, 3)).assertEqual(3);
      expect(clampInt(2, 3, 3)).assertEqual(3);
      expect(clampInt(-7, 3, 3)).assertEqual(3);
      expect(clampInt(0, 0, 0)).assertEqual(0);
      expect(clampInt(100, 0, 0)).assertEqual(0);
      expect(clampInt(3, 3, 3)).assertEqual(3);
      expect(clampInt(5, 3, 3) === 5).assertFalse();
    });

    /**
     * @tc.name   expectedOracleAgreesWithTaskReporting
     * @tc.desc   For a chain of inputs the oracle and the task agree on every intermediate value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectedOracleAgreesWithTaskReporting', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      const inputs: number[] = [-10, 0, 12, 12, 45, 30, 100, 120, 99, -5];
      let previous: number = 0;
      for (let index = 0; index < inputs.length; index++) {
        const oracle: number = expectedProgressAfter(previous, inputs[index]);
        const stored: number = task.reportProgress(inputs[index]);
        expect(stored).assertEqual(oracle);
        expect(stored >= previous).assertTrue();
        previous = stored;
      }
      expect(task.progress).assertEqual(100);
      expect(previous).assertEqual(100);
      expect(inputs.length).assertEqual(10);
    });

    /**
     * @tc.name   expectedCompletedProgressIsTotal
     * @tc.desc   The completion oracle returns the same constant the page writes for a finished row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectedCompletedProgressIsTotal', 0, () => {
      expect(expectedCompletedProgress()).assertEqual(PROGRESS_TOTAL);
      expect(expectedCompletedProgress()).assertEqual(100);
      expect(expectedCompletedProgress()).assertLarger(99);
      expect(expectedCompletedProgress() > 0).assertTrue();
      expect(expectedCompletedProgress()).assertEqual(clampInt(1000, 0, 100));
      expect(PROGRESS_TOTAL - expectedCompletedProgress()).assertEqual(0);
      expect(PROGRESS_INITIAL).assertEqual(0);
    });

    /**
     * @tc.name   labelEmbedsTaskNumberAndBoundedValue
     * @tc.desc   The rendered label carries the task number and the clamped percentage.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('labelEmbedsTaskNumberAndBoundedValue', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      task.reportProgress(150);
      expect(task.label()).assertEqual('任务C当前进度 100%');
      expect(task.label()).assertEqual(progressLabel(TASK_C, 100));
      expect(task.label().indexOf(TASK_C)).assertLarger(0);
      expect(task.label().indexOf('100%')).assertLarger(0);
      expect(task.label().endsWith('%')).assertTrue();
      expect(task.label().length).assertEqual('任务C当前进度 100%'.length);
      expect(task.progress).assertEqual(100);
    });

    /**
     * @tc.name   unknownTaskNumberCannotComplete
     * @tc.desc   Completing a task number the graph does not contain returns false and changes nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('unknownTaskNumberCannotComplete', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.completeTask('Z')).assertFalse();
      expect(graph.completeTask('AB')).assertFalse();
      expect(graph.completeTask('a')).assertFalse();
      expect(completionTrace(graph)).assertEqual('');
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   emptyTaskNumberCannotComplete
     * @tc.desc   An empty task number is not a key of the graph, so completion is refused.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyTaskNumberCannotComplete', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.completeTask('')).assertFalse();
      expect(graph.taskByNo('')).assertUndefined();
      expect(completionTrace(graph)).assertEqual('');
      expect(graph.allCompleted()).assertFalse();
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(countOf([''], '')).assertEqual(1);
    });

    /**
     * @tc.name   emptyTaskNumberLabelHasNoNumber
     * @tc.desc   An empty task number yields a label without a task character and a describe with a leading colon.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyTaskNumberLabelHasNoNumber', 0, () => {
      const task: DownloadTask = new DownloadTask('', URL_TASK_A);
      expect(task.taskNo).assertEqual('');
      expect(task.label()).assertEqual('任务当前进度 0%');
      expect(task.describe()).assertEqual(':idle:0');
      expect(task.describe().startsWith(':')).assertTrue();
      expect(task.reportProgress(30)).assertEqual(30);
      expect(task.label()).assertEqual('任务当前进度 30%');
      expect(task.progressRatio()).assertEqual(0.3);
      expect(task.isIdle()).assertTrue();
    });

    /**
     * @tc.name   negativeIndexClampsToFirstTask
     * @tc.desc   The index accessor clamps every negative index to the first page row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('negativeIndexClampsToFirstTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.taskAt(-1).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(-2).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(-100).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(-1) === graph.taskAt(0)).assertTrue();
      expect(graph.taskAt(-3).url).assertEqual(URL_TASK_A);
      expect(graph.taskAt(-1).progress).assertEqual(0);
      expect(graph.taskAt(-1).isIdle()).assertTrue();
    });

    /**
     * @tc.name   oversizedIndexClampsToLastTask
     * @tc.desc   The index accessor clamps every index past the end to the last page row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oversizedIndexClampsToLastTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.taskAt(3).taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(4).taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(999).taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(3) === graph.taskAt(2)).assertTrue();
      expect(graph.taskAt(999).url).assertEqual(URL_TASK_C);
      expect(graph.taskAt(999).label()).assertEqual('任务C当前进度 0%');
      expect(graph.taskAt(999).progress).assertEqual(0);
    });

    /**
     * @tc.name   taskAtIndexesPreservePageOrder
     * @tc.desc   The three valid indexes map to A, B and C in the order the page renders them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskAtIndexesPreservePageOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.taskAt(0).taskNo).assertEqual('A');
      expect(graph.taskAt(1).taskNo).assertEqual('B');
      expect(graph.taskAt(2).taskNo).assertEqual('C');
      expect(graph.taskAt(0).url).assertEqual(URL_TASK_A);
      expect(graph.taskAt(1).url).assertEqual(URL_TASK_B);
      expect(graph.taskAt(2).url).assertEqual(URL_TASK_C);
      expect(graph.taskAt(0) === graph.taskAt(1)).assertFalse();
      expect(graph.taskAt(1) === graph.taskAt(2)).assertFalse();
    });

    /**
     * @tc.name   snapshotCapturesBoundaryProgress
     * @tc.desc   A snapshot copies the bounded progress and status of a task at the moment of capture.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotCapturesBoundaryProgress', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.reportProgress(170);
      const snapshot: RunSnapshot = task.snapshot();
      expect(snapshot.taskNo).assertEqual(TASK_A);
      expect(snapshot.progress).assertEqual(100);
      expect(snapshot.status).assertEqual(STATUS_IDLE);
      expect(snapshot.sameAs(new RunSnapshot(TASK_A, 100, STATUS_IDLE))).assertTrue();
      expect(snapshot.describe()).assertEqual('A/idle/100');
      task.reset();
      expect(snapshot.progress).assertEqual(100);
      expect(snapshot.sameAs(task.snapshot())).assertFalse();
    });

    /**
     * @tc.name   resetRestoresBoundaryState
     * @tc.desc   reset() clears progress, status, error and timestamps while keeping the attempt count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetRestoresBoundaryState', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(11);
      task.reportProgress(55);
      task.fail(ERROR_NETWORK);
      expect(task.progress).assertEqual(55);
      task.reset();
      expect(task.progress).assertEqual(0);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
      expect(task.attempts).assertEqual(1);
      expect(task.isIdle()).assertTrue();
    });

    /**
     * @tc.name   graphTotalAfterTwoCompletions
     * @tc.desc   Two finished rows add 200 to the total and leave the third row at the zero boundary.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphTotalAfterTwoCompletions', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.totalProgress()).assertEqual(200);
      expect(graph.averageProgress()).assertLarger(66);
      expect(graph.averageProgress()).assertLess(67);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.taskAt(1).progress).assertEqual(100);
    });

    /**
     * @tc.name   averageProgressOfCompletedGraphIsHundred
     * @tc.desc   When all three rows reach the total the average hits exactly 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('averageProgressOfCompletedGraphIsHundred', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_C);
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.averageProgress()).assertEqual(100);
      expect(graph.averageProgress()).assertEqual(PROGRESS_TOTAL);
      expect(graph.allCompleted()).assertTrue();
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(graph.taskAt(0).progressRatio()).assertEqual(1);
      expect(graph.taskAt(1).progressRatio()).assertEqual(1);
      expect(graph.taskAt(2).progressRatio()).assertEqual(1);
    });

    /**
     * @tc.name   unknownTaskNumberHasNoEntry
     * @tc.desc   Only the three page task numbers resolve through the lookup helper.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('unknownTaskNumberHasNoEntry', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.taskByNo(TASK_A) !== undefined).assertTrue();
      expect(graph.taskByNo(TASK_B) !== undefined).assertTrue();
      expect(graph.taskByNo(TASK_C) !== undefined).assertTrue();
      expect(graph.taskByNo('')).assertUndefined();
      expect(graph.taskByNo('D')).assertUndefined();
      expect(graph.taskByNo('AB')).assertUndefined();
      expect(graph.taskByNo(TASK_A) === graph.taskAt(0)).assertTrue();
    });

    /**
     * @tc.name   reportingProgressBeforeStartStaysBounded
     * @tc.desc   The progress callback may fire before start, and its value is still clamped and stored.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BoundaryTransfers scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reportingProgressBeforeStartStaysBounded', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      expect(task.reportProgress(140)).assertEqual(100);
      expect(task.progress).assertEqual(100);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.isIdle()).assertTrue();
      expect(task.isComplete()).assertFalse();
      expect(task.reportProgress(20)).assertEqual(100);
      expect(task.progressRatio()).assertEqual(1);
    });

  });
}
