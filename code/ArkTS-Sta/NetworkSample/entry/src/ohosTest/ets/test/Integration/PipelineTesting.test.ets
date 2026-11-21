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
 * PipelineTesting suite.
 *
 * The sample is a staged pipeline:
 *   1 config creation -> 2 start -> 3 progress -> 4 A/B completion ->
 *   5 gate unlock -> 6 C start -> 7 C finish.
 * Each case asserts the output of one stage and proves it is the input the
 * next stage consumes, so a broken hand-off is visible at the boundary.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   109-148 download(): config then create then callbacks then start
 *   174-198 startAllTasks: start A/B, arm the exclusive poll
 *   68-76   updateProgress: the completion stage output
 *   98-107  checkAndUnlock and canRunTaskC between stage 4 and 6
 *   194-196 clearInterval once the last stage is scheduled
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  TASK_URLS,
  PROGRESS_TOTAL,
  POLL_INTERVAL_MS,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  STATUS_FAILED,
  ERROR_NETWORK,
  createTaskGraph,
  DownloadConfig,
  expectedConfigFor,
  completionTrace,
  isTopologicalCompletion,
  NetworkMetrics,
  SnapshotLog,
  progressLabel,
  startButtonEnabled,
  textFingerprint,
  fileNameOf,
  hostOf,
  isHttpsUrl,
  TaskGraph
} from '../Shared/SharedDriver';

/** Runs stages one to four for A and B without starting C. */
function driveThroughCompletion(graph: TaskGraph): void {
  graph.startAll();
  graph.completeTask(TASK_A);
  graph.completeTask(TASK_B);
}

export default function pipelineTestingTest(): void {
  describe('PipelineTesting', () => {
    beforeAll(() => {
      logSuite('PipelineTesting', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('PipelineTesting', 'end');
    });

    /**
     * @tc.name   stageOneConfigForEachTaskIsValid
     * @tc.desc   Stage one produces one accepted configuration per task, which is the start stage input.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageOneConfigForEachTaskIsValid', 0, () => {
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        const config = DownloadConfig.forTask(TASK_NUMBERS[index]);
        expect(config.isValid()).assertTrue();
        expect(config.validate().length).assertEqual(0);
        expect(isHttpsUrl(config.url)).assertTrue();
        expect(hostOf(config.url)).assertEqual('gitee.com');
        expect(config.action).assertEqual('DOWNLOAD');
        expect(config.method).assertEqual('GET');
        expect(config.overwrite).assertTrue();
        expect(config.saveas).assertEqual('./');
        expect(config.fileName().endsWith('.png')).assertTrue();
      }
      expect(TASK_NUMBERS.length).assertEqual(3);
      expect(DownloadConfig.forTask(TASK_C).fileName()).assertEqual('icon_main_color.png');
      expect(DownloadConfig.forTask(TASK_A).fileName()).assertEqual('favor_list_tea.png');
      expect(DownloadConfig.forTask(TASK_B).fileName()).assertEqual('after_cache.png');
      expect(DownloadConfig.forTask(TASK_A).fileName() === DownloadConfig.forTask(TASK_B).fileName()).assertFalse();
      expect(DownloadConfig.forTask(TASK_A).describe().split('|')[4]).assertEqual(TASK_URLS[0]);
    });

    /**
     * @tc.name   stageOneConfigMatchesOracle
     * @tc.desc   Stage one output is byte identical to the independent configuration oracle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageOneConfigMatchesOracle', 0, () => {
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        const produced = DownloadConfig.forTask(TASK_NUMBERS[index]);
        const oracle = expectedConfigFor(TASK_NUMBERS[index]);
        expect(produced.sameAs(oracle)).assertTrue();
        expect(produced.describe()).assertEqual(oracle.describe());
        expect(produced.describe().split('|').length).assertEqual(5);
        expect(produced.url).assertEqual(TASK_URLS[index]);
        expect(oracle.url).assertEqual(TASK_URLS[index]);
      }
      expect(DownloadConfig.forTask(TASK_A).describe().startsWith('DOWNLOAD|GET|true|./|')).assertTrue();
      expect(DownloadConfig.forTask(TASK_B).sameAs(DownloadConfig.forTask(TASK_C))).assertFalse();
    });

    /**
     * @tc.name   stageTwoStartRequiresIdleButton
     * @tc.desc   The start stage only proceeds while isTaskFinished is true, exactly as the button binding enforces.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageTwoStartRequiresIdleButton', 0, () => {
      const graph = createTaskGraph();
      expect(graph.isTaskFinished).assertTrue();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(graph.startAll()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.taskAt(0).attempts).assertEqual(1);
    });

    /**
     * @tc.name   stageTwoStartIsAcceptedExactlyOnce
     * @tc.desc   One accepted start per run: further calls are refused and add only rejection records.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageTwoStartIsAcceptedExactlyOnce', 0, () => {
      const graph = createTaskGraph();
      const accepted: boolean[] = [graph.startAll(), graph.startAll(), graph.startAll()];
      expect(accepted[0]).assertTrue();
      expect(accepted[1]).assertFalse();
      expect(accepted[2]).assertFalse();
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('start-rejected')).assertEqual(2);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(1).attempts).assertEqual(1);
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.size()).assertEqual(6);
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   stageTwoStartArmsTimerAndSharedLocks
     * @tc.desc   The start stage output is two shared holders plus an armed poll waiting for the exclusive slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageTwoStartArmsTimerAndSharedLocks', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.timerActive).assertTrue();
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.lock.isUnlocked()).assertFalse();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.events.countOf('queued')).assertEqual(1);
    });

    /**
     * @tc.name   stageThreeProgressFeedsLabel
     * @tc.desc   Progress reported at stage three is exactly what the row label renders for the next frame.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageThreeProgressFeedsLabel', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const steps: number[] = [8, 21, 34, 47, 60, 73, 86, 99];
      for (let index = 0; index < steps.length; index++) {
        const value: number = graph.taskAt(0).reportProgress(steps[index]);
        expect(value).assertEqual(steps[index]);
        expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, steps[index]));
        expect(graph.taskAt(0).label().indexOf(String(steps[index])) > 0).assertTrue();
        expect(graph.taskAt(0).progressRatio()).assertEqual(steps[index] / 100);
        expect(graph.taskAt(0).label().split(' ').length).assertEqual(2);
      }
      expect(graph.taskAt(0).progress).assertEqual(99);
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(1).label()).assertEqual(progressLabel(TASK_B, 0));
      expect(graph.taskAt(0).progressRatio()).assertEqual(0.99);
      expect(graph.taskAt(0).describe()).assertEqual('A:running:99');
      expect(graph.taskAt(0).label().length).assertEqual(11);
      expect(graph.taskAt(0).label().indexOf('99') > 0).assertTrue();
      expect(graph.taskAt(0).label().endsWith('99%')).assertTrue();
    });

    /**
     * @tc.name   stageThreeProgressIsMonotonic
     * @tc.desc   The progress stage output never decreases, so the next completion stage always starts above zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stageThreeProgressIsMonotonic', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const steps: number[] = [55, 12, 55, 40, 90, 30, 100];
      let previous: number = 0;
      for (let index = 0; index < steps.length; index++) {
        const value: number = graph.taskAt(1).reportProgress(steps[index]);
        expect(value >= previous).assertTrue();
        expect(value <= PROGRESS_TOTAL).assertTrue();
        previous = value;
      }
      expect(graph.taskAt(1).progress).assertEqual(100);
      expect(graph.taskAt(1).label()).assertEqual(progressLabel(TASK_B, 100));
      expect(graph.taskAt(1).progressRatio()).assertEqual(1);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(1).isComplete()).assertFalse();
    });

    /**
     * @tc.name   stageThreeProgressDoesNotOpenGate
     * @tc.desc   A full progress bar alone never counts as completion, so the gate stays closed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stageThreeProgressDoesNotOpenGate', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(100);
      graph.taskAt(1).reportProgress(100);
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.taskAt(1).progress).assertEqual(100);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.events.countOf('completed')).assertEqual(0);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(0).isComplete()).assertFalse();
      expect(graph.taskAt(1).isRunning()).assertTrue();
    });

    /**
     * @tc.name   stageFourCompletionWritesFullBar
     * @tc.desc   The completion stage replaces any partial bar with exactly one hundred percent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageFourCompletionWritesFullBar', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(42);
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(0).progressRatio()).assertEqual(1);
      expect(graph.taskAt(0).label()).assertEqual('任务A当前进度 100%');
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.events.last()).assertEqual('completed:A');
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.completionOrder[0]).assertEqual(TASK_A);
      expect(graph.taskAt(0).progressRatio() === 1).assertTrue();
      expect(graph.taskAt(0).label().endsWith('100%')).assertTrue();
      expect(graph.taskAt(0).isRunning()).assertFalse();
    });

    /**
     * @tc.name   stageFourCompletionRecordsOrder
     * @tc.desc   Each completion appends exactly one entry to the trace, in arrival order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageFourCompletionRecordsOrder', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(completionTrace(graph)).assertEqual('B');
      graph.completeTask(TASK_A);
      expect(graph.completionOrder.length).assertEqual(2);
      expect(completionTrace(graph)).assertEqual('B|A');
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(completionTrace(graph)).assertEqual('B|A|C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
    });

    /**
     * @tc.name   stageFourFirstCompletionKeepsGateShut
     * @tc.desc   The first completion is not enough: the gate stays shut and the third stage output is unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageFourFirstCompletionKeepsGateShut', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.runTaskCIfReady(100)).assertFalse();
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   stageFiveGateOpensAfterBothCompletions
     * @tc.desc   The gate stage consumes both completions and emits one unlock record plus an empty lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageFiveGateOpensAfterBothCompletions', 0, () => {
      const graph = createTaskGraph();
      driveThroughCompletion(graph);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.taskAt(1).progress).assertEqual(100);
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   stageFiveUnlockEventExactlyOnce
     * @tc.desc   Repeating stage four calls does not emit a second unlock record.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stageFiveUnlockEventExactlyOnce', 0, () => {
      const graph = createTaskGraph();
      driveThroughCompletion(graph);
      const sizeAtGate: number = graph.events.size();
      expect(graph.completeTask(TASK_A)).assertFalse();
      expect(graph.completeTask(TASK_B)).assertFalse();
      expect(graph.events.size()).assertEqual(sizeAtGate);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.taskAt(2).attempts).assertEqual(0);
    });

    /**
     * @tc.name   stageFiveGateRejectsSingleDependency
     * @tc.desc   Either dependency alone leaves the gate shut, whichever one finishes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stageFiveGateRejectsSingleDependency', 0, () => {
      const onlyA = createTaskGraph();
      onlyA.startAll();
      onlyA.completeTask(TASK_A);
      expect(onlyA.canRunTaskC()).assertFalse();
      expect(onlyA.events.countOf('unlocked')).assertEqual(0);
      const onlyB = createTaskGraph();
      onlyB.startAll();
      onlyB.completeTask(TASK_B);
      expect(onlyB.canRunTaskC()).assertFalse();
      expect(onlyB.events.countOf('unlocked')).assertEqual(0);
      expect(onlyA.canRunTaskC()).assertEqual(onlyB.canRunTaskC());
      expect(onlyA.taskAt(2).isIdle() && onlyB.taskAt(2).isIdle()).assertTrue();
      expect(onlyA.lock.holderCount()).assertEqual(1);
      expect(onlyB.lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   stageSixTaskCStartsOnPoll
     * @tc.desc   The first poll after the unlock starts the exclusive task with the poll timestamp.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageSixTaskCStartsOnPoll', 0, () => {
      const graph = createTaskGraph();
      driveThroughCompletion(graph);
      expect(graph.pollTick(600)).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(2).startedAt).assertEqual(600);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.last()).assertEqual('timer-cleared:C');
      expect(graph.runningCount()).assertEqual(1);
      expect(graph.taskAt(2).label()).assertEqual(progressLabel(TASK_C, 0));
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.taskAt(2).isIdle()).assertFalse();
      expect(graph.lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   stageSixTimerClearedAfterStart
     * @tc.desc   The timer flag is the output of stage six and is false from then on.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageSixTimerClearedAfterStart', 0, () => {
      const graph = createTaskGraph();
      driveThroughCompletion(graph);
      expect(graph.timerActive).assertTrue();
      graph.pollTick(POLL_INTERVAL_MS);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.pollTick(2 * POLL_INTERVAL_MS)).assertFalse();
      expect(graph.pollTick(3 * POLL_INTERVAL_MS)).assertFalse();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.taskAt(1).startedAt).assertEqual(0);
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   stageSixTaskCUsesExclusiveLock
     * @tc.desc   Stage six transfers ownership from the shared pair to the single exclusive owner.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stageSixTaskCUsesExclusiveLock', 0, () => {
      const graph = createTaskGraph();
      driveThroughCompletion(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.lock.acquireShared(TASK_A)).assertFalse();
      expect(graph.lock.rejections).assertEqual(1);
      expect(graph.lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   stageSixSecondStartBlockedByNonIdleTask
     * @tc.desc   A running exclusive task cannot be started again even though the gate remains open.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stageSixSecondStartBlockedByNonIdleTask', 0, () => {
      const graph = createTaskGraph();
      driveThroughCompletion(graph);
      expect(graph.runTaskCIfReady(200)).assertTrue();
      expect(graph.runTaskCIfReady(400)).assertFalse();
      expect(graph.pollTick(600)).assertFalse();
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.taskAt(2).startedAt).assertEqual(200);
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   stageSevenFinishCompletesAll
     * @tc.desc   The final stage completes the exclusive task and leaves all three rows at a full bar.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageSevenFinishCompletesAll', 0, () => {
      const graph = createTaskGraph();
      driveThroughCompletion(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      expect(graph.completeTaskC(2 * POLL_INTERVAL_MS)).assertTrue();
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(2).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(2).finishedAt).assertEqual(2 * POLL_INTERVAL_MS);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.averageProgress()).assertEqual(100);
      for (let index = 0; index < graph.tasks.length; index++) {
        expect(graph.taskAt(index).label()).assertEqual(progressLabel(TASK_NUMBERS[index], 100));
      }
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   stageSevenFinishReleasesLock
     * @tc.desc   The finish stage hands the exclusive slot back, leaving a fully unlocked lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageSevenFinishReleasesLock', 0, () => {
      const graph = createTaskGraph();
      driveThroughCompletion(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.completeTaskC(400)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.taskAt(2).status).assertEqual(STATUS_COMPLETED);
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.taskAt(2).finishedAt).assertEqual(400);
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   stageSevenFinishUpdatesMetrics
     * @tc.desc   Metrics read after the last stage report three completions and a full progress sum.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stageSevenFinishUpdatesMetrics', 0, () => {
      const graph = createTaskGraph();
      const before = NetworkMetrics.from(graph);
      driveThroughCompletion(graph);
      const midway = NetworkMetrics.from(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      const after = NetworkMetrics.from(graph);
      expect(before.completedTasks).assertEqual(0);
      expect(midway.completedTasks).assertEqual(2);
      expect(after.completedTasks).assertEqual(3);
      expect(after.failedTasks).assertEqual(0);
      expect(after.totalProgress).assertEqual(300);
      expect(before.totalProgress).assertEqual(0);
      expect(midway.totalProgress).assertEqual(200);
      expect(after.averageProgress()).assertEqual(100);
      expect(after.successRatio()).assertEqual(1);
      expect(after.fingerprint()).assertEqual(textFingerprint('3:3:0:300'));
      expect(after.fingerprint() === midway.fingerprint()).assertFalse();
      expect(midway.fingerprint()).assertEqual(textFingerprint('3:2:0:200'));
    });

    /**
     * @tc.name   stagePipelineEventCausality
     * @tc.desc   In the recorded trace every stage event precedes the event of the stage that consumes it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stagePipelineEventCausality', 0, () => {
      const graph = createTaskGraph();
      driveThroughCompletion(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      const trace: string = graph.events.trace();
      expect(trace.indexOf('start-all:begin') < trace.indexOf('started:A')).assertTrue();
      expect(trace.indexOf('started:A') < trace.indexOf('completed:A')).assertTrue();
      expect(trace.indexOf('completed:B') < trace.indexOf('unlocked:C')).assertTrue();
      expect(trace.indexOf('unlocked:C') < trace.indexOf('started:C')).assertTrue();
      expect(trace.indexOf('started:C') < trace.indexOf('timer-cleared:C')).assertTrue();
      expect(trace.indexOf('timer-cleared:C') < trace.indexOf('completed:C')).assertTrue();
      expect(trace.endsWith('completed:C|unlocked:C')).assertTrue();
      expect(trace.split('|').length).assertEqual(11);
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.taskAt(2).startedAt).assertEqual(POLL_INTERVAL_MS);
    });

    /**
     * @tc.name   stagePipelineFingerprintStable
     * @tc.desc   Two graphs driven through identical stages share one trace fingerprint and one metric fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stagePipelineFingerprintStable', 0, () => {
      const first = createTaskGraph();
      const second = createTaskGraph();
      driveThroughCompletion(first);
      first.pollTick(POLL_INTERVAL_MS);
      first.completeTaskC(2 * POLL_INTERVAL_MS);
      driveThroughCompletion(second);
      second.pollTick(POLL_INTERVAL_MS);
      second.completeTaskC(2 * POLL_INTERVAL_MS);
      expect(first.events.trace()).assertEqual(second.events.trace());
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.fingerprint()).assertEqual(textFingerprint(first.events.trace()));
      expect(NetworkMetrics.from(first).fingerprint()).assertEqual(NetworkMetrics.from(second).fingerprint());
      expect(first.snapshotText()).assertEqual(second.snapshotText());
      expect(completionTrace(first)).assertEqual(completionTrace(second));
      expect(first.events.size()).assertEqual(second.events.size());
      expect(first.events.size()).assertEqual(11);
    });

    /**
     * @tc.name   stagePipelineSnapshotTrace
     * @tc.desc   Captures taken stage by stage grow by three rows and end with three completed snapshots.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stagePipelineSnapshotTrace', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      graph.startAll();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(6);
      graph.completeTask(TASK_A);
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(9);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(12);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(15);
      expect(log.trace().split('|').length).assertEqual(15);
      expect(log.snapshots[14].status).assertEqual(STATUS_COMPLETED);
      expect(log.snapshots[14].progress).assertEqual(100);
      expect(log.snapshots[12].progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   stagePipelineRetryAtCompletionStage
     * @tc.desc   A failure at the completion stage is retried and then feeds the gate stage as if it had succeeded first time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stagePipelineRetryAtCompletionStage', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      expect(graph.taskAt(0).status).assertEqual(STATUS_FAILED);
      expect(graph.canRunTaskC()).assertFalse();
      graph.taskAt(0).reset();
      graph.taskAt(0).start(POLL_INTERVAL_MS);
      graph.completeTask(TASK_A);
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(0).progress).assertEqual(100);
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.pollTick(2 * POLL_INTERVAL_MS)).assertTrue();
      expect(graph.completeTaskC(3 * POLL_INTERVAL_MS)).assertTrue();
      expect(graph.allCompleted()).assertTrue();
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(graph.taskAt(0).attempts).assertEqual(2);
      expect(graph.events.countOf('unlocked')).assertEqual(2);
    });

    /**
     * @tc.name   stagePipelineResetReturnsToConfigStage
     * @tc.desc   A reset rewinds the pipeline to the state a freshly configured page has before stage two.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stagePipelineResetReturnsToConfigStage', 0, () => {
      const graph = createTaskGraph();
      driveThroughCompletion(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      expect(graph.allCompleted()).assertTrue();
      graph.reset();
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.snapshotText()).assertEqual(createTaskGraph().snapshotText());
      expect(graph.startAll()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.events.countOf('start-all')).assertEqual(1);
    });

    /**
     * @tc.name   stagePipelineConfigSurvivesAllStages
     * @tc.desc   The stage one configuration object stays valid and unchanged while the later stages run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stagePipelineConfigSurvivesAllStages', 0, () => {
      const config = DownloadConfig.forTask(TASK_B);
      const snapshot: string = config.describe();
      const graph = createTaskGraph();
      driveThroughCompletion(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      expect(config.describe()).assertEqual(snapshot);
      expect(config.isValid()).assertTrue();
      expect(config.url).assertEqual(TASK_URLS[1]);
      expect(config.fileName()).assertEqual('after_cache.png');
      expect(hostOf(config.url)).assertEqual('gitee.com');
      expect(config.validate().length).assertEqual(0);
      expect(graph.taskAt(1).url).assertEqual(config.url);
      expect(graph.taskAt(1).status).assertEqual(STATUS_COMPLETED);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.taskAt(1).label()).assertEqual(progressLabel(TASK_B, 100));
      expect(config.url).assertEqual(graph.taskAt(1).url);
    });

    /**
     * @tc.name   stagePipelineProgressBudgetAccounting
     * @tc.desc   Each stage accounts for the progress budget: partial sums, then the full three hundred.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stagePipelineProgressBudgetAccounting', 0, () => {
      const graph = createTaskGraph();
      expect(graph.totalProgress()).assertEqual(0);
      graph.startAll();
      graph.taskAt(0).reportProgress(25);
      graph.taskAt(1).reportProgress(50);
      expect(graph.totalProgress()).assertEqual(75);
      expect(graph.averageProgress()).assertEqual(25);
      graph.completeTask(TASK_A);
      expect(graph.totalProgress()).assertEqual(150);
      graph.completeTask(TASK_B);
      expect(graph.totalProgress()).assertEqual(200);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.taskAt(2).reportProgress(60);
      expect(graph.totalProgress()).assertEqual(260);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.averageProgress()).assertEqual(100);
      expect(NetworkMetrics.from(graph).totalProgress).assertEqual(3 * PROGRESS_TOTAL);
      expect(graph.taskAt(2).progress).assertEqual(100);
      expect(graph.taskAt(2).label()).assertEqual(progressLabel(TASK_C, 100));
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.totalProgress() - 300).assertEqual(0);
    });

    /**
     * @tc.name   stagePipelineRejectsSkippedGate
     * @tc.desc   Jumping straight to stage six is refused: no poll and no direct start can bypass the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stagePipelineRejectsSkippedGate', 0, () => {
      const graph = createTaskGraph();
      expect(graph.runTaskCIfReady()).assertFalse();
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertFalse();
      graph.startAll();
      expect(graph.runTaskCIfReady()).assertFalse();
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      graph.completeTask(TASK_A);
      expect(graph.runTaskCIfReady()).assertFalse();
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.events.countOf('started')).assertEqual(2);
      graph.completeTask(TASK_B);
      expect(graph.runTaskCIfReady(300)).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.taskAt(1).progress).assertEqual(100);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
    });

    /**
     * @tc.name   stagePipelineEndToEndReport
     * @tc.desc   One report line summarises the seven stages, and every stage value can be re-read from the graph.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PipelineTesting scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stagePipelineEndToEndReport', 0, () => {
      const graph = createTaskGraph();
      driveThroughCompletion(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      const metrics = NetworkMetrics.from(graph);
      logStep('PipelineTesting', 'stages=7 trace=' + completionTrace(graph) + ' metrics=' + String(metrics.fingerprint()));
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(3);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('3:3:0:300'));
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.events.size()).assertEqual(11);
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.taskAt(2).startedAt).assertEqual(POLL_INTERVAL_MS);
      expect(graph.taskAt(2).finishedAt).assertEqual(2 * POLL_INTERVAL_MS);
      expect(graph.taskAt(0).finishedAt).assertEqual(0);
      expect(graph.taskAt(1).finishedAt).assertEqual(0);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.totalProgress() - 300).assertEqual(0);
      expect(graph.events.size()).assertEqual(11);
    });

    // End of pipeline suite.
  });
}
