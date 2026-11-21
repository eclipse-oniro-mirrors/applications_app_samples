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
 * CoreConsistency suite of the NetworkSample ohosTest module.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-60    three progress cells plus isTaskFinished
 *   68-76    updateProgress writes the literal 100 for exactly one task
 *   79-95    completeTaskA / completeTaskB / completeTaskC
 *   209-247  three progress labels built from the same template
 *
 * The suite repeats identical journeys and compares their observables, so a
 * run-to-run drift in a progress cell, an event counter or a snapshot row is
 * caught even when a single-run assertion would still pass.
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
  STATUS_FAILED,
  PROGRESS_TOTAL,
  POLL_INTERVAL_MS,
  ERROR_NETWORK,
  DownloadTask,
  DownloadConfig,
  TaskGraph,
  RunSnapshot,
  SnapshotLog,
  NetworkMetrics,
  ReferenceGraph,
  EventRecorder,
  createTaskGraph,
  expectedConfigFor,
  expectedGateOpen,
  expectedProgressAfter,
  expectedCompletedProgress,
  completionTrace,
  isTopologicalCompletion,
  progressLabel,
  textFingerprint,
  joined,
  sortedCopy,
  reversedCopy
} from '../Shared/SharedDriver';

export default function networkCoreConsistencyTest(): void {
  describe('CoreConsistency', () => {
    beforeAll(() => {
      logSuite('CoreConsistency', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreConsistency', 'end');
    });

    /**
     * @tc.name   repeatedJourneysProduceIdenticalSnapshotText
     * @tc.desc   Two complete A|B|C journeys end with byte-identical row text for all three tasks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('repeatedJourneysProduceIdenticalSnapshotText', 0, () => {
      const first = createTaskGraph();
      first.startAll();
      first.completeTask(TASK_A);
      first.completeTask(TASK_B);
      first.pollTick(POLL_INTERVAL_MS);
      first.completeTaskC(POLL_INTERVAL_MS);
      const second = createTaskGraph();
      second.startAll();
      second.completeTask(TASK_A);
      second.completeTask(TASK_B);
      second.pollTick(POLL_INTERVAL_MS);
      second.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreConsistency', 'row text ' + first.snapshotText());
      expect(first.snapshotText()).assertEqual(second.snapshotText());
      expect(first.snapshotText()).assertEqual('A:completed:100|B:completed:100|C:completed:100');
      expect(first.taskAt(0).describe()).assertEqual(second.taskAt(0).describe());
      expect(first.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
      expect(second.totalProgress()).assertEqual(first.totalProgress());
    });

    /**
     * @tc.name   repeatedJourneysProduceIdenticalEventFingerprint
     * @tc.desc   Event recorders fed by the same script hash to the same number, which pins the trace order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('repeatedJourneysProduceIdenticalEventFingerprint', 0, () => {
      const first = createTaskGraph();
      first.startAll();
      first.completeTask(TASK_A);
      first.completeTask(TASK_B);
      first.pollTick(POLL_INTERVAL_MS);
      first.completeTaskC(POLL_INTERVAL_MS);
      const second = createTaskGraph();
      second.startAll();
      second.completeTask(TASK_A);
      second.completeTask(TASK_B);
      second.pollTick(POLL_INTERVAL_MS);
      second.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreConsistency', 'fingerprints ' + String(first.events.fingerprint()) + ' / ' +
        String(second.events.fingerprint()));
      expect(first.eventTrace()).assertEqual(second.eventTrace());
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.size()).assertEqual(second.events.size());
      expect(first.events.fingerprint()).assertEqual(textFingerprint(first.eventTrace()));
      expect(first.events.size()).assertLarger(4);
    });

    /**
     * @tc.name   repeatedJourneysProduceIdenticalCompletionTrace
     * @tc.desc   The completion order list repeats exactly when the scripted call order repeats.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('repeatedJourneysProduceIdenticalCompletionTrace', 0, () => {
      const first = createTaskGraph();
      first.startAll();
      first.completeTask(TASK_B);
      first.completeTask(TASK_A);
      first.pollTick(POLL_INTERVAL_MS);
      first.completeTaskC(POLL_INTERVAL_MS);
      const second = createTaskGraph();
      second.startAll();
      second.completeTask(TASK_B);
      second.completeTask(TASK_A);
      second.pollTick(POLL_INTERVAL_MS);
      second.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreConsistency', 'traces ' + completionTrace(first) + ' / ' + completionTrace(second));
      expect(completionTrace(first)).assertEqual(completionTrace(second));
      expect(completionTrace(first)).assertEqual('B|A|C');
      expect(first.completionOrder.length).assertEqual(3);
      expect(joined(first.completionOrder, ',')).assertEqual(joined(second.completionOrder, ','));
      expect(joined(sortedCopy(first.completionOrder), '|')).assertEqual('A|B|C');
      expect(isTopologicalCompletion(reversedCopy(first.completionOrder))).assertFalse();
      expect(isTopologicalCompletion(first.completionOrder)).assertTrue();
    });

    /**
     * @tc.name   completionOfTaskAIsIdempotent
     * @tc.desc   A second A completion is refused and neither the progress row nor the order list grows twice.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionOfTaskAIsIdempotent', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const firstReturn = graph.completeTask(TASK_A);
      const secondReturn = graph.completeTask(TASK_A);
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      logStep('CoreConsistency', 'A completion returns ' + String(firstReturn) + ' / ' + String(secondReturn));
      expect(firstReturn).assertTrue();
      expect(secondReturn).assertFalse();
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.totalProgress()).assertEqual(PROGRESS_TOTAL);
      expect(graph.lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   completionOfTaskBIsIdempotent
     * @tc.desc   The same refusal applies to B, which guards against a duplicated onCompleted callback.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionOfTaskBIsIdempotent', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      const repeated = graph.completeTask(TASK_B);
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      logStep('CoreConsistency', 'repeated B completion ' + String(repeated));
      expect(repeated).assertFalse();
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(b.status).assertEqual(STATUS_COMPLETED);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(0).isRunning()).assertTrue();
    });

    /**
     * @tc.name   completionOfTaskCIsIdempotent
     * @tc.desc   Task C completes once; the second callback is refused and its terminal row stays at 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionOfTaskCIsIdempotent', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      const firstReturn = graph.completeTaskC(POLL_INTERVAL_MS);
      const secondReturn = graph.completeTaskC(POLL_INTERVAL_MS * 2);
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      logStep('CoreConsistency', 'C completion ' + String(firstReturn) + ' / ' + String(secondReturn));
      expect(firstReturn).assertTrue();
      expect(secondReturn).assertFalse();
      expect(c.progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   progressNeverDecreasesUnderOutOfOrderReports
     * @tc.desc   A late report carrying a smaller percentage cannot roll the row back, matching the page's 100 write.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressNeverDecreasesUnderOutOfOrderReports', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const high = a.reportProgress(80);
      const low = a.reportProgress(30);
      const zero = a.reportProgress(0);
      logStep('CoreConsistency', 'reports 80/30/0 keep ' + String(zero));
      expect(high).assertEqual(80);
      expect(low).assertEqual(80);
      expect(zero).assertEqual(80);
      expect(a.progress).assertEqual(80);
      expect(expectedProgressAfter(80, 30)).assertEqual(80);
      expect(expectedProgressAfter(80, 95)).assertEqual(95);
    });

    /**
     * @tc.name   progressIsMonotoneAcrossASequence
     * @tc.desc   A sorted-descending callback sequence still yields a non-decreasing row at every step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressIsMonotoneAcrossASequence', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const reports: number[] = [90, 10, 60, 60, 25, 100];
      let previous: number = 0;
      let violations = 0;
      for (let index = 0; index < reports.length; index++) {
        const value = a.reportProgress(reports[index]);
        if (value < previous) {
          violations = violations + 1;
        }
        previous = value;
      }
      logStep('CoreConsistency', 'final ' + String(previous) + ' violations ' + String(violations));
      expect(violations).assertEqual(0);
      expect(previous).assertEqual(PROGRESS_TOTAL);
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(a.progressRatio()).assertEqual(1);
      expect(graph.taskAt(1).progress).assertEqual(0);
    });

    /**
     * @tc.name   snapshotSameAsDetectsEqualState
     * @tc.desc   Two independently built snapshots with the same triple compare equal in both directions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotSameAsDetectsEqualState', 0, () => {
      const left = new RunSnapshot(TASK_A, 40, STATUS_RUNNING);
      const right = new RunSnapshot(TASK_A, 40, STATUS_RUNNING);
      const other = new RunSnapshot(TASK_B, 40, STATUS_RUNNING);
      logStep('CoreConsistency', 'equal snapshots ' + left.describe());
      expect(left.sameAs(right)).assertTrue();
      expect(right.sameAs(left)).assertTrue();
      expect(left.sameAs(other)).assertFalse();
      expect(left.describe()).assertEqual('A/running/40');
      expect(left.progress).assertEqual(right.progress);
    });

    /**
     * @tc.name   snapshotSameAsDetectsProgressDrift
     * @tc.desc   A one point progress difference breaks snapshot equality while the task number and status agree.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotSameAsDetectsProgressDrift', 0, () => {
      const base = new RunSnapshot(TASK_B, 99, STATUS_RUNNING);
      const drifted = new RunSnapshot(TASK_B, 100, STATUS_RUNNING);
      logStep('CoreConsistency', 'drift ' + base.describe() + ' vs ' + drifted.describe());
      expect(base.sameAs(drifted)).assertFalse();
      expect(drifted.sameAs(base)).assertFalse();
      expect(base.taskNo).assertEqual(drifted.taskNo);
      expect(base.status).assertEqual(drifted.status);
      expect(base.progress).assertLess(drifted.progress);
      expect(drifted.progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   snapshotSameAsDetectsStatusDrift
     * @tc.desc   The same percentage in two different statuses is not the same snapshot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotSameAsDetectsStatusDrift', 0, () => {
      const running = new RunSnapshot(TASK_C, 0, STATUS_RUNNING);
      const idle = new RunSnapshot(TASK_C, 0, STATUS_IDLE);
      const failed = new RunSnapshot(TASK_C, 0, STATUS_FAILED);
      logStep('CoreConsistency', 'status drift ' + running.status + '/' + idle.status);
      expect(running.sameAs(idle)).assertFalse();
      expect(idle.sameAs(running)).assertFalse();
      expect(running.sameAs(failed)).assertFalse();
      expect(idle.sameAs(failed)).assertFalse();
      expect(idle.sameAs(idle)).assertTrue();
      expect(idle.describe()).assertEqual('C/idle/0');
    });

    /**
     * @tc.name   snapshotSameAsDetectsTaskDrift
     * @tc.desc   Identical numbers attached to different task numbers must not compare equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotSameAsDetectsTaskDrift', 0, () => {
      const a = new RunSnapshot(TASK_A, 55, STATUS_RUNNING);
      const b = new RunSnapshot(TASK_B, 55, STATUS_RUNNING);
      logStep('CoreConsistency', 'task drift ' + a.describe() + ' vs ' + b.describe());
      expect(a.sameAs(b)).assertFalse();
      expect(b.sameAs(a)).assertFalse();
      expect(a.progress).assertEqual(b.progress);
      expect(a.status).assertEqual(b.status);
      expect(a.taskNo).assertEqual(TASK_A);
      expect(a.describe().startsWith('A/')).assertTrue();
      expect(b.describe().startsWith('B/')).assertTrue();
    });

    /**
     * @tc.name   snapshotLogCaptureAppendsOneRowPerTask
     * @tc.desc   Two captures over the three task array append six rows in task order, never three.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotLogCaptureAppendsOneRowPerTask', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      log.capture(graph.tasks);
      const afterFirst = log.size();
      graph.startAll();
      log.capture(graph.tasks);
      logStep('CoreConsistency', 'rows ' + String(afterFirst) + ' -> ' + String(log.size()));
      expect(afterFirst).assertEqual(3);
      expect(log.size()).assertEqual(6);
      expect(log.snapshots[0].taskNo).assertEqual(TASK_A);
      expect(log.snapshots[2].taskNo).assertEqual(TASK_C);
      expect(log.snapshots[3].taskNo).assertEqual(TASK_A);
      expect(log.snapshots[3].status).assertEqual(STATUS_RUNNING);
      expect(log.snapshots[0].status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   snapshotLogLatestReturnsNewestRowForTask
     * @tc.desc   latest() scans backwards, so the second capture wins for every task number.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotLogLatestReturnsNewestRowForTask', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      log.capture(graph.tasks);
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      a.reportProgress(70);
      log.capture(graph.tasks);
      const latestA = log.latest(TASK_A) as RunSnapshot;
      const latestC = log.latest(TASK_C) as RunSnapshot;
      logStep('CoreConsistency', 'latest A ' + latestA.describe());
      expect(latestA.progress).assertEqual(70);
      expect(latestA.status).assertEqual(STATUS_RUNNING);
      expect(latestC.status).assertEqual(STATUS_IDLE);
      expect(log.latest('D')).assertUndefined();
      expect(log.snapshots[0].progress).assertEqual(0);
      expect(log.size()).assertEqual(6);
    });

    /**
     * @tc.name   snapshotLogTraceMatchesRowOrder
     * @tc.desc   The trace concatenates every row with a pipe and therefore starts with the first A row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLogTraceMatchesRowOrder', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      log.capture(graph.tasks);
      graph.startAll();
      graph.completeTask(TASK_A);
      log.capture(graph.tasks);
      const trace = log.trace();
      logStep('CoreConsistency', 'trace ' + trace);
      expect(trace).assertEqual('A/idle/0|B/idle/0|C/idle/0|A/completed/100|B/running/0|C/idle/0');
      expect(trace.startsWith('A/idle/0')).assertTrue();
      expect(trace.endsWith('C/idle/0')).assertTrue();
      expect(trace.indexOf('|')).assertLarger(0);
      expect(log.size()).assertEqual(6);
      log.clear();
      expect(log.size()).assertEqual(0);
      expect(log.trace()).assertEqual('');
    });

    /**
     * @tc.name   totalProgressEqualsSumOfThreeCells
     * @tc.desc   The aggregate is the plain sum of the three independent rows after each partial step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('totalProgressEqualsSumOfThreeCells', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      a.reportProgress(30);
      const afterA = graph.totalProgress();
      b.reportProgress(45);
      const afterB = graph.totalProgress();
      graph.completeTask(TASK_A);
      const afterComplete = graph.totalProgress();
      logStep('CoreConsistency', 'totals ' + String(afterA) + '/' + String(afterB) + '/' + String(afterComplete));
      expect(afterA).assertEqual(30);
      expect(afterB).assertEqual(75);
      expect(afterComplete).assertEqual(145);
      expect(afterComplete).assertEqual(a.progress + b.progress + graph.taskAt(2).progress);
      expect(graph.taskAt(2).progress).assertEqual(0);
    });

    /**
     * @tc.name   averageProgressIsOneThirdOfTheTotal
     * @tc.desc   averageProgress divides the sum by the fixed task count of three, not by the running count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('averageProgressIsOneThirdOfTheTotal', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const total = graph.totalProgress();
      const average = graph.averageProgress();
      const drift = Math.abs(average * 3 - total);
      logStep('CoreConsistency', 'total ' + String(total) + ' average ' + String(average));
      expect(total).assertEqual(100);
      expect(average).assertEqual(total / 3);
      expect(drift).assertLess(0.0001);
      expect(graph.runningCount()).assertEqual(1);
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.averageProgress()).assertLarger(33);
      expect(graph.averageProgress()).assertLess(34);
    });

    /**
     * @tc.name   averageProgressReachesHundredWhenAllComplete
     * @tc.desc   Once the three rows are full the average is exactly 100 and the success ratio is 1.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('averageProgressReachesHundredWhenAllComplete', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const metrics = NetworkMetrics.from(graph);
      logStep('CoreConsistency', 'average ' + String(graph.averageProgress()));
      expect(graph.averageProgress()).assertEqual(PROGRESS_TOTAL);
      expect(graph.totalProgress()).assertEqual(PROGRESS_TOTAL * 3);
      expect(metrics.averageProgress()).assertEqual(PROGRESS_TOTAL);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.completedTasks).assertEqual(3);
      expect(metrics.failedTasks).assertEqual(0);
    });

    /**
     * @tc.name   metricsFingerprintIsStableAcrossIdenticalRuns
     * @tc.desc   Two runs with the same counts hash to the same metrics fingerprint, while a different run does not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsFingerprintIsStableAcrossIdenticalRuns', 0, () => {
      const first = createTaskGraph();
      first.startAll();
      first.completeTask(TASK_A);
      const second = createTaskGraph();
      second.startAll();
      second.completeTask(TASK_A);
      const third = createTaskGraph();
      third.startAll();
      third.completeTask(TASK_A);
      third.completeTask(TASK_B);
      const firstMetrics = NetworkMetrics.from(first);
      const secondMetrics = NetworkMetrics.from(second);
      const thirdMetrics = NetworkMetrics.from(third);
      logStep('CoreConsistency', 'metric hashes ' + String(firstMetrics.fingerprint()) + '/' +
        String(thirdMetrics.fingerprint()));
      expect(firstMetrics.fingerprint()).assertEqual(secondMetrics.fingerprint());
      expect(firstMetrics.fingerprint() === thirdMetrics.fingerprint()).assertFalse();
      expect(thirdMetrics.totalProgress).assertLarger(firstMetrics.totalProgress);
      expect(firstMetrics.completedTasks).assertEqual(1);
      expect(thirdMetrics.completedTasks).assertEqual(2);
      expect(firstMetrics.totalTasks).assertEqual(3);
    });

    /**
     * @tc.name   networkMetricsCountsCompleteAndFailedRows
     * @tc.desc   A mixed graph reports one completed row and one failed row, and the counts are not interchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('networkMetricsCountsCompleteAndFailedRows', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.fail(ERROR_NETWORK);
      const metrics = NetworkMetrics.from(graph);
      logStep('CoreConsistency', 'completed ' + String(metrics.completedTasks) + ' failed ' +
        String(metrics.failedTasks));
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(1);
      expect(metrics.failedTasks).assertEqual(1);
      expect(metrics.totalProgress).assertEqual(100);
      expect(metrics.successRatio()).assertEqual(1.0 / 3);
      expect(metrics.averageProgress()).assertEqual(100.0 / 3);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   eventKindCountersAgreeWithEntryLength
     * @tc.desc   Per-kind counters partition the recorder, so their sum equals the total entry count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventKindCountersAgreeWithEntryLength', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const started = graph.events.countOf('started');
      const completed = graph.events.countOf('completed');
      const unlocked = graph.events.countOf('unlocked');
      const cleared = graph.events.countOf('timer-cleared');
      const startAll = graph.events.countOf('start-all');
      const queued = graph.events.countOf('queued');
      const total = started + completed + unlocked + cleared + startAll + queued;
      logStep('CoreConsistency', 'kinds ' + String(started) + '/' + String(completed) + '/' + String(unlocked));
      expect(started).assertEqual(3);
      expect(completed).assertEqual(3);
      expect(unlocked).assertEqual(2);
      expect(cleared).assertEqual(1);
      expect(startAll).assertEqual(1);
      expect(total).assertEqual(graph.events.size());
      expect(queued).assertEqual(1);
      expect(total).assertEqual(11);
    });

    /**
     * @tc.name   progressLabelIsDeterministicForOneValue
     * @tc.desc   The row label template produces the same Chinese text for the same task and percentage twice.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLabelIsDeterministicForOneValue', 0, () => {
      const graph = createTaskGraph();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const initial = a.label();
      a.start(0);
      a.reportProgress(42);
      const middle = a.label();
      graph.completeTask(TASK_A);
      const done = a.label();
      logStep('CoreConsistency', 'labels ' + initial + ' / ' + middle);
      expect(initial).assertEqual(progressLabel(TASK_A, 0));
      expect(middle).assertEqual('任务A当前进度 42%');
      expect(middle.indexOf('任务A')).assertEqual(0);
      expect(done).assertEqual('任务A当前进度 100%');
      expect(done.endsWith('%')).assertTrue();
      expect(initial === middle).assertFalse();
    });

    /**
     * @tc.name   snapshotTextOrdersRowsByTaskNumberNotByCompletion
     * @tc.desc   Completing B before A must not reorder the serialised rows: the A cell is always printed first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotTextOrdersRowsByTaskNumberNotByCompletion', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      const text = graph.snapshotText();
      logStep('CoreConsistency', 'ordered text ' + text);
      expect(text).assertEqual('A:completed:100|B:completed:100|C:idle:0');
      expect(text.indexOf('A:')).assertEqual(0);
      expect(text.indexOf('C:')).assertLarger(text.indexOf('B:'));
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(TASK_NUMBERS[0]).assertEqual(TASK_A);
      expect(text.split('|').length).assertEqual(3);
    });

    /**
     * @tc.name   referenceGraphAgreesWithTheGateOracle
     * @tc.desc   The boolean reference graph and the class graph open the gate at the same step of the same script.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('referenceGraphAgreesWithTheGateOracle', 0, () => {
      const graph = createTaskGraph();
      const reference = new ReferenceGraph();
      graph.startAll();
      const before = graph.canRunTaskC() === reference.unlocked();
      graph.completeTask(TASK_A);
      reference.markComplete(TASK_A);
      const halfOpen = graph.canRunTaskC() === reference.unlocked();
      const halfPoll = reference.poll();
      graph.completeTask(TASK_B);
      reference.markComplete(TASK_B);
      const fullOpen = graph.canRunTaskC() === reference.unlocked();
      const fullPoll = reference.poll();
      logStep('CoreConsistency', 'reference ' + reference.trace());
      expect(before).assertTrue();
      expect(halfOpen).assertTrue();
      expect(fullOpen).assertTrue();
      expect(halfPoll).assertFalse();
      expect(fullPoll).assertTrue();
      expect(expectedGateOpen(true, true)).assertEqual(graph.canRunTaskC());
      expect(reference.trace()).assertEqual('true,true,true,false');
      expect(reference.rounds).assertEqual(2);
    });

    /**
     * @tc.name   configBuildersAgreeOnAllThreeTasks
     * @tc.desc   forTask and the independent expectation factory build the same config for A, B and C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configBuildersAgreeOnAllThreeTasks', 0, () => {
      const configA = DownloadConfig.forTask(TASK_A);
      const expectA = expectedConfigFor(TASK_A);
      const configB = DownloadConfig.forTask(TASK_B);
      const expectB = expectedConfigFor(TASK_B);
      const configC = DownloadConfig.forTask(TASK_C);
      const expectC = expectedConfigFor(TASK_C);
      logStep('CoreConsistency', 'config A ' + configA.fileName());
      expect(configA.sameAs(expectA)).assertTrue();
      expect(configB.sameAs(expectB)).assertTrue();
      expect(configC.sameAs(expectC)).assertTrue();
      expect(configA.url).assertEqual(expectA.url);
      expect(configA.method).assertEqual('GET');
      expect(configB.overwrite).assertTrue();
      expect(configC.saveas).assertEqual('./');
    });

    /**
     * @tc.name   completedProgressOracleIsAlwaysFull
     * @tc.desc   The completion oracle is independent of the incoming value and always returns the 100 literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completedProgressOracleIsAlwaysFull', 0, () => {
      const first = expectedCompletedProgress();
      const second = expectedCompletedProgress();
      const graph = createTaskGraph();
      graph.startAll();
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      c.reportProgress(20);
      graph.completeTask(TASK_C);
      logStep('CoreConsistency', 'completion oracle ' + String(first));
      expect(first).assertEqual(PROGRESS_TOTAL);
      expect(second).assertEqual(first);
      expect(c.progress).assertEqual(expectedCompletedProgress());
      expect(c.progress).assertEqual(PROGRESS_TOTAL);
      expect(c.progressRatio()).assertEqual(1);
      expect(expectedProgressAfter(0, 500)).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   consistencyHoldsAfterGraphReset
     * @tc.desc   A graph reset and rerun reproduces the snapshot, trace and fingerprint of the first run exactly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('consistencyHoldsAfterGraphReset', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const firstTrace = graph.eventTrace();
      const firstSnapshot = graph.snapshotText();
      const firstHash = graph.events.fingerprint();
      graph.reset();
      const idleSnapshot = graph.snapshotText();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreConsistency', 'rerun snapshot ' + graph.snapshotText());
      expect(idleSnapshot).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      expect(graph.snapshotText()).assertEqual(firstSnapshot);
      expect(graph.eventTrace()).assertEqual(firstTrace);
      expect(graph.events.fingerprint()).assertEqual(firstHash);
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.completionOrder.length).assertEqual(3);
    });

    /**
     * @tc.name   lockCountersRepeatAcrossTwoIdenticalJourneys
     * @tc.desc   After a reset the lock counters start from zero and reach the same totals a second time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockCountersRepeatAcrossTwoIdenticalJourneys', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      const firstAcquisitions = graph.lock.acquisitions;
      const firstRejections = graph.lock.rejections;
      graph.reset();
      const resetAcquisitions = graph.lock.acquisitions;
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      graph.pollTick(POLL_INTERVAL_MS);
      logStep('CoreConsistency', 'lock counters ' + String(firstAcquisitions) + ' then ' +
        String(graph.lock.acquisitions));
      expect(firstAcquisitions).assertEqual(3);
      expect(firstRejections).assertEqual(0);
      expect(resetAcquisitions).assertEqual(0);
      expect(graph.lock.acquisitions).assertEqual(firstAcquisitions);
      expect(graph.lock.rejections).assertEqual(firstRejections);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   emptyRecorderFingerprintIsConstant
     * @tc.desc   Two untouched recorders share the empty-trace fingerprint, which differs from a one-entry trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emptyRecorderFingerprintIsConstant', 0, () => {
      const first = new EventRecorder();
      const second = new EventRecorder();
      const base = first.fingerprint();
      second.record('probe', 'one');
      logStep('CoreConsistency', 'empty hash ' + String(base) + ' probe ' + String(second.fingerprint()));
      expect(first.fingerprint()).assertEqual(base);
      expect(base).assertEqual(textFingerprint(''));
      expect(second.size()).assertEqual(1);
      expect(second.fingerprint() === base).assertFalse();
      expect(second.trace()).assertEqual('probe:one');
      expect(second.countOf('probe')).assertEqual(1);
      expect(first.size()).assertEqual(0);
    });

    /**
     * @tc.name   progressOracleClampsBothEndsOfTheRange
     * @tc.desc   Negative and oversized incoming percentages both collapse onto the legal 0..100 window.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressOracleClampsBothEndsOfTheRange', 0, () => {
      const belowRange = expectedProgressAfter(0, -25);
      const aboveRange = expectedProgressAfter(0, 250);
      const fromMiddle = expectedProgressAfter(40, 250);
      const keepMiddle = expectedProgressAfter(40, -25);
      const exact = expectedProgressAfter(40, 40);
      logStep('CoreConsistency', 'clamps ' + String(belowRange) + '/' + String(aboveRange) + '/' +
        String(keepMiddle));
      expect(belowRange).assertEqual(0);
      expect(aboveRange).assertEqual(PROGRESS_TOTAL);
      expect(fromMiddle).assertEqual(PROGRESS_TOTAL);
      expect(keepMiddle).assertEqual(40);
      expect(exact).assertEqual(40);
      expect(fromMiddle).assertLarger(keepMiddle);
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      a.reportProgress(250);
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(1).progress).assertEqual(0);
    });

    /**
     * @tc.name   twoRunsFromScratchShareLockCounters
     * @tc.desc   Two independent graphs driven by the same script report identical lock counters and holder states.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConsistency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('twoRunsFromScratchShareLockCounters', 0, () => {
      const first = createTaskGraph();
      const second = createTaskGraph();
      first.startAll();
      second.startAll();
      const holdersAtStart = first.lock.holderCount() === second.lock.holderCount();
      first.completeTask(TASK_B);
      second.completeTask(TASK_B);
      first.pollTick(POLL_INTERVAL_MS);
      second.pollTick(POLL_INTERVAL_MS);
      logStep('CoreConsistency', 'lock totals ' + String(first.lock.acquisitions) + ' / ' +
        String(second.lock.acquisitions));
      expect(holdersAtStart).assertTrue();
      expect(first.lock.acquisitions).assertEqual(second.lock.acquisitions);
      expect(first.lock.acquisitions).assertEqual(2);
      expect(first.lock.rejections).assertEqual(second.lock.rejections);
      expect(first.lock.exclusiveOwner).assertEqual(second.lock.exclusiveOwner);
      expect(first.lock.waitingExclusive).assertEqual(second.lock.waitingExclusive);
      expect(first.snapshotText()).assertEqual(second.snapshotText());
    });
  });
}
