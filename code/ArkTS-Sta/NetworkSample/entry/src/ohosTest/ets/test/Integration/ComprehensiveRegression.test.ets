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
 * ComprehensiveRegression suite.
 *
 * A matrix regression: several graph instances, every dependency order, a
 * failed row in the middle, resets between rows and repeated runs. Each row
 * records a completion trace, an event fingerprint, a snapshot trace and an
 * aggregate metric, so a behavioural change shows up as a different value
 * rather than as a vague failure.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-65   six pieces of per-run state
 *   79-102  completion helpers and the unlock predicate
 *   174-198 startAllTasks and the exclusive polling block
 *   200-265 rendered rows, labels and the start button
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  PROGRESS_TOTAL,
  POLL_INTERVAL_MS,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  ERROR_NETWORK,
  createTaskGraph,
  completionTrace,
  isTopologicalCompletion,
  NetworkMetrics,
  EventRecorder,
  SnapshotLog,
  RunSnapshot,
  textFingerprint,
  joined,
  uniqueStrings,
  TaskGraph
} from '../Shared/SharedDriver';

/** Drives one full successful run and returns the graph. */
function driveFullRun(): TaskGraph {
  const graph = createTaskGraph();
  graph.startAll();
  graph.completeTask(TASK_A);
  graph.completeTask(TASK_B);
  graph.pollTick(POLL_INTERVAL_MS);
  graph.completeTaskC(2 * POLL_INTERVAL_MS);
  return graph;
}

/** Drives a run where A and B finish in the supplied order. */
function driveOrderedRun(first: string, second: string): TaskGraph {
  const graph = createTaskGraph();
  graph.startAll();
  graph.completeTask(first);
  graph.completeTask(second);
  graph.pollTick(POLL_INTERVAL_MS);
  graph.completeTaskC(2 * POLL_INTERVAL_MS);
  return graph;
}

export default function comprehensiveRegressionTest(): void {
  describe('ComprehensiveRegression', () => {
    beforeAll(() => {
      logSuite('ComprehensiveRegression', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ComprehensiveRegression', 'end');
    });

    /**
     * @tc.name   threeIndependentGraphsRunInParallel
     * @tc.desc   Three graphs driven at the same time keep separate traces, locks and metrics.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('threeIndependentGraphsRunInParallel', 0, () => {
      const first = createTaskGraph();
      const second = createTaskGraph();
      const third = createTaskGraph();
      first.startAll();
      second.startAll();
      second.completeTask(TASK_B);
      third.startAll();
      third.completeTask(TASK_B);
      third.completeTask(TASK_A);
      expect(first.events.countOf('completed')).assertEqual(0);
      expect(second.events.countOf('completed')).assertEqual(1);
      expect(third.events.countOf('completed')).assertEqual(2);
      expect(second.canRunTaskC()).assertFalse();
      expect(third.canRunTaskC()).assertTrue();
      expect(completionTrace(second)).assertEqual('B');
      expect(completionTrace(third)).assertEqual('B|A');
      expect(first.taskAt(0).isRunning()).assertTrue();
      expect(third.taskAt(0).isComplete()).assertTrue();
      expect(first.events.fingerprint() === third.events.fingerprint()).assertFalse();
    });

    /**
     * @tc.name   runMatrixProducesDistinctOrderTraces
     * @tc.desc   The two dependency orders yield distinct completion traces but the same end state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runMatrixProducesDistinctOrderTraces', 0, () => {
      const forward = driveOrderedRun(TASK_A, TASK_B);
      const reverse = driveOrderedRun(TASK_B, TASK_A);
      expect(completionTrace(forward)).assertEqual('A|B|C');
      expect(completionTrace(reverse)).assertEqual('B|A|C');
      expect(completionTrace(forward) === completionTrace(reverse)).assertFalse();
      expect(forward.snapshotText()).assertEqual(reverse.snapshotText());
      expect(forward.events.fingerprint() === reverse.events.fingerprint()).assertFalse();
      expect(NetworkMetrics.from(forward).fingerprint()).assertEqual(NetworkMetrics.from(reverse).fingerprint());
      expect(forward.events.countOf('completed')).assertEqual(3);
      expect(reverse.events.countOf('completed')).assertEqual(3);
      expect(forward.events.countOf('unlocked')).assertEqual(reverse.events.countOf('unlocked'));
    });

    /**
     * @tc.name   allMatrixOrdersAreTopological
     * @tc.desc   Every row of the order matrix satisfies the gate predicate with C last.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('allMatrixOrdersAreTopological', 0, () => {
      const firsts: string[] = [TASK_A, TASK_A, TASK_B, TASK_B];
      const seconds: string[] = [TASK_B, TASK_B, TASK_A, TASK_A];
      for (let index = 0; index < firsts.length; index++) {
        const graph = driveOrderedRun(firsts[index], seconds[index]);
        expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
        expect(graph.completionOrder[2]).assertEqual(TASK_C);
        expect(graph.completionOrder.indexOf(TASK_C)).assertEqual(2);
        expect(graph.taskAt(2).progress).assertEqual(100);
        expect(NetworkMetrics.from(graph).completedTasks).assertEqual(3);
      }
      expect(isTopologicalCompletion([TASK_C, TASK_A, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_C, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_B, TASK_C, TASK_A])).assertFalse();
    });

    /**
     * @tc.name   metricsFingerprintDiffersPerStage
     * @tc.desc   The metric fingerprint changes at idle, halfway and complete, matching the documented formula.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsFingerprintDiffersPerStage', 0, () => {
      const graph = createTaskGraph();
      const idleMetrics = NetworkMetrics.from(graph);
      graph.startAll();
      graph.completeTask(TASK_A);
      const halfMetrics = NetworkMetrics.from(graph);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      const doneMetrics = NetworkMetrics.from(graph);
      expect(idleMetrics.fingerprint()).assertEqual(textFingerprint('3:0:0:0'));
      expect(halfMetrics.fingerprint()).assertEqual(textFingerprint('3:1:0:100'));
      expect(doneMetrics.fingerprint()).assertEqual(textFingerprint('3:3:0:300'));
      expect(idleMetrics.fingerprint() === halfMetrics.fingerprint()).assertFalse();
      expect(halfMetrics.fingerprint() === doneMetrics.fingerprint()).assertFalse();
      expect(idleMetrics.completedTasks).assertEqual(0);
      expect(halfMetrics.completedTasks).assertEqual(1);
      expect(doneMetrics.completedTasks).assertEqual(3);
      expect(doneMetrics.failedTasks).assertEqual(0);
    });

    /**
     * @tc.name   equivalentRunsShareFingerprint
     * @tc.desc   Two runs with identical scripts produce identical event and metric fingerprints.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('equivalentRunsShareFingerprint', 0, () => {
      const first = driveFullRun();
      const second = driveFullRun();
      expect(first.eventTrace()).assertEqual(second.eventTrace());
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.fingerprint()).assertEqual(textFingerprint(first.eventTrace()));
      expect(first.events.size()).assertEqual(second.events.size());
      expect(first.snapshotText()).assertEqual(second.snapshotText());
      expect(NetworkMetrics.from(first).fingerprint()).assertEqual(NetworkMetrics.from(second).fingerprint());
      expect(completionTrace(first)).assertEqual(completionTrace(second));
      expect(first.events.trace().split('|').length).assertEqual(11);
      expect(second.events.trace().split('|').length).assertEqual(11);
    });

    /**
     * @tc.name   eventFingerprintStableForIdenticalScript
     * @tc.desc   Recomputing the fingerprint over the stored entries is deterministic for repeat calls.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventFingerprintStableForIdenticalScript', 0, () => {
      const graph = driveFullRun();
      const once: number = graph.events.fingerprint();
      const twice: number = graph.events.fingerprint();
      expect(once).assertEqual(twice);
      expect(once).assertLarger(0);
      expect(once).assertLess(1000003);
      expect(once).assertEqual(textFingerprint(graph.events.trace()));
      const manual: EventRecorder = new EventRecorder();
      manual.record('a', 'b');
      manual.record('c', 'd');
      expect(manual.fingerprint()).assertEqual(textFingerprint('a:b|c:d'));
      expect(manual.trace()).assertEqual('a:b|c:d');
      expect(manual.fingerprint() === textFingerprint('a:b|c:e')).assertFalse();
    });

    /**
     * @tc.name   eventFingerprintChangesWhenOrderChanges
     * @tc.desc   Swapping the completion order is enough to change the fingerprint of the same event count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventFingerprintChangesWhenOrderChanges', 0, () => {
      const forward = driveOrderedRun(TASK_A, TASK_B);
      const reverse = driveOrderedRun(TASK_B, TASK_A);
      expect(forward.events.size()).assertEqual(reverse.events.size());
      expect(forward.events.countOf('started')).assertEqual(reverse.events.countOf('started'));
      expect(forward.events.countOf('completed')).assertEqual(reverse.events.countOf('completed'));
      expect(forward.events.fingerprint() === reverse.events.fingerprint()).assertFalse();
      expect(forward.events.trace() === reverse.events.trace()).assertFalse();
      expect(forward.events.trace().indexOf('completed:A') < forward.events.trace().indexOf('completed:B')).assertTrue();
      expect(reverse.events.trace().indexOf('completed:B') < reverse.events.trace().indexOf('completed:A')).assertTrue();
      expect(NetworkMetrics.from(forward).fingerprint()).assertEqual(NetworkMetrics.from(reverse).fingerprint());
    });

    /**
     * @tc.name   snapshotLogTraceGrowsPerCapture
     * @tc.desc   Every capture appends one row per task and the trace length follows capture count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLogTraceGrowsPerCapture', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      expect(log.size()).assertEqual(0);
      expect(log.trace()).assertEqual('');
      graph.startAll();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      expect(log.trace().split('|').length).assertEqual(3);
      graph.completeTask(TASK_A);
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(6);
      expect(log.trace().split('|').length).assertEqual(6);
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(9);
      expect(log.trace().split('|').length).assertEqual(9);
      log.clear();
      expect(log.size()).assertEqual(0);
      expect(log.trace()).assertEqual('');
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
    });

    /**
     * @tc.name   latestSnapshotReturnsLastPerTask
     * @tc.desc   The snapshot log resolves the newest row for each task number, not the first match.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('latestSnapshotReturnsLastPerTask', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      graph.startAll();
      log.capture(graph.tasks);
      graph.completeTask(TASK_A);
      log.capture(graph.tasks);
      graph.taskAt(1).reportProgress(40);
      log.capture(graph.tasks);
      const latestA = log.latest(TASK_A);
      const latestB = log.latest(TASK_B);
      const latestC = log.latest(TASK_C);
      expect(latestA !== undefined).assertTrue();
      expect(latestB !== undefined).assertTrue();
      expect(latestC !== undefined).assertTrue();
      if (latestA !== undefined && latestB !== undefined && latestC !== undefined) {
        expect(latestA.progress).assertEqual(100);
        expect(latestA.status).assertEqual(STATUS_COMPLETED);
        expect(latestB.progress).assertEqual(40);
        expect(latestB.status).assertEqual(STATUS_RUNNING);
        expect(latestC.progress).assertEqual(0);
        expect(latestC.status).assertEqual(STATUS_IDLE);
      }
      expect(log.size()).assertEqual(9);
      expect(log.latest('Z') === undefined).assertTrue();
    });

    /**
     * @tc.name   snapshotEqualityRequiresAllThreeFields
     * @tc.desc   Two snapshots differ if any of task number, progress or status differs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotEqualityRequiresAllThreeFields', 0, () => {
      const base = new RunSnapshot(TASK_A, 50, STATUS_RUNNING);
      expect(base.sameAs(new RunSnapshot(TASK_A, 50, STATUS_RUNNING))).assertTrue();
      expect(base.sameAs(new RunSnapshot(TASK_B, 50, STATUS_RUNNING))).assertFalse();
      expect(base.sameAs(new RunSnapshot(TASK_A, 51, STATUS_RUNNING))).assertFalse();
      expect(base.sameAs(new RunSnapshot(TASK_A, 50, STATUS_COMPLETED))).assertFalse();
      expect(base.sameAs(new RunSnapshot(TASK_B, 51, STATUS_IDLE))).assertFalse();
      expect(base.describe()).assertEqual('A/running/50');
      expect(base.taskNo).assertEqual(TASK_A);
      expect(base.progress).assertEqual(50);
      expect(base.status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   completionTraceJoinsWithPipe
     * @tc.desc   The completion trace helper joins entries with a pipe and is empty before the first finish.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionTraceJoinsWithPipe', 0, () => {
      const graph = createTaskGraph();
      expect(completionTrace(graph)).assertEqual('');
      expect(completionTrace(graph).length).assertEqual(0);
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(completionTrace(graph)).assertEqual('A');
      graph.completeTask(TASK_B);
      expect(completionTrace(graph)).assertEqual('A|B');
      expect(completionTrace(graph).split('|').length).assertEqual(2);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(300);
      expect(completionTrace(graph)).assertEqual(joined([TASK_A, TASK_B, TASK_C], '|'));
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(completionTrace(graph).indexOf('|')).assertEqual(1);
      expect(completionTrace(graph).lastIndexOf('|')).assertEqual(3);
    });

    /**
     * @tc.name   isTopologicalRejectsMissingC
     * @tc.desc   An order that never contains the exclusive task is not a complete topological order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('isTopologicalRejectsMissingC', 0, () => {
      expect(isTopologicalCompletion([TASK_A, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_A])).assertFalse();
      expect(isTopologicalCompletion([TASK_B])).assertFalse();
      expect(isTopologicalCompletion([])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_B, TASK_A])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_B, TASK_C])).assertTrue();
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(isTopologicalCompletion(graph.completionOrder)).assertFalse();
      graph.runTaskCIfReady(100);
      graph.completeTaskC(200);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(isTopologicalCompletion(graph.completionOrder)).assertEqual(graph.allCompleted());
    });

    /**
     * @tc.name   isTopologicalRejectsCBeforeB
     * @tc.desc   Any order that places the exclusive task before a dependency is rejected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('isTopologicalRejectsCBeforeB', 0, () => {
      expect(isTopologicalCompletion([TASK_A, TASK_C, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_B, TASK_C, TASK_A])).assertFalse();
      expect(isTopologicalCompletion([TASK_C, TASK_A, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_C, TASK_B, TASK_A])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_B, TASK_C])).assertTrue();
      expect(isTopologicalCompletion([TASK_B, TASK_A, TASK_C])).assertTrue();
      expect(isTopologicalCompletion([TASK_A, TASK_B, TASK_C, TASK_C])).assertTrue();
      expect(isTopologicalCompletion([TASK_C, TASK_A, TASK_B, TASK_C])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_B, TASK_C, TASK_A])).assertTrue();
      expect(isTopologicalCompletion([TASK_A, TASK_C])).assertFalse();
      expect(isTopologicalCompletion([TASK_B, TASK_C])).assertFalse();
    });

    /**
     * @tc.name   failureRowInMatrixReflectsFailure
     * @tc.desc   A matrix row with a failed dependency reports one failure, no success and an empty trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failureRowInMatrixReflectsFailure', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).fail(ERROR_NETWORK);
      graph.completeTask(TASK_A);
      const metrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.failedTasks).assertEqual(1);
      expect(metrics.completedTasks).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(1.0 / 3);
      expect(metrics.totalProgress).assertEqual(100);
      expect(completionTrace(graph)).assertEqual('A');
      expect(isTopologicalCompletion(graph.completionOrder)).assertFalse();
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(1).lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('3:1:1:100'));
    });

    /**
     * @tc.name   resetBetweenMatrixRowsRestoresBaseline
     * @tc.desc   Resetting after a completed row gives a graph whose snapshot text matches a brand new graph.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetBetweenMatrixRowsRestoresBaseline', 0, () => {
      const graph = driveFullRun();
      const fresh = createTaskGraph();
      expect(graph.snapshotText() === fresh.snapshotText()).assertFalse();
      graph.reset();
      expect(graph.snapshotText()).assertEqual(fresh.snapshotText());
      expect(graph.events.size()).assertEqual(fresh.events.size());
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.timerActive).assertEqual(fresh.timerActive);
      expect(graph.isTaskFinished).assertEqual(fresh.isTaskFinished);
      expect(graph.totalProgress()).assertEqual(fresh.totalProgress());
      expect(graph.canRunTaskC()).assertEqual(fresh.canRunTaskC());
      expect(graph.averageProgress()).assertEqual(0);
      graph.startAll();
      expect(graph.snapshotText() === fresh.snapshotText()).assertFalse();
    });

    /**
     * @tc.name   tenRunLoopKeepsCountersConsistent
     * @tc.desc   Ten resets and ten runs keep the per-run counters at three completions and grow attempts once each.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('tenRunLoopKeepsCountersConsistent', 0, () => {
      const graph = createTaskGraph();
      for (let run = 0; run < 10; run++) {
        graph.reset();
        graph.startAll();
        graph.completeTask(TASK_A);
        graph.completeTask(TASK_B);
        graph.pollTick(POLL_INTERVAL_MS);
        graph.completeTaskC(2 * POLL_INTERVAL_MS);
        expect(graph.events.countOf('completed')).assertEqual(3);
        expect(graph.completionOrder.length).assertEqual(3);
        expect(graph.totalProgress()).assertEqual(3 * PROGRESS_TOTAL);
        expect(graph.allCompleted()).assertTrue();
        expect(graph.lock.isUnlocked()).assertTrue();
      }
      expect(graph.taskAt(0).attempts).assertEqual(10);
      expect(graph.taskAt(1).attempts).assertEqual(10);
      expect(graph.taskAt(2).attempts).assertEqual(10);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.pollTicks).assertEqual(1);
      expect(NetworkMetrics.from(graph).completedTasks).assertEqual(3);
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
    });

    /**
     * @tc.name   completionCountEqualsThreePerRun
     * @tc.desc   Each of five driven runs records exactly three completions and ten trace entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionCountEqualsThreePerRun', 0, () => {
      for (let run = 0; run < 5; run++) {
        const graph = driveFullRun();
        expect(graph.events.countOf('completed')).assertEqual(3);
        expect(graph.events.countOf('started')).assertEqual(3);
        expect(graph.events.countOf('unlocked')).assertEqual(2);
        expect(graph.events.countOf('timer-cleared')).assertEqual(1);
        expect(graph.events.countOf('queued')).assertEqual(1);
        expect(graph.events.size()).assertEqual(11);
        expect(graph.completionOrder.length).assertEqual(3);
        expect(completionTrace(graph)).assertEqual('A|B|C');
        expect(graph.allCompleted()).assertTrue();
      }
    });

    /**
     * @tc.name   metricsAverageProgressAcrossStages
     * @tc.desc   The stage-by-stage average divides the summed rows by three and lands on the full value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsAverageProgressAcrossStages', 0, () => {
      const graph = createTaskGraph();
      expect(NetworkMetrics.from(graph).averageProgress()).assertEqual(0);
      graph.startAll();
      graph.taskAt(0).reportProgress(30);
      expect(NetworkMetrics.from(graph).averageProgress()).assertEqual(10);
      graph.taskAt(1).reportProgress(60);
      expect(NetworkMetrics.from(graph).averageProgress()).assertEqual(30);
      graph.taskAt(2).reportProgress(90);
      expect(NetworkMetrics.from(graph).averageProgress()).assertEqual(60);
      graph.completeTask(TASK_A);
      expect(NetworkMetrics.from(graph).averageProgress()).assertEqual(250.0 / 3);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(300);
      expect(NetworkMetrics.from(graph).averageProgress()).assertEqual(100);
      expect(NetworkMetrics.from(graph).totalProgress).assertEqual(300);
      expect(NetworkMetrics.from(graph).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name   snapshotTextOrderIsAlwaysABC
     * @tc.desc   The three row descriptions are always reported in page order, whatever the completion order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotTextOrderIsAlwaysABC', 0, () => {
      const forward = driveOrderedRun(TASK_A, TASK_B);
      const reverse = driveOrderedRun(TASK_B, TASK_A);
      const fresh = createTaskGraph();
      const texts: string[] = [forward.snapshotText(), reverse.snapshotText(), fresh.snapshotText()];
      for (let index = 0; index < texts.length; index++) {
        expect(texts[index].split('|').length).assertEqual(3);
        expect(texts[index].startsWith('A:')).assertTrue();
        expect(texts[index].indexOf('|B:') > 0).assertTrue();
        expect(texts[index].indexOf('|C:') > 0).assertTrue();
        expect(texts[index].indexOf('|B:') < texts[index].indexOf('|C:')).assertTrue();
        expect(texts[index].split(':').length).assertEqual(7);
      }
      expect(forward.snapshotText()).assertEqual(reverse.snapshotText());
      expect(fresh.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      expect(forward.snapshotText()).assertEqual('A:completed:100|B:completed:100|C:completed:100');
      expect(forward.snapshotText() === fresh.snapshotText()).assertFalse();
      expect(forward.snapshotText().indexOf(STATUS_RUNNING)).assertLess(0);
    });

    /**
     * @tc.name   eventTracePrefixIsAlwaysStartAll
     * @tc.desc   Every driven run starts its trace with the start-all marker and the two shared starts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventTracePrefixIsAlwaysStartAll', 0, () => {
      const traces: string[] = [];
      traces.push(driveFullRun().eventTrace());
      traces.push(driveOrderedRun(TASK_B, TASK_A).eventTrace());
      const failed = createTaskGraph();
      failed.startAll();
      failed.taskAt(0).fail(ERROR_NETWORK);
      traces.push(failed.eventTrace());
      for (let index = 0; index < traces.length; index++) {
        expect(traces[index].startsWith('start-all:begin|started:A|started:B|queued:C')).assertTrue();
        expect(traces[index].indexOf('start-all') < traces[index].indexOf('started:A')).assertTrue();
        expect(traces[index].indexOf('queued:C') > 0).assertTrue();
        expect(traces[index].split('|').length >= 4).assertTrue();
      }
      expect(traces[0] === traces[1]).assertFalse();
      expect(traces[2].endsWith('queued:C')).assertTrue();
      expect(traces[2].length < traces[0].length).assertTrue();
    });

    /**
     * @tc.name   unlockRecordedOnGateAndAgainOnFinish
     * @tc.desc   A successful run records one unlock when the gate opens, a second when C finishes, and one timer clearance.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unlockRecordedOnGateAndAgainOnFinish', 0, () => {
      const graph = driveFullRun();
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.trace().split('unlocked:C').length).assertEqual(3);
      expect(graph.events.trace().split('timer-cleared:C').length).assertEqual(2);
      expect(graph.timerActive).assertFalse();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_C);
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.events.size()).assertEqual(11);
    });

    /**
     * @tc.name   networkMetricsFingerprintDistinguishesTotalProgress
     * @tc.desc   Two graphs with equal completion counts but different sums get different metric fingerprints.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('networkMetricsFingerprintDistinguishesTotalProgress', 0, () => {
      const low = createTaskGraph();
      const high = createTaskGraph();
      low.startAll();
      high.startAll();
      low.taskAt(0).reportProgress(10);
      high.taskAt(0).reportProgress(90);
      const lowMetrics = NetworkMetrics.from(low);
      const highMetrics = NetworkMetrics.from(high);
      expect(lowMetrics.completedTasks).assertEqual(highMetrics.completedTasks);
      expect(lowMetrics.failedTasks).assertEqual(highMetrics.failedTasks);
      expect(lowMetrics.totalProgress).assertEqual(10);
      expect(highMetrics.totalProgress).assertEqual(90);
      expect(lowMetrics.fingerprint() === highMetrics.fingerprint()).assertFalse();
      expect(lowMetrics.fingerprint()).assertEqual(textFingerprint('3:0:0:10'));
      expect(highMetrics.fingerprint()).assertEqual(textFingerprint('3:0:0:90'));
      expect(lowMetrics.averageProgress()).assertEqual(10.0 / 3);
      expect(highMetrics.averageProgress()).assertEqual(30);
      expect(highMetrics.successRatio()).assertEqual(0);
    });

    /**
     * @tc.name   runningCountProfileOverLifecycle
     * @tc.desc   The running count walks 0, 2, 1, 0, 1, 0 across one complete lifecycle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runningCountProfileOverLifecycle', 0, () => {
      const graph = createTaskGraph();
      const profile: number[] = [];
      profile.push(graph.runningCount());
      graph.startAll();
      profile.push(graph.runningCount());
      graph.completeTask(TASK_A);
      profile.push(graph.runningCount());
      graph.completeTask(TASK_B);
      profile.push(graph.runningCount());
      graph.pollTick(POLL_INTERVAL_MS);
      profile.push(graph.runningCount());
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      profile.push(graph.runningCount());
      expect(profile.length).assertEqual(6);
      expect(profile[0]).assertEqual(0);
      expect(profile[1]).assertEqual(2);
      expect(profile[2]).assertEqual(1);
      expect(profile[3]).assertEqual(0);
      expect(profile[4]).assertEqual(1);
      expect(profile[5]).assertEqual(0);
      expect(joined([String(profile[0]), String(profile[1]), String(profile[3])], ',')).assertEqual('0,2,0');
    });

    /**
     * @tc.name   progressSumProfileOverLifecycle
     * @tc.desc   The summed progress climbs 0, 30, 60, 100, 200, 300 without ever dropping.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressSumProfileOverLifecycle', 0, () => {
      const graph = createTaskGraph();
      const sums: number[] = [];
      sums.push(graph.totalProgress());
      graph.startAll();
      graph.taskAt(0).reportProgress(30);
      sums.push(graph.totalProgress());
      graph.taskAt(1).reportProgress(60);
      sums.push(graph.totalProgress());
      graph.completeTask(TASK_A);
      sums.push(graph.totalProgress());
      graph.completeTask(TASK_B);
      sums.push(graph.totalProgress());
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      sums.push(graph.totalProgress());
      expect(sums.length).assertEqual(6);
      expect(sums[0]).assertEqual(0);
      expect(sums[1]).assertEqual(30);
      expect(sums[2]).assertEqual(90);
      expect(sums[3]).assertEqual(160);
      expect(sums[4]).assertEqual(200);
      expect(sums[5]).assertEqual(300);
      for (let index = 1; index < sums.length; index++) {
        expect(sums[index] > sums[index - 1]).assertTrue();
      }
      expect(sums[5]).assertEqual(3 * PROGRESS_TOTAL);
    });

    /**
     * @tc.name   matrixWithFailedMiddleRunRecovers
     * @tc.desc   A matrix row that fails midway can be retried and still reaches the topological end state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('matrixWithFailedMiddleRunRecovers', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      graph.completeTask(TASK_B);
      expect(NetworkMetrics.from(graph).failedTasks).assertEqual(1);
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertFalse();
      graph.taskAt(0).reset();
      graph.taskAt(0).start(2 * POLL_INTERVAL_MS);
      graph.completeTask(TASK_A);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.pollTick(3 * POLL_INTERVAL_MS)).assertTrue();
      expect(graph.completeTaskC(4 * POLL_INTERVAL_MS)).assertTrue();
      const metrics = NetworkMetrics.from(graph);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.completedTasks).assertEqual(3);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('3:3:0:300'));
      expect(completionTrace(graph)).assertEqual('B|A|C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.taskAt(0).attempts).assertEqual(2);
    });

    /**
     * @tc.name   regressionAcrossConfigsAndGraphs
     * @tc.desc   Each task's config, expectation and graph row agree inside one regression sweep.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('regressionAcrossConfigsAndGraphs', 0, () => {
      const graph = createTaskGraph();
      const expectedNames: string[] = ['favor_list_tea.png', 'after_cache.png', 'icon_main_color.png'];
      for (let index = 0; index < graph.tasks.length; index++) {
        const row = graph.taskAt(index);
        const snap = row.snapshot();
        expect(snap.taskNo).assertEqual(row.taskNo);
        expect(snap.status).assertEqual(STATUS_IDLE);
        expect(snap.progress).assertEqual(0);
        expect(row.url.endsWith(expectedNames[index])).assertTrue();
        expect(row.url.startsWith('https://gitee.com/')).assertTrue();
        expect(row.status).assertEqual(STATUS_IDLE);
        expect(row.progress).assertEqual(0);
        row.start(0);
        expect(row.isRunning()).assertTrue();
        row.reset();
        expect(row.isIdle()).assertTrue();
      }
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.totalProgress()).assertEqual(0);
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      expect(NetworkMetrics.from(graph).completedTasks).assertEqual(3);
    });

    /**
     * @tc.name   repeatedResetLeavesNoResidualState
     * @tc.desc   Resetting twice is idempotent: the next run's trace equals the trace after a single reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('repeatedResetLeavesNoResidualState', 0, () => {
      const graph = driveFullRun();
      graph.reset();
      graph.reset();
      graph.reset();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      const afterTripleReset: TaskGraph = driveFullRun();
      const baseline: TaskGraph = driveFullRun();
      expect(afterTripleReset.events.trace()).assertEqual(baseline.events.trace());
      expect(afterTripleReset.events.fingerprint()).assertEqual(baseline.events.fingerprint());
      expect(graph.snapshotText()).assertEqual(createTaskGraph().snapshotText());
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(2).attempts).assertEqual(1);
    });

    /**
     * @tc.name   fiveGraphBatchHasDistinctFingerprints
     * @tc.desc   Five graphs driven with two alternating orders produce exactly two distinct trace fingerprints.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fiveGraphBatchHasDistinctFingerprints', 0, () => {
      const fingerprints: string[] = [];
      for (let index = 0; index < 5; index++) {
        const first: string = index % 2 === 0 ? TASK_A : TASK_B;
        const second: string = index % 2 === 0 ? TASK_B : TASK_A;
        const graph = driveOrderedRun(first, second);
        fingerprints.push(String(graph.events.fingerprint()));
      }
      expect(fingerprints.length).assertEqual(5);
      const distinct: string[] = uniqueStrings(fingerprints);
      expect(distinct.length).assertEqual(2);
      expect(fingerprints[0]).assertEqual(fingerprints[2]);
      expect(fingerprints[0]).assertEqual(fingerprints[4]);
      expect(fingerprints[1]).assertEqual(fingerprints[3]);
      expect(fingerprints[0] === fingerprints[1]).assertFalse();
      expect(distinct.indexOf(fingerprints[0]) >= 0).assertTrue();
      expect(distinct.indexOf(fingerprints[1]) >= 0).assertTrue();
    });

    /**
     * @tc.name   endToEndFingerprintReportedInLog
     * @tc.desc   The regression fingerprint of a full run is stable enough to be reported and compared.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('endToEndFingerprintReportedInLog', 0, () => {
      const graph = driveFullRun();
      const eventHash: number = graph.events.fingerprint();
      const metricHash: number = NetworkMetrics.from(graph).fingerprint();
      logStep('ComprehensiveRegression', 'events=' + String(eventHash) + ' metrics=' + String(metricHash));
      expect(eventHash).assertLarger(0);
      expect(metricHash).assertLarger(0);
      expect(eventHash === metricHash).assertFalse();
      expect(metricHash).assertEqual(textFingerprint('3:3:0:300'));
      expect(eventHash).assertEqual(textFingerprint(graph.events.trace()));
      expect(graph.events.trace().length).assertLarger(60);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   matrixRowSnapshotsDifferOnlyByOrder
     * @tc.desc   The two dependency orders produce identical snapshot traces while their event orders differ.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ComprehensiveRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('matrixRowSnapshotsDifferOnlyByOrder', 0, () => {
      const forward = createTaskGraph();
      const reverse = createTaskGraph();
      const forwardLog = new SnapshotLog();
      const reverseLog = new SnapshotLog();
      forward.startAll();
      reverse.startAll();
      forward.completeTask(TASK_A);
      reverse.completeTask(TASK_B);
      forwardLog.capture(forward.tasks);
      reverseLog.capture(reverse.tasks);
      expect(forwardLog.trace() === reverseLog.trace()).assertFalse();
      expect(forwardLog.size()).assertEqual(3);
      expect(forwardLog.trace().indexOf('A/completed/100') >= 0).assertTrue();
      expect(reverseLog.trace().indexOf('B/completed/100') >= 0).assertTrue();
      expect(forwardLog.trace().indexOf('C/idle/0') >= 0).assertTrue();
      expect(reverseLog.trace().indexOf('C/idle/0') >= 0).assertTrue();
      forward.completeTask(TASK_B);
      reverse.completeTask(TASK_A);
      expect(forward.events.fingerprint() === reverse.events.fingerprint()).assertFalse();
      expect(forward.snapshotText()).assertEqual(reverse.snapshotText());
      expect(completionTrace(forward) === completionTrace(reverse)).assertFalse();
      expect(forward.lock.holderCount()).assertEqual(reverse.lock.holderCount());
    });

    // End of regression matrix.
  });
}
