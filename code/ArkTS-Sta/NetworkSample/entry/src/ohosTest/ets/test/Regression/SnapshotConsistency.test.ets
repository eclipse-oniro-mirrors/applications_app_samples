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
 * SnapshotConsistency suite.
 *
 * Compares run snapshots across phases and across repeated runs: the snapshot
 * log content, the latest lookup, the pipe trace, fingerprint equality for
 * identical runs and inequality for divergent ones.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   57-60    the three progress values and the finished flag
 *   68-76    updateProgress writes exactly one row
 *   200-247  the rendered rows that a snapshot mirrors
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
  ERROR_NETWORK,
  PROGRESS_TOTAL,
  PROGRESS_INITIAL,
  DownloadTask,
  RunSnapshot,
  SnapshotLog,
  TaskGraph,
  createTaskGraph,
  NetworkMetrics,
  textFingerprint,
  joined
} from '../Shared/SharedDriver';

export default function snapshotConsistencyTest(): void {
  describe('SnapshotConsistency', () => {
    beforeAll(() => {
      logSuite('SnapshotConsistency', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SnapshotConsistency', 'end');
    });

    /**
     * @tc.name   emptySnapshotLogReportsZero
     * @tc.desc   A new snapshot log holds no entries and renders an empty trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptySnapshotLogReportsZero', 0, () => {
      logStep('SnapshotConsistency', 'empty log');
      const log: SnapshotLog = new SnapshotLog();
      expect(log.size()).assertEqual(0);
      expect(log.trace()).assertEqual('');
      expect(log.latest(TASK_A) === undefined).assertTrue();
      expect(log.latest(TASK_C) === undefined).assertTrue();
      const snapshots: RunSnapshot[] = log.snapshots;
      expect(snapshots.length).assertEqual(0);
    });

    /**
     * @tc.name   captureAddsOneSnapshotPerRow
     * @tc.desc   Capturing a three-row graph appends exactly three snapshots in row order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('captureAddsOneSnapshotPerRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      expect(log.snapshots[0].taskNo).assertEqual(TASK_A);
      expect(log.snapshots[1].taskNo).assertEqual(TASK_B);
      expect(log.snapshots[2].taskNo).assertEqual(TASK_C);
      expect(log.trace()).assertEqual('A/idle/0|B/idle/0|C/idle/0');
      expect(log.snapshots[0].progress).assertEqual(PROGRESS_INITIAL);
    });

    /**
     * @tc.name   latestReturnsMostRecentPerTask
     * @tc.desc   After repeated captures the latest lookup returns the newest snapshot of the requested task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('latestReturnsMostRecentPerTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      log.capture(graph.tasks);
      const latestA: RunSnapshot = log.latest(TASK_A) as RunSnapshot;
      const latestB: RunSnapshot = log.latest(TASK_B) as RunSnapshot;
      expect(latestA.progress).assertEqual(PROGRESS_TOTAL);
      expect(latestA.status).assertEqual(STATUS_COMPLETED);
      expect(latestB.status).assertEqual(STATUS_RUNNING);
      expect(log.size()).assertEqual(6);
      expect(log.snapshots.length).assertEqual(6);
    });

    /**
     * @tc.name   latestUnknownTaskIsUndefined
     * @tc.desc   A lookup for a task that was never captured returns undefined rather than a blank snapshot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('latestUnknownTaskIsUndefined', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      expect(log.latest('D') === undefined).assertTrue();
      expect(log.latest('') === undefined).assertTrue();
      expect(log.latest(TASK_A) !== undefined).assertTrue();
      expect(log.size()).assertEqual(3);
      expect(log.trace().indexOf('D/')).assertEqual(-1);
      expect(log.latest(TASK_A) === log.latest('D')).assertFalse();
    });

    /**
     * @tc.name   snapshotSameAsItself
     * @tc.desc   Snapshot equality is reflexive across every field and also matches a freshly built twin.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotSameAsItself', 0, () => {
      const snapshot: RunSnapshot = new RunSnapshot(TASK_B, 40, STATUS_RUNNING);
      const twin: RunSnapshot = new RunSnapshot(TASK_B, 40, STATUS_RUNNING);
      expect(snapshot.sameAs(snapshot)).assertTrue();
      expect(snapshot.sameAs(twin)).assertTrue();
      expect(twin.sameAs(snapshot)).assertTrue();
      expect(snapshot.describe()).assertEqual('B/running/40');
      expect(twin.describe()).assertEqual(snapshot.describe());
      expect(textFingerprint(snapshot.describe())).assertEqual(textFingerprint(twin.describe()));
    });

    /**
     * @tc.name   snapshotDiffersOnProgress
     * @tc.desc   Two snapshots of the same task and status differ as soon as their progress values differ.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotDiffersOnProgress', 0, () => {
      const low: RunSnapshot = new RunSnapshot(TASK_A, 25, STATUS_RUNNING);
      const high: RunSnapshot = new RunSnapshot(TASK_A, 75, STATUS_RUNNING);
      expect(low.sameAs(high)).assertFalse();
      expect(high.sameAs(low)).assertFalse();
      expect(low.describe() === high.describe()).assertFalse();
      expect(low.describe()).assertEqual('A/running/25');
      expect(high.describe()).assertEqual('A/running/75');
      expect(high.progress > low.progress).assertTrue();
    });

    /**
     * @tc.name   snapshotDiffersOnStatus
     * @tc.desc   The status string alone distinguishes snapshots that share task number and progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotDiffersOnStatus', 0, () => {
      const running: RunSnapshot = new RunSnapshot(TASK_C, 100, STATUS_RUNNING);
      const completed: RunSnapshot = new RunSnapshot(TASK_C, 100, STATUS_COMPLETED);
      expect(running.sameAs(completed)).assertFalse();
      expect(running.describe()).assertEqual('C/running/100');
      expect(completed.describe()).assertEqual('C/completed/100');
      expect(running.status === completed.status).assertFalse();
      expect(textFingerprint(running.describe()) === textFingerprint(completed.describe())).assertFalse();
    });

    /**
     * @tc.name   traceJoinsSnapshotsWithPipes
     * @tc.desc   The log trace is the pipe join of the described snapshots in capture order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('traceJoinsSnapshotsWithPipes', 0, () => {
      const log: SnapshotLog = new SnapshotLog();
      log.add(new RunSnapshot(TASK_A, 10, STATUS_RUNNING));
      log.add(new RunSnapshot(TASK_B, 20, STATUS_IDLE));
      log.add(new RunSnapshot(TASK_C, 30, STATUS_FAILED));
      expect(log.trace()).assertEqual('A/running/10|B/idle/20|C/failed/30');
      expect(log.trace().split('|').length).assertEqual(3);
      expect(log.trace().split('|')[1]).assertEqual('B/idle/20');
      expect(joined(['A/running/10', 'B/idle/20', 'C/failed/30'], '|')).assertEqual(log.trace());
      expect(log.size()).assertEqual(3);
    });

    /**
     * @tc.name   repeatedCaptureGrowsLogLinearly
     * @tc.desc   Three captures of a three-row graph append three snapshots each, never replacing earlier ones.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedCaptureGrowsLogLinearly', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      for (let round = 0; round < 3; round++) {
        log.capture(graph.tasks);
        expect(log.size()).assertEqual((round + 1) * 3);
      }
      expect(log.size()).assertEqual(9);
      expect(log.trace().split('|').length).assertEqual(9);
      expect(log.snapshots[0].taskNo).assertEqual(TASK_A);
      expect(log.snapshots[3].taskNo).assertEqual(TASK_A);
      expect(log.snapshots[8].taskNo).assertEqual(TASK_C);
    });

    /**
     * @tc.name   clearEmptiesLogAndLookups
     * @tc.desc   Clearing the log removes every snapshot, empties the trace and makes lookups undefined.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clearEmptiesLogAndLookups', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      log.clear();
      expect(log.size()).assertEqual(0);
      expect(log.trace()).assertEqual('');
      expect(log.latest(TASK_A) === undefined).assertTrue();
      expect(log.snapshots.length).assertEqual(0);
      expect(log.trace().length).assertEqual(0);
    });

    /**
     * @tc.name   snapshotOfCompletedRowIsFull
     * @tc.desc   The snapshot taken after completion records 100 with the completed status in one step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotOfCompletedRowIsFull', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_C, 9);
      const snapshot: RunSnapshot = graph.taskAt(2).snapshot();
      expect(snapshot.taskNo).assertEqual(TASK_C);
      expect(snapshot.progress).assertEqual(PROGRESS_TOTAL);
      expect(snapshot.status).assertEqual(STATUS_COMPLETED);
      expect(snapshot.describe()).assertEqual('C/completed/100');
      expect(snapshot.sameAs(new RunSnapshot(TASK_C, 100, STATUS_COMPLETED))).assertTrue();
      expect(snapshot.progress === PROGRESS_INITIAL).assertFalse();
    });

    /**
     * @tc.name   snapshotLogTraceStableAcrossReruns
     * @tc.desc   The same scripted run twice produces equal snapshot traces and equal fingerprints.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLogTraceStableAcrossReruns', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      log.capture(graph.tasks);
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      log.capture(graph.tasks);
      const firstTrace: string = log.trace();
      const firstPrint: number = textFingerprint(firstTrace);
      graph.reset();
      log.clear();
      graph.startAll();
      log.capture(graph.tasks);
      graph.completeTask(TASK_A, 11);
      graph.completeTask(TASK_B, 12);
      graph.pollTick(13);
      graph.completeTaskC(14);
      log.capture(graph.tasks);
      expect(log.trace()).assertEqual(firstTrace);
      expect(textFingerprint(log.trace())).assertEqual(firstPrint);
      expect(log.size()).assertEqual(6);
      expect(log.trace().indexOf('idle/0|running/0')).assertEqual(-1);
    });

    /**
     * @tc.name   identicalSnapshotsShareFingerprint
     * @tc.desc   Two independently built identical snapshot traces have the same rolling fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('identicalSnapshotsShareFingerprint', 0, () => {
      const first: SnapshotLog = new SnapshotLog();
      const second: SnapshotLog = new SnapshotLog();
      first.add(new RunSnapshot(TASK_A, 15, STATUS_RUNNING));
      first.add(new RunSnapshot(TASK_B, 35, STATUS_IDLE));
      second.add(new RunSnapshot(TASK_A, 15, STATUS_RUNNING));
      second.add(new RunSnapshot(TASK_B, 35, STATUS_IDLE));
      expect(first.trace()).assertEqual(second.trace());
      expect(textFingerprint(first.trace())).assertEqual(textFingerprint(second.trace()));
      expect(first.size()).assertEqual(second.size());
      const latestA: RunSnapshot = first.latest(TASK_A) as RunSnapshot;
      expect(latestA.progress).assertEqual(15);
      expect(textFingerprint(first.trace()) > 0).assertTrue();
    });

    /**
     * @tc.name   divergentSnapshotsDifferInFingerprint
     * @tc.desc   A single changed progress value changes the trace and therefore the fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('divergentSnapshotsDifferInFingerprint', 0, () => {
      const first: SnapshotLog = new SnapshotLog();
      const second: SnapshotLog = new SnapshotLog();
      first.add(new RunSnapshot(TASK_A, 15, STATUS_RUNNING));
      second.add(new RunSnapshot(TASK_A, 16, STATUS_RUNNING));
      expect(first.trace() === second.trace()).assertFalse();
      expect(textFingerprint(first.trace()) === textFingerprint(second.trace())).assertFalse();
      const firstLatest: RunSnapshot = first.latest(TASK_A) as RunSnapshot;
      const secondLatest: RunSnapshot = second.latest(TASK_A) as RunSnapshot;
      expect(firstLatest.progress).assertEqual(15);
      expect(secondLatest.progress).assertEqual(16);
      expect(first.snapshots[0].sameAs(second.snapshots[0])).assertFalse();
    });

    /**
     * @tc.name   taskSnapshotMatchesGraphState
     * @tc.desc   A row snapshot mirrors the live task fields exactly at the moment it is taken.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskSnapshotMatchesGraphState', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.reportProgress(55);
      const snapshot: RunSnapshot = a.snapshot();
      expect(snapshot.progress).assertEqual(a.progress);
      expect(snapshot.status).assertEqual(a.status);
      expect(snapshot.taskNo).assertEqual(a.taskNo);
      expect(snapshot.progress).assertEqual(55);
      expect(snapshot.status).assertEqual(STATUS_RUNNING);
      expect(snapshot.describe()).assertEqual(a.describe().replace(':', '/').replace(':', '/'));
    });

    /**
     * @tc.name   snapshotTextMatchesCapturedRows
     * @tc.desc   The graph snapshot text and a captured log describe the same rows with different separators.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotTextMatchesCapturedRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      const graphText: string = graph.snapshotText();
      const logText: string = log.trace();
      expect(graphText).assertEqual('A:completed:100|B:running:0|C:idle:0');
      expect(logText).assertEqual('A/completed/100|B/running/0|C/idle/0');
      expect(graphText.split('|').length).assertEqual(logText.split('|').length);
      expect(graphText.startsWith('A:completed:100')).assertTrue();
      expect(logText.startsWith('A/completed/100')).assertTrue();
    });

    /**
     * @tc.name   snapshotOfPartialProgressPerRow
     * @tc.desc   Three different partial values appear unchanged in the captured log for each row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotOfPartialProgressPerRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(12);
      graph.taskAt(1).reportProgress(34);
      graph.taskAt(2).reportProgress(56);
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      expect(log.trace()).assertEqual('A/running/12|B/running/34|C/idle/56');
      const latestA: RunSnapshot = log.latest(TASK_A) as RunSnapshot;
      expect(latestA.describe()).assertEqual('A/running/12');
      expect(log.snapshots[1].progress).assertEqual(34);
      expect(log.snapshots[2].progress).assertEqual(56);
      expect(graph.totalProgress()).assertEqual(102);
    });

    /**
     * @tc.name   snapshotOfFailedRowKeepsStatus
     * @tc.desc   A failed row captures the failed status and its frozen progress, not a full 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotOfFailedRowKeepsStatus', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      b.reportProgress(45);
      b.fail(ERROR_NETWORK);
      const snapshot: RunSnapshot = b.snapshot();
      expect(snapshot.status).assertEqual(STATUS_FAILED);
      expect(snapshot.progress).assertEqual(45);
      expect(snapshot.progress === PROGRESS_TOTAL).assertFalse();
      expect(snapshot.describe()).assertEqual('B/failed/45');
      expect(snapshot.sameAs(new RunSnapshot(TASK_B, 45, STATUS_COMPLETED))).assertFalse();
    });

    /**
     * @tc.name   latestAfterMultipleRunsPointsAtNewest
     * @tc.desc   After two complete runs the latest snapshot per task belongs to the second capture.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('latestAfterMultipleRunsPointsAtNewest', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      log.capture(graph.tasks);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 11);
      graph.completeTask(TASK_B, 12);
      log.capture(graph.tasks);
      const latestA: RunSnapshot = log.latest(TASK_A) as RunSnapshot;
      const latestB: RunSnapshot = log.latest(TASK_B) as RunSnapshot;
      expect(log.size()).assertEqual(6);
      expect(latestA.status).assertEqual(STATUS_COMPLETED);
      expect(latestB.status).assertEqual(STATUS_COMPLETED);
      expect(log.snapshots[0].status).assertEqual(STATUS_COMPLETED);
      expect(log.snapshots[1].status).assertEqual(STATUS_RUNNING);
      expect(latestB.progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   snapshotResetDescribesIdleRow
     * @tc.desc   After a reset the newest snapshot of every task is idle at zero even if older ones were full.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotResetDescribesIdleRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      log.capture(graph.tasks);
      graph.reset();
      log.capture(graph.tasks);
      const latestA: RunSnapshot = log.latest(TASK_A) as RunSnapshot;
      expect(latestA.status).assertEqual(STATUS_IDLE);
      expect(latestA.describe()).assertEqual('A/idle/0');
      expect(log.snapshots[0].describe()).assertEqual('A/completed/100');
      expect(log.size()).assertEqual(6);
      expect(log.trace().endsWith('A/idle/0|B/idle/0|C/idle/0')).assertTrue();
    });

    /**
     * @tc.name   twoGraphsProduceIndependentSnapshotLogs
     * @tc.desc   Snapshot logs built from two graphs never share entries or fingerprints.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('twoGraphsProduceIndependentSnapshotLogs', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      const firstLog: SnapshotLog = new SnapshotLog();
      const secondLog: SnapshotLog = new SnapshotLog();
      first.startAll();
      first.completeTask(TASK_A, 1);
      firstLog.capture(first.tasks);
      second.startAll();
      secondLog.capture(second.tasks);
      expect(firstLog.trace() === secondLog.trace()).assertFalse();
      expect(textFingerprint(firstLog.trace()) === textFingerprint(secondLog.trace())).assertFalse();
      expect(firstLog.size()).assertEqual(3);
      expect(secondLog.size()).assertEqual(3);
      const firstLatestB: RunSnapshot = firstLog.latest(TASK_B) as RunSnapshot;
      expect(firstLatestB.status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   fingerprintStableUnderRepeatedCapture
     * @tc.desc   Capturing the same unchanged graph twice duplicates the log but keeps each half identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintStableUnderRepeatedCapture', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.taskAt(0).reportProgress(30);
      log.capture(graph.tasks);
      const firstHalf: string = log.trace();
      log.capture(graph.tasks);
      const full: string = log.trace();
      expect(log.size()).assertEqual(6);
      expect(full).assertEqual(firstHalf + '|' + firstHalf);
      expect(textFingerprint(full)).assertEqual(textFingerprint("A/running/30|B/running/0|C/idle/0|" +
        'A/running/30|B/running/0|C/idle/0'));
      expect(textFingerprint(firstHalf) === textFingerprint(full)).assertFalse();
    });

    /**
     * @tc.name   snapshotFingerprintChangesPerLifecyclePhase
     * @tc.desc   Four captures taken at distinct lifecycle phases produce four distinct trace fingerprints.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotFingerprintChangesPerLifecyclePhase', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const prints: number[] = [];
      const idle: SnapshotLog = new SnapshotLog();
      idle.capture(graph.tasks);
      prints.push(textFingerprint(idle.trace()));
      graph.startAll();
      const running: SnapshotLog = new SnapshotLog();
      running.capture(graph.tasks);
      prints.push(textFingerprint(running.trace()));
      graph.completeTask(TASK_A, 1);
      const partial: SnapshotLog = new SnapshotLog();
      partial.capture(graph.tasks);
      prints.push(textFingerprint(partial.trace()));
      graph.reset();
      const reset: SnapshotLog = new SnapshotLog();
      reset.capture(graph.tasks);
      prints.push(textFingerprint(reset.trace()));
      expect(prints.length).assertEqual(4);
      expect(prints[0] === prints[1]).assertFalse();
      expect(prints[1] === prints[2]).assertFalse();
      expect(prints[2] === prints[3]).assertFalse();
      expect(prints[0] === prints[3]).assertTrue();
    });
  });
}
