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
 * CoreStateManagement suite of the NetworkSample ohosTest module.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-60    three @State progress cells plus @State isTaskFinished
 *   62-65    private lock / taskACompleted / taskBCompleted / checkTaskC
 *   68-76    updateProgress writes one cell per task number
 *   174-198  startAllTasks is the only writer that clears isTaskFinished
 *   249-259  the start button is bound to isTaskFinished
 *
 * The suite covers the state layer: the run flag and its rejection path, the
 * three independent progress cells, snapshot history and the reset contract
 * that every mutable field of the graph returns to its initial value.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  PROGRESS_TOTAL,
  POLL_INTERVAL_MS,
  DownloadTask,
  TaskGraph,
  RunSnapshot,
  SnapshotLog,
  EventRecorder,
  createTaskGraph,
  startButtonEnabled,
  progressLabel,
  joined
} from '../Shared/SharedDriver';

export default function networkCoreStateManagementTest(): void {
  describe('CoreStateManagement', () => {
    beforeAll(() => {
      logSuite('CoreStateManagement', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreStateManagement', 'end');
    });

    /**
     * @tc.name   freshGraphFlagIsTrue
     * @tc.desc   A graph built for a new page instance starts finishable, which is what enables the button.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshGraphFlagIsTrue', 0, () => {
      const graph = createTaskGraph();
      logStep('CoreStateManagement', 'fresh flag ' + String(graph.isTaskFinished));
      expect(graph.isTaskFinished).assertTrue();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.isTaskFinished === false).assertFalse();
    });

    /**
     * @tc.name   startAllClearsFlag
     * @tc.desc   The only writer that clears the flag is startAll, and it clears it before any task starts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllClearsFlag', 0, () => {
      const graph = createTaskGraph();
      const accepted = graph.startAll();
      logStep('CoreStateManagement', 'flag after start ' + String(graph.isTaskFinished));
      expect(accepted).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(graph.events.entries[0]).assertEqual('start-all:begin');
      expect(graph.events.entries[1]).assertEqual('started:A');
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   rejectedStartWhileActiveKeepsFlagAndTasks
     * @tc.desc   A second start during an active run is refused and changes neither the flag nor the rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('rejectedStartWhileActiveKeepsFlagAndTasks', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const second = graph.startAll();
      logStep('CoreStateManagement', 'second start ' + String(second));
      expect(second).assertFalse();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.snapshotText()).assertEqual('A:running:0|B:running:0|C:idle:0');
    });

    /**
     * @tc.name   rejectedStartAppendsOnlyOneMarker
     * @tc.desc   Each refused start appends exactly one start-rejected entry carrying the current poll count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rejectedStartAppendsOnlyOneMarker', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.pollTick(POLL_INTERVAL_MS);
      const before = graph.events.size();
      graph.startAll();
      const afterFirst = graph.events.size();
      graph.startAll();
      logStep('CoreStateManagement', 'markers ' + String(graph.events.countOf('start-rejected')));
      expect(afterFirst).assertEqual(before + 1);
      expect(graph.events.size()).assertEqual(before + 2);
      expect(graph.events.countOf('start-rejected')).assertEqual(2);
      expect(graph.events.entries[before]).assertEqual('start-rejected:1');
      expect(graph.events.last()).assertEqual('start-rejected:1');
      expect(graph.pollTicks).assertEqual(1);
    });

    /**
     * @tc.name   individualCompletionDoesNotRestoreFlag
     * @tc.desc   Completing A or B writes a row and an event, but the run flag stays false until reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('individualCompletionDoesNotRestoreFlag', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const afterA = graph.isTaskFinished;
      graph.completeTask(TASK_B);
      const afterB = graph.isTaskFinished;
      logStep('CoreStateManagement', 'flag after completions ' + String(afterB));
      expect(afterA).assertFalse();
      expect(afterB).assertFalse();
      expect(afterB).assertEqual(afterA);
      expect(graph.totalProgress()).assertEqual(200);
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   flagStaysFalseAfterAllTasksComplete
     * @tc.desc   Even a fully finished journey leaves the flag false, so only reset re-enables the button.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('flagStaysFalseAfterAllTasksComplete', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreStateManagement', 'flag after journey ' + String(graph.isTaskFinished));
      expect(graph.allCompleted()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(300);
    });

    /**
     * @tc.name   threeCellsStartAtZero
     * @tc.desc   Each of the three mirror cells begins at the initial literal and renders a zero label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('threeCellsStartAtZero', 0, () => {
      const graph = createTaskGraph();
      logStep('CoreStateManagement', 'labels ' + graph.taskAt(0).label() + ' / ' + graph.taskAt(1).label());
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, 0));
      expect(graph.taskAt(1).label()).assertEqual('任务B当前进度 0%');
      expect(graph.taskAt(2).label()).assertEqual('任务C当前进度 0%');
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.averageProgress()).assertEqual(0);
    });

    /**
     * @tc.name   cellAAdvancesIndependently
     * @tc.desc   A progress report on A moves only the A cell and leaves the other two mirrors at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cellAAdvancesIndependently', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const value = a.reportProgress(37);
      logStep('CoreStateManagement', 'A cell ' + String(value));
      expect(value).assertEqual(37);
      expect(graph.taskAt(0).progress).assertEqual(37);
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.taskAt(0).label()).assertEqual('任务A当前进度 37%');
      expect(graph.totalProgress()).assertEqual(37);
      expect(graph.averageProgress()).assertEqual(37.0 / 3);
    });

    /**
     * @tc.name   cellBAdvancesIndependently
     * @tc.desc   The B mirror cell tracks B alone, including the case where it overtakes the A value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cellBAdvancesIndependently', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      a.reportProgress(20);
      b.reportProgress(75);
      logStep('CoreStateManagement', 'cells ' + String(a.progress) + '/' + String(b.progress));
      expect(b.progress).assertEqual(75);
      expect(a.progress).assertEqual(20);
      expect(graph.taskAt(1).progress).assertLarger(graph.taskAt(0).progress);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(95);
      expect(graph.taskAt(1).label()).assertEqual('任务B当前进度 75%');
    });

    /**
     * @tc.name   cellCAdvancesIndependently
     * @tc.desc   The third cell only moves once C is running, and its own reports never touch A or B.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cellCAdvancesIndependently', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      const value = c.reportProgress(64);
      logStep('CoreStateManagement', 'C cell ' + String(value));
      expect(value).assertEqual(64);
      expect(graph.taskAt(2).progress).assertEqual(64);
      expect(graph.taskAt(2).label()).assertEqual('任务C当前进度 64%');
      expect(graph.totalProgress()).assertEqual(264);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(2).status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   threeCellSumMatchesTotal
     * @tc.desc   totalProgress is maintained as the sum of the three mirrors at every stage of the run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('threeCellSumMatchesTotal', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      a.reportProgress(11);
      const first = graph.totalProgress();
      b.reportProgress(22);
      const second = graph.totalProgress();
      a.complete(0);
      const third = graph.totalProgress();
      logStep('CoreStateManagement', 'totals ' + String(first) + '/' + String(second) + '/' + String(third));
      expect(first).assertEqual(11);
      expect(second).assertEqual(33);
      expect(third).assertEqual(122);
      expect(third).assertEqual(graph.taskAt(0).progress + graph.taskAt(1).progress + graph.taskAt(2).progress);
      expect(graph.averageProgress()).assertEqual(122.0 / 3);
      expect(graph.tasks.length).assertEqual(3);
    });

    /**
     * @tc.name   averageUsesFixedDivisor
     * @tc.desc   The average divides by three even when only one row is running, so it stays a share of the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('averageUsesFixedDivisor', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      a.reportProgress(90);
      const average = graph.averageProgress();
      logStep('CoreStateManagement', 'average with one running row ' + String(average));
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.tasks.length).assertEqual(3);
      expect(average).assertEqual(30);
      expect(average * graph.tasks.length).assertEqual(graph.totalProgress());
      expect(graph.averageProgress() === 90).assertFalse();
      expect(graph.totalProgress() / graph.runningCount()).assertEqual(45);
    });

    /**
     * @tc.name   snapshotLogCaptureWritesThreeRows
     * @tc.desc   One capture over the graph appends exactly three snapshots in A, B, C order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotLogCaptureWritesThreeRows', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const log = new SnapshotLog();
      log.capture(graph.tasks);
      logStep('CoreStateManagement', 'captured rows ' + String(log.size()));
      expect(log.size()).assertEqual(3);
      expect(log.snapshots[0].taskNo).assertEqual(TASK_A);
      expect(log.snapshots[1].taskNo).assertEqual(TASK_B);
      expect(log.snapshots[2].taskNo).assertEqual(TASK_C);
      expect(log.snapshots[0].status).assertEqual(STATUS_RUNNING);
      expect(log.snapshots[2].status).assertEqual(STATUS_IDLE);
      expect(log.snapshots[1].progress).assertEqual(0);
    });

    /**
     * @tc.name   snapshotLogLatestReadsNewestPerTask
     * @tc.desc   After two captures latest() returns the newer row of each task, not the older one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotLogLatestReadsNewestPerTask', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      log.capture(graph.tasks);
      graph.startAll();
      graph.completeTask(TASK_A);
      log.capture(graph.tasks);
      const latestA = log.latest(TASK_A) as RunSnapshot;
      const latestB = log.latest(TASK_B) as RunSnapshot;
      logStep('CoreStateManagement', 'latest A ' + latestA.describe());
      expect(latestA.status).assertEqual(STATUS_COMPLETED);
      expect(latestA.progress).assertEqual(PROGRESS_TOTAL);
      expect(latestB.status).assertEqual(STATUS_RUNNING);
      expect(latestB.progress).assertEqual(0);
      expect(log.snapshots[0].status).assertEqual(STATUS_IDLE);
      expect(log.latest('Z')).assertUndefined();
      expect(log.size()).assertEqual(6);
    });

    /**
     * @tc.name   snapshotLogTraceIsPipeJoined
     * @tc.desc   The snapshot trace joins every row with a pipe in capture order and repeats describe() exactly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLogTraceIsPipeJoined', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      log.capture(graph.tasks);
      const trace = log.trace();
      logStep('CoreStateManagement', 'snapshot trace ' + trace);
      expect(trace).assertEqual('A/idle/0|B/idle/0|C/idle/0');
      expect(trace).assertEqual(log.snapshots[0].describe() + '|' + log.snapshots[1].describe() + '|' +
        log.snapshots[2].describe());
      expect(trace.split('|').length).assertEqual(3);
      expect(trace.indexOf('/idle/')).assertLarger(0);
      expect(trace.startsWith('A/')).assertTrue();
      expect(trace.endsWith('/idle/0')).assertTrue();
      expect(log.snapshots.length).assertEqual(3);
    });

    /**
     * @tc.name   snapshotLogClearResetsHistory
     * @tc.desc   clear() empties the history so a following capture starts again from three rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLogClearResetsHistory', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      log.capture(graph.tasks);
      log.capture(graph.tasks);
      const beforeClear = log.size();
      log.clear();
      const afterClear = log.snapshots.length;
      log.capture(graph.tasks);
      const latestA = log.latest(TASK_A) as RunSnapshot;
      logStep('CoreStateManagement', 'history ' + String(beforeClear) + ' -> ' + String(afterClear));
      expect(beforeClear).assertEqual(6);
      expect(afterClear).assertEqual(0);
      expect(log.trace()).assertEqual('A/idle/0|B/idle/0|C/idle/0');
      expect(log.size()).assertEqual(3);
      expect(latestA.status).assertEqual(STATUS_IDLE);
      expect(log.latest('Q')).assertUndefined();
    });

    /**
     * @tc.name   taskAtClampsOutOfRangeIndex
     * @tc.desc   The accessor clamps negative and oversized indexes instead of returning undefined.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskAtClampsOutOfRangeIndex', 0, () => {
      const graph = createTaskGraph();
      const low = graph.taskAt(-5);
      const last = graph.taskAt(99);
      logStep('CoreStateManagement', 'clamped access ' + low.taskNo + ' / ' + last.taskNo);
      expect(low.taskNo).assertEqual(TASK_A);
      expect(last.taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(last.url).assertEqual(graph.taskAt(2).url);
      expect(TASK_NUMBERS.length).assertEqual(3);
      expect(graph.taskAt(2) === graph.taskAt(99)).assertTrue();
    });

    /**
     * @tc.name   taskByNoReturnsUndefinedForUnknownNumber
     * @tc.desc   An unknown task number yields undefined, while the three known numbers all resolve.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskByNoReturnsUndefinedForUnknownNumber', 0, () => {
      const graph = createTaskGraph();
      const missing = graph.taskByNo('D');
      const empty = graph.taskByNo('');
      logStep('CoreStateManagement', 'unknown lookup ' + String(missing === undefined));
      expect(missing).assertUndefined();
      expect(empty).assertUndefined();
      const resolvedA = graph.taskByNo(TASK_A) as DownloadTask;
      expect(resolvedA.taskNo).assertEqual(TASK_A);
      expect(graph.taskByNo(TASK_C) === undefined).assertFalse();
      const resolved = graph.taskByNo(TASK_B) as DownloadTask;
      expect(resolved.taskNo).assertEqual(TASK_B);
      expect(graph.completeTask('D')).assertFalse();
    });

    /**
     * @tc.name   graphResetClearsRecorder
     * @tc.desc   The event recorder is emptied by reset, so the next run starts from an empty trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphResetClearsRecorder', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      const before = graph.events.size();
      graph.reset();
      logStep('CoreStateManagement', 'events ' + String(before) + ' -> ' + String(graph.events.size()));
      expect(before).assertLarger(4);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.events.last()).assertEqual('');
      expect(graph.eventTrace()).assertEqual('');
      expect(graph.events.countOf('completed')).assertEqual(0);
      expect(graph.events.fingerprint()).assertEqual(new EventRecorder().fingerprint());
    });

    /**
     * @tc.name   graphResetZeroesCellsAndFlag
     * @tc.desc   Reset restores all three progress cells to zero and the run flag to its initial true value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphResetZeroesCellsAndFlag', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      graph.reset();
      logStep('CoreStateManagement', 'reset state ' + graph.snapshotText());
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.allCompleted()).assertFalse();
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
    });

    /**
     * @tc.name   graphResetDropsCompletionOrder
     * @tc.desc   The completion order list is rebuilt empty, so a stale C entry cannot leak into the next run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphResetDropsCompletionOrder', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const before = graph.completionOrder.slice();
      graph.reset();
      logStep('CoreStateManagement', 'order before ' + joined(before, '>'));
      expect(before.length).assertEqual(3);
      expect(before[2]).assertEqual(TASK_C);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(joined(graph.completionOrder, '>')).assertEqual('');
      expect(graph.completionOrder.indexOf(TASK_C)).assertEqual(-1);
    });

    /**
     * @tc.name   graphResetReleasesLockAndTimer
     * @tc.desc   Reset rebuilds the lock and the poll model, leaving no holder, no owner and no active timer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphResetReleasesLockAndTimer', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      const ownerBefore = graph.lock.exclusiveOwner;
      graph.reset();
      logStep('CoreStateManagement', 'lock owner ' + ownerBefore + ' -> reset');
      expect(ownerBefore).assertEqual(TASK_C);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
    });

    /**
     * @tc.name   waitingExclusiveReflectsQueuedTask
     * @tc.desc   The waiter flag is raised while C is queued and lowered only once C owns the lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('waitingExclusiveReflectsQueuedTask', 0, () => {
      const graph = createTaskGraph();
      const beforeStart = graph.lock.waitingExclusive;
      graph.startAll();
      const whileQueued = graph.lock.waitingExclusive;
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      const beforeGrant = graph.lock.waitingExclusive;
      graph.pollTick(POLL_INTERVAL_MS);
      logStep('CoreStateManagement', 'waiter ' + String(whileQueued) + ' -> ' + String(graph.lock.waitingExclusive));
      expect(beforeStart).assertFalse();
      expect(whileQueued).assertTrue();
      expect(beforeGrant).assertTrue();
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   snapshotTextIsStableWithoutChanges
     * @tc.desc   Calling snapshotText twice with no state change yields the same string, so it is a pure read.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotTextIsStableWithoutChanges', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const first = graph.snapshotText();
      const second = graph.snapshotText();
      const third = graph.snapshotText();
      logStep('CoreStateManagement', 'stable text ' + first);
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(first).assertEqual('A:running:0|B:running:0|C:idle:0');
      expect(graph.events.size()).assertEqual(4);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   eventKindCountsMatchRecorderSize
     * @tc.desc   Counting every recorded kind adds up to the recorder size, and last() is the final entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventKindCountsMatchRecorderSize', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const kinds: string[] = ['start-all', 'started', 'queued', 'completed'];
      let counted: number = 0;
      for (let index = 0; index < kinds.length; index++) {
        counted = counted + graph.events.countOf(kinds[index]);
      }
      logStep('CoreStateManagement', 'counted ' + String(counted) + ' of ' + String(graph.events.size()));
      expect(counted).assertEqual(graph.events.size());
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.events.last()).assertEqual('completed:A');
      expect(graph.events.trace().endsWith('completed:A')).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
    });

    /**
     * @tc.name   progressCellsSurviveSiblingCompletion
     * @tc.desc   A sibling completion rewrites only its own cell; the partial value of the other task survives.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressCellsSurviveSiblingCompletion', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      a.reportProgress(33);
      graph.completeTask(TASK_B);
      logStep('CoreStateManagement', 'cells after sibling completion ' + graph.snapshotText());
      expect(graph.taskAt(0).progress).assertEqual(33);
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(133);
      expect(graph.taskAt(0).label()).assertEqual('任务A当前进度 33%');
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   resetThenStartEmitsFreshTrace
     * @tc.desc   After reset the recorder contains only the new start quartet, with no entry from the previous run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetThenStartEmitsFreshTrace', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.reset();
      graph.startAll();
      logStep('CoreStateManagement', 'fresh trace ' + graph.eventTrace());
      expect(graph.eventTrace()).assertEqual('start-all:begin|started:A|started:B|queued:C');
      expect(graph.events.size()).assertEqual(4);
      expect(graph.events.countOf('completed')).assertEqual(0);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   snapshotLogAccumulatesAcrossRuns
     * @tc.desc   The log is owned by the test, so reset of the graph does not erase the captured history.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotLogAccumulatesAcrossRuns', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      log.capture(graph.tasks);
      graph.startAll();
      graph.completeTask(TASK_A);
      log.capture(graph.tasks);
      graph.reset();
      graph.startAll();
      log.capture(graph.tasks);
      const latestA = log.latest(TASK_A) as RunSnapshot;
      logStep('CoreStateManagement', 'history rows ' + String(log.size()));
      expect(log.size()).assertEqual(9);
      expect(log.snapshots[0].status).assertEqual(STATUS_IDLE);
      expect(log.snapshots[3].status).assertEqual(STATUS_COMPLETED);
      expect(latestA.status).assertEqual(STATUS_RUNNING);
      expect(latestA.progress).assertEqual(0);
      expect(log.snapshots[6].progress).assertEqual(0);
      expect(log.trace().split('|').length).assertEqual(9);
    });

    /**
     * @tc.name   resetWhileTaskCQueuedKeepsCellCZero
     * @tc.desc   Abandoning the run while C waits leaves the C cell at zero with no attempt recorded.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetWhileTaskCQueuedKeepsCellCZero', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.pollTick(POLL_INTERVAL_MS);
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      const queuedStatus = c.status;
      graph.reset();
      logStep('CoreStateManagement', 'queued C ' + queuedStatus + ' then ' + c.status);
      expect(queuedStatus).assertEqual(STATUS_IDLE);
      expect(c.progress).assertEqual(0);
      expect(c.attempts).assertEqual(0);
      expect(c.status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.lock.waitingExclusive).assertFalse();
    });

    /**
     * @tc.name   taskArrayOrderIsFixedAtConstruction
     * @tc.desc   The graph holds its three rows in A, B, C order no matter how the run proceeds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskArrayOrderIsFixedAtConstruction', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_C);
      graph.completeTask(TASK_B);
      const order: string[] = [];
      for (let index = 0; index < graph.tasks.length; index++) {
        order.push(graph.taskAt(index).taskNo);
      }
      logStep('CoreStateManagement', 'row order ' + joined(order, '-'));
      expect(joined(order, '-')).assertEqual('A-B-C');
      expect(joined(order, '-')).assertEqual(joined(TASK_NUMBERS, '-'));
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.completionOrder[0]).assertEqual(TASK_C);
      expect(joined(TASK_NUMBERS, '')).assertEqual('ABC');
    });

    /**
     * @tc.name   recorderCountOfIgnoresUnknownKinds
     * @tc.desc   Counting a kind that was never recorded returns zero while the recorded kinds stay exact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('recorderCountOfIgnoresUnknownKinds', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const recorder = graph.events;
      logStep('CoreStateManagement', 'unknown kind count ' + String(recorder.countOf('aborted')));
      expect(recorder.countOf('aborted')).assertEqual(0);
      expect(recorder.countOf('')).assertEqual(0);
      expect(recorder.countOf('start-all')).assertEqual(1);
      expect(recorder.size()).assertEqual(4);
      expect(recorder.trace().split('|').length).assertEqual(4);
      expect(recorder.last()).assertEqual('queued:C');
      expect(recorder.entries[0]).assertEqual('start-all:begin');
    });

    /**
     * @tc.name   rejectedStartDoesNotAdvancePollTicks
     * @tc.desc   Refusal is not a timer round: the poll counter only moves through pollTick.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('rejectedStartDoesNotAdvancePollTicks', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const ticksAtStart = graph.pollTicks;
      graph.startAll();
      graph.startAll();
      const ticksAfterRefusals = graph.pollTicks;
      graph.pollTick(POLL_INTERVAL_MS);
      logStep('CoreStateManagement', 'ticks ' + String(ticksAtStart) + '/' + String(ticksAfterRefusals) + '/' +
        String(graph.pollTicks));
      expect(ticksAtStart).assertEqual(0);
      expect(ticksAfterRefusals).assertEqual(0);
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.events.countOf('start-rejected')).assertEqual(2);
      expect(graph.events.entries[4]).assertEqual('start-rejected:0');
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.runningCount()).assertEqual(2);
    });

    /**
     * @tc.name   snapshotLogLatestBeforeAnyCaptureIsUndefined
     * @tc.desc   An empty log answers latest() with undefined for every task number and has an empty trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotLogLatestBeforeAnyCaptureIsUndefined', 0, () => {
      const log = new SnapshotLog();
      logStep('CoreStateManagement', 'empty log size ' + String(log.size()));
      expect(log.size()).assertEqual(0);
      expect(log.latest(TASK_A)).assertUndefined();
      expect(log.latest(TASK_B)).assertUndefined();
      expect(log.latest(TASK_C)).assertUndefined();
      expect(log.trace()).assertEqual('');
      expect(log.snapshots.length).assertEqual(0);
      log.add(new RunSnapshot(TASK_A, 5, STATUS_RUNNING));
      expect(log.size()).assertEqual(1);
      expect(log.trace()).assertEqual('A/running/5');
      expect(log.latest(TASK_B)).assertUndefined();
    });

    /**
     * @tc.name   resetClearsStartRejectionMarkers
     * @tc.desc   Rejection entries accumulated during a run disappear with the recorder on reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetClearsStartRejectionMarkers', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.startAll();
      graph.startAll();
      const rejectionsBefore = graph.events.countOf('start-rejected');
      const sizeBefore = graph.events.size();
      graph.reset();
      logStep('CoreStateManagement', 'rejections ' + String(rejectionsBefore) + ' -> 0');
      expect(rejectionsBefore).assertEqual(2);
      expect(sizeBefore).assertEqual(6);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      graph.startAll();
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
      expect(graph.events.size()).assertEqual(4);
    });

    /**
     * @tc.name   snapshotLogLatestOfClearedLogIsUndefinedAgain
     * @tc.desc   After clear() the log forgets its newest rows, so latest() goes back to undefined for all tasks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotLogLatestOfClearedLogIsUndefinedAgain', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      graph.startAll();
      log.capture(graph.tasks);
      const capturedA = log.latest(TASK_A) as RunSnapshot;
      log.clear();
      logStep('CoreStateManagement', 'captured then cleared ' + capturedA.describe());
      expect(capturedA.status).assertEqual(STATUS_RUNNING);
      expect(log.size()).assertEqual(0);
      expect(log.latest(TASK_A)).assertUndefined();
      expect(log.latest(TASK_C)).assertUndefined();
      expect(log.trace()).assertEqual('');
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
    });
  });
}
