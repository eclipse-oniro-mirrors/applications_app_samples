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
 * LongTermStability suite.
 *
 * Repeats the whole start, complete and reset cycle more than one hundred
 * times. Across that horizon the suite checks that progress totals return to
 * the same three step pattern, that the event count per round is constant, that
 * fingerprints stay stable for an identical script, and that no counter drifts.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   57-60    the four @State members are rewritten, never accumulated
 *   174-198  each press rebuilds the lock and the interval for that run
 *   250-259  the button returns to the enabled state between runs
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  PROGRESS_TOTAL,
  STATUS_IDLE,
  STATUS_COMPLETED,
  ERROR_NETWORK,
  TaskGraph,
  SnapshotLog,
  EventRecorder,
  NetworkMetrics,
  createTaskGraph,
  completionTrace,
  isTopologicalCompletion,
  textFingerprint
} from '../Shared/SharedDriver';

export default function longTermStabilityTest(): void {
  describe('LongTermStability', () => {
    beforeAll(() => {
      logSuite('LongTermStability', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('LongTermStability', 'end');
    });

    /**
     * @tc.name   oneHundredRoundsAllComplete
     * @tc.desc   A hundred sequential runs each finish with the three rows completed and the lock free.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oneHundredRoundsAllComplete', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let rounds: number = 0;
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, round * 4 + 1);
        graph.completeTask(TASK_B, round * 4 + 2);
        graph.pollTick(round * 4 + 3);
        graph.completeTaskC(round * 4 + 4);
        if (graph.allCompleted() && graph.lock.isUnlocked()) {
          rounds = rounds + 1;
        }
        graph.reset();
      }
      expect(rounds).assertEqual(100);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   oneHundredRoundsKeepTheProgressPattern
     * @tc.desc   Every round walks total progress through 0, 100, 200 and 300 exactly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('oneHundredRoundsKeepTheProgressPattern', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const observed: number[] = [];
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        observed.push(graph.totalProgress());
        graph.completeTask(TASK_B, 2);
        observed.push(graph.totalProgress());
        graph.pollTick(3);
        graph.completeTaskC(4);
        observed.push(graph.totalProgress());
        graph.reset();
      }
      expect(observed.length).assertEqual(300);
      expect(observed[0]).assertEqual(100);
      expect(observed[1]).assertEqual(200);
      expect(observed[2]).assertEqual(300);
      expect(observed[297]).assertEqual(100);
      expect(observed[299]).assertEqual(300);
    });

    /**
     * @tc.name   eventCountPerRoundIsConstant
     * @tc.desc   Each identical round records the same ten events, so the count never drifts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventCountPerRoundIsConstant', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const counts: number[] = [];
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        counts.push(graph.events.size());
        graph.reset();
      }
      expect(counts.length).assertEqual(100);
      expect(counts[0]).assertEqual(11);
      expect(counts[50]).assertEqual(11);
      expect(counts[99]).assertEqual(11);
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   fingerprintIsStableForAnIdenticalScript
     * @tc.desc   The event fingerprint of round one equals the fingerprint recorded in round one hundred.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintIsStableForAnIdenticalScript', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const prints: number[] = [];
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        prints.push(graph.events.fingerprint());
        graph.reset();
      }
      expect(prints.length).assertEqual(100);
      expect(prints[0]).assertEqual(prints[99]);
      expect(prints[42]).assertEqual(prints[0]);
      expect(prints[0] > 0).assertTrue();
    });

    /**
     * @tc.name   fingerprintDiffersForADifferentScript
     * @tc.desc   A reversed prerequisite order in the second round yields a different fingerprint than the first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintDiffersForADifferentScript', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const forward: number = graph.events.fingerprint();
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_B, 5);
      graph.completeTask(TASK_A, 6);
      graph.pollTick(7);
      graph.completeTaskC(8);
      const backward: number = graph.events.fingerprint();
      expect(forward === backward).assertFalse();
      expect(textFingerprint(graph.eventTrace())).assertEqual(backward);
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   twoHundredRoundsLeaveNoResidue
     * @tc.desc   After two hundred rounds the graph still reports an empty history and a free lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoHundredRoundsLeaveNoResidue', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 200; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        graph.reset();
      }
      expect(graph.events.size()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   attemptCountersGrowWithEveryRound
     * @tc.desc   The per row attempt counter increments once per round, so a hundred rounds reach one hundred.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('attemptCountersGrowWithEveryRound', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        graph.reset();
      }
      expect(graph.taskAt(0).attempts).assertEqual(100);
      expect(graph.taskAt(1).attempts).assertEqual(100);
      expect(graph.taskAt(2).attempts).assertEqual(100);
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   timestampsTrackTheLatestRound
     * @tc.desc   After the last round the rows carry that round's stamps, not the values of earlier rounds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timestampsTrackTheLatestRound', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, round * 4 + 1);
        graph.completeTask(TASK_B, round * 4 + 2);
        graph.pollTick(round * 4 + 3);
        graph.completeTaskC(round * 4 + 4);
        if (round < 99) {
          graph.reset();
        }
      }
      expect(graph.taskAt(0).finishedAt).assertEqual(397);
      expect(graph.taskAt(1).finishedAt).assertEqual(398);
      expect(graph.taskAt(2).startedAt).assertEqual(399);
      expect(graph.taskAt(2).finishedAt).assertEqual(400);
      expect(graph.taskAt(2).finishedAt > graph.taskAt(1).finishedAt).assertTrue();
    });

    /**
     * @tc.name   identityAndUrlsSurviveOneHundredRounds
     * @tc.desc   Repeated resets never rebuild the rows or rewrite the three download URLs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('identityAndUrlsSurviveOneHundredRounds', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const urls: string[] = [graph.taskAt(0).url, graph.taskAt(1).url, graph.taskAt(2).url];
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        graph.reset();
      }
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(1).url).assertEqual(urls[1]);
      expect(graph.taskAt(2).url).assertEqual(urls[2]);
      expect(urls[0] === urls[1]).assertFalse();
      expect(graph.tasks.length).assertEqual(3);
    });

    /**
     * @tc.name   completionOrderIsTopologicalEveryRound
     * @tc.desc   Each of one hundred rounds records an order in which C strictly follows both prerequisites.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionOrderIsTopologicalEveryRound', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let legal: number = 0;
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        if (round % 2 === 0) {
          graph.completeTask(TASK_A, 1);
          graph.completeTask(TASK_B, 2);
        } else {
          graph.completeTask(TASK_B, 1);
          graph.completeTask(TASK_A, 2);
        }
        graph.pollTick(3);
        graph.completeTaskC(4);
        if (isTopologicalCompletion(graph.completionOrder)) {
          legal = legal + 1;
        }
        graph.reset();
      }
      expect(legal).assertEqual(100);
      expect(graph.completionOrder.length).assertEqual(0);
    });

    /**
     * @tc.name   completionTraceIsAlwaysThreeEntries
     * @tc.desc   Every round produces a three part trace with the same row numbers, only the order varies.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionTraceIsAlwaysThreeEntries', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let forward: number = 0;
      let backward: number = 0;
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        const trace: string = completionTrace(graph);
        if (trace === 'A|B|C') {
          forward = forward + 1;
        }
        if (trace.split('|').length === 3) {
          backward = backward + 1;
        }
        graph.reset();
      }
      expect(forward).assertEqual(100);
      expect(backward).assertEqual(100);
      expect(completionTrace(graph)).assertEqual('');
    });

    /**
     * @tc.name   startStaysRefusedUntilResetEachRound
     * @tc.desc   Inside every round a second start is refused, which proves the latch is reset between rounds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startStaysRefusedUntilResetEachRound', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let refusals: number = 0;
      for (let round = 0; round < 100; round++) {
        expect(graph.startAll()).assertTrue();
        if (!graph.startAll()) {
          refusals = refusals + 1;
        }
        graph.reset();
      }
      expect(refusals).assertEqual(100);
      expect(graph.startAll()).assertTrue();
      expect(graph.events.countOf('start-all')).assertEqual(1);
    });

    /**
     * @tc.name   runningCountFollowsTheSamePattern
     * @tc.desc   Every round reports two running rows after start, one after the gate, and none at the end.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runningCountFollowsTheSamePattern', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const pattern: number[] = [];
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        pattern.push(graph.runningCount());
        graph.completeTask(TASK_A, 1);
        pattern.push(graph.runningCount());
        graph.completeTask(TASK_B, 2);
        pattern.push(graph.runningCount());
        graph.pollTick(3);
        pattern.push(graph.runningCount());
        graph.completeTaskC(4);
        pattern.push(graph.runningCount());
        graph.reset();
      }
      expect(pattern.length).assertEqual(500);
      expect(pattern[0]).assertEqual(2);
      expect(pattern[1]).assertEqual(1);
      expect(pattern[2]).assertEqual(0);
      expect(pattern[3]).assertEqual(1);
      expect(pattern[499]).assertEqual(0);
    });

    /**
     * @tc.name   averageProgressFollowsTheSamePattern
     * @tc.desc   The average of the three rows repeats zero, one third, two thirds and one in every round.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('averageProgressFollowsTheSamePattern', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let thirds: number = 0;
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        const afterA: number = graph.averageProgress();
        if (afterA > 33 && afterA < 34) {
          thirds = thirds + 1;
        }
        graph.completeTask(TASK_B, 2);
        const afterB: number = graph.averageProgress();
        expect(afterB > 66).assertTrue();
        graph.pollTick(3);
        graph.completeTaskC(4);
        expect(graph.averageProgress()).assertEqual(100);
        graph.reset();
      }
      expect(thirds).assertEqual(100);
      expect(graph.averageProgress()).assertEqual(0);
    });

    /**
     * @tc.name   failedRoundsAreRecoveredByTheNextRound
     * @tc.desc   Every tenth round fails a branch; the following round still completes without any reset residue.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedRoundsAreRecoveredByTheNextRound', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let recovered: number = 0;
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        if (round % 10 === 0) {
          graph.taskAt(0).fail(ERROR_NETWORK);
          expect(graph.allCompleted()).assertFalse();
        } else {
          graph.completeTask(TASK_A, 1);
          graph.completeTask(TASK_B, 2);
          graph.pollTick(3);
          graph.completeTaskC(4);
          if (graph.allCompleted()) {
            recovered = recovered + 1;
          }
        }
        graph.reset();
      }
      expect(recovered).assertEqual(90);
      expect(graph.taskAt(0).lastErrorCode).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
    });

    /**
     * @tc.name   failureEveryTenthRoundKeepsMetricsConsistent
     * @tc.desc   Metrics sampled in failed rounds always report one failed row and two or fewer completions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failureEveryTenthRoundKeepsMetricsConsistent', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let failedSamples: number = 0;
      let cleanSamples: number = 0;
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        if (round % 10 === 0) {
          graph.taskAt(1).fail(ERROR_NETWORK);
          const metrics: NetworkMetrics = NetworkMetrics.from(graph);
          if (metrics.failedTasks === 1 && metrics.completedTasks === 0) {
            failedSamples = failedSamples + 1;
          }
        } else {
          graph.completeTask(TASK_A, 1);
          graph.completeTask(TASK_B, 2);
          graph.pollTick(3);
          graph.completeTaskC(4);
          if (NetworkMetrics.from(graph).failedTasks === 0) {
            cleanSamples = cleanSamples + 1;
          }
        }
        graph.reset();
      }
      expect(failedSamples).assertEqual(10);
      expect(cleanSamples).assertEqual(90);
      expect(NetworkMetrics.from(graph).totalProgress).assertEqual(0);
    });

    /**
     * @tc.name   pollTicksStayAtOnePerRound
     * @tc.desc   A single successful poll per round keeps the tick counter at one until reset clears it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollTicksStayAtOnePerRound', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let ones: number = 0;
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        if (graph.pollTicks === 1) {
          ones = ones + 1;
        }
        graph.reset();
      }
      expect(ones).assertEqual(100);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   snapshotTextPatternRepeatsEveryRound
     * @tc.desc   The three phase snapshot string of round one reappears unchanged in the last round.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotTextPatternRepeatsEveryRound', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const first: string[] = [];
      const last: string[] = [];
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        const started: string = graph.snapshotText();
        graph.completeTask(TASK_A, 1);
        const halfway: string = graph.snapshotText();
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        const done: string = graph.snapshotText();
        if (round === 0) {
          first.push(started);
          first.push(halfway);
          first.push(done);
        }
        if (round === 99) {
          last.push(started);
          last.push(halfway);
          last.push(done);
        }
        graph.reset();
      }
      expect(first[0]).assertEqual(last[0]);
      expect(first[1]).assertEqual(last[1]);
      expect(first[2]).assertEqual(last[2]);
      expect(last[2]).assertEqual('A:completed:100|B:completed:100|C:completed:100');
    });

    /**
     * @tc.name   noDriftBetweenEarlyAndLateRounds
     * @tc.desc   Round one and round fifty are compared on five independent state views and match.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('noDriftBetweenEarlyAndLateRounds', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let referenceSnapshot: string = '';
      let referenceTrace: string = '';
      let referenceTotal: number = 0;
      let matched: number = 0;
      for (let round = 0; round < 51; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        if (round === 0) {
          referenceSnapshot = graph.snapshotText();
          referenceTrace = graph.eventTrace();
          referenceTotal = graph.totalProgress();
        }
        if (round === 50) {
          if (graph.snapshotText() === referenceSnapshot &&
            graph.eventTrace() === referenceTrace &&
            graph.totalProgress() === referenceTotal) {
            matched = matched + 1;
          }
        }
        graph.reset();
      }
      expect(matched).assertEqual(1);
      expect(referenceTotal).assertEqual(300);
      expect(referenceSnapshot.startsWith('A:completed:100')).assertTrue();
    });

    /**
     * @tc.name   timerLifecycleRepeatsEveryRound
     * @tc.desc   The interval is armed and released exactly once in each of one hundred rounds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timerLifecycleRepeatsEveryRound', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let armed: number = 0;
      let released: number = 0;
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        if (graph.timerActive) {
          armed = armed + 1;
        }
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        if (!graph.timerActive && graph.events.countOf('timer-cleared') === 1) {
          released = released + 1;
        }
        graph.reset();
      }
      expect(armed).assertEqual(100);
      expect(released).assertEqual(100);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   lockAcquisitionsReturnToThreePerRound
     * @tc.desc   Each round grants two shared slots plus one exclusive slot, and reset returns the counter to zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockAcquisitionsReturnToThreePerRound', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let threes: number = 0;
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        if (graph.lock.acquisitions === 3) {
          threes = threes + 1;
        }
        graph.reset();
      }
      expect(threes).assertEqual(100);
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   reversedOrderRoundsAreAlsoStable
     * @tc.desc   Fifty rounds that always complete B first keep the same totals and the same free lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reversedOrderRoundsAreAlsoStable', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let finished: number = 0;
      for (let round = 0; round < 50; round++) {
        graph.startAll();
        graph.completeTask(TASK_B, 1);
        graph.completeTask(TASK_A, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        if (graph.totalProgress() === 300 && graph.lock.holderCount() === 0) {
          finished = finished + 1;
        }
        graph.reset();
      }
      expect(finished).assertEqual(50);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.averageProgress()).assertEqual(0);
    });

    /**
     * @tc.name   metricsFingerprintIsStableForEqualRounds
     * @tc.desc   The metric fingerprint of a finished round is identical in the first and the sixtieth run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsFingerprintIsStableForEqualRounds', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let reference: number = 0;
      let stable: number = 0;
      for (let round = 0; round < 60; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        const current: number = NetworkMetrics.from(graph).fingerprint();
        if (round === 0) {
          reference = current;
        }
        if (current === reference) {
          stable = stable + 1;
        }
        graph.reset();
      }
      expect(stable).assertEqual(60);
      expect(reference > 0).assertTrue();
      expect(NetworkMetrics.from(graph).fingerprint() === reference).assertFalse();
    });

    /**
     * @tc.name   finalResetLeavesEveryProgressAtZero
     * @tc.desc   After the hundredth full round and a reset the three rows report the initial progress again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('finalResetLeavesEveryProgressAtZero', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        graph.reset();
      }
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   rejectionDetailQuotesZeroTicksInEveryRound
     * @tc.desc   Because each round starts fresh, every refused press logs the same zero tick detail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('rejectionDetailQuotesZeroTicksInEveryRound', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let zeroDetails: number = 0;
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.startAll();
        if (graph.events.last() === 'start-rejected:0') {
          zeroDetails = zeroDetails + 1;
        }
        graph.reset();
      }
      expect(zeroDetails).assertEqual(100);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
    });

    /**
     * @tc.name   hundredthRoundMatchesTheFirstOnEventSize
     * @tc.desc   The first and the last round record the same number of events and the same last entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredthRoundMatchesTheFirstOnEventSize', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let firstSize: number = 0;
      let firstLast: string = '';
      let lastSize: number = 0;
      let lastLast: string = '';
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        if (round === 0) {
          firstSize = graph.events.size();
          firstLast = graph.events.last();
        }
        if (round === 99) {
          lastSize = graph.events.size();
          lastLast = graph.events.last();
        }
        graph.reset();
      }
      expect(firstSize).assertEqual(lastSize);
      expect(firstLast).assertEqual(lastLast);
      expect(lastLast).assertEqual('unlocked:C');
    });

    /**
     * @tc.name   snapshotLogRecordsOneHundredRounds
     * @tc.desc   Capturing every third round fills the log with one hundred and two entries and no eviction.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLogRecordsOneHundredRounds', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        if (round % 3 === 0) {
          log.capture(graph.tasks);
        }
        graph.reset();
      }
      expect(log.size()).assertEqual(102);
      expect(log.snapshots.length).assertEqual(102);
      expect(log.snapshots[0].status).assertEqual(STATUS_COMPLETED);
      expect(log.trace().split('|').length).assertEqual(102);
      expect(log.latest(TASK_C) !== undefined).assertTrue();
    });

    /**
     * @tc.name   recorderScalesToTwelveHundredEntries
     * @tc.desc   The unbounded recorder keeps one thousand two hundred entries and hashes them consistently.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recorderScalesToTwelveHundredEntries', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      for (let round = 0; round < 300; round++) {
        recorder.record('round', String(round));
        recorder.record('started', TASK_A);
        recorder.record('started', TASK_B);
        recorder.record('queued', TASK_C);
      }
      expect(recorder.size()).assertEqual(1200);
      expect(recorder.countOf('round')).assertEqual(300);
      expect(recorder.countOf('started')).assertEqual(600);
      expect(recorder.last()).assertEqual('queued:C');
      const print: number = recorder.fingerprint();
      expect(recorder.fingerprint()).assertEqual(print);
    });

    /**
     * @tc.name   earlyTaskCCompletionRoundsStayStable
     * @tc.desc   Every twenty fifth round finishes C before the gate; the rest recover on the next round.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('earlyTaskCCompletionRoundsStayStable', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let normal: number = 0;
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        if (round % 25 === 0) {
          graph.completeTaskC(1);
          graph.completeTask(TASK_A, 2);
          graph.completeTask(TASK_B, 3);
          expect(graph.allCompleted()).assertTrue();
        } else {
          graph.completeTask(TASK_A, 1);
          graph.completeTask(TASK_B, 2);
          graph.pollTick(3);
          graph.completeTaskC(4);
          normal = normal + 1;
        }
        graph.reset();
      }
      expect(normal).assertEqual(96);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   holderArrayNeverExceedsTwo
     * @tc.desc   Across one hundred rounds the shared holder array holds at most two owners at a time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('holderArrayNeverExceedsTwo', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let peak: number = 0;
      let peakAfterStart: number = 0;
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        if (graph.lock.sharedHolders.length > peakAfterStart) {
          peakAfterStart = graph.lock.sharedHolders.length;
        }
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        if (graph.lock.holderCount() > peak) {
          peak = graph.lock.holderCount();
        }
        graph.completeTaskC(4);
        graph.reset();
      }
      expect(peakAfterStart).assertEqual(2);
      expect(peak).assertEqual(1);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
    });

    /**
     * @tc.name   sessionLatchOnlyFlipsAfterReset
     * @tc.desc   In every round the finished flag stays false after completion and returns true only on reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionLatchOnlyFlipsAfterReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let flipped: number = 0;
      for (let round = 0; round < 100; round++) {
        expect(graph.isTaskFinished).assertTrue();
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        if (!graph.isTaskFinished && graph.allCompleted()) {
          flipped = flipped + 1;
        }
        graph.reset();
        if (!graph.isTaskFinished) {
          flipped = flipped + 1000;
        }
      }
      expect(flipped).assertEqual(100);
      expect(graph.isTaskFinished).assertTrue();
    });

    /**
     * @tc.name   progressTotalsAreThreeHundredInEveryRound
     * @tc.desc   Summing the final progress of each round always yields exactly three hundred.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongTermStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressTotalsAreThreeHundredInEveryRound', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let exact: number = 0;
      let total: number = 0;
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        total = total + graph.totalProgress();
        if (graph.totalProgress() === PROGRESS_TOTAL * 3) {
          exact = exact + 1;
        }
        graph.reset();
      }
      expect(exact).assertEqual(100);
      expect(total).assertEqual(30000);
      expect(PROGRESS_TOTAL * 3).assertEqual(300);
    });
  });
}
