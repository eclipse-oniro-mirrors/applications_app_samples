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
 * CoreTaskModel suite of the NetworkSample ohosTest module.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-59    progressValueA / progressValueB / progressValueC
 *   68-76    updateProgress writes the number 100
 *   209-247  the three "任务X当前进度 NN%" labels and 100 total bars
 *
 * The suite is the unit level view of DownloadTask: the two identity fields,
 * the mutable run fields, the guards on start / complete / fail, the clamping
 * of intermediate progress, and the text projections label / describe /
 * snapshot that every other suite reads.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
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
  PROGRESS_TOTAL,
  ERROR_NONE,
  ERROR_CREATE,
  ERROR_START,
  ERROR_NETWORK,
  ERROR_TIMEOUT,
  DownloadTask,
  RunSnapshot,
  createTaskGraph,
  expectedProgressAfter,
  expectedCompletedProgress,
  progressLabel
} from '../Shared/SharedDriver';

export default function networkCoreTaskModelTest(): void {
  describe('CoreTaskModel', () => {
    beforeAll(() => {
      logSuite('CoreTaskModel', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreTaskModel', 'end');
    });

    /**
     * @tc.name   constructorStoresTaskNumberAndUrl
     * @tc.desc   The two constructor arguments are preserved verbatim and are not derived from anything else.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('constructorStoresTaskNumberAndUrl', 0, () => {
      const task = new DownloadTask(TASK_A, URL_TASK_A);
      logStep('CoreTaskModel', 'identity ' + task.taskNo + ' ' + task.url);
      expect(task.taskNo).assertEqual(TASK_A);
      expect(task.url).assertEqual(URL_TASK_A);
      expect(task.url.startsWith('https://')).assertTrue();
      expect(task.url.indexOf('favor_list_tea.png')).assertLarger(0);
      expect(task.taskNo.length).assertEqual(1);
      expect(task.url.length).assertLarger(task.taskNo.length);
    });

    /**
     * @tc.name   constructorInitialisesAllNumericFields
     * @tc.desc   Every mutable field starts at its documented default: zero progress, zero attempts, no timestamps.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('constructorInitialisesAllNumericFields', 0, () => {
      const task = new DownloadTask(TASK_B, URL_TASK_B);
      logStep('CoreTaskModel', 'defaults ' + task.describe());
      expect(task.progress).assertEqual(0);
      expect(task.attempts).assertEqual(0);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.progressRatio()).assertEqual(0);
    });

    /**
     * @tc.name   startReturnsTrueAndIncrementsAttempts
     * @tc.desc   A first start is accepted, moves the row to running and records the start timestamp.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startReturnsTrueAndIncrementsAttempts', 0, () => {
      const task = new DownloadTask(TASK_C, URL_TASK_C);
      const accepted = task.start(42);
      logStep('CoreTaskModel', 'start result ' + String(accepted));
      expect(accepted).assertTrue();
      expect(task.attempts).assertEqual(1);
      expect(task.startedAt).assertEqual(42);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.isRunning()).assertTrue();
      expect(task.progress).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   startRejectsRunningTask
     * @tc.desc   A running row returns false from start and keeps both the attempt count and the start stamp.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startRejectsRunningTask', 0, () => {
      const task = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(10);
      const second = task.start(99);
      logStep('CoreTaskModel', 'second start ' + String(second));
      expect(second).assertFalse();
      expect(task.attempts).assertEqual(1);
      expect(task.startedAt).assertEqual(10);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.isRunning()).assertTrue();
      expect(task.isIdle()).assertFalse();
    });

    /**
     * @tc.name   startRejectsCompletedTask
     * @tc.desc   Completion is terminal for start, so a finished row cannot be dispatched a second time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startRejectsCompletedTask', 0, () => {
      const task = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.complete(100);
      const restart = task.start(200);
      logStep('CoreTaskModel', 'restart completed ' + String(restart));
      expect(restart).assertFalse();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.attempts).assertEqual(1);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(100);
    });

    /**
     * @tc.name   startRejectsFailedTask
     * @tc.desc   The failed state is terminal too: start returns false until the row is reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startRejectsFailedTask', 0, () => {
      const task = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(0);
      task.fail(ERROR_NETWORK);
      const restart = task.start(300);
      logStep('CoreTaskModel', 'restart failed ' + String(restart));
      expect(restart).assertFalse();
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.attempts).assertEqual(1);
      expect(task.startedAt).assertEqual(0);
      expect(task.lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(task.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   completeFromRunningWritesFullProgress
     * @tc.desc   complete() sets 100 in one write and stamps the finish time, exactly like updateProgress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completeFromRunningWritesFullProgress', 0, () => {
      const task = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.reportProgress(48);
      const accepted = task.complete(640);
      logStep('CoreTaskModel', 'complete ' + task.describe());
      expect(accepted).assertTrue();
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.progress).assertEqual(expectedCompletedProgress());
      expect(task.finishedAt).assertEqual(640);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.isComplete()).assertTrue();
    });

    /**
     * @tc.name   completeRejectsSecondCall
     * @tc.desc   The second completion is refused and does not move the finish stamp away from the first one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completeRejectsSecondCall', 0, () => {
      const task = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      const first = task.complete(100);
      const second = task.complete(500);
      logStep('CoreTaskModel', 'completion stamps ' + String(task.finishedAt));
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(task.finishedAt).assertEqual(100);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.attempts).assertEqual(1);
    });

    /**
     * @tc.name   completeOverridesFailedRow
     * @tc.desc   A late success callback can repair a failed row because only completed status blocks complete().
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeOverridesFailedRow', 0, () => {
      const task = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(0);
      task.fail(ERROR_TIMEOUT);
      const repaired = task.complete(900);
      logStep('CoreTaskModel', 'repair ' + task.describe());
      expect(repaired).assertTrue();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.isComplete()).assertTrue();
      expect(task.isFailed()).assertFalse();
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.lastErrorCode).assertEqual(ERROR_TIMEOUT);
      expect(task.finishedAt).assertEqual(900);
    });

    /**
     * @tc.name   failRecordsCodeAndStatus
     * @tc.desc   fail() stores the code and the failed status while leaving the bar at its last value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failRecordsCodeAndStatus', 0, () => {
      const task = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.reportProgress(27);
      const accepted = task.fail(ERROR_CREATE);
      logStep('CoreTaskModel', 'failure ' + task.describe() + ' code ' + String(task.lastErrorCode));
      expect(accepted).assertTrue();
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.lastErrorCode).assertEqual(ERROR_CREATE);
      expect(task.progress).assertEqual(27);
      expect(task.isFailed()).assertTrue();
      expect(task.isComplete()).assertFalse();
      expect(task.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   failRejectedOnCompletedRow
     * @tc.desc   A completed row refuses the failure transition and keeps the success code untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failRejectedOnCompletedRow', 0, () => {
      const task = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.complete(120);
      const refused = task.fail(ERROR_START);
      logStep('CoreTaskModel', 'fail after complete ' + String(refused));
      expect(refused).assertFalse();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.finishedAt).assertEqual(120);
      expect(task.isFailed()).assertFalse();
    });

    /**
     * @tc.name   resetRestoresIdleDefaults
     * @tc.desc   reset() puts the row back to idle with zero progress, no code and no timestamps.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetRestoresIdleDefaults', 0, () => {
      const task = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(15);
      task.reportProgress(81);
      task.fail(ERROR_TIMEOUT);
      task.reset();
      logStep('CoreTaskModel', 'after reset ' + task.describe());
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.progress).assertEqual(0);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
      expect(task.isIdle()).assertTrue();
      expect(task.progressRatio()).assertEqual(0);
    });

    /**
     * @tc.name   resetKeepsAttempts
     * @tc.desc   The attempt counter is history, not run state, so a reset does not clear it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetKeepsAttempts', 0, () => {
      const task = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.fail(ERROR_START);
      const beforeReset = task.attempts;
      task.reset();
      logStep('CoreTaskModel', 'attempts before/after reset ' + String(beforeReset) + '/' +
        String(task.attempts));
      expect(beforeReset).assertEqual(1);
      expect(task.attempts).assertEqual(1);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
      expect(task.progress).assertEqual(0);
      expect(task.startedAt).assertEqual(0);
    });

    /**
     * @tc.name   progressClampsBelowZero
     * @tc.desc   A negative percentage is clamped to the initial literal instead of being stored.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressClampsBelowZero', 0, () => {
      const task = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      const value = task.reportProgress(-40);
      logStep('CoreTaskModel', 'clamped negative ' + String(value));
      expect(value).assertEqual(0);
      expect(task.progress).assertEqual(0);
      expect(task.progressRatio()).assertEqual(0);
      expect(expectedProgressAfter(0, -40)).assertEqual(0);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.progress).assertLarger(-1);
    });

    /**
     * @tc.name   progressClampsAboveHundred
     * @tc.desc   An oversized percentage is clamped to 100, which is the bar total of the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressClampsAboveHundred', 0, () => {
      const task = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(0);
      const value = task.reportProgress(250);
      logStep('CoreTaskModel', 'clamped high ' + String(value));
      expect(value).assertEqual(PROGRESS_TOTAL);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.progressRatio()).assertEqual(1);
      expect(expectedProgressAfter(0, 250)).assertEqual(PROGRESS_TOTAL);
      expect(task.isComplete()).assertFalse();
      expect(task.status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   progressClampSequenceEndsAtHundred
     * @tc.desc   Feeding an unordered sequence of percentages converges on 100 and never moves backwards.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressClampSequenceEndsAtHundred', 0, () => {
      const task = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      const reports: number[] = [5, 90, 12, 90, 140, -3, 99, 100];
      let previous: number = 0;
      let regressions = 0;
      for (let index = 0; index < reports.length; index++) {
        const value = task.reportProgress(reports[index]);
        if (value < previous) {
          regressions = regressions + 1;
        }
        previous = value;
      }
      logStep('CoreTaskModel', 'final clamped value ' + String(previous));
      expect(regressions).assertEqual(0);
      expect(previous).assertEqual(PROGRESS_TOTAL);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.progressRatio()).assertEqual(1);
      expect(task.label()).assertEqual('任务A当前进度 100%');
      expect(task.isComplete()).assertFalse();
    });

    /**
     * @tc.name   progressRatioForQuarterValue
     * @tc.desc   The ratio divides by the page total, so 25 percent becomes exactly 0.25.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressRatioForQuarterValue', 0, () => {
      const task = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.reportProgress(25);
      const ratio = task.progressRatio();
      logStep('CoreTaskModel', 'quarter ratio ' + String(ratio));
      expect(ratio).assertEqual(0.25);
      expect(ratio * PROGRESS_TOTAL).assertEqual(task.progress);
      expect(task.progress).assertEqual(25);
      expect(ratio).assertLess(1);
      expect(task.progressRatio()).assertLarger(0);
    });

    /**
     * @tc.name   progressRatioAtBothBounds
     * @tc.desc   The ratio is 0 at the initial literal and 1 at the completed literal, never outside that range.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressRatioAtBothBounds', 0, () => {
      const task = new DownloadTask(TASK_C, URL_TASK_C);
      const atStart = task.progressRatio();
      task.start(0);
      task.complete(10);
      const atEnd = task.progressRatio();
      logStep('CoreTaskModel', 'ratio bounds ' + String(atStart) + '/' + String(atEnd));
      expect(atStart).assertEqual(0);
      expect(atEnd).assertEqual(1);
      expect(atEnd - atStart).assertEqual(1);
      expect(atEnd).assertLarger(atStart);
      expect(PROGRESS_TOTAL).assertEqual(100);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   labelUsesChineseTemplate
     * @tc.desc   label() reproduces the rendered Text template for a partial and for a full row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('labelUsesChineseTemplate', 0, () => {
      const task = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      const empty = task.label();
      task.reportProgress(58);
      const partial = task.label();
      task.complete(20);
      const full = task.label();
      logStep('CoreTaskModel', 'labels ' + partial);
      expect(empty).assertEqual('任务A当前进度 0%');
      expect(partial).assertEqual('任务A当前进度 58%');
      expect(full).assertEqual(progressLabel(TASK_A, PROGRESS_TOTAL));
      expect(partial.indexOf('任务A')).assertEqual(0);
      expect(full.endsWith('%')).assertTrue();
      expect(empty === full).assertFalse();
    });

    /**
     * @tc.name   describeUsesColonSeparatedTriple
     * @tc.desc   describe() is "task:status:progress", which both snapshotText and RunSnapshot rely on.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('describeUsesColonSeparatedTriple', 0, () => {
      const task = new DownloadTask(TASK_B, URL_TASK_B);
      const idle = task.describe();
      task.start(0);
      task.reportProgress(30);
      const running = task.describe();
      task.fail(ERROR_START);
      const failed = task.describe();
      logStep('CoreTaskModel', 'descriptions ' + idle + ' / ' + running + ' / ' + failed);
      expect(idle).assertEqual('B:idle:0');
      expect(running).assertEqual('B:running:30');
      expect(failed).assertEqual('B:failed:30');
      expect(running.split(':').length).assertEqual(3);
      expect(running.split(':')[0]).assertEqual(TASK_B);
      expect(failed === running).assertFalse();
    });

    /**
     * @tc.name   snapshotCapturesCurrentTriple
     * @tc.desc   snapshot() copies the three observable values into a detached RunSnapshot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotCapturesCurrentTriple', 0, () => {
      const task = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(0);
      task.reportProgress(72);
      const snapshot = task.snapshot();
      task.complete(30);
      logStep('CoreTaskModel', 'snapshot ' + snapshot.describe());
      expect(snapshot.taskNo).assertEqual(TASK_C);
      expect(snapshot.progress).assertEqual(72);
      expect(snapshot.status).assertEqual(STATUS_RUNNING);
      expect(snapshot.describe()).assertEqual('C/running/72');
      expect(task.snapshot().progress).assertEqual(PROGRESS_TOTAL);
      expect(snapshot.sameAs(task.snapshot())).assertFalse();
    });

    /**
     * @tc.name   snapshotSameAsComparesAllThreeFields
     * @tc.desc   Equality requires task, progress and status to match; flipping any single field breaks it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotSameAsComparesAllThreeFields', 0, () => {
      const base = new RunSnapshot(TASK_A, 50, STATUS_RUNNING);
      const same = new RunSnapshot(TASK_A, 50, STATUS_RUNNING);
      const otherTask = new RunSnapshot(TASK_B, 50, STATUS_RUNNING);
      const otherProgress = new RunSnapshot(TASK_A, 51, STATUS_RUNNING);
      const otherStatus = new RunSnapshot(TASK_A, 50, STATUS_COMPLETED);
      logStep('CoreTaskModel', 'snapshot comparisons for ' + base.describe());
      expect(base.sameAs(same)).assertTrue();
      expect(base.sameAs(otherTask)).assertFalse();
      expect(base.sameAs(otherProgress)).assertFalse();
      expect(base.sameAs(otherStatus)).assertFalse();
      expect(same.sameAs(base)).assertTrue();
      expect(base.describe()).assertEqual('A/running/50');
    });

    /**
     * @tc.name   statusPredicatesAreMutuallyExclusive
     * @tc.desc   At most one of idle / running / completed is true for any reachable status of the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('statusPredicatesAreMutuallyExclusive', 0, () => {
      const task = new DownloadTask(TASK_A, URL_TASK_A);
      const idleCount = (task.isIdle() ? 1 : 0) + (task.isRunning() ? 1 : 0) + (task.isComplete() ? 1 : 0);
      task.start(0);
      const runningCount = (task.isIdle() ? 1 : 0) + (task.isRunning() ? 1 : 0) + (task.isComplete() ? 1 : 0);
      task.complete(10);
      const completeCount = (task.isIdle() ? 1 : 0) + (task.isRunning() ? 1 : 0) + (task.isComplete() ? 1 : 0);
      logStep('CoreTaskModel', 'predicate counts ' + String(idleCount) + String(runningCount) +
        String(completeCount));
      expect(idleCount).assertEqual(1);
      expect(runningCount).assertEqual(1);
      expect(completeCount).assertEqual(1);
      expect(task.isIdle()).assertFalse();
      expect(task.isFailed()).assertFalse();
      expect(task.isComplete()).assertTrue();
    });

    /**
     * @tc.name   progressIgnoredOnTerminalRow
     * @tc.desc   A completed row answers every progress report with 100, including a lower one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressIgnoredOnTerminalRow', 0, () => {
      const task = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.complete(5);
      const lower = task.reportProgress(10);
      const zero = task.reportProgress(0);
      const higher = task.reportProgress(100);
      logStep('CoreTaskModel', 'terminal answers ' + String(lower) + '/' + String(zero) + '/' + String(higher));
      expect(lower).assertEqual(PROGRESS_TOTAL);
      expect(zero).assertEqual(PROGRESS_TOTAL);
      expect(higher).assertEqual(PROGRESS_TOTAL);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.progressRatio()).assertEqual(1);
      expect(task.finishedAt).assertEqual(5);
    });

    /**
     * @tc.name   identityFieldsSurviveStatusChanges
     * @tc.desc   taskNo and url never change as the row moves through running, failed, reset and completed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('identityFieldsSurviveStatusChanges', 0, () => {
      const task = new DownloadTask(TASK_C, URL_TASK_C);
      const urlAtStart = task.url;
      task.start(0);
      task.fail(ERROR_NETWORK);
      const urlAfterFail = task.url;
      task.reset();
      task.start(1);
      task.complete(2);
      logStep('CoreTaskModel', 'identity stable ' + task.taskNo);
      expect(task.taskNo).assertEqual(TASK_C);
      expect(task.url).assertEqual(urlAtStart);
      expect(urlAfterFail).assertEqual(urlAtStart);
      expect(task.url).assertEqual(URL_TASK_C);
      expect(task.url.indexOf('icon_main_color.png')).assertLarger(0);
      expect(task.attempts).assertEqual(2);
    });

    /**
     * @tc.name   startAfterResetBeginsSecondAttempt
     * @tc.desc   Reset plus start is the supported retry path and increments the attempt counter to two.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startAfterResetBeginsSecondAttempt', 0, () => {
      const task = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.fail(ERROR_TIMEOUT);
      task.reset();
      const accepted = task.start(777);
      logStep('CoreTaskModel', 'retry attempt ' + String(task.attempts));
      expect(accepted).assertTrue();
      expect(task.attempts).assertEqual(2);
      expect(task.startedAt).assertEqual(777);
      expect(task.finishedAt).assertEqual(0);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.progress).assertEqual(0);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name   graphTasksExposeModelFields
     * @tc.desc   The three rows created by the graph carry the same model fields as a hand built task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphTasksExposeModelFields', 0, () => {
      const graph = createTaskGraph();
      const a = graph.taskAt(0);
      const c = graph.taskAt(2);
      logStep('CoreTaskModel', 'graph rows ' + a.describe() + ' / ' + c.describe());
      expect(a.taskNo).assertEqual(TASK_A);
      expect(a.url).assertEqual(URL_TASK_A);
      expect(a.status).assertEqual(STATUS_IDLE);
      expect(a.progress).assertEqual(0);
      expect(a.attempts).assertEqual(0);
      expect(c.url).assertEqual(URL_TASK_C);
      expect(c.label()).assertEqual('任务C当前进度 0%');
      expect(c.snapshot().sameAs(new RunSnapshot(TASK_C, 0, STATUS_IDLE))).assertTrue();
    });

    /**
     * @tc.name   errorCodeFieldDefaultsAndUpdates
     * @tc.desc   lastErrorCode is ERROR_NONE until a failure and never changes on a successful completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('errorCodeFieldDefaultsAndUpdates', 0, () => {
      const task = new DownloadTask(TASK_A, URL_TASK_A);
      const initial = task.lastErrorCode;
      task.start(0);
      task.complete(100);
      const afterSuccess = task.lastErrorCode;
      task.reset();
      task.start(1);
      task.fail(ERROR_TIMEOUT);
      const afterFailure = task.lastErrorCode;
      task.reset();
      logStep('CoreTaskModel', 'error codes ' + String(initial) + '/' + String(afterSuccess) + '/' +
        String(afterFailure));
      expect(initial).assertEqual(ERROR_NONE);
      expect(afterSuccess).assertEqual(ERROR_NONE);
      expect(afterFailure).assertEqual(ERROR_TIMEOUT);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
      expect(ERROR_TIMEOUT).assertLarger(ERROR_NONE);
      expect(afterFailure).assertEqual(13400004);
    });

    /**
     * @tc.name   ratioIsProportionalAcrossValues
     * @tc.desc   Ratio and percentage stay proportional for several distinct values of the same row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('ratioIsProportionalAcrossValues', 0, () => {
      const task = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.reportProgress(10);
      const ten = task.progressRatio();
      task.reportProgress(60);
      const sixty = task.progressRatio();
      task.reportProgress(100);
      const hundred = task.progressRatio();
      logStep('CoreTaskModel', 'ratios ' + String(ten) + '/' + String(sixty) + '/' + String(hundred));
      expect(ten).assertEqual(0.1);
      expect(sixty).assertEqual(0.6);
      expect(hundred).assertEqual(1);
      expect(ten * 100).assertEqual(10);
      expect(ten).assertLess(sixty);
      expect(hundred).assertLarger(sixty);
      expect(task.describe()).assertEqual('B:running:100');
    });

    /**
     * @tc.name   labelMatchesOracleForAllThreeTasks
     * @tc.desc   The label template is identical for A, B and C at the same percentage, only the task letter differs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('labelMatchesOracleForAllThreeTasks', 0, () => {
      const a = new DownloadTask(TASK_A, URL_TASK_A);
      const b = new DownloadTask(TASK_B, URL_TASK_B);
      const c = new DownloadTask(TASK_C, URL_TASK_C);
      a.start(0);
      b.start(0);
      c.start(0);
      a.reportProgress(12);
      b.reportProgress(12);
      c.reportProgress(12);
      logStep('CoreTaskModel', 'labels ' + a.label() + ' / ' + b.label() + ' / ' + c.label());
      expect(a.label()).assertEqual(progressLabel(TASK_A, 12));
      expect(b.label()).assertEqual(progressLabel(TASK_B, 12));
      expect(c.label()).assertEqual(progressLabel(TASK_C, 12));
      expect(a.label().indexOf('任务A')).assertEqual(0);
      expect(b.label().indexOf('任务B')).assertEqual(0);
      expect(c.label().indexOf('任务C')).assertEqual(0);
      expect(a.label().length).assertEqual(c.label().length);
    });

    /**
     * @tc.name   snapshotOfIdleRowIsStable
     * @tc.desc   Repeated snapshots of an untouched row compare equal, and add/reset does not change the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotOfIdleRowIsStable', 0, () => {
      const task = new DownloadTask(TASK_C, URL_TASK_C);
      const first = task.snapshot();
      const second = task.snapshot();
      logStep('CoreTaskModel', 'idle snapshots ' + first.describe() + ' / ' + second.describe());
      expect(first.sameAs(second)).assertTrue();
      expect(second.sameAs(first)).assertTrue();
      expect(first.progress).assertEqual(0);
      expect(first.status).assertEqual(STATUS_IDLE);
      expect(first.describe()).assertEqual('C/idle/0');
      expect(task.progress).assertEqual(0);
      expect(task.attempts).assertEqual(0);
    });

    /**
     * @tc.name   completedProgressOracleIgnoresCurrentValue
     * @tc.desc   expectedCompletedProgress has no argument and always answers the 100 literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completedProgressOracleIgnoresCurrentValue', 0, () => {
      const task = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.reportProgress(33);
      const before = task.progress;
      const oracle = expectedCompletedProgress();
      task.complete(0);
      logStep('CoreTaskModel', 'oracle ' + String(oracle) + ' before ' + String(before));
      expect(oracle).assertEqual(PROGRESS_TOTAL);
      expect(before).assertEqual(33);
      expect(task.progress).assertEqual(oracle);
      expect(expectedCompletedProgress()).assertEqual(oracle);
      expect(expectedProgressAfter(before, 500)).assertEqual(oracle);
      expect(task.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   failureErrorCodeDoesNotChangeProgress
     * @tc.desc   Recording a failure code leaves the percentage untouched, so the bar and the code are independent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failureErrorCodeDoesNotChangeProgress', 0, () => {
      const task = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.reportProgress(44);
      const beforeCode = task.lastErrorCode;
      task.fail(ERROR_START);
      logStep('CoreTaskModel', 'progress with failure ' + String(task.progress));
      expect(beforeCode).assertEqual(ERROR_NONE);
      expect(task.lastErrorCode).assertEqual(ERROR_START);
      expect(task.progress).assertEqual(44);
      expect(task.progressRatio()).assertEqual(0.44);
      expect(task.label()).assertEqual('任务B当前进度 44%');
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   labelAndDescribeAgreeOnProgress
     * @tc.desc   The percentage embedded in label() is the same number that describe() prints for the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('labelAndDescribeAgreeOnProgress', 0, () => {
      const task = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(0);
      task.reportProgress(17);
      const label = task.label();
      const described = task.describe();
      const describedValue = described.split(':')[2];
      logStep('CoreTaskModel', 'label/describe ' + label + ' / ' + described);
      expect(describedValue).assertEqual('17');
      expect(label.indexOf(describedValue)).assertLarger(0);
      expect(described.split(':')[0]).assertEqual(task.taskNo);
      expect(described.split(':')[1]).assertEqual(task.status);
      expect(label).assertEqual('任务C当前进度 17%');
      expect(task.snapshot().describe()).assertEqual('C/running/17');
    });

    /**
     * @tc.name   snapshotAfterResetReportsIdleTriple
     * @tc.desc   A snapshot taken after reset reports the idle triple, proving the snapshot reads live state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotAfterResetReportsIdleTriple', 0, () => {
      const task = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.complete(30);
      const before = task.snapshot();
      task.reset();
      const after = task.snapshot();
      logStep('CoreTaskModel', 'snapshot before/after reset ' + before.describe() + ' / ' + after.describe());
      expect(before.status).assertEqual(STATUS_COMPLETED);
      expect(before.progress).assertEqual(PROGRESS_TOTAL);
      expect(after.status).assertEqual(STATUS_IDLE);
      expect(after.progress).assertEqual(0);
      expect(before.sameAs(after)).assertFalse();
      expect(after.sameAs(new RunSnapshot(TASK_A, 0, STATUS_IDLE))).assertTrue();
      expect(task.progress).assertEqual(0);
    });

    /**
     * @tc.name   runSnapshotDescribeUsesSlashSeparators
     * @tc.desc   The snapshot text projection is task/status/progress with slashes, unlike the colon form of describe.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('runSnapshotDescribeUsesSlashSeparators', 0, () => {
      const task = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(0);
      task.reportProgress(8);
      const snapshot = task.snapshot();
      const parts = snapshot.describe().split('/');
      logStep('CoreTaskModel', 'snapshot text ' + snapshot.describe());
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual(TASK_C);
      expect(parts[1]).assertEqual(STATUS_RUNNING);
      expect(parts[2]).assertEqual('8');
      expect(snapshot.describe().indexOf('/')).assertEqual(1);
      expect(snapshot.describe() === task.describe()).assertFalse();
      expect(snapshot.sameAs(new RunSnapshot(TASK_C, 8, STATUS_RUNNING))).assertTrue();
    });

    /**
     * @tc.name   progressReportBeforeStartWritesTheIdleRow
     * @tc.desc   A progress callback can arrive before start; it fills the bar while the row is still idle, and start keeps the value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressReportBeforeStartWritesTheIdleRow', 0, () => {
      const task = new DownloadTask(TASK_B, URL_TASK_B);
      const before = task.status;
      const value = task.reportProgress(45);
      logStep('CoreTaskModel', 'idle report ' + task.describe());
      expect(before).assertEqual(STATUS_IDLE);
      expect(value).assertEqual(45);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.attempts).assertEqual(0);
      expect(task.startedAt).assertEqual(0);
      expect(task.label()).assertEqual('任务B当前进度 45%');
      const started = task.start(120);
      expect(started).assertTrue();
      expect(task.progress).assertEqual(45);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.attempts).assertEqual(1);
    });

    /**
     * @tc.name   descriptionTraceOfOneFullLifecycle
     * @tc.desc   Five describe() snapshots taken across start, progress, failure and reset form one ordered lifecycle trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreTaskModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('descriptionTraceOfOneFullLifecycle', 0, () => {
      const task = new DownloadTask(TASK_C, URL_TASK_C);
      const steps: string[] = [];
      steps.push(task.describe());
      task.start(0);
      steps.push(task.describe());
      task.reportProgress(55);
      steps.push(task.describe());
      task.fail(ERROR_START);
      steps.push(task.describe());
      task.reset();
      steps.push(task.describe());
      const trace = steps.join('>');
      logStep('CoreTaskModel', 'lifecycle trace ' + trace);
      expect(trace).assertEqual('C:idle:0>C:running:0>C:running:55>C:failed:55>C:idle:0');
      expect(steps.length).assertEqual(5);
      expect(steps[2]).assertEqual('C:running:55');
      expect(steps[3].indexOf('failed')).assertLarger(0);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.attempts).assertEqual(1);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
    });
  });
}
