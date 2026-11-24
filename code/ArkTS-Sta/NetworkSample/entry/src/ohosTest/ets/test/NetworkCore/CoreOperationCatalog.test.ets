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
 * CoreOperationCatalog suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   62       private lock gate of task C
 *   68-76    updateProgress writes 100 for exactly one task
 *   79-95    completeTaskA / completeTaskB / completeTaskC
 *   109-116  download() builds the request.agent.Config
 *   174-198  startAllTasks sets isTaskFinished, starts A/B, queues C, polls 200 ms
 *
 * The suite is an operation catalog: for every observable operation of the
 * model it pins the precondition, the postcondition and the exact event entry
 * that the operation appends. The event recorder is the audited side channel,
 * so a wrong branch in completeTask or pollTick shows up as a wrong trace.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TaskGraph,
  DownloadTask,
  DownloadConfig,
  EventRecorder,
  createTaskGraph,
  TASK_A,
  TASK_B,
  TASK_C,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  POLL_INTERVAL_MS,
  PROGRESS_TOTAL,
  ERROR_NETWORK,
  joined,
  countOf
} from '../Shared/SharedDriver';

export default function networkCoreOperationCatalogTest(): void {
  describe('CoreOperationCatalog', () => {
    beforeAll(() => {
      logSuite('CoreOperationCatalog', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreOperationCatalog', 'end');
    });

    /**
     * @tc.name   freshGraphExposesTheCatalogPreconditions
     * @tc.desc   Before any operation the graph is idle, finished and event free.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshGraphExposesTheCatalogPreconditions', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
    });

    /**
     * @tc.name   startAllRecordsTheFourStartEntriesInOrder
     * @tc.desc   startAll appends start-all, two started entries and the queued C entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllRecordsTheFourStartEntriesInOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      logStep('CoreOperationCatalog', graph.eventTrace());
      expect(graph.events.size()).assertEqual(4);
      expect(graph.eventTrace()).assertEqual('start-all:begin|started:A|started:B|queued:C');
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.last()).assertEqual('queued:C');
    });

    /**
     * @tc.name   startAllPostconditionSetsTheRunningFlags
     * @tc.desc   A and B become running while C stays idle and the button flag is consumed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllPostconditionSetsTheRunningFlags', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.runningCount()).assertEqual(2);
      expect((graph.taskByNo(TASK_A) as DownloadTask).isRunning()).assertTrue();
      expect((graph.taskByNo(TASK_B) as DownloadTask).isRunning()).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
    });

    /**
     * @tc.name   startAllPostconditionArmsThePollTimer
     * @tc.desc   The timer flag turns on and the poll counter is still zero right after start.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllPostconditionArmsThePollTimer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTicks).assertEqual(0);
      expect(POLL_INTERVAL_MS).assertEqual(200);
      expect(graph.lock.waitingExclusive).assertTrue();
    });

    /**
     * @tc.name   repeatedStartIsRejectedAndCatalogued
     * @tc.desc   A second start fails its precondition and records start-rejected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedStartIsRejectedAndCatalogued', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.events.last()).assertEqual('start-rejected:0');
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   completeTaskAPostconditionWritesFullProgress
     * @tc.desc   Completing A sets progress 100, status completed and appends one completed entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completeTaskAPostconditionWritesFullProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const before: number = graph.events.size();
      expect(graph.completeTask(TASK_A)).assertTrue();
      const task: DownloadTask = graph.taskByNo(TASK_A) as DownloadTask;
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.isComplete()).assertTrue();
      expect(graph.events.size()).assertEqual(before + 1);
      expect(graph.events.last()).assertEqual('completed:A');
      expect(graph.completionOrder[0]).assertEqual(TASK_A);
    });

    /**
     * @tc.name   completeTaskBPostconditionMatchesThePageBranch
     * @tc.desc   B takes the second branch of the completion callback and records completed:B.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completeTaskBPostconditionMatchesThePageBranch', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.completeTask(TASK_B)).assertTrue();
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.eventTrace().endsWith('completed:B|unlocked:C')).assertTrue();
      expect((graph.taskByNo(TASK_B) as DownloadTask).progress).assertEqual(100);
      expect(graph.canRunTaskC()).assertTrue();
    });
    /**
     * @tc.name   unlockEntryIsDeferredUntilTheSecondCompletion
     * @tc.desc   Only the completion that closes the gate appends unlocked:C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unlockEntryIsDeferredUntilTheSecondCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_B);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.events.countOf('completed')).assertEqual(2);
    });

    /**
     * @tc.name   duplicateCompletionIsRejectedWithoutAnEvent
     * @tc.desc   A second completeTask for A returns false and leaves the trace untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateCompletionIsRejectedWithoutAnEvent', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const trace: string = graph.eventTrace();
      const size: number = graph.events.size();
      expect(graph.completeTask(TASK_A)).assertFalse();
      expect(graph.eventTrace()).assertEqual(trace);
      expect(graph.events.size()).assertEqual(size);
      expect(graph.completionOrder.length).assertEqual(1);
    });

    /**
     * @tc.name   unknownCompletionIsANoOp
     * @tc.desc   A task number outside A/B/C has no task and records nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownCompletionIsANoOp', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const size: number = graph.events.size();
      expect(graph.completeTask('Z')).assertFalse();
      expect(graph.completeTask('')).assertFalse();
      expect(graph.events.size()).assertEqual(size);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   completeTaskCRecordsBothCompletionAndUnlock
     * @tc.desc   The C branch appends completed:C and then re-evaluates the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeTaskCRecordsBothCompletionAndUnlock', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady(1);
      expect(graph.completeTaskC(2)).assertTrue();
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
    });

    /**
     * @tc.name   pollOnAnInactiveTimerOnlyCountsTheTick
     * @tc.desc   pollTick on a fresh graph returns false but still advances pollTicks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollOnAnInactiveTimerOnlyCountsTheTick', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.pollTick(0)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   pollBeforeTheGateIsQuiet
     * @tc.desc   With only A completed the poll runs no task and logs nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollBeforeTheGateIsQuiet', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const size: number = graph.events.size();
      expect(graph.pollTick(1)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.events.size()).assertEqual(size);
      expect(graph.timerActive).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
    });

    /**
     * @tc.name   pollWhenReadyStartsTheLastTask
     * @tc.desc   A tick after both completions starts C and records started:C then timer-cleared:C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollWhenReadyStartsTheLastTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick(200)).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.last()).assertEqual('timer-cleared:C');
      expect(graph.timerActive).assertFalse();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isRunning()).assertTrue();
    });

    /**
     * @tc.name   pollAfterClearStopsStartingTasks
     * @tc.desc   Because the timer flag is false, later ticks are inert yet counted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollAfterClearStopsStartingTasks', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect((graph.taskByNo(TASK_C) as DownloadTask).attempts).assertEqual(1);
    });

    /**
     * @tc.name   configCreateOperationUsesTheTaskLiterals
     * @tc.desc   The create step of download() resolves A, B and C without validation errors.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configCreateOperationUsesTheTaskLiterals', 0, () => {
      const configA: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const configB: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const configC: DownloadConfig = DownloadConfig.forTask(TASK_C);
      expect(configA.url).assertEqual(URL_TASK_A);
      expect(configB.url).assertEqual(URL_TASK_B);
      expect(configC.url).assertEqual(URL_TASK_C);
      expect(configA.isValid()).assertTrue();
      expect(configB.isValid()).assertTrue();
      expect(configC.isValid()).assertTrue();
    });

    /**
     * @tc.name   configCreateForAnUnknownTaskFailsValidation
     * @tc.desc   The create step cannot succeed when the URL literal is missing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('configCreateForAnUnknownTaskFailsValidation', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask('unknown');
      expect(config.isValid()).assertFalse();
      expect(config.validate().length).assertEqual(2);
      expect(config.fileName()).assertEqual('file');
      expect(config.url).assertEqual('');
    });

    /**
     * @tc.name   progressUpdateOperationIsMonotoneAndBounded
     * @tc.desc   reportProgress keeps the high-water mark and clamps at 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressUpdateOperationIsMonotoneAndBounded', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      expect(task.reportProgress(25)).assertEqual(25);
      expect(task.reportProgress(10)).assertEqual(25);
      expect(task.reportProgress(150)).assertEqual(100);
      expect(task.reportProgress(80)).assertEqual(100);
    });

    /**
     * @tc.name   progressUpdateIsIgnoredAfterCompletion
     * @tc.desc   A completed task keeps 100 even if the callback delivers a lower value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressUpdateIsIgnoredAfterCompletion', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.complete(1);
      expect(task.reportProgress(10)).assertEqual(100);
      expect(task.progress).assertEqual(100);
      expect(task.isComplete()).assertTrue();
      expect(task.finishedAt).assertEqual(1);
    });

    /**
     * @tc.name   resetOperationRestoresTheCatalogState
     * @tc.desc   reset() clears tasks, lock, events and timer back to the preconditions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetOperationRestoresTheCatalogState', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.reset();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   resetOperationKeepsTheTaskIdentity
     * @tc.desc   A reset graph still knows A, B and C with their URL literals.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetOperationKeepsTheTaskIdentity', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.reset();
      expect(graph.tasks.length).assertEqual(3);
      expect((graph.taskByNo(TASK_A) as DownloadTask).url).assertEqual(URL_TASK_A);
      expect((graph.taskByNo(TASK_C) as DownloadTask).url).assertEqual(URL_TASK_C);
      expect((graph.taskByNo(TASK_A) as DownloadTask).isIdle()).assertTrue();
      expect((graph.taskByNo(TASK_A) as DownloadTask).progress).assertEqual(0);
    });

    /**
     * @tc.name   fullFlowKeepsEventKindCountsBalanced
     * @tc.desc   The canonical flow produces two started entries per shared task and one per exclusive task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fullFlowKeepsEventKindCountsBalanced', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   fullFlowHighlightedTraceIsStable
     * @tc.desc   The complete trace text of one canonical run matches the documented order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fullFlowHighlightedTraceIsStable', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      const trace: string = graph.eventTrace();
      logStep('CoreOperationCatalog', trace);
      expect(trace.startsWith('start-all:begin|started:A|started:B|queued:C|')).assertTrue();
      expect(trace.indexOf('completed:A|completed:B|unlocked:C|started:C')).assertLarger(0);
      expect(trace.endsWith('completed:C|unlocked:C')).assertTrue();
      expect(trace.split('|').length).assertEqual(11);
    });

    /**
     * @tc.name   eventFingerprintIsEqualForIdenticalRuns
     * @tc.desc   Two graphs driven through the same operations fingerprint identically.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('eventFingerprintIsEqualForIdenticalRuns', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A);
      second.completeTask(TASK_A);
      first.completeTask(TASK_B);
      second.completeTask(TASK_B);
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.eventTrace()).assertEqual(second.eventTrace());
      expect(first.events.size()).assertEqual(second.events.size());
    });

    /**
     * @tc.name   eventFingerprintSeparatesDifferentOperationOrders
     * @tc.desc   Completing A then B differs from B then A at the trace level only in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('eventFingerprintSeparatesDifferentOperationOrders', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A);
      first.completeTask(TASK_B);
      second.completeTask(TASK_B);
      second.completeTask(TASK_A);
      expect(first.completionOrder[0]).assertEqual(TASK_A);
      expect(second.completionOrder[0]).assertEqual(TASK_B);
      expect(first.events.fingerprint() === second.events.fingerprint()).assertFalse();
      expect(first.events.size()).assertEqual(second.events.size());
    });

    /**
     * @tc.name   startRejectedEntryCarriesThePollCount
     * @tc.desc   The rejection detail is the pollTicks value observed at the attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('startRejectedEntryCarriesThePollCount', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.pollTick(200);
      graph.pollTick(400);
      expect(graph.startAll()).assertFalse();
      expect(graph.events.last()).assertEqual('start-rejected:2');
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.events.countOf('start-all')).assertEqual(1);
    });

    /**
     * @tc.name   completeTaskCTwiceKeepsTheFirstCompletion
     * @tc.desc   The second C completion is refused, so the completion trace keeps one C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeTaskCTwiceKeepsTheFirstCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady(1);
      graph.completeTaskC(2);
      expect(graph.completeTaskC(3)).assertFalse();
      expect(countOf(graph.completionOrder, TASK_C)).assertEqual(1);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.events.countOf('completed')).assertEqual(3);
    });

    /**
     * @tc.name   failureOperationIsIndependentOfCompletion
     * @tc.desc   A failed task records an error code and still accepts a later completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failureOperationIsIndependentOfCompletion', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      expect(task.start(0)).assertTrue();
      expect(task.fail(ERROR_NETWORK)).assertTrue();
      expect(task.lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(task.isFailed()).assertTrue();
      expect(task.complete(5)).assertTrue();
      expect(task.isComplete()).assertTrue();
      expect(task.lastErrorCode).assertEqual(ERROR_NETWORK);
    });

    /**
     * @tc.name   noOperationEverMovesProgressBackwards
     * @tc.desc   Neither progress reports nor completions lower a stored progress value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('noOperationEverMovesProgressBackwards', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const task: DownloadTask = graph.taskByNo(TASK_A) as DownloadTask;
      task.reportProgress(40);
      task.reportProgress(20);
      expect(task.progress).assertEqual(40);
      graph.completeTask(TASK_A);
      expect(task.progress).assertEqual(100);
      task.reportProgress(60);
      expect(task.progress).assertEqual(100);
      expect(graph.totalProgress()).assertEqual(100);
    });

    /**
     * @tc.name   recorderClearOnlyDropsTheEventLog
     * @tc.desc   EventRecorder.clear() empties the trace without touching the task graph.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('recorderClearOnlyDropsTheEventLog', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const recorder: EventRecorder = graph.events;
      recorder.clear();
      expect(recorder.size()).assertEqual(0);
      expect(graph.eventTrace()).assertEqual('');
      expect(graph.isTaskFinished).assertFalse();
      expect((graph.taskByNo(TASK_A) as DownloadTask).isComplete()).assertTrue();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
    });

    /**
     * @tc.name   recorderCountsByKindPrefix
     * @tc.desc   countOf uses the kind prefix, so started and start-all stay distinct.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('recorderCountsByKindPrefix', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(0);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
    });

    /**
     * @tc.name   catalogCoversEveryDetailTokenOfTheStartPhase
     * @tc.desc   The four opening entries use the documented detail tokens exactly once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('catalogCoversEveryDetailTokenOfTheStartPhase', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const entries: string[] = graph.events.entries;
      expect(entries[0]).assertEqual('start-all:begin');
      expect(entries[1]).assertEqual('started:A');
      expect(entries[2]).assertEqual('started:B');
      expect(entries[3]).assertEqual('queued:C');
      expect(joined(entries, ';')).assertEqual('start-all:begin;started:A;started:B;queued:C');
      expect(countOf(entries, 'queued:C')).assertEqual(1);
    });

    /**
     * @tc.name   completionPhaseRecordsOneEntryPerTask
     * @tc.desc   The canonical completion sequence appends completed:A, completed:B, unlocked:C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionPhaseRecordsOneEntryPerTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      const entries: string[] = graph.events.entries;
      expect(entries.length).assertEqual(7);
      expect(entries[4]).assertEqual('completed:A');
      expect(entries[5]).assertEqual('completed:B');
      expect(entries[6]).assertEqual('unlocked:C');
      expect(joined(entries, '|')).assertEqual(graph.eventTrace());
    });

    /**
     * @tc.name   startOperationLeavesThePollCounterAlone
     * @tc.desc   startAll does not poll, so pollTicks stays zero until the timer callback fires.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('startOperationLeavesThePollCounterAlone', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.pollTicks).assertEqual(0);
      graph.pollTick(200);
      expect(graph.pollTicks).assertEqual(1);
      graph.pollTick(400);
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
    });

    /**
     * @tc.name   unsupportedOperationKeepsAllPostconditions
     * @tc.desc   A rejected poll on an inactive timer changes only the tick counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('unsupportedOperationKeepsAllPostconditions', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const trace: string = graph.eventTrace();
      expect(graph.pollTick(0)).assertFalse();
      expect(graph.eventTrace()).assertEqual(trace);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.allCompleted()).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
    });

    /**
     * @tc.name   completionOfCWithoutAStartIsStillRecorded
     * @tc.desc   completeTaskC marks C done even if the page never started it, matching the callback branch.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completionOfCWithoutAStartIsStillRecorded', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.completeTaskC(0)).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isComplete()).assertTrue();
      expect(graph.completionOrder[0]).assertEqual(TASK_C);
      expect(graph.events.last()).assertEqual('completed:C');
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   operationCatalogIsIndependentOfTheSeedFlag
     * @tc.desc   A graph that never started still accepts a completion and records it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('operationCatalogIsIndependentOfTheSeedFlag', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect((graph.taskByNo(TASK_A) as DownloadTask).progress).assertEqual(100);
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.completionOrder[0]).assertEqual(TASK_A);
    });

    /**
     * @tc.name   taskAtBoundsServeTheProgressRows
     * @tc.desc   taskAt clamps its index, so the three rendered rows always resolve.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskAtBoundsServeTheProgressRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(-5).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(99).taskNo).assertEqual(TASK_C);
      expect(graph.taskByNo('Z')).assertUndefined();
    });

    /**
     * @tc.name   progressUpdatesReachTheCatalogSnapshot
     * @tc.desc   Snapshot text reflects intermediate progress updates through the graph.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('progressUpdatesReachTheCatalogSnapshot', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      (graph.taskByNo(TASK_A) as DownloadTask).reportProgress(50);
      (graph.taskByNo(TASK_B) as DownloadTask).reportProgress(25);
      expect(graph.snapshotText()).assertEqual('A:running:50|B:running:25|C:idle:0');
      expect(graph.totalProgress()).assertEqual(75);
      expect(graph.averageProgress()).assertEqual(25);
      expect(graph.events.countOf('completed')).assertEqual(0);
    });

    /**
     * @tc.name   pollingIsIdempotentWhenTheGateStaysClosed
     * @tc.desc   Repeated polls before the second completion never start C nor clear the timer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('pollingIsIdempotentWhenTheGateStaysClosed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      for (let round = 0; round < 4; round++) {
        expect(graph.pollTick(200 * (round + 1))).assertFalse();
      }
      expect(graph.pollTicks).assertEqual(4);
      expect(graph.timerActive).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).attempts).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
    });

    /**
     * @tc.name   recorderKeepsInsertionOrderWhenClearedAndReused
     * @tc.desc   After clear() the recorder accepts a fresh trace starting from the first new entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('recorderKeepsInsertionOrderWhenClearedAndReused', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('alpha', 'one');
      recorder.record('beta', 'two');
      recorder.clear();
      recorder.record('gamma', 'three');
      expect(recorder.size()).assertEqual(1);
      expect(recorder.last()).assertEqual('gamma:three');
      expect(recorder.entries[0]).assertEqual('gamma:three');
      expect(recorder.countOf('alpha')).assertEqual(0);
    });

    /**
     * @tc.name   startPreconditionIsTheFinishedFlagAlone
     * @tc.desc   Clearing isTaskFinished by hand blocks startAll even before any task runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('startPreconditionIsTheFinishedFlagAlone', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.isTaskFinished = false;
      expect(graph.startAll()).assertFalse();
      expect(graph.events.last()).assertEqual('start-rejected:0');
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   completionPreconditionIsTheTaskStatusAlone
     * @tc.desc   A task completed directly cannot be completed through the graph again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completionPreconditionIsTheTaskStatusAlone', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const task: DownloadTask = graph.taskByNo(TASK_B) as DownloadTask;
      expect(task.complete(7)).assertTrue();
      expect(graph.completeTask(TASK_B, 8)).assertFalse();
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(task.finishedAt).assertEqual(7);
    });

    /**
     * @tc.name   everyCatalogOperationKeepsTheTaskOrder
     * @tc.desc   No operation reorders the three progress rows of the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everyCatalogOperationKeepsTheTaskOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.completionOrder.length).assertEqual(3);
    });
    /**
     * @tc.name   catalogSnapshotOfAFreshGraphNamesAllRows
     * @tc.desc   The seeded snapshot text names A, B and C with idle status and zero progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogSnapshotOfAFreshGraphNamesAllRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      expect(graph.snapshotText().split('|').length).assertEqual(3);
      expect(graph.averageProgress()).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   startAllRecordsNoTerminalEvents
     * @tc.desc   The start operation never emits a completed, unlocked or timer-cleared entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startAllRecordsNoTerminalEvents', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.countOf('completed')).assertEqual(0);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   progressUpdateOperationKeepsTheTaskStatus
     * @tc.desc   reportProgress changes the value only; status and the attempt counter are untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressUpdateOperationKeepsTheTaskStatus', 0, () => {
      const idle: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      expect(idle.reportProgress(40)).assertEqual(40);
      expect(idle.status).assertEqual('idle');
      expect(idle.attempts).assertEqual(0);
      idle.start(1);
      expect(idle.reportProgress(70)).assertEqual(70);
      expect(idle.status).assertEqual('running');
      expect(idle.attempts).assertEqual(1);
    });

    /**
     * @tc.name   completionOperationDoesNotStartTheTask
     * @tc.desc   completeTask writes the completion without touching startedAt or attempts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionOperationDoesNotStartTheTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.completeTask(TASK_A, 123)).assertTrue();
      const task: DownloadTask = graph.taskByNo(TASK_A) as DownloadTask;
      expect(task.attempts).assertEqual(0);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(123);
      expect(task.isRunning()).assertFalse();
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   pollTickOnAFreshGraphNeverArmsTheTimer
     * @tc.desc   Repeated ticks on an unstarted graph count but cannot enable polling work.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollTickOnAFreshGraphNeverArmsTheTimer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 3; round++) {
        expect(graph.pollTick(round * 200)).assertFalse();
      }
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.size()).assertEqual(0);
      expect((graph.taskByNo(TASK_C) as DownloadTask).attempts).assertEqual(0);
    });

    /**
     * @tc.name   resetAppendsNoEventEntry
     * @tc.desc   reset clears the recorder instead of logging a reset entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('resetAppendsNoEventEntry', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.events.size()).assertLarger(0);
      graph.reset();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.events.last()).assertEqual('');
      expect(graph.eventTrace()).assertEqual('');
      expect(graph.events.countOf('reset')).assertEqual(0);
    });

    /**
     * @tc.name   unknownCompletionAfterTheUnlockKeepsTheUnlockCount
     * @tc.desc   A refused completion of an unknown number cannot add a second unlocked entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('unknownCompletionAfterTheUnlockKeepsTheUnlockCount', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.completeTask('Z')).assertFalse();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.canRunTaskC()).assertTrue();
    });
    /**
     * @tc.name   configCreateForEmptyUrlKeepsTheDefaultRequestShape
     * @tc.desc   The empty URL branch still builds the page request and fails only the URL checks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('configCreateForEmptyUrlKeepsTheDefaultRequestShape', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl('');
      expect(config.action).assertEqual('DOWNLOAD');
      expect(config.method).assertEqual('GET');
      expect(config.overwrite).assertTrue();
      expect(config.saveas).assertEqual('./');
      expect(config.validate().length).assertEqual(2);
      expect(config.describe()).assertEqual('DOWNLOAD|GET|true|./|');
    });
  });
}
