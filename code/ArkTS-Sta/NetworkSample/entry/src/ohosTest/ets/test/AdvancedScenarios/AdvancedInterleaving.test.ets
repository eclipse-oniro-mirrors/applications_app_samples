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
 * AdvancedInterleaving suite.
 *
 * Exercises completion interleavings of the A/B/C dependency graph: A before B,
 * B before A, progress callbacks mixed with completions, several independent
 * graphs advanced in lockstep and resets that land while the gate is already
 * open or while the exclusive row runs.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   62-64    lock, taskACompleted, taskBCompleted
 *   79-95    completeTaskA / completeTaskB / completeTaskC
 *   98-107   checkAndUnlock and canRunTaskC
 *   174-198  startAllTasks: shared A/B, exclusive C, 200 ms poll
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
  PROGRESS_INITIAL,
  PROGRESS_TOTAL,
  DownloadTask,
  TaskGraph,
  createTaskGraph,
  completionTrace,
  isTopologicalCompletion,
  textFingerprint,
  NetworkMetrics
} from '../Shared/SharedDriver';

export default function advancedInterleavingTest(): void {
  describe('AdvancedInterleaving', () => {
    beforeAll(() => {
      logSuite('AdvancedInterleaving', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('AdvancedInterleaving', 'end');
    });

    /**
     * @tc.name   aThenBInterleavingReachesOpenGate
     * @tc.desc   Finishing A and then B in separate turns leaves C queued with the gate open and no holder.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('aThenBInterleavingReachesOpenGate', 0, () => {
      logStep('AdvancedInterleaving', 'A then B');
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 100);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_B, 200);
      expect(graph.canRunTaskC()).assertTrue();
      expect(completionTrace(graph)).assertEqual('A|B');
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
    });

    /**
     * @tc.name   bThenAInterleavingReachesSameGateState
     * @tc.desc   The reversed prerequisite order produces the same gate state but a different trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('bThenAInterleavingReachesSameGateState', 0, () => {
      logStep('AdvancedInterleaving', 'B then A');
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 150);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_A, 250);
      expect(graph.canRunTaskC()).assertTrue();
      expect(completionTrace(graph)).assertEqual('B|A');
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:completed:100|C:idle:0');
      graph.pollTick(300);
      graph.completeTaskC(400);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
    });

    /**
     * @tc.name   interleavedProgressCallbacksKeepRowsMonotone
     * @tc.desc   Alternating progress callbacks for A and B advance each row independently and never move back.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('interleavedProgressCallbacksKeepRowsMonotone', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      const b: DownloadTask = graph.taskAt(1);
      expect(a.reportProgress(20)).assertEqual(20);
      expect(b.reportProgress(35)).assertEqual(35);
      expect(a.reportProgress(15)).assertEqual(20);
      expect(b.reportProgress(80)).assertEqual(80);
      expect(a.progress).assertEqual(20);
      expect(b.progress).assertEqual(80);
      expect(graph.totalProgress()).assertEqual(100);
    });

    /**
     * @tc.name   completionInterleavedWithProgressKeepsFullRows
     * @tc.desc   Partial progress followed by completion still writes exactly 100 on both prerequisite rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionInterleavedWithProgressKeepsFullRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      const b: DownloadTask = graph.taskAt(1);
      a.reportProgress(45);
      b.reportProgress(60);
      graph.completeTask(TASK_A, 10);
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(b.progress).assertEqual(60);
      graph.completeTask(TASK_B, 20);
      expect(b.progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.totalProgress()).assertEqual(200);
      expect(a.finishedAt).assertEqual(10);
      expect(b.finishedAt).assertEqual(20);
    });

    /**
     * @tc.name   gateStaysClosedAfterSingleCompletionEvent
     * @tc.desc   One finished prerequisite never satisfies the two boolean predicate of the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateStaysClosedAfterSingleCompletionEvent', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).isRunning()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.pollTick(2)).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
    });

    /**
     * @tc.name   twoGraphsInterleaveWithoutCrossTalk
     * @tc.desc   Steps applied alternately to two graphs never leak status, events or lock holders across them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoGraphsInterleaveWithoutCrossTalk', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A, 5);
      second.completeTask(TASK_B, 6);
      first.completeTask(TASK_B, 7);
      second.completeTask(TASK_A, 8);
      expect(first.canRunTaskC()).assertTrue();
      expect(second.canRunTaskC()).assertTrue();
      expect(completionTrace(first)).assertEqual('A|B');
      expect(completionTrace(second)).assertEqual('B|A');
      expect(first.events.size()).assertEqual(second.events.size());
      expect(first.events.fingerprint() === second.events.fingerprint()).assertFalse();
    });

    /**
     * @tc.name   secondGraphStaysIdleWhileFirstPolls
     * @tc.desc   Advancing one graph to the exclusive phase leaves the other graph untouched at its last step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondGraphStaysIdleWhileFirstPolls', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      first.completeTask(TASK_A, 1);
      first.completeTask(TASK_B, 2);
      first.pollTick(3);
      expect(first.taskAt(2).isRunning()).assertTrue();
      expect(second.taskAt(0).isIdle()).assertTrue();
      expect(second.taskAt(2).isIdle()).assertTrue();
      expect(second.pollTicks).assertEqual(0);
      expect(second.events.size()).assertEqual(0);
      expect(second.lock.acquisitions).assertEqual(0);
    });

    /**
     * @tc.name   threeGraphsFinishInStaggeredTurns
     * @tc.desc   Three graphs started in different turns each produce a legal topological order and three metrics.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('threeGraphsFinishInStaggeredTurns', 0, () => {
      const graphs: TaskGraph[] = [];
      for (let index = 0; index < 3; index++) {
        const graph: TaskGraph = createTaskGraph();
        graphs.push(graph);
        graph.startAll();
      }
      for (let index = 0; index < graphs.length; index++) {
        const graph: TaskGraph = graphs[index];
        graph.completeTask(TASK_A, 10 + index);
        graph.completeTask(TASK_B, 20 + index);
        graph.pollTick(30 + index);
        graph.completeTaskC(40 + index);
      }
      for (let index = 0; index < graphs.length; index++) {
        expect(graphs[index].allCompleted()).assertTrue();
        expect(isTopologicalCompletion(graphs[index].completionOrder)).assertTrue();
        expect(NetworkMetrics.from(graphs[index]).completedTasks).assertEqual(3);
      }
      expect(graphs[0].eventTrace()).assertEqual(graphs[1].eventTrace());
      expect(graphs[1].eventTrace()).assertEqual(graphs[2].eventTrace());
    });

    /**
     * @tc.name   partialProgressOnEveryRowSumsDeterministically
     * @tc.desc   Partial progress across all three rows aggregates by plain addition before and after C starts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('partialProgressOnEveryRowSumsDeterministically', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(20);
      graph.taskAt(1).reportProgress(30);
      graph.taskAt(2).reportProgress(40);
      expect(graph.totalProgress()).assertEqual(90);
      expect(graph.averageProgress()).assertEqual(30);
      graph.taskAt(2).reportProgress(45);
      expect(graph.totalProgress()).assertEqual(95);
      expect(NetworkMetrics.from(graph).averageProgress()).assertEqual(95.0 / 3);
      expect(NetworkMetrics.from(graph).completedTasks).assertEqual(0);
    });

    /**
     * @tc.name   resetMidFlightWhileGateOpenRestoresIdleGate
     * @tc.desc   A reset arriving after both prerequisites finish but before the poll closes the gate again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetMidFlightWhileGateOpenRestoresIdleGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.canRunTaskC()).assertTrue();
      graph.reset();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(1).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   resetMidFlightStopsTimerAndClearsQueue
     * @tc.desc   Reset during the gate-open window clears the armed timer and the queued exclusive request.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetMidFlightStopsTimerAndClearsQueue', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.timerActive).assertTrue();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.reset();
      expect(graph.timerActive).assertFalse();
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.isTaskFinished).assertTrue();
      const polled: boolean = graph.pollTick(3);
      expect(polled).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.taskAt(2).isIdle()).assertTrue();
    });

    /**
     * @tc.name   restartAfterMidFlightResetRepeatsTrace
     * @tc.desc   The scripted run performed after a mid-flight reset produces a byte-identical event trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('restartAfterMidFlightResetRepeatsTrace', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const abandoned: number = graph.events.size();
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 11);
      graph.completeTask(TASK_B, 12);
      graph.pollTick(13);
      graph.completeTaskC(14);
      expect(abandoned > 0).assertTrue();
      expect(graph.events.trace()).assertEqual('start-all:begin|started:A|started:B|queued:C|' +
        'completed:A|completed:B|unlocked:C|started:C|timer-cleared:C|completed:C|unlocked:C');
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.completionOrder.length).assertEqual(3);
    });

    /**
     * @tc.name   duplicateCompletionAttemptDoesNotDuplicateOrder
     * @tc.desc   A repeated onCompleted callback is refused by the row and adds nothing to the completion order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateCompletionAttemptDoesNotDuplicateOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const first: boolean = graph.completeTask(TASK_A, 10);
      const second: boolean = graph.completeTask(TASK_A, 20);
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.taskAt(0).finishedAt).assertEqual(10);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   progressAfterCompletionIsFrozenInInterleavedRun
     * @tc.desc   Once A completed, a later stale progress callback cannot lower the row during B activity.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressAfterCompletionIsFrozenInInterleavedRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 5);
      graph.taskAt(1).reportProgress(70);
      const frozen: number = graph.taskAt(0).reportProgress(10);
      expect(frozen).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(1).progress).assertEqual(70);
      expect(graph.totalProgress()).assertEqual(170);
      expect(graph.taskAt(0).isRunning()).assertFalse();
    });

    /**
     * @tc.name   pollBeforeGateOpenConsumesTickWithoutStarting
     * @tc.desc   A poll with a closed gate returns false yet still advances the tick counter and keeps the timer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollBeforeGateOpenConsumesTickWithoutStarting', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.pollTick(10)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.timerActive).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.events.countOf('started')).assertEqual(2);
    });

    /**
     * @tc.name   repeatedPollsThenCompletionStartsOnce
     * @tc.desc   Several fruitless polls before the gate opens do not cause C to start more than once afterwards.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedPollsThenCompletionStartsOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.pollTick(1);
      graph.pollTick(2);
      graph.pollTick(3);
      expect(graph.pollTicks).assertEqual(3);
      graph.completeTask(TASK_A, 4);
      graph.completeTask(TASK_B, 5);
      expect(graph.pollTick(6)).assertTrue();
      expect(graph.pollTick(7)).assertFalse();
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.taskAt(2).startedAt).assertEqual(6);
    });

    /**
     * @tc.name   gateOpeningBetweenPollsStartsCOnNextPoll
     * @tc.desc   When the second prerequisite lands between two polls, only the poll after it starts the exclusive row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateOpeningBetweenPollsStartsCOnNextPoll', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      expect(graph.pollTick(2)).assertFalse();
      graph.completeTask(TASK_B, 3);
      expect(graph.taskAt(2).startedAt).assertEqual(0);
      expect(graph.pollTick(4)).assertTrue();
      expect(graph.taskAt(2).startedAt).assertEqual(4);
      expect(graph.taskAt(2).isRunning()).assertTrue();
    });

    /**
     * @tc.name   resetWhileExclusiveRowRunsFreesLock
     * @tc.desc   Resetting after C took exclusive ownership clears the owner, the timer and the running row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetWhileExclusiveRowRunsFreesLock', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      graph.reset();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   snapshotTextTracksEveryInterleavingStep
     * @tc.desc   Four successive reads after different interleaving steps show distinct, exact row descriptions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotTextTracksEveryInterleavingStep', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      graph.startAll();
      expect(graph.snapshotText()).assertEqual('A:running:0|B:running:0|C:idle:0');
      graph.completeTask(TASK_B, 1);
      expect(graph.snapshotText()).assertEqual('A:running:0|B:completed:100|C:idle:0');
      graph.completeTask(TASK_A, 2);
      graph.pollTick(3);
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:completed:100|C:running:0');
      expect(graph.snapshotText().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name   reversedInterleavingTraceDiffersFromForward
     * @tc.desc   Both orders are legal yet their traces and fingerprints differ, so order is observable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('reversedInterleavingTraceDiffersFromForward', 0, () => {
      const forward: TaskGraph = createTaskGraph();
      const reverse: TaskGraph = createTaskGraph();
      forward.startAll();
      reverse.startAll();
      forward.completeTask(TASK_A, 1);
      forward.completeTask(TASK_B, 2);
      reverse.completeTask(TASK_B, 1);
      reverse.completeTask(TASK_A, 2);
      expect(forward.eventTrace() === reverse.eventTrace()).assertFalse();
      expect(forward.events.fingerprint() === reverse.events.fingerprint()).assertFalse();
      expect(forward.events.countOf('completed')).assertEqual(2);
      expect(reverse.events.countOf('completed')).assertEqual(2);
      expect(completionTrace(forward)).assertEqual('A|B');
      expect(completionTrace(reverse)).assertEqual('B|A');
    });

    /**
     * @tc.name   totalProgressAcrossInterleavedPartialCompletions
     * @tc.desc   A completed row contributes 100 while the other prerequisite keeps only its partial value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('totalProgressAcrossInterleavedPartialCompletions', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).reportProgress(40);
      expect(graph.totalProgress()).assertEqual(40);
      graph.completeTask(TASK_A, 1);
      expect(graph.totalProgress()).assertEqual(140);
      expect(graph.averageProgress()).assertEqual(140.0 / 3);
      graph.completeTask(TASK_B, 2);
      expect(graph.totalProgress()).assertEqual(200);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_INITIAL);
    });

    /**
     * @tc.name   interleavedRunKeepsLockCountersConsistent
     * @tc.desc   Two shared acquisitions, one failed exclusive attempt and one granted exclusive are counted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('interleavedRunKeepsLockCountersConsistent', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.lock.acquireExclusive(TASK_C)).assertFalse();
      expect(graph.lock.rejections).assertEqual(1);
      graph.completeTask(TASK_A, 1);
      expect(graph.lock.acquireExclusive(TASK_C)).assertFalse();
      graph.completeTask(TASK_B, 2);
      expect(graph.lock.acquireExclusive(TASK_C)).assertTrue();
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.lock.rejections).assertEqual(2);
      expect(graph.lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   completionOfUnknownTaskLeavesGraphUntouched
     * @tc.desc   A completion callback carrying an unknown task number is dropped without side effects.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completionOfUnknownTaskLeavesGraphUntouched', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const before: string = graph.snapshotText();
      const beforeEvents: number = graph.events.size();
      const accepted: boolean = graph.completeTask('D', 5);
      expect(accepted).assertFalse();
      expect(graph.snapshotText()).assertEqual(before);
      expect(graph.events.size()).assertEqual(beforeEvents);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.runningCount()).assertEqual(2);
    });

    /**
     * @tc.name   fullInterleavingEndsWithThreeFullRows
     * @tc.desc   A complete interleaved run closes with three completed rows, a free lock and the timer off.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fullInterleavingEndsWithThreeFullRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(25);
      graph.completeTask(TASK_B, 30);
      graph.taskAt(0).reportProgress(85);
      graph.completeTask(TASK_A, 40);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      graph.pollTick(50);
      graph.taskAt(2).reportProgress(60);
      graph.completeTaskC(60);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(textFingerprint(graph.eventTrace()) > 0).assertTrue();
    });

    /**
     * @tc.name   interleavingPreservesRowIdentityAndUrls
     * @tc.desc   Mixing progress and completion callbacks never reorders the three rows or rewrites their URLs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('interleavingPreservesRowIdentityAndUrls', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const urlA: string = graph.taskAt(0).url;
      const urlC: string = graph.taskAt(2).url;
      graph.startAll();
      graph.taskAt(1).reportProgress(55);
      graph.completeTask(TASK_A, 5);
      graph.taskAt(2).reportProgress(15);
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(0).url).assertEqual(urlA);
      expect(graph.taskAt(2).url).assertEqual(urlC);
      expect(graph.tasks.length).assertEqual(3);
    });

    /**
     * @tc.name   metricsSnapshotInsideInterleavedWindow
     * @tc.desc   Metrics taken mid-run report one completion, no failure and only the accumulated partial progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsSnapshotInsideInterleavedWindow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).reportProgress(30);
      graph.completeTask(TASK_A, 9);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(1);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(130);
      expect(metrics.successRatio()).assertEqual(1.0 / 3);
      expect(metrics.fingerprint()).assertEqual(
        textFingerprint('3:1:0:130'));
    });
  });
}
