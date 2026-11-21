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
 * StateManagement suite.
 *
 * Pins the observable @State members of the page and the helper stores that
 * mirror them: isTaskFinished, the three progress values, the snapshot log, the
 * dependency lock holders and the event recorder.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   57-60    @State progressValueA / progressValueB / progressValueC / isTaskFinished
 *   62-64    private lock, taskACompleted, taskBCompleted
 *   68-76    updateProgress writes 100 into exactly one state member
 *   98-102   checkAndUnlock reads both booleans and the lock
 *   105-107  canRunTaskC renders the inverted lock
 *   174-175  startAllTasks clears isTaskFinished before any request is created
 *   209-247  each row renders label plus a linear Progress with total 100
 *   250-259  the button is enabled by isTaskFinished
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  PROGRESS_INITIAL,
  PROGRESS_TOTAL,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  DownloadTask,
  RunSnapshot,
  SnapshotLog,
  DependencyLock,
  TaskGraph,
  EventRecorder,
  createTaskGraph,
  expectedProgressAfter,
  progressLabel,
  startButtonEnabled,
  startButtonBackground,
  clampInt
} from '../Shared/SharedDriver';

export default function stateManagementTest(): void {
  describe('StateManagement', () => {
    beforeAll(() => {
      logSuite('StateManagement', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('StateManagement', 'end');
    });

    /**
     * @tc.name   finishedFlagStartsTrueOnFreshGraph
     * @tc.desc   A fresh graph renders the start button enabled because isTaskFinished starts true.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('finishedFlagStartsTrueOnFreshGraph', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   startAllFlipsFinishedFlagOnce
     * @tc.desc   startAll clears isTaskFinished exactly once and the flag stays false while work runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllFlipsFinishedFlagOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.isTaskFinished).assertFalse();
      graph.pollTick(1);
      expect(graph.isTaskFinished).assertFalse();
      graph.completeTask(TASK_A, 2);
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   finishedFlagIsNotRestoredByCompletion
     * @tc.desc   Finishing all three rows does not re-enable the button; only reset does, as in the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('finishedFlagIsNotRestoredByCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
    });

    /**
     * @tc.name   rowProgressStartsAtInitialForEveryTask
     * @tc.desc   All three progress members report zero before any callback has fired.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('rowProgressStartsAtInitialForEveryTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const values: number[] = [graph.taskAt(0).progress, graph.taskAt(1).progress, graph.taskAt(2).progress];
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(0);
      expect(values[2]).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.taskAt(0).progressRatio()).assertEqual(0);
    });

    /**
     * @tc.name   singleRowProgressLeavesSiblingsUntouched
     * @tc.desc   Reporting progress on A changes only the A member, exactly like updateProgress('A').
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('singleRowProgressLeavesSiblingsUntouched', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const reported: number = graph.taskAt(0).reportProgress(42);
      expect(reported).assertEqual(42);
      expect(graph.taskAt(0).progress).assertEqual(42);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.totalProgress()).assertEqual(42);
    });

    /**
     * @tc.name   staleLowerProgressReportIsIgnored
     * @tc.desc   A progress callback that arrives out of order cannot lower a state member that already advanced.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('staleLowerProgressReportIsIgnored', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      b.reportProgress(80);
      const afterStale: number = b.reportProgress(15);
      expect(afterStale).assertEqual(80);
      expect(b.progress).assertEqual(80);
      expect(expectedProgressAfter(80, 15)).assertEqual(80);
      expect(b.progressRatio()).assertEqual(0.8);
    });

    /**
     * @tc.name   oversizedProgressClampsToFull
     * @tc.desc   A callback worth more than 100 is bounded to the Progress total used by every row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('oversizedProgressClampsToFull', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      const clamped: number = a.reportProgress(250);
      expect(clamped).assertEqual(PROGRESS_TOTAL);
      expect(a.progress).assertEqual(100);
      expect(clampInt(250, 0, 100)).assertEqual(100);
      expect(a.progressRatio()).assertEqual(1);
      expect(graph.taskAt(1).progress).assertEqual(0);
    });

    /**
     * @tc.name   negativeProgressClampsToInitial
     * @tc.desc   A negative callback value cannot drive a progress member below zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('negativeProgressClampsToInitial', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const c: DownloadTask = graph.taskAt(2);
      const clamped: number = c.reportProgress(-9);
      expect(clamped).assertEqual(PROGRESS_INITIAL);
      expect(c.progress).assertEqual(0);
      expect(clampInt(-9, 0, 100)).assertEqual(0);
      expect(c.progressRatio()).assertEqual(0);
      expect(c.label()).assertEqual('任务C当前进度 0%');
    });

    /**
     * @tc.name   progressRatioReportsFractionOfFull
     * @tc.desc   The ratio member converts the state value into the 0..1 span consumed by the progress row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressRatioReportsFractionOfFull', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.reportProgress(25);
      expect(a.progressRatio()).assertEqual(0.25);
      a.reportProgress(75);
      expect(a.progressRatio()).assertEqual(0.75);
      a.complete(10);
      expect(a.progressRatio()).assertEqual(1);
      expect(a.progressRatio() * PROGRESS_TOTAL).assertEqual(100);
    });

    /**
     * @tc.name   progressLabelUsesProductionTemplate
     * @tc.desc   The rendered label keeps the exact "任务X当前进度 N%" template of the three Text nodes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLabelUsesProductionTemplate', 0, () => {
      const label: string = progressLabel(TASK_A, 40);
      expect(label).assertEqual('任务A当前进度 40%');
      expect(label.startsWith('任务A')).assertTrue();
      expect(label.endsWith('40%')).assertTrue();
      expect(label.indexOf('当前进度')).assertLarger(0);
      expect(label.length).assertEqual(11);
      expect(progressLabel(TASK_B, 0)).assertEqual('任务B当前进度 0%');
    });

    /**
     * @tc.name   progressLabelFollowsRowValue
     * @tc.desc   The label helper of a live row reflects each new state value without extra bookkeeping.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLabelFollowsRowValue', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      expect(b.label().indexOf('0%')).assertLarger(0);
      b.reportProgress(70);
      expect(b.label()).assertEqual('任务B当前进度 70%');
      b.complete(5);
      expect(b.label()).assertEqual('任务B当前进度 100%');
      expect(b.label()).assertEqual(progressLabel(TASK_B, PROGRESS_TOTAL));
    });

    /**
     * @tc.name   snapshotCaptureAddsOneEntryPerTask
     * @tc.desc   One capture of the graph stores exactly three snapshots in page order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotCaptureAddsOneEntryPerTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      expect(log.trace()).assertEqual('A/idle/0|B/idle/0|C/idle/0');
      const first: RunSnapshot | undefined = log.latest(TASK_A);
      expect(first !== undefined).assertTrue();
      if (first !== undefined) {
        expect(first.status).assertEqual(STATUS_IDLE);
      }
    });

    /**
     * @tc.name   snapshotCaptureAppendsAcrossCalls
     * @tc.desc   Each capture appends three more entries, so the log keeps a history instead of overwriting.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotCaptureAppendsAcrossCalls', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      graph.startAll();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(6);
      expect(log.snapshots.length).assertEqual(6);
      expect(log.snapshots[0].status).assertEqual(STATUS_IDLE);
      expect(log.snapshots[3].status).assertEqual(STATUS_RUNNING);
      expect(log.trace().split('|').length).assertEqual(6);
    });

    /**
     * @tc.name   snapshotLatestReturnsNewestEntryPerTask
     * @tc.desc   latest() scans backwards, so a second capture wins over the first for the same task number.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotLatestReturnsNewestEntryPerTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      log.capture(graph.tasks);
      const a: RunSnapshot | undefined = log.latest(TASK_A);
      const c: RunSnapshot | undefined = log.latest(TASK_C);
      expect(a !== undefined).assertTrue();
      expect(c !== undefined).assertTrue();
      if (a !== undefined) {
        expect(a.progress).assertEqual(PROGRESS_TOTAL);
        expect(a.status).assertEqual(STATUS_COMPLETED);
      }
      if (c !== undefined) {
        expect(c.status).assertEqual(STATUS_IDLE);
      }
    });

    /**
     * @tc.name   snapshotLatestForUnknownTaskIsUndefined
     * @tc.desc   The lookup returns undefined for a task number the page never owns instead of a blank row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotLatestForUnknownTaskIsUndefined', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      const missing: RunSnapshot | undefined = log.latest('Z');
      const empty: SnapshotLog = new SnapshotLog();
      const none: RunSnapshot | undefined = empty.latest(TASK_A);
      expect(missing === undefined).assertTrue();
      expect(none === undefined).assertTrue();
      expect(empty.size()).assertEqual(0);
      expect(log.size()).assertEqual(3);
    });

    /**
     * @tc.name   snapshotTraceJoinsEntriesInCaptureOrder
     * @tc.desc   The trace string follows capture order and uses the slash-describe of each snapshot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotTraceJoinsEntriesInCaptureOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      graph.startAll();
      graph.completeTask(TASK_B, 20);
      log.capture(graph.tasks);
      const trace: string = log.trace();
      expect(trace.startsWith('A/idle/0|B/idle/0|C/idle/0')).assertTrue();
      expect(trace.endsWith('A/running/0|B/completed/100|C/idle/0')).assertTrue();
      expect(trace.indexOf('B/completed/100')).assertLarger(0);
      expect(trace.split('|').length).assertEqual(6);
    });

    /**
     * @tc.name   snapshotClearDropsEveryEntry
     * @tc.desc   clear() removes the stored history so the next capture starts a fresh log.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotClearDropsEveryEntry', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      log.clear();
      expect(log.size()).assertEqual(0);
      expect(log.snapshots.length).assertEqual(0);
      expect(log.trace()).assertEqual('');
      expect(log.latest(TASK_A) === undefined).assertTrue();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
    });

    /**
     * @tc.name   snapshotCopyIsDetachedFromLiveRow
     * @tc.desc   A stored snapshot keeps the values captured at that moment while the live row keeps running.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotCopyIsDetachedFromLiveRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      const snapshot: RunSnapshot = a.snapshot();
      a.reportProgress(55);
      const afterProgress: boolean = snapshot.sameAs(new RunSnapshot(TASK_A, 0, STATUS_RUNNING));
      a.complete(30);
      expect(snapshot.progress).assertEqual(0);
      expect(snapshot.status).assertEqual(STATUS_RUNNING);
      expect(snapshot.taskNo).assertEqual(TASK_A);
      expect(afterProgress).assertTrue();
      expect(a.progress).assertEqual(100);
      expect(a.status).assertEqual(STATUS_COMPLETED);
    });

    /**
     * @tc.name   snapshotSameAsComparesEveryField
     * @tc.desc   Two snapshots are equal only when task, status and progress all agree.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotSameAsComparesEveryField', 0, () => {
      const left: RunSnapshot = new RunSnapshot(TASK_A, 100, STATUS_COMPLETED);
      const same: RunSnapshot = new RunSnapshot(TASK_A, 100, STATUS_COMPLETED);
      const otherProgress: RunSnapshot = new RunSnapshot(TASK_A, 50, STATUS_COMPLETED);
      const otherStatus: RunSnapshot = new RunSnapshot(TASK_A, 100, STATUS_RUNNING);
      const otherTask: RunSnapshot = new RunSnapshot(TASK_B, 100, STATUS_COMPLETED);
      expect(left.sameAs(same)).assertTrue();
      expect(left.sameAs(otherProgress)).assertFalse();
      expect(left.sameAs(otherStatus)).assertFalse();
      expect(left.sameAs(otherTask)).assertFalse();
      expect(same.sameAs(left)).assertTrue();
    });

    /**
     * @tc.name   snapshotDescribeUsesSlashSeparator
     * @tc.desc   The snapshot description keeps the task/status/progress order used by the trace string.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotDescribeUsesSlashSeparator', 0, () => {
      const snapshot: RunSnapshot = new RunSnapshot(TASK_C, 100, STATUS_COMPLETED);
      expect(snapshot.describe()).assertEqual('C/completed/100');
      expect(snapshot.describe().split('/').length).assertEqual(3);
      expect(snapshot.describe().startsWith('C/')).assertTrue();
      expect(snapshot.describe().endsWith('/100')).assertTrue();
      expect(snapshot.taskNo).assertEqual(TASK_C);
      expect(snapshot.progress).assertEqual(100);
    });

    /**
     * @tc.name   lockStartsWithoutHolders
     * @tc.desc   A fresh dependency lock is fully free and reports no waiting exclusive request.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lockStartsWithoutHolders', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.acquisitions).assertEqual(0);
      expect(lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   lockSharedPairOccupiesTwoSlots
     * @tc.desc   A and B each add one shared holder and bump the acquisition counter once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lockSharedPairOccupiesTwoSlots', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      const first: boolean = lock.acquireShared(TASK_A);
      const second: boolean = lock.acquireShared(TASK_B);
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(lock.holderCount()).assertEqual(2);
      expect(lock.hasShared(TASK_A)).assertTrue();
      expect(lock.hasShared(TASK_B)).assertTrue();
      expect(lock.acquisitions).assertEqual(2);
      expect(lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   lockRejectsExclusiveWhileSharedHeld
     * @tc.desc   An exclusive request fails while A or B holds a shared slot and is marked as waiting.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lockRejectsExclusiveWhileSharedHeld', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      const rejected: boolean = lock.acquireExclusive(TASK_C);
      expect(rejected).assertFalse();
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.rejections).assertEqual(1);
      expect(lock.acquisitions).assertEqual(2);
      expect(lock.holderCount()).assertEqual(2);
    });

    /**
     * @tc.name   lockRejectsSharedWhileExclusiveHeld
     * @tc.desc   Once C owns the exclusive slot a late shared request is refused and counted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockRejectsSharedWhileExclusiveHeld', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      const owned: boolean = lock.acquireExclusive(TASK_C);
      const refused: boolean = lock.acquireShared(TASK_A);
      expect(owned).assertTrue();
      expect(refused).assertFalse();
      expect(lock.hasShared(TASK_A)).assertFalse();
      expect(lock.rejections).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   releaseSharedByNonHolderReturnsFalse
     * @tc.desc   Releasing a shared slot nobody owns is a no-op that reports failure and changes no counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('releaseSharedByNonHolderReturnsFalse', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      const released: boolean = lock.releaseShared(TASK_B);
      expect(released).assertFalse();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.hasShared(TASK_A)).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
    });

    /**
     * @tc.name   releaseExclusiveByWrongOwnerReturnsFalse
     * @tc.desc   Only the exclusive owner may free the slot; a foreign task number is rejected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('releaseExclusiveByWrongOwnerReturnsFalse', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      const foreign: boolean = lock.releaseExclusive(TASK_A);
      const owned: boolean = lock.releaseExclusive(TASK_C);
      expect(foreign).assertFalse();
      expect(owned).assertTrue();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.releaseExclusive(TASK_C)).assertFalse();
    });

    /**
     * @tc.name   waitingFlagDropsAfterExclusiveAcquire
     * @tc.desc   The queued exclusive request clears its waiting marker as soon as the slot is granted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('waitingFlagDropsAfterExclusiveAcquire', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.waitingExclusive).assertTrue();
      lock.releaseShared(TASK_A);
      lock.releaseShared(TASK_B);
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.rejections).assertEqual(1);
    });

    /**
     * @tc.name   lockHolderCountReturnsToZeroAfterRun
     * @tc.desc   The graph releases every shared and exclusive slot when the three rows finish.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockHolderCountReturnsToZeroAfterRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.lock.holderCount()).assertEqual(2);
      graph.completeTask(TASK_A, 1);
      expect(graph.lock.holderCount()).assertEqual(1);
      graph.completeTask(TASK_B, 2);
      expect(graph.lock.holderCount()).assertEqual(0);
      graph.pollTick(3);
      expect(graph.lock.holderCount()).assertEqual(1);
      graph.completeTaskC(4);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   eventRecorderCountsByKind
     * @tc.desc   countOf groups entries by their kind prefix and ignores unrelated kinds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('eventRecorderCountsByKind', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('start-all', 'begin');
      recorder.record('started', TASK_A);
      recorder.record('started', TASK_B);
      recorder.record('queued', TASK_C);
      recorder.record('completed', TASK_A);
      expect(recorder.size()).assertEqual(5);
      expect(recorder.countOf('started')).assertEqual(2);
      expect(recorder.countOf('completed')).assertEqual(1);
      expect(recorder.countOf('unlocked')).assertEqual(0);
      expect(recorder.countOf('queu')).assertEqual(0);
      expect(recorder.countOf('queued')).assertEqual(1);
    });

    /**
     * @tc.name   eventRecorderLastEntryReflectsLatestOperation
     * @tc.desc   last() returns the newest entry and an empty string before anything is recorded.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('eventRecorderLastEntryReflectsLatestOperation', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      expect(recorder.last()).assertEqual('');
      recorder.record('start-all', 'begin');
      expect(recorder.last()).assertEqual('start-all:begin');
      recorder.record('unlocked', TASK_C);
      expect(recorder.last()).assertEqual('unlocked:C');
      expect(recorder.entries[recorder.size() - 1]).assertEqual('unlocked:C');
      expect(recorder.last().startsWith('unlocked')).assertTrue();
    });

    /**
     * @tc.name   eventRecorderTraceJoinsEntriesWithPipe
     * @tc.desc   The trace string is the ordered pipe join of the recorded kind and detail pairs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventRecorderTraceJoinsEntriesWithPipe', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('start-all', 'begin');
      recorder.record('started', TASK_A);
      recorder.record('started', TASK_B);
      recorder.record('queued', TASK_C);
      expect(recorder.trace()).assertEqual('start-all:begin|started:A|started:B|queued:C');
      expect(recorder.trace().split('|').length).assertEqual(4);
      expect(recorder.trace().indexOf('started:A|started:B')).assertLarger(0);
      expect(recorder.trace().endsWith('queued:C')).assertTrue();
    });

    /**
     * @tc.name   eventRecorderClearDropsHistoryAndFingerprint
     * @tc.desc   clear() empties the entries, so the trace and its fingerprint return to the empty value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventRecorderClearDropsHistoryAndFingerprint', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('started', TASK_A);
      recorder.record('completed', TASK_A);
      const before: number = recorder.fingerprint();
      recorder.clear();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.entries.length).assertEqual(0);
      expect(recorder.trace()).assertEqual('');
      expect(recorder.last()).assertEqual('');
      expect(recorder.fingerprint()).assertEqual(new EventRecorder().fingerprint());
      expect(recorder.fingerprint() === before).assertFalse();
    });

    /**
     * @tc.name   eventFingerprintMatchesForEqualSequences
     * @tc.desc   Two recorders fed the same ordered entries report the same fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventFingerprintMatchesForEqualSequences', 0, () => {
      const first: EventRecorder = new EventRecorder();
      const second: EventRecorder = new EventRecorder();
      first.record('started', TASK_A);
      first.record('completed', TASK_A);
      second.record('started', TASK_A);
      second.record('completed', TASK_A);
      expect(first.trace()).assertEqual(second.trace());
      expect(first.fingerprint()).assertEqual(second.fingerprint());
      expect(first.fingerprint() > 0).assertTrue();
      expect(first.size()).assertEqual(second.size());
    });

    /**
     * @tc.name   eventFingerprintDiffersForReorderedSequence
     * @tc.desc   The fingerprint is order sensitive, so swapped entries produce a different value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventFingerprintDiffersForReorderedSequence', 0, () => {
      const forward: EventRecorder = new EventRecorder();
      const backward: EventRecorder = new EventRecorder();
      forward.record('completed', TASK_A);
      forward.record('completed', TASK_B);
      backward.record('completed', TASK_B);
      backward.record('completed', TASK_A);
      expect(forward.size()).assertEqual(backward.size());
      expect(forward.trace() === backward.trace()).assertFalse();
      expect(forward.fingerprint() === backward.fingerprint()).assertFalse();
      expect(forward.fingerprint() > 0).assertTrue();
    });

    /**
     * @tc.name   stateAfterResetMatchesFreshGraph
     * @tc.desc   The reset graph exposes the same state members, lock state and empty history as a new graph.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stateAfterResetMatchesFreshGraph', 0, () => {
      const used: TaskGraph = createTaskGraph();
      used.startAll();
      used.completeTask(TASK_A, 1);
      used.completeTask(TASK_B, 2);
      used.pollTick(3);
      used.completeTaskC(4);
      used.reset();
      const fresh: TaskGraph = createTaskGraph();
      expect(used.isTaskFinished).assertEqual(fresh.isTaskFinished);
      expect(used.snapshotText()).assertEqual(fresh.snapshotText());
      expect(used.totalProgress()).assertEqual(fresh.totalProgress());
      expect(used.lock.holderCount()).assertEqual(fresh.lock.holderCount());
      expect(used.events.size()).assertEqual(fresh.events.size());
      expect(used.pollTicks).assertEqual(fresh.pollTicks);
    });

    /**
     * @tc.name   totalProgressTracksEveryPhase
     * @tc.desc   The summed progress member moves in exact steps as the run advances.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('totalProgressTracksEveryPhase', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.totalProgress()).assertEqual(0);
      graph.startAll();
      graph.taskAt(0).reportProgress(20);
      graph.taskAt(1).reportProgress(30);
      expect(graph.totalProgress()).assertEqual(50);
      graph.completeTask(TASK_A, 1);
      expect(graph.totalProgress()).assertEqual(130);
      graph.completeTask(TASK_B, 2);
      expect(graph.totalProgress()).assertEqual(200);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.totalProgress()).assertEqual(300);
    });

    /**
     * @tc.name   averageProgressTracksEveryPhase
     * @tc.desc   The average of the three progress members starts at zero, rises in (0,100) and ends at 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('averageProgressTracksEveryPhase', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.averageProgress()).assertEqual(0);
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const afterA: number = graph.averageProgress();
      expect(afterA > 33).assertTrue();
      expect(afterA < 34).assertTrue();
      graph.completeTask(TASK_B, 2);
      const afterB: number = graph.averageProgress();
      expect(afterB > 66).assertTrue();
      expect(afterB < 67).assertTrue();
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.averageProgress()).assertEqual(100);
    });

    /**
     * @tc.name   gateOpeningEventsArriveCompletedThenUnlocked
     * @tc.desc   On the second prerequisite the recorder writes the completion entry before the unlock entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('gateOpeningEventsArriveCompletedThenUnlocked', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      const trace: string = graph.eventTrace();
      const completedAt: number = trace.indexOf('completed:B');
      const unlockedAt: number = trace.indexOf('unlocked:C');
      expect(completedAt > 0).assertTrue();
      expect(unlockedAt > completedAt).assertTrue();
      expect(trace.endsWith('completed:B|unlocked:C')).assertTrue();
      expect(graph.events.last()).assertEqual('unlocked:C');
    });

    /**
     * @tc.name   startButtonHelpersFollowFinishedFlag
     * @tc.desc   The enabled and background helpers track isTaskFinished across start and reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startButtonHelpersFollowFinishedFlag', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#409EFF');
      graph.startAll();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#C0C4CC');
      graph.reset();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#409EFF');
    });

    /**
     * @tc.name   taskCProgressMemberFollowsPollLifecycle
     * @tc.desc   The C member stays zero while queued, is untouched by the poll, then becomes 100 on completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskCProgressMemberFollowsPollLifecycle', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.taskAt(2).progress).assertEqual(0);
      graph.pollTick(3);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.taskAt(2).progressRatio()).assertEqual(0);
      graph.completeTaskC(4);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(2).progressRatio()).assertEqual(1);
    });

    /**
     * @tc.name   completionLeavesEveryProgressMemberFull
     * @tc.desc   A finished run reports 100 on each of the three state members, never 99 or a ratio.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionLeavesEveryProgressMemberFull', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.totalProgress()).assertEqual(3 * PROGRESS_TOTAL);
      expect(graph.snapshotText().indexOf('99')).assertEqual(-1);
    });

    /**
     * @tc.name   snapshotLogSurvivesUnrelatedTaskProgress
     * @tc.desc   Entries captured from one row are unaffected when another row reports intermediate progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotLogSurvivesUnrelatedTaskProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      log.capture(graph.tasks);
      graph.taskAt(0).reportProgress(60);
      graph.taskAt(1).reportProgress(20);
      const a: RunSnapshot | undefined = log.latest(TASK_A);
      const b: RunSnapshot | undefined = log.latest(TASK_B);
      expect(a !== undefined).assertTrue();
      expect(b !== undefined).assertTrue();
      if (a !== undefined) {
        expect(a.progress).assertEqual(0);
        expect(a.sameAs(new RunSnapshot(TASK_A, 0, STATUS_RUNNING))).assertTrue();
      }
      if (b !== undefined) {
        expect(b.progress).assertEqual(0);
      }
      expect(log.size()).assertEqual(3);
    });

    /**
     * @tc.name   manualSnapshotAddAppendsEntries
     * @tc.desc   The public add entry point accepts hand built snapshots and keeps them alongside task captures.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('manualSnapshotAddAppendsEntries', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.add(new RunSnapshot(TASK_A, 30, STATUS_RUNNING));
      log.add(new RunSnapshot(TASK_B, 100, STATUS_COMPLETED));
      expect(log.size()).assertEqual(2);
      expect(log.trace()).assertEqual('A/running/30|B/completed/100');
      log.add(graph.taskAt(2).snapshot());
      expect(log.size()).assertEqual(3);
      expect(log.snapshots[2].taskNo).assertEqual(TASK_C);
      expect(log.latest(TASK_C) !== undefined).assertTrue();
    });

    /**
     * @tc.name   duplicateDetailEntriesAreCountedSeparately
     * @tc.desc   Recording the same kind and detail twice stores two entries, so counts track callbacks not kinds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateDetailEntriesAreCountedSeparately', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('started', TASK_A);
      recorder.record('started', TASK_A);
      recorder.record('completed', TASK_A);
      expect(recorder.size()).assertEqual(3);
      expect(recorder.countOf('started')).assertEqual(2);
      expect(recorder.trace()).assertEqual('started:A|started:A|completed:A');
      expect(recorder.entries[0]).assertEqual(recorder.entries[1]);
      expect(recorder.last()).assertEqual('completed:A');
    });

    /**
     * @tc.name   perTaskResetClearsProgressButNotGraphBookkeeping
     * @tc.desc   Resetting one row drops its state member only; the graph keeps its history and its lock holders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('perTaskResetClearsProgressButNotGraphBookkeeping', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.taskAt(1).reportProgress(50);
      graph.taskAt(0).reset();
      graph.taskAt(1).reset();
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
    });
  });
}
