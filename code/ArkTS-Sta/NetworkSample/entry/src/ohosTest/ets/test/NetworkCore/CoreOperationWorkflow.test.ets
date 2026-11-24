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
 * CoreOperationWorkflow suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-64    three progress values, isTaskFinished, lock, A/B completion flags
 *   98-107   checkAndUnlock and canRunTaskC
 *   109-148  download(): config create, onCompleted, onProgress, start
 *   174-198  startAllTasks() and the 200 ms gate check
 *   249-259  enabled(isTaskFinished) start button
 *
 * User level workflows rather than primitives: tap start, both downloads
 * finish, C unlocks and finishes; an interrupted workflow; and a repeated
 * workflow after reset.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TaskGraph,
  DownloadTask,
  DownloadConfig,
  NetworkMetrics,
  createTaskGraph,
  completionTrace,
  startButtonEnabled,
  startButtonBackground,
  BUTTON_ACTIVE_BACKGROUND,
  BUTTON_DISABLED_BACKGROUND,
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  expectedConfigFor,
  countOf,
  joined
} from '../Shared/SharedDriver';

export default function networkCoreOperationWorkflowTest(): void {
  describe('CoreOperationWorkflow', () => {
    beforeAll(() => {
      logSuite('CoreOperationWorkflow', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreOperationWorkflow', 'end');
    });

    /**
     * @tc.name   workflowTapStartBeginsTheSharedDownloads
     * @tc.desc   The enabled button starts A and B, disables itself and queues C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('workflowTapStartBeginsTheSharedDownloads', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(graph.startAll()).assertTrue();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.events.last()).assertEqual('queued:C');
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   workflowBothSharedDownloadsFinishUnlockC
     * @tc.desc   The completion callbacks for A and B close the gate and arm C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('workflowBothSharedDownloadsFinishUnlockC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A, 400)).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.completeTask(TASK_B, 800)).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
    });

    /**
     * @tc.name   workflowUnlockIsObservedByTheNextPoll
     * @tc.desc   The 200 ms tick after the last completion starts C in the same tick.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('workflowUnlockIsObservedByTheNextPoll', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick(200)).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isRunning()).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.events.last()).assertEqual('timer-cleared:C');
    });

    /**
     * @tc.name   workflowCFinishesAndTheRunIsComplete
     * @tc.desc   The last completion writes 100 for C and every bar shows full.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('workflowCFinishesAndTheRunIsComplete', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      expect(graph.completeTaskC(2000)).assertTrue();
      expect(graph.allCompleted()).assertTrue();
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:completed:100|C:completed:100');
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   workflowFullSequenceEndsWithThreeCompletionEntries
     * @tc.desc   The canonical run records A, B and C exactly once in the completion trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('workflowFullSequenceEndsWithThreeCompletionEntries', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(countOf(graph.completionOrder, TASK_C)).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(3);
    });

    /**
     * @tc.name   workflowDuplicateTapDuringTheRunIsIgnored
     * @tc.desc   The disabled button cannot restart the downloads; the rejection is recorded once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowDuplicateTapDuringTheRunIsIgnored', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.startAll()).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(2);
      expect((graph.taskByNo(TASK_A) as DownloadTask).attempts).assertEqual(1);
      expect(graph.runningCount()).assertEqual(2);
    });
    /**
     * @tc.name   workflowButtonBackgroundFollowsTheFlag
     * @tc.desc   The button is blue while idle and grey during the run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowButtonBackgroundFollowsTheFlag', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual(BUTTON_ACTIVE_BACKGROUND);
      graph.startAll();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(graph.isTaskFinished).assertFalse();
      expect(BUTTON_ACTIVE_BACKGROUND === BUTTON_DISABLED_BACKGROUND).assertFalse();
    });

    /**
     * @tc.name   workflowTapIsRejectedAgainAfterTheRunFinishes
     * @tc.desc   A completed run leaves the button disabled until reset, matching enabled(isTaskFinished).
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowTapIsRejectedAgainAfterTheRunFinishes', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.isTaskFinished).assertFalse();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
    });

    /**
     * @tc.name   workflowInterruptedRunIsClearedByReset
     * @tc.desc   An interruption at the halfway point wipes every visible trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowInterruptedRunIsClearedByReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.pollTicks).assertEqual(0);
    });

    /**
     * @tc.name   workflowFailedDependencyKeepsTheGateClosed
     * @tc.desc   When A fails the gate cannot open, so no poll ever starts C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowFailedDependencyKeepsTheGateClosed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskByNo(TASK_A) as DownloadTask;
      a.reportProgress(40);
      expect(a.fail(13400003)).assertTrue();
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.timerActive).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
      expect(a.lastErrorCode).assertEqual(13400003);
    });

    /**
     * @tc.name   workflowCompletedDependencyAfterAFailedSiblingStillUnlocks
     * @tc.desc   The model follows the completion flag, so a late completion of A opens the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowCompletedDependencyAfterAFailedSiblingStillUnlocks', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskByNo(TASK_A) as DownloadTask;
      a.fail(13400004);
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(a.lastErrorCode).assertEqual(13400004);
      expect(graph.pollTick(200)).assertTrue();
    });

    /**
     * @tc.name   workflowRestartAfterFailureRunsCleanly
     * @tc.desc   A reset after a failed attempt clears the error and allows a full successful run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowRestartAfterFailureRunsCleanly', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      (graph.taskByNo(TASK_A) as DownloadTask).fail(13400003);
      graph.reset();
      expect((graph.taskByNo(TASK_A) as DownloadTask).lastErrorCode).assertEqual(0);
      expect(graph.startAll()).assertTrue();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.allCompleted()).assertTrue();
      expect(NetworkMetrics.from(graph).failedTasks).assertEqual(0);
    });

    /**
     * @tc.name   workflowRepeatedRunAfterResetRepeatsTheTrace
     * @tc.desc   A second identical workflow after reset yields the same event trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowRepeatedRunAfterResetRepeatsTheTrace', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      const first: string = graph.eventTrace();
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.eventTrace()).assertEqual(first);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.pollTicks).assertEqual(1);
    });

    /**
     * @tc.name   workflowSecondRunWithoutResetIsRefused
     * @tc.desc   Only one workflow may exist at a time; the flag guards the start.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowSecondRunWithoutResetIsRefused', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
    });

    /**
     * @tc.name   workflowUnlockHappensExactlyOncePerRun
     * @tc.desc   The gate opens once; later polls and completions add no unlocked entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowUnlockHappensExactlyOncePerRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      graph.pollTick(200);
      graph.pollTick(400);
      graph.completeTaskC(600);
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(graph.events.entries[6]).assertEqual('unlocked:C');
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.events.countOf('completed')).assertEqual(3);
    });

    /**
     * @tc.name   workflowProgressBarsClimbMonotonically
     * @tc.desc   Summed progress never decreases between checkpoints of a healthy run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowProgressBarsClimbMonotonically', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const totals: number[] = [];
      totals.push(graph.totalProgress());
      graph.startAll();
      (graph.taskByNo(TASK_A) as DownloadTask).reportProgress(20);
      (graph.taskByNo(TASK_B) as DownloadTask).reportProgress(30);
      totals.push(graph.totalProgress());
      graph.completeTask(TASK_A);
      totals.push(graph.totalProgress());
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      totals.push(graph.totalProgress());
      const rendered: string[] = [];
      for (let index = 0; index < totals.length; index++) {
        rendered.push(String(totals[index]));
      }
      expect(joined(rendered, ',')).assertEqual('0,50,130,300');
      expect(totals[3]).assertEqual(300);
      expect(totals[2]).assertLarger(totals[1]);
    });

    /**
     * @tc.name   workflowCRunsOnlyAfterBothBarsShowFull
     * @tc.desc   The exclusive download starts only when A and B both report 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowCRunsOnlyAfterBothBarsShowFull', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      (graph.taskByNo(TASK_A) as DownloadTask).reportProgress(100);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.pollTick(200)).assertFalse();
      graph.completeTask(TASK_A);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.pollTick(400)).assertFalse();
      graph.completeTask(TASK_B);
      expect(graph.pollTick(600)).assertTrue();
    });

    /**
     * @tc.name   workflowCheckpointSnapshotsDescribeEachPhase
     * @tc.desc   The four user visible phases produce four distinct snapshot strings.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowCheckpointSnapshotsDescribeEachPhase', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const checkpoints: string[] = [];
      checkpoints.push(graph.snapshotText());
      graph.startAll();
      checkpoints.push(graph.snapshotText());
      graph.completeTask(TASK_A);
      checkpoints.push(graph.snapshotText());
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      checkpoints.push(graph.snapshotText());
      graph.completeTaskC(400);
      checkpoints.push(graph.snapshotText());
      expect(checkpoints.length).assertEqual(5);
      expect(checkpoints[0]).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      expect(checkpoints[1]).assertEqual('A:running:0|B:running:0|C:idle:0');
      expect(checkpoints[2]).assertEqual('A:completed:100|B:running:0|C:idle:0');
      expect(checkpoints[4]).assertEqual('A:completed:100|B:completed:100|C:completed:100');
    });

    /**
     * @tc.name   workflowMetricsShowASuccessfulRun
     * @tc.desc   The final metrics report three successes and full progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowMetricsShowASuccessfulRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(3);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(300);
      expect(metrics.averageProgress()).assertEqual(100);
      expect(metrics.successRatio()).assertEqual(1);
    });

    /**
     * @tc.name   workflowMetricsShowAnInterruptedRun
     * @tc.desc   Halfway through, only one task counts as complete and the ratio is one third.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowMetricsShowAnInterruptedRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.completedTasks).assertEqual(1);
      expect(metrics.totalProgress).assertLarger(0);
      expect(metrics.successRatio()).assertEqual(1.0 / 3);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.fingerprint() === NetworkMetrics.from(createTaskGraph()).fingerprint()).assertFalse();
    });

    /**
     * @tc.name   workflowPreflightConfigForEveryDownload
     * @tc.desc   Each tap of start resolves three valid configurations before create.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowPreflightConfigForEveryDownload', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        const config: DownloadConfig = expectedConfigFor(TASK_NUMBERS[index]);
        expect(config.isValid()).assertTrue();
        expect(config.sameAs(DownloadConfig.forTask(TASK_NUMBERS[index]))).assertTrue();
        expect(config.fileName().endsWith('.png')).assertTrue();
      }
      expect(graph.runningCount()).assertEqual(2);
    });

    /**
     * @tc.name   workflowDownloadUrlsAreTheSeededResources
     * @tc.desc   The workflow never swaps the URL literals of the three rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowDownloadUrlsAreTheSeededResources', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect((graph.taskAt(0) as DownloadTask).url).assertEqual(URL_TASK_A);
      expect((graph.taskAt(1) as DownloadTask).url).assertEqual(URL_TASK_B);
      expect((graph.taskAt(2) as DownloadTask).url).assertEqual(URL_TASK_C);
      expect((graph.taskAt(0) as DownloadTask).url === (graph.taskAt(1) as DownloadTask).url).assertFalse();
    });

    /**
     * @tc.name   workflowTimerTicksWhileTheUserWaits
     * @tc.desc   The 200 ms timer counts quiet ticks before the gate opens.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowTimerTicksWhileTheUserWaits', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTick(600)).assertFalse();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
    });

    /**
     * @tc.name   workflowUserSeesAnUnlockBeforeTheExclusiveStart
     * @tc.desc   The unlock entry exists before the poll appends started:C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowUserSeesAnUnlockBeforeTheExclusiveStart', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      const beforePoll: string = graph.eventTrace();
      expect(beforePoll.endsWith('unlocked:C')).assertTrue();
      expect(beforePoll.indexOf('started:C')).assertEqual(-1);
      graph.pollTick(200);
      expect(graph.eventTrace().indexOf('started:C')).assertLarger(beforePoll.length);
      expect(graph.events.entries[7]).assertEqual('started:C');
    });

    /**
     * @tc.name   workflowCFinishCallbackIsIdempotent
     * @tc.desc   A repeated onCompleted for C leaves the run finished and the trace unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowCFinishCallbackIsIdempotent', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      const trace: string = graph.eventTrace();
      expect(graph.completeTaskC(500)).assertFalse();
      expect(graph.eventTrace()).assertEqual(trace);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.events.size()).assertEqual(11);
    });
    /**
     * @tc.name   workflowFingerprintSeparatesAFinishedRunFromAnInterruptedOne
     * @tc.desc   The audited trace fingerprint proves the two runs differ.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowFingerprintSeparatesAFinishedRunFromAnInterruptedOne', 0, () => {
      const finished: TaskGraph = createTaskGraph();
      const interrupted: TaskGraph = createTaskGraph();
      finished.startAll();
      finished.completeTask(TASK_A);
      finished.completeTask(TASK_B);
      finished.pollTick(200);
      finished.completeTaskC(400);
      interrupted.startAll();
      interrupted.completeTask(TASK_A);
      expect(finished.events.fingerprint() === interrupted.events.fingerprint()).assertFalse();
      expect(finished.events.size()).assertEqual(11);
      expect(interrupted.events.size()).assertEqual(5);
      expect(finished.allCompleted()).assertTrue();
      expect(interrupted.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   workflowThirdCycleRepeatsTheSameCompletions
     * @tc.desc   Three reset cycles in a row keep the completion order stable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowThirdCycleRepeatsTheSameCompletions', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const traces: string[] = [];
      for (let cycle = 0; cycle < 3; cycle++) {
        graph.reset();
        graph.startAll();
        graph.completeTask(TASK_A);
        graph.completeTask(TASK_B);
        graph.pollTick(200);
        graph.completeTaskC(400 + cycle);
        traces.push(completionTrace(graph));
        expect(graph.totalProgress()).assertEqual(300);
      }
      expect(traces.length).assertEqual(3);
      expect(traces[0]).assertEqual('A|B|C');
      expect(traces[1]).assertEqual(traces[0]);
      expect(traces[2]).assertEqual(traces[0]);
    });

    /**
     * @tc.name   workflowResetBeforeThePollStopsTheExclusiveStart
     * @tc.desc   If the user resets while C waits, no later poll can start C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowResetBeforeThePollStopsTheExclusiveStart', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.reset();
      expect(graph.pollTick(200)).assertFalse();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   workflowResetAfterUnlockReleasesTheQueuedHolders
     * @tc.desc   A reset between the unlock and the poll leaves no shared or exclusive owner.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowResetAfterUnlockReleasesTheQueuedHolders', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      expect(graph.lock.isUnlocked()).assertTrue();
      graph.reset();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
    });

    /**
     * @tc.name   workflowEachImpatientTapIsCountedSeparately
     * @tc.desc   Every rejected tap appends its own start-rejected entry with the current poll count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowEachImpatientTapIsCountedSeparately', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.pollTick(200);
      graph.startAll();
      graph.pollTick(400);
      graph.startAll();
      expect(graph.events.countOf('start-rejected')).assertEqual(2);
      expect(graph.events.entries[graph.events.size() - 2]).assertEqual('start-rejected:1');
      expect(graph.events.last()).assertEqual('start-rejected:2');
      expect(graph.pollTicks).assertEqual(2);
    });

    /**
     * @tc.name   workflowReversedDependencyOrderAlsoFinishes
     * @tc.desc   A user whose B download finishes first still reaches the same final screen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowReversedDependencyOrderAlsoFinishes', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 500);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_A, 900);
      expect(graph.pollTick(1000)).assertTrue();
      expect(graph.completeTaskC(1500)).assertTrue();
      expect(completionTrace(graph)).assertEqual('B|A|C');
      expect(graph.allCompleted()).assertTrue();
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:completed:100|C:completed:100');
    });

    /**
     * @tc.name   workflowFinalLabelsShowFullPercent
     * @tc.desc   The three rendered row labels read 100% when the run completes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowFinalLabelsShowFullPercent', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect((graph.taskByNo(TASK_A) as DownloadTask).label()).assertEqual('任务A当前进度 100%');
      expect((graph.taskByNo(TASK_B) as DownloadTask).label()).assertEqual('任务B当前进度 100%');
      expect((graph.taskByNo(TASK_C) as DownloadTask).label()).assertEqual('任务C当前进度 100%');
      expect((graph.taskByNo(TASK_C) as DownloadTask).label().endsWith('100%')).assertTrue();
    });

    /**
     * @tc.name   workflowTotalProgressEqualsTheRowCountTimesFull
     * @tc.desc   Three full bars sum to 300 and average exactly 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('workflowTotalProgressEqualsTheRowCountTimesFull', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.totalProgress()).assertEqual(graph.tasks.length * 100);
      expect(graph.averageProgress()).assertEqual(100);
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   workflowNothingRunsAfterTheFinalCompletion
     * @tc.desc   After C completes, polls, taps and duplicate completions cannot start work.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowNothingRunsAfterTheFinalCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      const attempts: number = (graph.taskByNo(TASK_A) as DownloadTask).attempts;
      expect(graph.pollTick(600)).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.completeTask(TASK_A)).assertFalse();
      expect((graph.taskByNo(TASK_A) as DownloadTask).attempts).assertEqual(attempts);
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
    });

    /**
     * @tc.name   workflowTraceMentionsOnlyTheThreeSeededNumbers
     * @tc.desc   The audit trail of a healthy run names A, B and C and no other task token.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowTraceMentionsOnlyTheThreeSeededNumbers', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      const trace: string = graph.eventTrace();
      expect(trace.indexOf('started:A')).assertLarger(0);
      expect(trace.indexOf('completed:B')).assertLarger(0);
      expect(trace.indexOf('started:C')).assertLarger(0);
      expect(trace.indexOf('started:D')).assertEqual(-1);
      expect(trace.indexOf('completed:Z')).assertEqual(-1);
      logStep('CoreOperationWorkflow', trace);
    });

    /**
     * @tc.name   workflowAfterResetKeepsTheSameTaskIdentities
     * @tc.desc   A repeated workflow reuses the three rows and their URL literals.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowAfterResetKeepsTheSameTaskIdentities', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.reset();
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect((graph.taskAt(0) as DownloadTask).url).assertEqual(URL_TASK_A);
      expect((graph.taskAt(2) as DownloadTask).url).assertEqual(URL_TASK_C);
    });
    /**
     * @tc.name   workflowInterruptedRunKeepsTheCompletedRow
     * @tc.desc   When the user abandons a run at A done, the visible bar for A stays full.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowInterruptedRunKeepsTheCompletedRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 250);
      expect((graph.taskByNo(TASK_A) as DownloadTask).progress).assertEqual(100);
      expect((graph.taskByNo(TASK_A) as DownloadTask).finishedAt).assertEqual(250);
      expect((graph.taskByNo(TASK_B) as DownloadTask).isRunning()).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
      expect(graph.totalProgress()).assertEqual(100);
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   workflowSlowFirstDependencyStillUnlocks
     * @tc.desc   A very late A completion after B keeps the same unlock semantics.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('workflowSlowFirstDependencyStillUnlocks', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 100);
      for (let round = 1; round <= 3; round++) {
        expect(graph.pollTick(100 * round)).assertFalse();
      }
      expect(graph.completeTask(TASK_A, 9000)).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.pollTick(9200)).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).startedAt).assertEqual(9200);
    });

    /**
     * @tc.name   workflowNewRunAfterResetStartsFromIdleRows
     * @tc.desc   The tap after reset sees three idle rows and an armed timer once accepted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('workflowNewRunAfterResetStartsFromIdleRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      graph.reset();
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      expect(graph.startAll()).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(graph.events.size()).assertEqual(4);
      expect(graph.events.last()).assertEqual('queued:C');
    });
    /**
     * @tc.name   workflowEventRecorderTraceIsNeverEmptyDuringARun
     * @tc.desc   After the tap the trace always has the four opening entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationWorkflow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('workflowEventRecorderTraceIsNeverEmptyDuringARun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.eventTrace()).assertEqual('');
      graph.startAll();
      expect(graph.eventTrace().length).assertLarger(0);
      expect(graph.eventTrace().split('|').length).assertEqual(4);
      expect(graph.events.last()).assertEqual('queued:C');
    });
  });
}
