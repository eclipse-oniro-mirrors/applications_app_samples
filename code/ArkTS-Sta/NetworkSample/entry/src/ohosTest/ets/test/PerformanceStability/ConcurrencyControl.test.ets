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
 * ConcurrencyControl suite.
 *
 * Network callbacks do not arrive in a fixed order, so the suite replays many
 * interleavings of the A and B completions, of progress reports, of polls and
 * of start presses. Whatever the order, only A and B together may unlock C, C
 * starts at most once, and the lock never hands out a second exclusive owner.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   62-64    lock and the two completion booleans are written from callbacks
 *   98-102   checkAndUnlock is the only transition that opens the gate
 *   174-198  A/B take shared slots, C waits for the exclusive one
 *   188-196  the interval may fire several times while the gate is still shut
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  STATUS_IDLE,
  STATUS_RUNNING,
  ERROR_NETWORK,
  DownloadTask,
  DependencyLock,
  TaskGraph,
  ReferenceGraph,
  createTaskGraph,
  completionTrace,
  isTopologicalCompletion,
  textFingerprint
} from '../Shared/SharedDriver';

export default function concurrencyControlTest(): void {
  describe('ConcurrencyControl', () => {
    beforeAll(() => {
      logSuite('ConcurrencyControl', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ConcurrencyControl', 'end');
    });

    /**
     * @tc.name   aThenBUnlocksTheGate
     * @tc.desc   The A first interleaving opens the gate only after B also arrives.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('aThenBUnlocksTheGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_B, 2);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   bThenAUnlocksTheGate
     * @tc.desc   The mirrored interleaving must open the gate identically, with no order dependence.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('bThenAUnlocksTheGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 1);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_A, 2);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(completionTrace(graph)).assertEqual('B|A');
    });

    /**
     * @tc.name   interleavedProgressDoesNotUnlockAnything
     * @tc.desc   Progress callbacks alternating between rows never satisfy the completion gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('interleavedProgressDoesNotUnlockAnything', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      for (let round = 1; round <= 5; round++) {
        graph.taskAt(0).reportProgress(round * 10);
        graph.taskAt(1).reportProgress(round * 10);
      }
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(0);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.pollTick(200)).assertFalse();
    });

    /**
     * @tc.name   onlyBothCompletionsUnlockAcrossTheMatrix
     * @tc.desc   Four boolean combinations are replayed and only the pair with A and B done opens the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('onlyBothCompletionsUnlockAcrossTheMatrix', 0, () => {
      const neither: ReferenceGraph = new ReferenceGraph();
      const onlyA: ReferenceGraph = new ReferenceGraph();
      const onlyB: ReferenceGraph = new ReferenceGraph();
      const both: ReferenceGraph = new ReferenceGraph();
      onlyA.markComplete(TASK_A);
      onlyB.markComplete(TASK_B);
      both.markComplete(TASK_A);
      both.markComplete(TASK_B);
      expect(neither.unlocked()).assertFalse();
      expect(onlyA.unlocked()).assertFalse();
      expect(onlyB.unlocked()).assertFalse();
      expect(both.unlocked()).assertTrue();
      expect(both.poll()).assertTrue();
    });

    /**
     * @tc.name   twoPrerequisiteOrdersConvergeOnTheSameState
     * @tc.desc   Running A then B and B then A ends with the same status, progress and lock state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoPrerequisiteOrdersConvergeOnTheSameState', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      first.completeTask(TASK_A, 1);
      first.completeTask(TASK_B, 2);
      second.startAll();
      second.completeTask(TASK_B, 1);
      second.completeTask(TASK_A, 2);
      expect(first.snapshotText()).assertEqual(second.snapshotText());
      expect(first.lock.holderCount()).assertEqual(second.lock.holderCount());
      expect(first.canRunTaskC()).assertEqual(second.canRunTaskC());
      expect(first.pollTick(3)).assertEqual(second.pollTick(3));
    });

    /**
     * @tc.name   interruptionBetweenCompletionsKeepsTheGateShut
     * @tc.desc   A poll or a progress report between the two completions changes nothing about the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('interruptionBetweenCompletionsKeepsTheGateShut', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.pollTick(200);
      graph.taskAt(1).reportProgress(70);
      graph.pollTick(400);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   unlockCountIsOneInBothOrders
     * @tc.desc   Both interleavings record exactly one unlock announcement for the single gate transition.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unlockCountIsOneInBothOrders', 0, () => {
      const orders: string[][] = [[TASK_A, TASK_B], [TASK_B, TASK_A]];
      for (let round = 0; round < orders.length; round++) {
        const graph: TaskGraph = createTaskGraph();
        graph.startAll();
        graph.completeTask(orders[round][0], 1);
        expect(graph.events.countOf('unlocked')).assertEqual(0);
        graph.completeTask(orders[round][1], 2);
        expect(graph.events.countOf('unlocked')).assertEqual(1);
        expect(graph.lock.holderCount()).assertEqual(0);
      }
    });

    /**
     * @tc.name   singleCompletionRepeatedNeverOpensTheGate
     * @tc.desc   Completing only A many times can never substitute for the missing B completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('singleCompletionRepeatedNeverOpensTheGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A, 1)).assertTrue();
      for (let round = 0; round < 5; round++) {
        expect(graph.completeTask(TASK_A, round + 2)).assertFalse();
      }
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.completionOrder.length).assertEqual(1);
    });

    /**
     * @tc.name   duplicateCompletionInEitherOrderIsRejected
     * @tc.desc   A duplicate callback is refused before it can release a holder twice, in both orders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateCompletionInEitherOrderIsRejected', 0, () => {
      const first: TaskGraph = createTaskGraph();
      first.startAll();
      first.completeTask(TASK_A, 1);
      first.completeTask(TASK_A, 2);
      expect(first.lock.holderCount()).assertEqual(1);
      const second: TaskGraph = createTaskGraph();
      second.startAll();
      second.completeTask(TASK_B, 1);
      second.completeTask(TASK_B, 2);
      expect(second.lock.holderCount()).assertEqual(1);
      expect(second.events.countOf('completed')).assertEqual(1);
    });

    /**
     * @tc.name   fiveRandomisedRoundsAllFinishLegally
     * @tc.desc   Five runs with alternating prerequisite order all end completed with a topological order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fiveRandomisedRoundsAllFinishLegally', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const traces: string[] = [];
      for (let round = 0; round < 5; round++) {
        graph.startAll();
        if (round % 2 === 0) {
          graph.completeTask(TASK_A, round * 10 + 1);
          graph.completeTask(TASK_B, round * 10 + 2);
        } else {
          graph.completeTask(TASK_B, round * 10 + 1);
          graph.completeTask(TASK_A, round * 10 + 2);
        }
        graph.pollTick(round * 10 + 3);
        graph.completeTaskC(round * 10 + 4);
        traces.push(completionTrace(graph));
        graph.reset();
      }
      expect(traces.length).assertEqual(5);
      expect(traces[0]).assertEqual('A|B|C');
      expect(traces[1]).assertEqual('B|A|C');
      expect(traces[2]).assertEqual('A|B|C');
      expect(traces[3]).assertEqual('B|A|C');
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   sharedAcquireIsRejectedWhileExclusiveHeld
     * @tc.desc   A late A or B request cannot enter once C owns the exclusive slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sharedAcquireIsRejectedWhileExclusiveHeld', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertFalse();
      expect(lock.acquireShared(TASK_B)).assertFalse();
      expect(lock.rejections).assertEqual(2);
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   exclusiveAcquireIsRejectedWhileAnySharedHeld
     * @tc.desc   One remaining shared holder is enough to refuse the exclusive request.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exclusiveAcquireIsRejectedWhileAnySharedHeld', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_B);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.rejections).assertEqual(1);
      lock.releaseShared(TASK_B);
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.rejections).assertEqual(1);
    });

    /**
     * @tc.name   sharedRequestFailsAfterTheRunTakesExclusiveC
     * @tc.desc   Inside a live graph the exclusive C blocks a newly arriving shared request and counts it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sharedRequestFailsAfterTheRunTakesExclusiveC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      const late: boolean = graph.lock.acquireShared(TASK_A);
      expect(late).assertFalse();
      expect(graph.lock.rejections).assertEqual(1);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   lockRejectionsGrowWithEachRefusedAttempt
     * @tc.desc   Five refused shared requests and one refused exclusive request produce six rejections.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockRejectionsGrowWithEachRefusedAttempt', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      for (let round = 0; round < 5; round++) {
        expect(lock.acquireShared(TASK_A)).assertFalse();
      }
      expect(lock.acquireExclusive(TASK_B)).assertFalse();
      expect(lock.rejections).assertEqual(6);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
    });

    /**
     * @tc.name   repeatedPollAfterGateOpenStartsTaskCOnce
     * @tc.desc   Ten immediate polls after the gate opens produce one start and one timer release.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('repeatedPollAfterGateOpenStartsTaskCOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      let starts: number = 0;
      for (let round = 0; round < 10; round++) {
        if (graph.pollTick(200 + round * 200)) {
          starts = starts + 1;
        }
      }
      expect(starts).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.pollTicks).assertEqual(10);
    });

    /**
     * @tc.name   twentyPollsBeforeTheGateStayHarmless
     * @tc.desc   Repeated polling of a half finished run keeps C idle and the interval armed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twentyPollsBeforeTheGateStayHarmless', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 1);
      for (let round = 0; round < 20; round++) {
        expect(graph.pollTick(round * 200)).assertFalse();
      }
      expect(graph.pollTicks).assertEqual(20);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.timerActive).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   pollsInterleavedWithCompletionsStillUnlockOnce
     * @tc.desc   Polling between the two completions does not change the single unlock transition.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollsInterleavedWithCompletionsStillUnlockOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.pollTick(200);
      graph.completeTask(TASK_A, 210);
      graph.pollTick(400);
      graph.completeTask(TASK_B, 420);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.pollTick(600)).assertTrue();
    });

    /**
     * @tc.name   doubleStartNeverDuplicatesRows
     * @tc.desc   Two start presses leave three rows, two running and one queued request.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('doubleStartNeverDuplicatesRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.startAll();
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.lock.sharedHolders.length).assertEqual(2);
    });

    /**
     * @tc.name   startPressedDuringThePollWindowIsRejected
     * @tc.desc   A press that lands while the interval waits for the gate is refused and the run continues.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startPressedDuringThePollWindowIsRejected', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.pollTick(200);
      expect(graph.startAll()).assertFalse();
      expect(graph.events.last()).assertEqual('start-rejected:1');
      expect(graph.pollTick(400)).assertFalse();
      graph.completeTask(TASK_B, 420);
      expect(graph.pollTick(600)).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   twoCompletionsThenTwoPollsStartTaskCOnce
     * @tc.desc   The first poll services the gate; the second finds the interval already released.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoCompletionsThenTwoPollsStartTaskCOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.pollTick(3)).assertTrue();
      expect(graph.pollTick(203)).assertFalse();
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.taskAt(2).startedAt).assertEqual(3);
    });

    /**
     * @tc.name   progressInterleavingKeepsPerRowValues
     * @tc.desc   Alternating reports advance each row independently without swapping values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressInterleavingKeepsPerRowValues', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      const b: DownloadTask = graph.taskAt(1);
      a.reportProgress(20);
      b.reportProgress(50);
      a.reportProgress(70);
      b.reportProgress(30);
      expect(a.progress).assertEqual(70);
      expect(b.progress).assertEqual(50);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(120);
    });

    /**
     * @tc.name   holderCountDescendsThroughTheInterleaving
     * @tc.desc   The lock reports two, then one, then zero holders as the two completions land in either order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('holderCountDescendsThroughTheInterleaving', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.lock.holderCount()).assertEqual(2);
      graph.completeTask(TASK_B, 1);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      graph.completeTask(TASK_A, 2);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   acquisitionsEqualThreeAfterEveryOrder
     * @tc.desc   Two shared acquisitions plus the exclusive acquisition are the only three grants in a run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('acquisitionsEqualThreeAfterEveryOrder', 0, () => {
      const orders: string[][] = [[TASK_A, TASK_B], [TASK_B, TASK_A]];
      for (let round = 0; round < orders.length; round++) {
        const graph: TaskGraph = createTaskGraph();
        graph.startAll();
        graph.completeTask(orders[round][0], 1);
        graph.completeTask(orders[round][1], 2);
        graph.pollTick(3);
        expect(graph.lock.acquisitions).assertEqual(3);
        expect(graph.lock.rejections).assertEqual(0);
      }
    });

    /**
     * @tc.name   normalInterleavingRecordsNoRejections
     * @tc.desc   A clean run never exercises a lock rejection path, whatever the completion order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('normalInterleavingRecordsNoRejections', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 1);
      graph.completeTask(TASK_A, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
    });

    /**
     * @tc.name   booleanOracleAgreesAcrossTwentyInterleavings
     * @tc.desc   Twenty alternating replays keep the graph gate equal to the independent boolean oracle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('booleanOracleAgreesAcrossTwentyInterleavings', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 20; round++) {
        const ref: ReferenceGraph = new ReferenceGraph();
        graph.startAll();
        if (round % 2 === 0) {
          graph.completeTask(TASK_A, 1);
          ref.markComplete(TASK_A);
        } else {
          graph.completeTask(TASK_B, 1);
          ref.markComplete(TASK_B);
        }
        expect(graph.canRunTaskC()).assertEqual(ref.unlocked());
        expect(ref.unlocked()).assertFalse();
        expect(ref.rounds).assertEqual(0);
        graph.reset();
      }
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   earlyTaskCCompletionLeavesTheIntervalArmed
     * @tc.desc   When C finishes before the gate ever opens the interval is never cleared by a poll.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('earlyTaskCCompletionLeavesTheIntervalArmed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTaskC(10);
      graph.completeTask(TASK_B, 20);
      graph.completeTask(TASK_A, 30);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTick(40)).assertFalse();
      expect(graph.allCompleted()).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(2);
    });

    /**
     * @tc.name   failureInOneBranchKeepsTheGateShut
     * @tc.desc   A failed B interleaved with a successful A can never satisfy the two boolean predicate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failureInOneBranchKeepsTheGateShut', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).fail(ERROR_NETWORK);
      graph.completeTask(TASK_A, 1);
      graph.pollTick(2);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.taskAt(1).status).assertEqual('failed');
    });

    /**
     * @tc.name   exclusiveOwnerStaysSingleAcrossInterleavedAcquires
     * @tc.desc   Three competing exclusive owners never coexist; only the first grant is kept.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exclusiveOwnerStaysSingleAcrossInterleavedAcquires', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.acquireExclusive(TASK_A)).assertFalse();
      expect(lock.acquireExclusive(TASK_B)).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.rejections).assertEqual(2);
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   releaseOrderOfSharedSlotsDoesNotMatter
     * @tc.desc   Releasing the shared slots in either order leaves one identical free lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('releaseOrderOfSharedSlotsDoesNotMatter', 0, () => {
      const first: DependencyLock = new DependencyLock();
      first.acquireShared(TASK_A);
      first.acquireShared(TASK_B);
      first.releaseShared(TASK_A);
      first.releaseShared(TASK_B);
      const second: DependencyLock = new DependencyLock();
      second.acquireShared(TASK_A);
      second.acquireShared(TASK_B);
      second.releaseShared(TASK_B);
      second.releaseShared(TASK_A);
      expect(first.holderCount()).assertEqual(second.holderCount());
      expect(first.isUnlocked()).assertTrue();
      expect(second.isUnlocked()).assertTrue();
      expect(first.acquisitions).assertEqual(second.acquisitions);
    });

    /**
     * @tc.name   unlockEventIsPerTransitionNotPerPoll
     * @tc.desc   The unlock marker belongs to the boolean transition, so extra polls add no duplicate marker.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('unlockEventIsPerTransitionNotPerPoll', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      graph.pollTick(3);
      graph.pollTick(203);
      graph.pollTick(403);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.events.last()).assertEqual('timer-cleared:C');
    });

    /**
     * @tc.name   taskCWaitsUntilBothSharedOwnersLeave
     * @tc.desc   The exclusive acquisition succeeds only after the second shared holder is released.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskCWaitsUntilBothSharedOwnersLeave', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      expect(graph.runTaskCIfReady(2)).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(2);
      graph.completeTask(TASK_B, 3);
      expect(graph.runTaskCIfReady(4)).assertTrue();
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.taskAt(2).status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   pollBeforeAnyCompletionKeepsBothHolders
     * @tc.desc   An early poll neither releases a shared holder nor advances the exclusive request.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollBeforeAnyCompletionKeepsBothHolders', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.lock.sharedHolders.length).assertEqual(2);
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.taskAt(2).startedAt).assertEqual(0);
      expect(graph.runningCount()).assertEqual(2);
    });

    /**
     * @tc.name   twoGraphsInterleaveIndependently
     * @tc.desc   Interleaved operations on two graphs never share a lock, a flag or a completion order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('twoGraphsInterleaveIndependently', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A, 1);
      second.completeTask(TASK_B, 2);
      first.completeTask(TASK_B, 3);
      second.completeTask(TASK_A, 4);
      expect(first.canRunTaskC()).assertTrue();
      expect(second.canRunTaskC()).assertTrue();
      expect(first.lock.acquisitions).assertEqual(2);
      expect(second.lock.acquisitions).assertEqual(2);
      expect(completionTrace(first)).assertEqual('A|B');
      expect(completionTrace(second)).assertEqual('B|A');
    });

    /**
     * @tc.name   lockResetMidInterleavingFreesBothSlots
     * @tc.desc   A lock reset during the gate window empties the holder array and clears the waiting flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockResetMidInterleavingFreesBothSlots', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      expect(graph.lock.holderCount()).assertEqual(1);
      graph.lock.reset();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   completionsAfterARejectedPressStillOpenTheGate
     * @tc.desc   A refused press does not poison the run: later callbacks still reach the unlock transition.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionsAfterARejectedPressStillOpenTheGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.startAll()).assertFalse();
      graph.completeTask(TASK_B, 1);
      graph.completeTask(TASK_A, 2);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.pollTick(3)).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   fingerprintSeparatesCompletionOrders
     * @tc.desc   Two graphs with equal row states but different callback orders have different event hashes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fingerprintSeparatesCompletionOrders', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      first.completeTask(TASK_A, 1);
      first.completeTask(TASK_B, 2);
      second.startAll();
      second.completeTask(TASK_B, 1);
      second.completeTask(TASK_A, 2);
      expect(first.canRunTaskC()).assertEqual(second.canRunTaskC());
      expect(first.events.fingerprint() === second.events.fingerprint()).assertFalse();
      expect(textFingerprint(first.eventTrace())).assertEqual(first.events.fingerprint());
      expect(first.events.size()).assertEqual(second.events.size());
    });

    /**
     * @tc.name   repeatedCompletionOfBothRowsNeverUnlocksTwice
     * @tc.desc   Duplicated callbacks for A and B after the gate opened add no second unlock announcement.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedCompletionOfBothRowsNeverUnlocksTwice', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.completeTask(TASK_A, 3);
      graph.completeTask(TASK_B, 4);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   bothOrdersProduceTopologicalSequences
     * @tc.desc   The recorded order is topological in both interleavings, with C strictly after the pair.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bothOrdersProduceTopologicalSequences', 0, () => {
      const first: string[] = [];
      const second: string[] = [];
      const one: TaskGraph = createTaskGraph();
      one.startAll();
      one.completeTask(TASK_A, 1);
      one.completeTask(TASK_B, 2);
      one.pollTick(3);
      one.completeTaskC(4);
      for (let index = 0; index < one.completionOrder.length; index++) {
        first.push(one.completionOrder[index]);
      }
      const two: TaskGraph = createTaskGraph();
      two.startAll();
      two.completeTask(TASK_B, 1);
      two.completeTask(TASK_A, 2);
      two.pollTick(3);
      two.completeTaskC(4);
      for (let index = 0; index < two.completionOrder.length; index++) {
        second.push(two.completionOrder[index]);
      }
      expect(isTopologicalCompletion(first)).assertTrue();
      expect(isTopologicalCompletion(second)).assertTrue();
      expect(first[1]).assertEqual(TASK_B);
      expect(second[1]).assertEqual(TASK_A);
    });

    /**
     * @tc.name   mixedInterleavingOfProgressAndPollsEndsClean
     * @tc.desc   A noisy run that mixes reports, polls and two orders still ends with every resource released.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrencyControl scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mixedInterleavingOfProgressAndPollsEndsClean', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(25);
      graph.pollTick(200);
      graph.taskAt(1).reportProgress(35);
      graph.completeTask(TASK_B, 300);
      graph.pollTick(400);
      graph.taskAt(0).reportProgress(65);
      graph.completeTask(TASK_A, 500);
      expect(graph.pollTick(600)).assertTrue();
      graph.completeTaskC(700);
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.allCompleted()).assertTrue();
    });
  });
}
