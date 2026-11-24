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
 * SimultaneousCompletion suite.
 *
 * Both prerequisites finish inside one synchronous turn, which is the case the
 * page cannot serialize: A and B callbacks arrive back to back, the gate opens
 * once, the poll starts C once and no duplicate callback restarts anything.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   79-102   completeTaskA / completeTaskB both call checkAndUnlock
 *   98-102   checkAndUnlock requires A && B && lock, so the gate flips once
 *   174-198  the exclusive C branch polls every 200 ms and clears its interval
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
  PROGRESS_TOTAL,
  DownloadTask,
  TaskGraph,
  createTaskGraph,
  ReferenceGraph,
  NetworkMetrics,
  completionTrace,
  isTopologicalCompletion,
  expectedGateOpen,
  textFingerprint
} from '../Shared/SharedDriver';

export default function simultaneousCompletionTest(): void {
  describe('SimultaneousCompletion', () => {
    beforeAll(() => {
      logSuite('SimultaneousCompletion', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SimultaneousCompletion', 'end');
    });

    /**
     * @tc.name   bothCompleteInSameTurnOpensGateOnce
     * @tc.desc   Two completions in one turn flip the gate exactly once and announce it exactly once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('bothCompleteInSameTurnOpensGateOnce', 0, () => {
      logStep('SimultaneousCompletion', 'A and B in one turn');
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A, 10)).assertTrue();
      expect(graph.completeTask(TASK_B, 10)).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   simultaneousTurnRecordsBothOrderEntries
     * @tc.desc   The completion order keeps both task numbers in callback order and adds no C entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('simultaneousTurnRecordsBothOrderEntries', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 20);
      graph.completeTask(TASK_B, 20);
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.completionOrder[0]).assertEqual(TASK_A);
      expect(graph.completionOrder[1]).assertEqual(TASK_B);
      expect(completionTrace(graph)).assertEqual('A|B');
      expect(completionTrace(graph).indexOf(TASK_C)).assertEqual(-1);
      expect(graph.events.countOf('completed')).assertEqual(2);
    });

    /**
     * @tc.name   gateOracleAgreesForAllBooleanCombinations
     * @tc.desc   The independent two-boolean oracle reports the gate open only for the both-true combination.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateOracleAgreesForAllBooleanCombinations', 0, () => {
      expect(expectedGateOpen(false, false)).assertFalse();
      expect(expectedGateOpen(true, false)).assertFalse();
      expect(expectedGateOpen(false, true)).assertFalse();
      expect(expectedGateOpen(true, true)).assertTrue();
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.canRunTaskC()).assertEqual(expectedGateOpen(true, true));
      expect(graph.taskAt(0).isComplete() && graph.taskAt(1).isComplete()).assertTrue();
    });

    /**
     * @tc.name   singlePollStartsCExactlyOnce
     * @tc.desc   After a simultaneous pair one poll starts C, and an immediate second poll does nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('singlePollStartsCExactlyOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 5);
      graph.completeTask(TASK_B, 5);
      expect(graph.pollTick(6)).assertTrue();
      expect(graph.pollTick(6)).assertFalse();
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.taskAt(2).startedAt).assertEqual(6);
    });

    /**
     * @tc.name   cStartsOnceEvenWhenGateRechecked
     * @tc.desc   Calling the readiness helper again after C started returns false because the row is no longer idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cStartsOnceEvenWhenGateRechecked', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.runTaskCIfReady(3)).assertTrue();
      expect(graph.runTaskCIfReady(4)).assertFalse();
      expect(graph.runTaskCIfReady(5)).assertFalse();
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.events.countOf('started')).assertEqual(3);
    });

    /**
     * @tc.name   simultaneousCompletionThenPollTraceExact
     * @tc.desc   The whole event trace of a simultaneous pair followed by one poll is a fixed string.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('simultaneousCompletionThenPollTraceExact', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 1);
      graph.pollTick(2);
      expect(graph.eventTrace()).assertEqual('start-all:begin|started:A|started:B|queued:C|' +
        'completed:A|completed:B|unlocked:C|started:C|timer-cleared:C');
      expect(graph.events.size()).assertEqual(9);
      expect(graph.events.fingerprint()).assertEqual(textFingerprint(graph.eventTrace()));
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   referenceGraphStartsCOnlyOnce
     * @tc.desc   The independent reference model, polled repeatedly, also starts the exclusive work exactly once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('referenceGraphStartsCOnlyOnce', 0, () => {
      const reference: ReferenceGraph = new ReferenceGraph();
      reference.markComplete(TASK_A);
      reference.markComplete(TASK_B);
      expect(reference.unlocked()).assertTrue();
      expect(reference.poll()).assertTrue();
      expect(reference.poll()).assertFalse();
      expect(reference.poll()).assertFalse();
      expect(reference.rounds).assertEqual(3);
      expect(reference.trace()).assertEqual('true,true,true,false');
    });

    /**
     * @tc.name   simultaneousReferenceGraphMatchesGraphGate
     * @tc.desc   For every completion prefix the boolean oracle and the class graph agree on gate openness.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('simultaneousReferenceGraphMatchesGraphGate', 0, () => {
      const prefixes: string[][] = [[], [TASK_A], [TASK_B], [TASK_A, TASK_B]];
      for (let index = 0; index < prefixes.length; index++) {
        const graph: TaskGraph = createTaskGraph();
        const reference: ReferenceGraph = new ReferenceGraph();
        graph.startAll();
        for (let inner = 0; inner < prefixes[index].length; inner++) {
          graph.completeTask(prefixes[index][inner], inner + 1);
          reference.markComplete(prefixes[index][inner]);
        }
        expect(graph.canRunTaskC()).assertEqual(reference.unlocked());
        expect(graph.canRunTaskC()).assertEqual(expectedGateOpen(reference.aDone, reference.bDone));
      }
      expect(prefixes.length).assertEqual(4);
    });

    /**
     * @tc.name   simultaneousCompletionProgressSumsTwoHundred
     * @tc.desc   Two completed rows in one turn raise the aggregate progress to 200 before C starts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('simultaneousCompletionProgressSumsTwoHundred', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(70);
      graph.taskAt(1).reportProgress(40);
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 1);
      expect(graph.totalProgress()).assertEqual(200);
      expect(graph.averageProgress()).assertEqual(200.0 / 3);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(2).progress).assertEqual(0);
    });

    /**
     * @tc.name   simultaneousCompletionKeepsLockCounts
     * @tc.desc   Two shared grants and one exclusive grant are counted after the simultaneous pair and poll.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('simultaneousCompletionKeepsLockCounts', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 1);
      graph.pollTick(2);
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.lock.waitingExclusive).assertFalse();
    });

    /**
     * @tc.name   doubleCompletionOfSameTaskIgnored
     * @tc.desc   A duplicated A callback inside the simultaneous turn is refused and changes no order entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('doubleCompletionOfSameTaskIgnored', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A, 1)).assertTrue();
      expect(graph.completeTask(TASK_A, 1)).assertFalse();
      expect(graph.completeTask(TASK_B, 1)).assertTrue();
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.taskAt(0).finishedAt).assertEqual(1);
    });

    /**
     * @tc.name   cCompletionInSameTurnClosesGraph
     * @tc.desc   Starting and completing C in one turn frees the exclusive lock and completes all three rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cCompletionInSameTurnClosesGraph', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 1);
      graph.pollTick(2);
      expect(graph.completeTaskC(2)).assertTrue();
      expect(graph.allCompleted()).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.completionOrder.length).assertEqual(3);
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(graph.taskAt(2).finishedAt).assertEqual(2);
    });

    /**
     * @tc.name   timerClearedExactlyOnce
     * @tc.desc   The simultaneous run clears the poll timer once and never re-arms it on later ticks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timerClearedExactlyOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.timerActive).assertTrue();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.timerActive).assertTrue();
      graph.pollTick(3);
      expect(graph.timerActive).assertFalse();
      graph.pollTick(4);
      graph.pollTick(5);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.pollTicks).assertEqual(3);
    });

    /**
     * @tc.name   startedEventsTotalThreeAfterFullRun
     * @tc.desc   Two shared starts plus one exclusive start are the only started events of a full simultaneous run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startedEventsTotalThreeAfterFullRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 1);
      graph.pollTick(2);
      graph.completeTaskC(3);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.size()).assertEqual(11);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
    });

    /**
     * @tc.name   simultaneousRunSnapshotExact
     * @tc.desc   Snapshots before, between and after the same-turn pair render the exact expected row strings.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('simultaneousRunSnapshotExact', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.snapshotText()).assertEqual('A:running:0|B:running:0|C:idle:0');
      graph.completeTask(TASK_A, 1);
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:running:0|C:idle:0');
      graph.completeTask(TASK_B, 1);
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:completed:100|C:idle:0');
      graph.pollTick(2);
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:completed:100|C:running:0');
      expect(graph.snapshotText().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name   simultaneousRunFingerprintStableAcrossGraphs
     * @tc.desc   Two graphs fed the same simultaneous script produce identical traces and fingerprints.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('simultaneousRunFingerprintStableAcrossGraphs', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A, 1);
      second.completeTask(TASK_A, 1);
      first.completeTask(TASK_B, 1);
      second.completeTask(TASK_B, 1);
      first.pollTick(2);
      second.pollTick(2);
      expect(first.eventTrace()).assertEqual(second.eventTrace());
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.snapshotText()).assertEqual(second.snapshotText());
      expect(first.lock.acquisitions).assertEqual(second.lock.acquisitions);
      expect(textFingerprint(first.eventTrace()) > 0).assertTrue();
    });

    /**
     * @tc.name   simultaneousFailurePairDoesNotOpenGate
     * @tc.desc   Two failures in the same turn never satisfy the gate, even though both rows are terminal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('simultaneousFailurePairDoesNotOpenGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      const b: DownloadTask = graph.taskAt(1);
      a.fail(13400003);
      b.fail(13400003);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.events.countOf('completed')).assertEqual(0);
      expect(graph.lock.sharedHolders.length).assertEqual(2);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   secondPollAfterCFinishedDoesNotRestart
     * @tc.desc   Once C completed, further polls return false and cannot resurrect any row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondPollAfterCFinishedDoesNotRestart', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 1);
      graph.pollTick(2);
      graph.completeTaskC(3);
      expect(graph.pollTick(4)).assertFalse();
      expect(graph.pollTick(5)).assertFalse();
      expect(graph.taskAt(2).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.events.countOf('started')).assertEqual(3);
    });

    /**
     * @tc.name   simultaneousCompletionDoesNotReEnableButton
     * @tc.desc   The start button flag stays false after a simultaneous run until an explicit reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('simultaneousCompletionDoesNotReEnableButton', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 1);
      graph.pollTick(2);
      graph.completeTaskC(3);
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.startAll()).assertTrue();
    });

    /**
     * @tc.name   topologicalOrderLegalForSameTurnPair
     * @tc.desc   The completion order of the same-turn pair is a legal topological order of the page gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('topologicalOrderLegalForSameTurnPair', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 1);
      graph.completeTask(TASK_A, 1);
      graph.pollTick(2);
      graph.completeTaskC(3);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.completionOrder.indexOf(TASK_C)).assertEqual(2);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(completionTrace(graph)).assertEqual('B|A|C');
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
    });

    /**
     * @tc.name   simultaneousResetAndRerunStartsOnce
     * @tc.desc   A reset between two simultaneous runs keeps the one-start-per-run invariant for C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('simultaneousResetAndRerunStartsOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let run = 0; run < 2; run++) {
        graph.startAll();
        graph.completeTask(TASK_A, run + 1);
        graph.completeTask(TASK_B, run + 1);
        expect(graph.pollTick(run + 2)).assertTrue();
        expect(graph.taskAt(2).attempts).assertEqual(run + 1);
        graph.completeTaskC(run + 3);
        graph.reset();
      }
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.taskAt(2).attempts).assertEqual(2);
    });

    /**
     * @tc.name   cRunRequiresIdleRow
     * @tc.desc   A ready gate with an already running C cannot start it again through the readiness helper.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cRunRequiresIdleRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 1);
      const c: DownloadTask = graph.taskAt(2);
      expect(c.start(2)).assertTrue();
      expect(graph.runTaskCIfReady(3)).assertFalse();
      expect(c.attempts).assertEqual(1);
      expect(c.startedAt).assertEqual(2);
      c.reset();
      expect(graph.runTaskCIfReady(4)).assertTrue();
      expect(c.attempts).assertEqual(2);
    });

    /**
     * @tc.name   metricsAtSimultaneousCompletion
     * @tc.desc   Metrics right after the same-turn pair report two completions, no failure and progress 200.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsAtSimultaneousCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 1);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(2);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(200);
      expect(metrics.successRatio()).assertEqual(2.0 / 3);
      expect(metrics.averageProgress()).assertEqual(200.0 / 3);
    });

    /**
     * @tc.name   simultaneousTurnPreservesTaskIdentity
     * @tc.desc   The same-turn pair leaves task numbers, URLs and row order exactly as configured.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('simultaneousTurnPreservesTaskIdentity', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const thirdUrl: string = graph.taskAt(2).url;
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 1);
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(0).url.endsWith('.png')).assertTrue();
      expect(graph.taskAt(2).url).assertEqual(thirdUrl);
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   gateOpenExactlyAtSecondCallback
     * @tc.desc   The gate flips on the second of the two callbacks, never on the first, in a same-turn pair.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateOpenExactlyAtSecondCallback', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      graph.completeTask(TASK_B, 1);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.lock.waitingExclusive).assertTrue();
    });

    /**
     * @tc.name   timerStaysArmedUntilPollEvenWhenGateOpen
     * @tc.desc   An open gate does not by itself clear the interval; only the poll that starts C does.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timerStaysArmedUntilPollEvenWhenGateOpen', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 1);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      graph.pollTick(2);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.taskAt(2).isRunning()).assertTrue();
    });

    /**
     * @tc.name   exclusiveQueueAcquisitionOnlyOnPoll
     * @tc.desc   The exclusive grant is applied by the poll, so the lock keeps two shared holders until then.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SimultaneousCompletion scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exclusiveQueueAcquisitionOnlyOnPoll', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 1);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      graph.pollTick(2);
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
    });
  });
}
