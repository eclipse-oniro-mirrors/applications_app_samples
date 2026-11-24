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
 * CoreProgressLedger suite of the NetworkSample ohosTest module.
 *
 * The suite reads the progress ledger of the page the way the three progress
 * rows read it: one integer per task, a running total, an average and a text
 * label. It stresses the monotone rule of every progress callback, the exact
 * boundary literals, the terminal rows that stop accepting numbers, and the
 * snapshot projections that other suites consume as oracles.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-59    progressValueA / progressValueB / progressValueC
 *   68-76    updateProgress writes the number 100 for exactly one row
 *   200-247  three "任务X当前进度 NN%" labels above 100 total bars
 *   250-265  the progress column is bound to the three state integers
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
  STATUS_FAILED,
  ERROR_START,
  ERROR_TIMEOUT,
  DownloadTask,
  RunSnapshot,
  SnapshotLog,
  TaskGraph,
  createTaskGraph,
  expectedProgressAfter,
  expectedCompletedProgress,
  progressLabel,
  NetworkMetrics
} from '../Shared/SharedDriver';

export default function networkCoreProgressLedgerTest(): void {
  describe('CoreProgressLedger', () => {
    beforeAll(() => {
      logSuite('CoreProgressLedger', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreProgressLedger', 'end');
    });

    /**
     * @tc.name   progressLedgerInitialRowsAreZero
     * @tc.desc   A fresh graph opens its ledger with three zero rows, so total and average both start at zero.
     * @tc.precondition  The shared driver is loaded and beforeEach yields once before the ledger is read.
     * @tc.steps         1. Build a fresh TaskGraph through createTaskGraph.
     *                   2. Read the progress of all three rows and the aggregate ledger values.
     *                   3. Compare the readings with the documented initial literal.
     * @tc.expected      Every row reports zero progress and the aggregate total and average are zero.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerInitialRowsAreZero', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      logStep('CoreProgressLedger', 'initial ledger ' + graph.snapshotText());
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.averageProgress()).assertEqual(0);
      expect(graph.taskAt(0).progressRatio()).assertEqual(0);
    });

    /**
     * @tc.name   progressLedgerTotalSumsThreeRows
     * @tc.desc   The total is the arithmetic sum of the three rows, not a single shared counter.
     * @tc.precondition  The shared driver is loaded and every row starts idle at zero percent.
     * @tc.steps         1. Report 20, 30 and 50 percent on rows A, B and C.
     *                   2. Read totalProgress from the graph.
     *                   3. Compare the total with the sum of the three row values.
     * @tc.expected      The total equals 100 and equals the sum of the individual rows.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerTotalSumsThreeRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.taskAt(0).reportProgress(20);
      graph.taskAt(1).reportProgress(30);
      graph.taskAt(2).reportProgress(50);
      const rowSum: number = graph.taskAt(0).progress + graph.taskAt(1).progress + graph.taskAt(2).progress;
      logStep('CoreProgressLedger', 'total ' + String(graph.totalProgress()) + ' row sum ' + String(rowSum));
      expect(graph.totalProgress()).assertEqual(100);
      expect(graph.totalProgress()).assertEqual(rowSum);
      expect(graph.taskAt(0).progress).assertEqual(20);
      expect(graph.taskAt(1).progress).assertEqual(30);
      expect(graph.taskAt(2).progress).assertEqual(50);
      expect(graph.totalProgress()).assertLarger(graph.taskAt(2).progress);
    });

    /**
     * @tc.name   progressLedgerAverageDividesByRowCount
     * @tc.desc   The average divides the total by the fixed row count of three, never by the rows that moved.
     * @tc.precondition  The shared driver is loaded and the graph owns exactly three rows.
     * @tc.steps         1. Move only row B to 30 percent and leave A and C at zero.
     *                   2. Read the graph average and divide the total by three by hand.
     *                   3. Compare both numbers.
     * @tc.expected      The average is ten and is strictly smaller than the only non-zero row.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerAverageDividesByRowCount', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.taskAt(1).reportProgress(30);
      const average: number = graph.averageProgress();
      logStep('CoreProgressLedger', 'average ' + String(average));
      expect(average).assertEqual(10);
      expect(average).assertEqual(graph.totalProgress() / graph.tasks.length);
      expect(average).assertLess(graph.taskAt(1).progress);
      expect(average).assertLarger(0);
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.taskAt(0).progress).assertEqual(0);
    });

    /**
     * @tc.name   progressLedgerMonotoneIgnoresLowerReport
     * @tc.desc   A later progress callback that carries a smaller number cannot move the row backwards.
     * @tc.precondition  The shared driver is loaded and the row is running before the reports.
     * @tc.steps         1. Start row A and report 70 percent.
     *                   2. Report 20 percent on the same row.
     *                   3. Read the accepted answer and the stored progress.
     * @tc.expected      The row keeps 70, so the second callback does not regress the bar.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerMonotoneIgnoresLowerReport', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(0);
      task.reportProgress(70);
      const accepted: number = task.reportProgress(20);
      logStep('CoreProgressLedger', 'monotone answer ' + String(accepted));
      expect(accepted).assertEqual(70);
      expect(task.progress).assertEqual(70);
      expect(task.progress).assertLarger(20);
      expect(task.progressRatio()).assertEqual(0.7);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.reportProgress(69)).assertEqual(70);
    });

    /**
     * @tc.name   progressLedgerMonotoneClampsNegative
     * @tc.desc   A negative percentage is bounded at the initial literal instead of being stored as is.
     * @tc.precondition  The shared driver is loaded and the row has never accepted a progress callback.
     * @tc.steps         1. Build an idle row and report minus forty percent.
     *                   2. Read the returned answer, the stored value and the ratio.
     *                   3. Compare all three with the zero bound.
     * @tc.expected      The row reports zero and never a negative percentage.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerMonotoneClampsNegative', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, 'https://example.com/b.png');
      const accepted: number = task.reportProgress(-40);
      logStep('CoreProgressLedger', 'negative answer ' + String(accepted));
      expect(accepted).assertEqual(0);
      expect(task.progress).assertEqual(PROGRESS_INITIAL);
      expect(task.progress).assertLarger(-1);
      expect(task.progressRatio()).assertEqual(0);
      expect(task.label()).assertEqual(progressLabel(TASK_B, 0));
      expect(task.status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   progressLedgerMonotoneClampsOverHundred
     * @tc.desc   An oversized percentage is bounded at the 100 total of the page bar but does not complete the row.
     * @tc.precondition  The shared driver is loaded and the row is running.
     * @tc.steps         1. Start row C and report two hundred and fifty percent.
     *                   2. Read the returned answer and the ratio.
     *                   3. Confirm the status did not become completed.
     * @tc.expected      The row stores 100, the ratio is one and the status stays running.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerMonotoneClampsOverHundred', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, 'https://example.com/c.png');
      task.start(0);
      const accepted: number = task.reportProgress(250);
      logStep('CoreProgressLedger', 'high answer ' + String(accepted));
      expect(accepted).assertEqual(PROGRESS_TOTAL);
      expect(task.progress).assertEqual(100);
      expect(task.progressRatio()).assertEqual(1);
      expect(task.isComplete()).assertFalse();
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(expectedProgressAfter(0, 250)).assertEqual(accepted);
    });

    /**
     * @tc.name   progressLedgerRepeatedSameValueIsIdempotent
     * @tc.desc   Reporting the same percentage twice leaves the ledger, the label and the ratio untouched.
     * @tc.precondition  The shared driver is loaded and the row is running with 45 percent.
     * @tc.steps         1. Report 45 percent, capture label and ratio.
     *                   2. Report 45 percent a second time.
     *                   3. Compare the second readings with the captured ones.
     * @tc.expected      The second report changes nothing and returns the same accepted value.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerRepeatedSameValueIsIdempotent', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(0);
      task.reportProgress(45);
      const firstLabel: string = task.label();
      const firstRatio: number = task.progressRatio();
      const second: number = task.reportProgress(45);
      logStep('CoreProgressLedger', 'idempotent ' + String(second));
      expect(second).assertEqual(45);
      expect(task.progress).assertEqual(45);
      expect(task.label()).assertEqual(firstLabel);
      expect(task.progressRatio()).assertEqual(firstRatio);
      expect(task.attempts).assertEqual(1);
      expect(task.status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   progressLedgerSequenceNeverRegresses
     * @tc.desc   An unordered callback sequence converges on 100 and never yields a single regression.
     * @tc.precondition  The shared driver is loaded and the row is running before the sequence.
     * @tc.steps         1. Feed a mixed sequence with highs, lows and out of range values.
     *                   2. Count every accepted answer that is smaller than its predecessor.
     *                   3. Compare the final value with the total literal.
     * @tc.expected      The regression counter stays zero and the final value is exactly 100.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerSequenceNeverRegresses', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, 'https://example.com/b.png');
      task.start(0);
      const reports: number[] = [8, 90, 12, 140, 45, 44, 99, -5, 100, 30];
      let previous: number = 0;
      let regressions: number = 0;
      for (let index: int = 0; index < reports.length; index++) {
        const value: number = task.reportProgress(reports[index]);
        if (value < previous) {
          regressions = regressions + 1;
        }
        previous = value;
      }
      logStep('CoreProgressLedger', 'sequence final ' + String(previous));
      expect(regressions).assertEqual(0);
      expect(previous).assertEqual(PROGRESS_TOTAL);
      expect(task.progress).assertEqual(100);
      expect(task.progressRatio()).assertEqual(1);
      expect(task.label()).assertEqual('任务B当前进度 100%');
      expect(task.isComplete()).assertFalse();
    });

    /**
     * @tc.name   progressLedgerOracleMatchesDriverForBoundaries
     * @tc.desc   The independent oracle agrees with the driver on both bounds, an interior value and a regression.
     * @tc.precondition  The shared driver is loaded and the oracle function is available.
     * @tc.steps         1. Compare expectedProgressAfter with a table of low and high inputs.
     *                   2. Apply the same inputs to a real row.
     *                   3. Check the row value equals the oracle value at every step.
     * @tc.expected      All five oracle answers match the driver without a single mismatch.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerOracleMatchesDriverForBoundaries', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, 'https://example.com/c.png');
      task.start(0);
      const inputs: number[] = [-1, 0, 1, 99, 100, 101];
      let mismatches: number = 0;
      for (let index: int = 0; index < inputs.length; index++) {
        const observed: number = task.reportProgress(inputs[index]);
        const oracle: number = expectedProgressAfter(task.progress, inputs[index]);
        if (observed !== oracle) {
          mismatches = mismatches + 1;
        }
      }
      logStep('CoreProgressLedger', 'oracle mismatches ' + String(mismatches));
      expect(mismatches).assertEqual(0);
      expect(expectedProgressAfter(0, -10)).assertEqual(0);
      expect(expectedProgressAfter(0, 10)).assertEqual(10);
      expect(expectedProgressAfter(60, 60)).assertEqual(60);
      expect(expectedProgressAfter(60, 20)).assertEqual(60);
      expect(expectedProgressAfter(0, 200)).assertEqual(PROGRESS_TOTAL);
      expect(task.progress).assertEqual(100);
    });

    /**
     * @tc.name   progressLedgerCompletionWritesFullRow
     * @tc.desc   Completing a row writes the 100 literal in one step and does not depend on the prior value.
     * @tc.precondition  The shared driver is loaded and the row sits at 33 percent.
     * @tc.steps         1. Start the row, report 33 percent and call complete.
     *                   2. Read the progress and the finish stamp.
     *                   3. Compare the value with the completed progress oracle.
     * @tc.expected      Completion jumps the row to 100 regardless of the previous percentage.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerCompletionWritesFullRow', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(0);
      task.reportProgress(33);
      const accepted: boolean = task.complete(640);
      logStep('CoreProgressLedger', 'completed row ' + task.describe());
      expect(accepted).assertTrue();
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.progress).assertEqual(expectedCompletedProgress());
      expect(task.progressRatio()).assertEqual(1);
      expect(task.finishedAt).assertEqual(640);
      expect(task.label()).assertEqual('任务A当前进度 100%');
    });

    /**
     * @tc.name   progressLedgerTerminalRejectsLowerReport
     * @tc.desc   A completed row answers every later callback with 100, including a strictly smaller number.
     * @tc.precondition  The shared driver is loaded and the row has already completed.
     * @tc.steps         1. Complete row B and then report 10, 0 and 90 percent.
     *                   2. Read the three answers and the stored value.
     *                   3. Compare each answer with the total literal.
     * @tc.expected      All three answers are 100 and the ledger never drops below the terminal value.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerTerminalRejectsLowerReport', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, 'https://example.com/b.png');
      task.start(0);
      task.complete(50);
      const low: number = task.reportProgress(10);
      const zero: number = task.reportProgress(0);
      const near: number = task.reportProgress(90);
      logStep('CoreProgressLedger', 'terminal answers ' + String(low) + '/' + String(zero) + '/' + String(near));
      expect(low).assertEqual(PROGRESS_TOTAL);
      expect(zero).assertEqual(PROGRESS_TOTAL);
      expect(near).assertEqual(PROGRESS_TOTAL);
      expect(task.progress).assertEqual(100);
      expect(task.finishedAt).assertEqual(50);
      expect(task.isComplete()).assertTrue();
    });

    /**
     * @tc.name   progressLedgerFailedRowKeepsLastValue
     * @tc.desc   A failure freezes the bar where it stood, so the ledger shows how far the download reached.
     * @tc.precondition  The shared driver is loaded and the row is running at 44 percent.
     * @tc.steps         1. Start row C, report 44 percent and record a timeout failure.
     *                   2. Read the progress, the ratio and the error code.
     *                   3. Compare the frozen value with the pre-failure reading.
     * @tc.expected      The failed row keeps 44 percent and stores the timeout code.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerFailedRowKeepsLastValue', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, 'https://example.com/c.png');
      task.start(0);
      task.reportProgress(44);
      const before: number = task.progress;
      task.fail(ERROR_TIMEOUT);
      logStep('CoreProgressLedger', 'failed row ' + task.describe());
      expect(before).assertEqual(44);
      expect(task.progress).assertEqual(44);
      expect(task.progressRatio()).assertEqual(0.44);
      expect(task.lastErrorCode).assertEqual(ERROR_TIMEOUT);
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.isComplete()).assertFalse();
    });

    /**
     * @tc.name   progressLedgerFailedRowRejectsNewProgress
     * @tc.desc   The failed status is terminal for progress too, so a late callback cannot revive the bar.
     * @tc.precondition  The shared driver is loaded and the row has failed at 12 percent.
     * @tc.steps         1. Fail row A at 12 percent and then report 88 percent.
     *                   2. Read the answer and the stored value.
     *                   3. Confirm the status stays failed.
     * @tc.expected      The row keeps 12 percent and the late callback is ignored.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerFailedRowRejectsNewProgress', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(0);
      task.reportProgress(12);
      task.fail(ERROR_START);
      const late: number = task.reportProgress(88);
      logStep('CoreProgressLedger', 'late callback ' + String(late));
      expect(late).assertEqual(12);
      expect(task.progress).assertEqual(12);
      expect(task.progress).assertLess(88);
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.isRunning()).assertFalse();
      expect(task.lastErrorCode).assertEqual(ERROR_START);
    });

    /**
     * @tc.name   progressLedgerSnapshotCapturesStableTriple
     * @tc.desc   A snapshot is a detached copy: later progress on the row does not rewrite the captured triple.
     * @tc.precondition  The shared driver is loaded and row B is running at 72 percent.
     * @tc.steps         1. Capture a snapshot at 72 percent.
     *                   2. Complete the row so the live value becomes 100.
     *                   3. Compare the old snapshot with the live snapshot.
     * @tc.expected      The captured triple still reports 72 and does not equal the new snapshot.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerSnapshotCapturesStableTriple', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, 'https://example.com/b.png');
      task.start(0);
      task.reportProgress(72);
      const captured: RunSnapshot = task.snapshot();
      task.complete(30);
      logStep('CoreProgressLedger', 'snapshot ' + captured.describe() + ' live ' + task.snapshot().describe());
      expect(captured.progress).assertEqual(72);
      expect(captured.status).assertEqual(STATUS_RUNNING);
      expect(captured.sameAs(task.snapshot())).assertFalse();
      expect(task.snapshot().progress).assertEqual(PROGRESS_TOTAL);
      expect(captured.describe()).assertEqual('B/running/72');
      expect(task.snapshot().sameAs(new RunSnapshot(TASK_B, 100, STATUS_COMPLETED))).assertTrue();
    });

    /**
     * @tc.name   progressLedgerSnapshotLogTraceAcrossRows
     * @tc.desc   Capturing the three rows twice appends six entries and the trace keeps the A, B, C order.
     * @tc.precondition  The shared driver is loaded and a fresh graph owns three idle rows.
     * @tc.steps         1. Capture the fresh graph into a SnapshotLog.
     *                   2. Start row A, report 25 percent and capture again.
     *                   3. Read the trace text and its segment count.
     * @tc.expected      The log holds six entries and the last segment reports A running at 25.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerSnapshotLogTraceAcrossRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const snapshots: SnapshotLog = new SnapshotLog();
      snapshots.capture(graph.tasks);
      const firstTrace: string = snapshots.trace();
      graph.taskAt(0).start(0);
      graph.taskAt(0).reportProgress(25);
      snapshots.capture(graph.tasks);
      const parts: string[] = snapshots.trace().split('|');
      logStep('CoreProgressLedger', 'snapshot trace ' + snapshots.trace());
      expect(snapshots.size()).assertEqual(6);
      expect(firstTrace).assertEqual('A/idle/0|B/idle/0|C/idle/0');
      expect(parts.length).assertEqual(6);
      expect(parts[0]).assertEqual('A/idle/0');
      expect(parts[3]).assertEqual('A/running/25');
      expect(snapshots.trace().startsWith(firstTrace)).assertTrue();
      expect(snapshots.trace() === firstTrace).assertFalse();
    });

    /**
     * @tc.name   progressLedgerSnapshotLogLatestReturnsLastPerTask
     * @tc.desc   latest() scans backwards and answers the newest triple for the requested task only.
     * @tc.precondition  The shared driver is loaded and two capture rounds have been appended.
     * @tc.steps         1. Capture the graph, move row A to 60, then capture again.
     *                   2. Ask latest for A and for C.
     *                   3. Compare the answers with the expected triples.
     * @tc.expected      A answers the second capture and C answers the untouched zero triple.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerSnapshotLogLatestReturnsLastPerTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const snapshots: SnapshotLog = new SnapshotLog();
      snapshots.capture(graph.tasks);
      graph.taskAt(0).start(0);
      graph.taskAt(0).reportProgress(60);
      snapshots.capture(graph.tasks);
      const latestA: RunSnapshot = snapshots.latest(TASK_A) as RunSnapshot;
      const latestC: RunSnapshot = snapshots.latest(TASK_C) as RunSnapshot;
      logStep('CoreProgressLedger', 'latest A ' + latestA.describe() + ' C ' + latestC.describe());
      expect(latestA.progress).assertEqual(60);
      expect(latestA.status).assertEqual(STATUS_RUNNING);
      expect(latestA.describe()).assertEqual('A/running/60');
      expect(latestC.progress).assertEqual(0);
      expect(latestC.status).assertEqual(STATUS_IDLE);
      expect(snapshots.size()).assertEqual(6);
    });

    /**
     * @tc.name   progressLedgerSnapshotLogClearEmpties
     * @tc.desc   Clearing the log drops every captured triple and restores an empty trace.
     * @tc.precondition  The shared driver is loaded and the log holds two rounds of entries.
     * @tc.steps         1. Capture twice and confirm the size.
     *                   2. Call clear on the log.
     *                   3. Read size, trace and latest after the clear.
     * @tc.expected      The size returns to zero and latest answers undefined.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerSnapshotLogClearEmpties', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const snapshots: SnapshotLog = new SnapshotLog();
      snapshots.capture(graph.tasks);
      snapshots.capture(graph.tasks);
      const before: number = snapshots.size();
      snapshots.clear();
      logStep('CoreProgressLedger', 'cleared log size ' + String(snapshots.size()));
      expect(before).assertEqual(6);
      expect(snapshots.size()).assertEqual(0);
      expect(snapshots.trace()).assertEqual('');
      expect(snapshots.latest(TASK_A)).assertUndefined();
      expect(snapshots.size()).assertLess(before);
    });

    /**
     * @tc.name   progressLedgerLabelForZeroAndFull
     * @tc.desc   The label template renders the zero literal and the completed literal with the same suffix.
     * @tc.precondition  The shared driver is loaded and row A is idle.
     * @tc.steps         1. Read the label of the untouched row.
     *                   2. Complete the row and read the label again.
     *                   3. Compare both strings with the page template.
     * @tc.expected      The two labels differ only in the number and both end with a percent sign.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerLabelForZeroAndFull', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, 'https://example.com/a.png');
      const empty: string = task.label();
      task.start(0);
      task.complete(5);
      const full: string = task.label();
      logStep('CoreProgressLedger', 'labels ' + empty + ' / ' + full);
      expect(empty).assertEqual('任务A当前进度 0%');
      expect(full).assertEqual('任务A当前进度 100%');
      expect(full).assertEqual(progressLabel(TASK_A, expectedCompletedProgress()));
      expect(empty.startsWith('任务A')).assertTrue();
      expect(full.endsWith('%')).assertTrue();
      expect(empty === full).assertFalse();
    });

    /**
     * @tc.name   progressLedgerLabelTaskLetterDiffersOnly
     * @tc.desc   At the same percentage the three labels share a length and differ only in the task letter.
     * @tc.precondition  The shared driver is loaded and all three rows are running at 12 percent.
     * @tc.steps         1. Report 12 percent on rows A, B and C.
     *                   2. Read the three labels and their lengths.
     *                   3. Compare each label with the oracle template.
     * @tc.expected      All three labels have equal length and the correct leading task letter.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerLabelTaskLetterDiffersOnly', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.taskAt(0).start(0);
      graph.taskAt(1).start(0);
      graph.taskAt(2).start(0);
      graph.taskAt(0).reportProgress(12);
      graph.taskAt(1).reportProgress(12);
      graph.taskAt(2).reportProgress(12);
      const labelA: string = graph.taskAt(0).label();
      const labelB: string = graph.taskAt(1).label();
      const labelC: string = graph.taskAt(2).label();
      logStep('CoreProgressLedger', 'labels ' + labelA + ' / ' + labelB + ' / ' + labelC);
      expect(labelA).assertEqual(progressLabel(TASK_A, 12));
      expect(labelB).assertEqual('任务B当前进度 12%');
      expect(labelC).assertEqual(progressLabel(TASK_C, 12));
      expect(labelA.length).assertEqual(labelC.length);
      expect(labelB.indexOf('任务B')).assertEqual(0);
      expect(labelA === labelB).assertFalse();
    });

    /**
     * @tc.name   progressLedgerRatioAndPercentageAgree
     * @tc.desc   The ratio is the percentage divided by the bar total, so multiplying it back restores the value.
     * @tc.precondition  The shared driver is loaded and row B is running.
     * @tc.steps         1. Report 10, 60 and 100 percent in order.
     *                   2. Capture the ratio after each report.
     *                   3. Multiply every ratio by the total literal.
     * @tc.expected      The products are 10, 60 and 100 and the ratios increase strictly.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerRatioAndPercentageAgree', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, 'https://example.com/b.png');
      task.start(0);
      task.reportProgress(10);
      const ten: number = task.progressRatio();
      task.reportProgress(60);
      const sixty: number = task.progressRatio();
      task.reportProgress(100);
      const hundred: number = task.progressRatio();
      logStep('CoreProgressLedger', 'ratios ' + String(ten) + '/' + String(sixty) + '/' + String(hundred));
      expect(ten).assertEqual(0.1);
      expect(sixty).assertEqual(0.6);
      expect(hundred).assertEqual(1);
      expect(ten * PROGRESS_TOTAL).assertEqual(10);
      expect(sixty * PROGRESS_TOTAL).assertEqual(60);
      expect(ten).assertLess(sixty);
      expect(hundred).assertLarger(sixty);
    });

    /**
     * @tc.name   progressLedgerTotalAfterMixedCompletion
     * @tc.desc   The ledger total mixes completed rows and partial rows without losing either contribution.
     * @tc.precondition  The shared driver is loaded and the graph has been started.
     * @tc.steps         1. Start the graph and complete rows A and B.
     *                   2. Report 50 percent on row C.
     *                   3. Read the total and the metrics view.
     * @tc.expected      The total is 250 and the metrics count two completed rows.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerTotalAfterMixedCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.taskAt(2).reportProgress(50);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      logStep('CoreProgressLedger', 'mixed total ' + String(graph.totalProgress()));
      expect(graph.totalProgress()).assertEqual(250);
      expect(metrics.completedTasks).assertEqual(2);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(250);
      expect(metrics.totalTasks).assertEqual(3);
      expect(graph.taskAt(2).progress).assertEqual(50);
    });

    /**
     * @tc.name   progressLedgerAverageAfterOneComplete
     * @tc.desc   One completed row lifts the average to a third of the bar total, never to a full bar.
     * @tc.precondition  The shared driver is loaded and only row A has completed.
     * @tc.steps         1. Start the graph and complete row A.
     *                   2. Read the total and the average.
     *                   3. Compare the average with one third of the total.
     * @tc.expected      The total is 100, the average is about 33.3 and stays below 100.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerAverageAfterOneComplete', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 0);
      const average: number = graph.averageProgress();
      logStep('CoreProgressLedger', 'one complete average ' + String(average));
      expect(graph.totalProgress()).assertEqual(100);
      expect(average).assertEqual(graph.totalProgress() / 3);
      expect(average).assertLess(PROGRESS_TOTAL);
      expect(average).assertLarger(30);
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.taskAt(2).progress).assertEqual(0);
    });

    /**
     * @tc.name   progressLedgerResetZeroesLedger
     * @tc.desc   Graph reset returns every row and the aggregate ledger to the fresh state.
     * @tc.precondition  The shared driver is loaded and the graph has completed two rows.
     * @tc.steps         1. Start the graph and complete rows A and B.
     *                   2. Call reset on the graph.
     *                   3. Read the totals, statuses and snapshot text.
     * @tc.expected      Every row is idle at zero and the total and average are zero again.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerResetZeroesLedger', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      const before: number = graph.totalProgress();
      graph.reset();
      logStep('CoreProgressLedger', 'after reset ' + graph.snapshotText());
      expect(before).assertEqual(200);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.averageProgress()).assertEqual(0);
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(0).progressRatio()).assertEqual(0);
    });

    /**
     * @tc.name   progressLedgerPartialThenCompleteUpdatesTotal
     * @tc.desc   Each completion adds exactly one full bar to the total while partial reports add their value.
     * @tc.precondition  The shared driver is loaded and every row starts at zero.
     * @tc.steps         1. Complete row A and read the total.
     *                   2. Report 25 percent on row C and read the total again.
     *                   3. Complete row B and read the final total.
     * @tc.expected      The total climbs 100, then 125, then 225 and equals the row sum.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerPartialThenCompleteUpdatesTotal', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 0);
      const afterFirst: number = graph.totalProgress();
      graph.taskAt(2).reportProgress(25);
      const afterPartial: number = graph.totalProgress();
      graph.completeTask(TASK_B, 0);
      const rowSum: number = graph.taskAt(0).progress + graph.taskAt(1).progress + graph.taskAt(2).progress;
      logStep('CoreProgressLedger', 'total steps ' + String(afterFirst) + '/' + String(afterPartial) + '/' +
        String(graph.totalProgress()));
      expect(afterFirst).assertEqual(100);
      expect(afterPartial).assertEqual(125);
      expect(graph.totalProgress()).assertEqual(225);
      expect(graph.totalProgress()).assertEqual(rowSum);
      expect(graph.taskAt(2).progress).assertEqual(25);
      expect(graph.totalProgress()).assertLarger(afterPartial);
    });

    /**
     * @tc.name   progressLedgerDescribeMatchesProgressLedger
     * @tc.desc   The describe triple carries the same percentage that the ledger and the label expose.
     * @tc.precondition  The shared driver is loaded and row C is running at 17 percent.
     * @tc.steps         1. Start row C and report 17 percent.
     *                   2. Split describe on the colon separator.
     *                   3. Compare the last segment with the label percentage.
     * @tc.expected      The described percentage is 17 and the label carries the same digits.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerDescribeMatchesProgressLedger', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, 'https://example.com/c.png');
      task.start(0);
      task.reportProgress(17);
      const described: string = task.describe();
      const parts: string[] = described.split(':');
      logStep('CoreProgressLedger', 'describe ' + described);
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual(TASK_C);
      expect(parts[1]).assertEqual(STATUS_RUNNING);
      expect(parts[2]).assertEqual('17');
      expect(task.label().indexOf(parts[2])).assertLarger(0);
      expect(task.label()).assertEqual('任务C当前进度 17%');
    });

    /**
     * @tc.name   progressLedgerSnapshotMatchesDescribeValues
     * @tc.desc   A snapshot and a describe call taken at the same instant report identical field values.
     * @tc.precondition  The shared driver is loaded and row A is running at 38 percent.
     * @tc.steps         1. Start row A and report 38 percent.
     *                   2. Take a snapshot and a describe string back to back.
     *                   3. Compare every projected field.
     * @tc.expected      The snapshot triple equals the describe triple with the separator swapped.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerSnapshotMatchesDescribeValues', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(0);
      task.reportProgress(38);
      const snapshot: RunSnapshot = task.snapshot();
      const described: string = task.describe();
      logStep('CoreProgressLedger', 'snapshot/describe ' + snapshot.describe() + ' / ' + described);
      expect(snapshot.taskNo).assertEqual(TASK_A);
      expect(snapshot.progress).assertEqual(38);
      expect(snapshot.status).assertEqual(STATUS_RUNNING);
      expect(described).assertEqual('A:running:38');
      expect(snapshot.describe()).assertEqual(described.replace(':', '/').replace(':', '/'));
      expect(snapshot.sameAs(new RunSnapshot(TASK_A, 38, STATUS_RUNNING))).assertTrue();
    });

    /**
     * @tc.name   progressLedgerSnapshotSameAsDetectsProgressDrift
     * @tc.desc   Equality of two snapshots fails when only the progress field drifts by a single point.
     * @tc.precondition  The shared driver is loaded and a base snapshot exists at 50 percent.
     * @tc.steps         1. Build a base snapshot and a same snapshot.
     *                   2. Build snapshots that differ in task, progress and status.
     *                   3. Compare all four with the base.
     * @tc.expected      Only the identical snapshot compares equal to the base.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerSnapshotSameAsDetectsProgressDrift', 0, () => {
      const base: RunSnapshot = new RunSnapshot(TASK_A, 50, STATUS_RUNNING);
      const same: RunSnapshot = new RunSnapshot(TASK_A, 50, STATUS_RUNNING);
      const progressDrift: RunSnapshot = new RunSnapshot(TASK_A, 51, STATUS_RUNNING);
      const taskDrift: RunSnapshot = new RunSnapshot(TASK_B, 50, STATUS_RUNNING);
      const statusDrift: RunSnapshot = new RunSnapshot(TASK_A, 50, STATUS_COMPLETED);
      logStep('CoreProgressLedger', 'same/drift ' + base.describe() + ' / ' + progressDrift.describe());
      expect(base.sameAs(same)).assertTrue();
      expect(base.sameAs(progressDrift)).assertFalse();
      expect(base.sameAs(taskDrift)).assertFalse();
      expect(base.sameAs(statusDrift)).assertFalse();
      expect(progressDrift.progress - base.progress).assertEqual(1);
      expect(base.describe()).assertEqual('A/running/50');
    });

    /**
     * @tc.name   progressLedgerProgressDoesNotChangeStatus
     * @tc.desc   A progress callback writes the bar only and never advances the status on its own.
     * @tc.precondition  The shared driver is loaded and row B has been started once.
     * @tc.steps         1. Start row B and capture the status and attempt count.
     *                   2. Report 99 percent.
     *                   3. Compare the status and attempt count with the captured values.
     * @tc.expected      The row stays running with one attempt even at 99 percent.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLedgerProgressDoesNotChangeStatus', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, 'https://example.com/b.png');
      task.start(0);
      const beforeStatus: string = task.status;
      const beforeAttempts: number = task.attempts;
      task.reportProgress(99);
      logStep('CoreProgressLedger', 'status after report ' + task.status);
      expect(beforeStatus).assertEqual(STATUS_RUNNING);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.status).assertEqual(beforeStatus);
      expect(task.attempts).assertEqual(beforeAttempts);
      expect(task.isComplete()).assertFalse();
      expect(task.isRunning()).assertTrue();
    });

    /**
     * @tc.name   progressLedgerStartKeepsPreStartProgress
     * @tc.desc   A progress callback that arrives before start fills the bar and start does not erase it.
     * @tc.precondition  The shared driver is loaded and row A is still idle.
     * @tc.steps         1. Report 45 percent on the idle row and capture the status.
     *                   2. Start the row with a timestamp.
     *                   3. Compare the retained progress and the new status.
     * @tc.expected      The started row keeps 45 percent and records the start timestamp.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerStartKeepsPreStartProgress', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, 'https://example.com/a.png');
      const before: number = task.reportProgress(45);
      const statusBefore: string = task.status;
      const started: boolean = task.start(120);
      logStep('CoreProgressLedger', 'pre-start progress ' + String(before) + ' after start ' + String(task.progress));
      expect(statusBefore).assertEqual(STATUS_IDLE);
      expect(before).assertEqual(45);
      expect(started).assertTrue();
      expect(task.progress).assertEqual(45);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.startedAt).assertEqual(120);
    });

    /**
     * @tc.name   progressLedgerRestartAfterResetStartsAtZero
     * @tc.desc   Reset clears the bar, so the next start begins a fresh ledger at the initial literal.
     * @tc.precondition  The shared driver is loaded and row C has failed at 80 percent.
     * @tc.steps         1. Start row C, report 80 percent and fail with a timeout.
     *                   2. Reset the row and start it again.
     *                   3. Read progress, attempts and status.
     * @tc.expected      The restarted row is at zero with a second attempt recorded.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerRestartAfterResetStartsAtZero', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, 'https://example.com/c.png');
      task.start(0);
      task.reportProgress(80);
      task.fail(ERROR_TIMEOUT);
      task.reset();
      const restarted: boolean = task.start(777);
      logStep('CoreProgressLedger', 'restart ' + task.describe());
      expect(restarted).assertTrue();
      expect(task.progress).assertEqual(0);
      expect(task.attempts).assertEqual(2);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.progressRatio()).assertEqual(0);
      expect(task.lastErrorCode).assertEqual(0);
    });

    /**
     * @tc.name   progressLedgerCompleteTwiceKeepsHundred
     * @tc.desc   A second completion is refused and cannot move the ledger or the finish stamp again.
     * @tc.precondition  The shared driver is loaded and row A has completed at stamp ten.
     * @tc.steps         1. Start row A, report 40 percent and complete at stamp ten.
     *                   2. Attempt a second completion at stamp five hundred.
     *                   3. Read the finish stamp and the ledger value.
     * @tc.expected      The second completion fails, the stamp stays ten and the bar stays 100.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerCompleteTwiceKeepsHundred', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(0);
      task.reportProgress(40);
      const first: boolean = task.complete(10);
      const second: boolean = task.complete(500);
      logStep('CoreProgressLedger', 'completion stamps ' + String(task.finishedAt));
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(task.finishedAt).assertEqual(10);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.attempts).assertEqual(1);
    });

    /**
     * @tc.name   progressLedgerFailAfterCompleteKeepsHundred
     * @tc.desc   A failure arriving after completion is refused and the ledger keeps the success value.
     * @tc.precondition  The shared driver is loaded and row B has completed without an error.
     * @tc.steps         1. Start row B and complete it at stamp 120.
     *                   2. Attempt to fail the row with a start error.
     *                   3. Read the status, error code and ledger value.
     * @tc.expected      The failure is refused, the error code stays zero and the bar stays 100.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerFailAfterCompleteKeepsHundred', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, 'https://example.com/b.png');
      task.start(0);
      task.complete(120);
      const refused: boolean = task.fail(ERROR_START);
      logStep('CoreProgressLedger', 'fail after complete ' + String(refused));
      expect(refused).assertFalse();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.lastErrorCode).assertEqual(0);
      expect(task.progress).assertEqual(100);
      expect(task.finishedAt).assertEqual(120);
      expect(task.isFailed()).assertFalse();
    });

    /**
     * @tc.name   progressLedgerTotalIsAdditiveAcrossRows
     * @tc.desc   The total is additive no matter which row moves first, so the order cannot change the sum.
     * @tc.precondition  The shared driver is loaded and all three rows are idle.
     * @tc.steps         1. Report 5, 15 and 80 percent on three fresh graphs in different orders.
     *                   2. Read the total from each graph.
     *                   3. Compare the three totals with each other.
     * @tc.expected      Every graph reports the same total of 100.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerTotalIsAdditiveAcrossRows', 0, () => {
      const first: TaskGraph = createTaskGraph();
      first.taskAt(0).reportProgress(5);
      first.taskAt(1).reportProgress(15);
      first.taskAt(2).reportProgress(80);
      const second: TaskGraph = createTaskGraph();
      second.taskAt(2).reportProgress(80);
      second.taskAt(1).reportProgress(15);
      second.taskAt(0).reportProgress(5);
      const third: TaskGraph = createTaskGraph();
      third.taskAt(1).reportProgress(15);
      third.taskAt(0).reportProgress(5);
      third.taskAt(2).reportProgress(80);
      logStep('CoreProgressLedger', 'totals ' + String(first.totalProgress()) + '/' +
        String(second.totalProgress()) + '/' + String(third.totalProgress()));
      expect(first.totalProgress()).assertEqual(100);
      expect(second.totalProgress()).assertEqual(first.totalProgress());
      expect(third.totalProgress()).assertEqual(first.totalProgress());
      expect(first.averageProgress()).assertEqual(second.averageProgress());
      expect(second.snapshotText()).assertEqual(third.snapshotText());
      expect(first.totalProgress()).assertEqual(5 + 15 + 80);
    });

    /**
     * @tc.name   progressLedgerAverageBoundsBetweenZeroAndHundred
     * @tc.desc   The average always stays inside the bar range, from an idle ledger to a fully completed one.
     * @tc.precondition  The shared driver is loaded and a fresh graph starts fully idle.
     * @tc.steps         1. Read the idle average.
     *                   2. Complete A and B and read the partial average.
     *                   3. Poll C, complete it and read the final average.
     * @tc.expected      The three averages are zero, about 66.7 and exactly 100.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('progressLedgerAverageBoundsBetweenZeroAndHundred', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const idle: number = graph.averageProgress();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      const partial: number = graph.averageProgress();
      graph.pollTick(30);
      graph.completeTaskC(40);
      const done: number = graph.averageProgress();
      logStep('CoreProgressLedger', 'averages ' + String(idle) + '/' + String(partial) + '/' + String(done));
      expect(idle).assertEqual(0);
      expect(partial).assertEqual(200.0 / 3);
      expect(done).assertEqual(100);
      expect(idle).assertLarger(-1);
      expect(done).assertLess(101);
      expect(partial).assertLarger(idle);
      expect(done).assertLarger(partial);
    });

    /**
     * @tc.name   progressLedgerTextIsDeterministic
     * @tc.desc   The snapshot text of two graphs that saw the same ledger is byte identical.
     * @tc.precondition  The shared driver is loaded and two independent graphs apply the same reports.
     * @tc.steps         1. Apply 11, 22 and 33 percent to two fresh graphs.
     *                   2. Read snapshotText from both graphs twice.
     *                   3. Compare all four strings.
     * @tc.expected      The text is identical across graphs and stable across repeated reads.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerTextIsDeterministic', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      const values: number[] = [11, 22, 33];
      for (let index: int = 0; index < values.length; index++) {
        first.taskAt(index).reportProgress(values[index]);
        second.taskAt(index).reportProgress(values[index]);
      }
      const firstText: string = first.snapshotText();
      const secondText: string = second.snapshotText();
      logStep('CoreProgressLedger', 'text ' + firstText);
      expect(firstText).assertEqual('A:idle:11|B:idle:22|C:idle:33');
      expect(firstText).assertEqual(secondText);
      expect(first.snapshotText()).assertEqual(firstText);
      expect(second.snapshotText()).assertEqual(firstText);
      expect(firstText.split('|').length).assertEqual(3);
      expect(firstText.indexOf('B:idle:22')).assertLarger(0);
    });

    /**
     * @tc.name   progressLedgerMetricsFingerprintStableForSameLedger
     * @tc.desc   The metrics fingerprint is a pure function of the ledger, so equal ledgers hash equal.
     * @tc.precondition  The shared driver is loaded and two graphs reach the same progress state.
     * @tc.steps         1. Complete A and report 40 percent on B in two graphs.
     *                   2. Build NetworkMetrics from both graphs.
     *                   3. Compare the fingerprints and mutate one graph.
     * @tc.expected      The fingerprints match before the mutation and diverge afterwards.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerMetricsFingerprintStableForSameLedger', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A, 0);
      second.completeTask(TASK_A, 0);
      first.taskAt(1).reportProgress(40);
      second.taskAt(1).reportProgress(40);
      const firstMetrics: NetworkMetrics = NetworkMetrics.from(first);
      const secondMetrics: NetworkMetrics = NetworkMetrics.from(second);
      const before: number = firstMetrics.fingerprint();
      second.taskAt(1).reportProgress(80);
      logStep('CoreProgressLedger', 'fingerprints ' + String(before) + '/' +
        String(secondMetrics.fingerprint()));
      expect(firstMetrics.fingerprint()).assertEqual(before);
      expect(secondMetrics.fingerprint()).assertEqual(before);
      expect(NetworkMetrics.from(second).fingerprint() === before).assertFalse();
      expect(firstMetrics.totalProgress).assertEqual(140);
      expect(secondMetrics.totalProgress).assertEqual(140);
      expect(firstMetrics.completedTasks).assertEqual(1);
    });

    /**
     * @tc.name   progressLedgerFailedRowContributesZeroToAverage
     * @tc.desc   A row that fails before receiving any progress contributes its zero to the average denominator.
     * @tc.precondition  The shared driver is loaded and row B fails while still at zero percent.
     * @tc.steps         1. Start the graph, fail row B and report 50 percent on row A.
     *                   2. Read the total, average and metrics.
     *                   3. Compare the average with the total divided by three.
     * @tc.expected      The total is 50, the average is a sixth of the bar and one row is failed.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerFailedRowContributesZeroToAverage', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).fail(ERROR_START);
      graph.taskAt(0).reportProgress(50);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      logStep('CoreProgressLedger', 'failed ledger ' + graph.snapshotText());
      expect(graph.totalProgress()).assertEqual(50);
      expect(graph.averageProgress()).assertEqual(50.0 / 3);
      expect(metrics.failedTasks).assertEqual(1);
      expect(metrics.completedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(50);
      expect(graph.taskAt(1).progress).assertEqual(0);
    });

    /**
     * @tc.name   progressLedgerSnapshotLogCycleLeavesLedgerIntact
     * @tc.desc   Capturing and clearing a SnapshotLog never mutates the live ledger it copied.
     * @tc.precondition  The shared driver is loaded and row C holds 64 percent.
     * @tc.steps         1. Report 64 percent on row C and capture the graph.
     *                   2. Clear the snapshot log.
     *                   3. Re-read the row value and the total.
     * @tc.expected      The ledger still reports 64 and the snapshot log is empty.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerSnapshotLogCycleLeavesLedgerIntact', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.taskAt(2).reportProgress(64);
      const snapshots: SnapshotLog = new SnapshotLog();
      snapshots.capture(graph.tasks);
      const captured: number = snapshots.size();
      snapshots.clear();
      logStep('CoreProgressLedger', 'ledger after log clear ' + graph.snapshotText());
      expect(captured).assertEqual(3);
      expect(snapshots.size()).assertEqual(0);
      expect(graph.taskAt(2).progress).assertEqual(64);
      expect(graph.totalProgress()).assertEqual(64);
      expect(graph.averageProgress()).assertEqual(64.0 / 3);
      expect(graph.taskAt(2).label()).assertEqual('任务C当前进度 64%');
    });

    /**
     * @tc.name   progressLedgerLabelReflectsFrozenFailedValue
     * @tc.desc   After a failure the label keeps showing the last accepted percentage, not a zero reset.
     * @tc.precondition  The shared driver is loaded and row A fails at 67 percent.
     * @tc.steps         1. Start row A and report 67 percent.
     *                   2. Fail the row with a network style error code.
     *                   3. Read the label and the described triple.
     * @tc.expected      The label still renders 67 percent and the status reads failed.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLedgerLabelReflectsFrozenFailedValue', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(0);
      task.reportProgress(67);
      task.fail(ERROR_TIMEOUT);
      logStep('CoreProgressLedger', 'failed label ' + task.label());
      expect(task.label()).assertEqual('任务A当前进度 67%');
      expect(task.label().indexOf('67')).assertLarger(0);
      expect(task.describe()).assertEqual('A:failed:67');
      expect(task.progress).assertEqual(67);
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   progressLedgerTotalNeverGoesNegative
     * @tc.desc   Negative callbacks and resets can never push the aggregate ledger below the zero bound.
     * @tc.precondition  The shared driver is loaded and every row starts at zero.
     * @tc.steps         1. Report negative values on all three rows of a fresh graph.
     *                   2. Read the total and the average.
     *                   3. Reset the graph and report another negative value.
     * @tc.expected      The total and average stay at zero after every negative callback.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('progressLedgerTotalNeverGoesNegative', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.taskAt(0).reportProgress(-10);
      graph.taskAt(1).reportProgress(-20);
      graph.taskAt(2).reportProgress(-30);
      const totalAfterNegatives: number = graph.totalProgress();
      graph.reset();
      graph.taskAt(2).reportProgress(-99);
      logStep('CoreProgressLedger', 'negative totals ' + String(totalAfterNegatives) + '/' +
        String(graph.totalProgress()));
      expect(totalAfterNegatives).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.averageProgress()).assertEqual(0);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.taskAt(2).progress).assertLarger(-1);
      expect(graph.taskAt(2).label()).assertEqual(progressLabel(TASK_C, 0));
    });
  });
}
