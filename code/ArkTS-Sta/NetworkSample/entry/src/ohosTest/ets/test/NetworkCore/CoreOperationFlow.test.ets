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
 * CoreOperationFlow suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   79-95    completeTaskA / B / C callbacks and updateProgress
 *   98-102   checkAndUnlock runs after every A/B completion
 *   174-198  startAllTasks: shared A/B, queued C, 200 ms setInterval
 *   249-259  the start button is enabled only while isTaskFinished
 *
 * Multi-step flows instead of single calls: A then B, B then A, C attempted
 * before the gate opens, polls on both sides of the unlock, duplicate
 * completions, and a reset in the middle of a run.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TaskGraph,
  DownloadTask,
  createTaskGraph,
  completionTrace,
  isTopologicalCompletion,
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  URL_TASK_A,
  countOf,
  joined
} from '../Shared/SharedDriver';

export default function networkCoreOperationFlowTest(): void {
  describe('CoreOperationFlow', () => {
    beforeAll(() => {
      logSuite('CoreOperationFlow', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreOperationFlow', 'end');
    });

    /**
     * @tc.name   flowAThenBUnlocksOnTheSecondCompletion
     * @tc.desc   Completing A first keeps the gate closed until B completes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('flowAThenBUnlocksOnTheSecondCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      graph.completeTask(TASK_B, 20);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(completionTrace(graph)).assertEqual('A|B');
    });

    /**
     * @tc.name   flowBThenAUnlocksOnTheSecondCompletion
     * @tc.desc   The reversed order reaches the same gate state at the same step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('flowBThenAUnlocksOnTheSecondCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 10);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_A, 20);
      expect(graph.canRunTaskC()).assertTrue();
      expect(completionTrace(graph)).assertEqual('B|A');
      expect(graph.events.countOf('unlocked')).assertEqual(1);
    });

    /**
     * @tc.name   flowUnlockEventSitsAtTheSameTraceOffsetForBothOrders
     * @tc.desc   The unlock is always the seventh recorded entry regardless of A/B order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowUnlockEventSitsAtTheSameTraceOffsetForBothOrders', 0, () => {
      const forward: TaskGraph = createTaskGraph();
      const reverse: TaskGraph = createTaskGraph();
      forward.startAll();
      reverse.startAll();
      forward.completeTask(TASK_A);
      forward.completeTask(TASK_B);
      reverse.completeTask(TASK_B);
      reverse.completeTask(TASK_A);
      expect(forward.events.entries[6]).assertEqual('unlocked:C');
      expect(reverse.events.entries[6]).assertEqual('unlocked:C');
      expect(forward.events.size()).assertEqual(reverse.events.size());
      expect(forward.events.fingerprint() === reverse.events.fingerprint()).assertFalse();
    });

    /**
     * @tc.name   flowCAttemptBeforeAnyCompletionIsBlocked
     * @tc.desc   runTaskCIfReady right after startAll refuses because the gate has two holders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('flowCAttemptBeforeAnyCompletionIsBlocked', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.runTaskCIfReady(5)).assertFalse();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(2);
    });

    /**
     * @tc.name   flowCAttemptAfterOnlyAIsStillBlocked
     * @tc.desc   One completed dependency is not enough; the exclusive request stays queued.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowCAttemptAfterOnlyAIsStillBlocked', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.runTaskCIfReady(5)).assertFalse();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).attempts).assertEqual(0);
    });

    /**
     * @tc.name   flowPollBeforeUnlockReturnsFalseAndKeepsWaiting
     * @tc.desc   A timer tick while the gate is closed leaves the timer armed and C idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowPollBeforeUnlockReturnsFalseAndKeepsWaiting', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
    });

    /**
     * @tc.name   flowFirstPollAfterUnlockStartsC
     * @tc.desc   The very next tick after B completes promotes C to running and clears the timer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('flowFirstPollAfterUnlockStartsC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick(200)).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isRunning()).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.events.last()).assertEqual('timer-cleared:C');
    });
    /**
     * @tc.name   flowRepeatedPollStartsCOnlyOnce
     * @tc.desc   Later ticks are inert because the timer was cleared by the first successful poll.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowRepeatedPollStartsCOnlyOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick(200)).assertTrue();
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTick(600)).assertFalse();
      expect((graph.taskByNo(TASK_C) as DownloadTask).attempts).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.pollTicks).assertEqual(3);
    });

    /**
     * @tc.name   flowDuplicateCompletionMidFlowKeepsTheOrder
     * @tc.desc   A repeated A completion is refused and does not disturb the later B step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowDuplicateCompletionMidFlowKeepsTheOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.completeTask(TASK_A)).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(1);
      graph.completeTask(TASK_B);
      expect(completionTrace(graph)).assertEqual('A|B');
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   flowResetMidFlowReturnsToTheSeedState
     * @tc.desc   A reset after A completes wipes progress, events, timer and the shared slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowResetMidFlowReturnsToTheSeedState', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   flowRestartAfterMidFlowResetSucceeds
     * @tc.desc   The reset restores the start precondition, so a second start is accepted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowRestartAfterMidFlowResetSucceeds', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.reset();
      expect(graph.startAll()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.pollTicks).assertEqual(0);
    });

    /**
     * @tc.name   flowTwoRunsAfterResetProduceTheSameCompletionTrace
     * @tc.desc   The second run repeats the first completion order exactly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowTwoRunsAfterResetProduceTheSameCompletionTrace', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      graph.pollTick(200);
      graph.completeTaskC(400);
      const first: string = completionTrace(graph);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(completionTrace(graph)).assertEqual(first);
      expect(first).assertEqual('B|A|C');
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   flowFullRunCompletesAllThreeTasks
     * @tc.desc   The canonical tap-start, wait, wait, poll flow ends with three completed tasks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('flowFullRunCompletesAllThreeTasks', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 300);
      graph.completeTask(TASK_B, 500);
      graph.pollTick(700);
      graph.completeTaskC(900);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.averageProgress()).assertEqual(100);
      expect(graph.runningCount()).assertEqual(0);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
    });

    /**
     * @tc.name   flowCompletionOrderCanBeEitherSharedOrderButNotReversedAtC
     * @tc.desc   Both A-first and B-first runs are topological, while C-first is not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowCompletionOrderCanBeEitherSharedOrderButNotReversedAtC', 0, () => {
      expect(isTopologicalCompletion([TASK_A, TASK_B, TASK_C])).assertTrue();
      expect(isTopologicalCompletion([TASK_B, TASK_A, TASK_C])).assertTrue();
      expect(isTopologicalCompletion([TASK_C, TASK_A, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_C, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_B])).assertFalse();
    });

    /**
     * @tc.name   flowCRunViaDirectCallClearsTheTimerToo
     * @tc.desc   runTaskCIfReady shares the timer-clearing side effect with pollTick.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowCRunViaDirectCallClearsTheTimerToo', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.timerActive).assertTrue();
      expect(graph.runTaskCIfReady(200)).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.events.last()).assertEqual('started:C');
    });

    /**
     * @tc.name   flowCCompletionReleasesTheExclusiveGate
     * @tc.desc   After the poll starts C, completing it unlocks the dependency lock for good.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowCCompletionReleasesTheExclusiveGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.completeTaskC(400)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.holderCount()).assertEqual(0);
      expect((graph.taskByNo(TASK_C) as DownloadTask).progress).assertEqual(100);
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
    });

    /**
     * @tc.name   flowCompletionWithoutStartRecordsOnlyTheCompletion
     * @tc.desc   A task completed before tapping start still records completed but never queued.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowCompletionWithoutStartRecordsOnlyTheCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.completeTask(TASK_A, 50)).assertTrue();
      expect(graph.events.size()).assertEqual(1);
      expect(graph.events.last()).assertEqual('completed:A');
      expect(graph.events.countOf('started')).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.completionOrder[0]).assertEqual(TASK_A);
    });

    /**
     * @tc.name   flowOnlyOneDependencyCompletedKeepsTheGateShut
     * @tc.desc   Repeated completion attempts on A never satisfy the two-task condition.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowOnlyOneDependencyCompletedKeepsTheGateShut', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_A);
      graph.pollTick(200);
      graph.pollTick(400);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.timerActive).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
    });

    /**
     * @tc.name   flowStartRejectedUntilTheRunIsReset
     * @tc.desc   A completed run keeps the button disabled; only reset() restores the tap.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowStartRejectedUntilTheRunIsReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      graph.reset();
      expect(graph.startAll()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   flowCCompletionWithoutAPollLeavesTheTimerArmed
     * @tc.desc   completeTaskC does not touch the timer flag; only starting C stops the poll.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowCCompletionWithoutAPollLeavesTheTimerArmed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.timerActive).assertTrue();
      expect(graph.completeTaskC(400)).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTick(600)).assertFalse();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isComplete()).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
    });

    /**
     * @tc.name   flowCBeforeBothDependenciesKeepsTheGateClosedForLaterSteps
     * @tc.desc   Completing C first records the completion but A and B still decide the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowCBeforeBothDependenciesKeepsTheGateClosedForLaterSteps', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.completeTaskC(100)).assertTrue();
      expect(graph.events.last()).assertEqual('completed:C');
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      graph.completeTask(TASK_A);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      graph.completeTask(TASK_B);
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(completionTrace(graph)).assertEqual('C|A|B');
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   flowPollAfterCCompletedIsANoOp
     * @tc.desc   Once C is complete, further poll ticks cannot start it again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowPollAfterCCompletedIsANoOp', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      const attempts: number = (graph.taskByNo(TASK_C) as DownloadTask).attempts;
      expect(graph.pollTick(600)).assertFalse();
      expect(graph.pollTick(800)).assertFalse();
      expect((graph.taskByNo(TASK_C) as DownloadTask).attempts).assertEqual(attempts);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.pollTicks).assertEqual(3);
    });

    /**
     * @tc.name   flowResetMidFlowClearsTheQueuedExclusiveRequest
     * @tc.desc   A reset while C waits erases waitingExclusive and the rejection-free counters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowResetMidFlowClearsTheQueuedExclusiveRequest', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.lock.waitingExclusive).assertTrue();
      graph.reset();
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect((graph.taskByNo(TASK_A) as DownloadTask).isIdle()).assertTrue();
    });

    /**
     * @tc.name   flowInterleavedProgressAndCompletionKeepsTheHighWaterMark
     * @tc.desc   Intermediate progress below 100 is preserved until the completion writes 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowInterleavedProgressAndCompletionKeepsTheHighWaterMark', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskByNo(TASK_A) as DownloadTask;
      const b: DownloadTask = graph.taskByNo(TASK_B) as DownloadTask;
      b.reportProgress(30);
      a.reportProgress(60);
      b.reportProgress(90);
      expect(graph.totalProgress()).assertEqual(150);
      expect(graph.snapshotText()).assertEqual('A:running:60|B:running:90|C:idle:0');
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      expect(graph.totalProgress()).assertEqual(200);
      expect(a.progress).assertEqual(100);
      expect(b.progress).assertEqual(100);
    });

    /**
     * @tc.name   flowTraceLengthGrowsWithEveryAcceptedStep
     * @tc.desc   Each accepted operation appends at least one entry while rejects append none.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowTraceLengthGrowsWithEveryAcceptedStep', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const sizes: number[] = [];
      graph.startAll();
      sizes.push(graph.events.size());
      graph.completeTask(TASK_A);
      sizes.push(graph.events.size());
      graph.completeTask(TASK_B);
      sizes.push(graph.events.size());
      graph.pollTick(200);
      sizes.push(graph.events.size());
      graph.completeTaskC(400);
      sizes.push(graph.events.size());
      expect(sizes[0]).assertEqual(4);
      expect(sizes[1]).assertEqual(5);
      expect(sizes[2]).assertEqual(7);
      expect(sizes[3]).assertEqual(9);
      expect(sizes[4]).assertEqual(11);
      expect(graph.events.size()).assertEqual(11);
    });

    /**
     * @tc.name   flowSnapshotTextMovesThroughThreePhases
     * @tc.desc   The snapshot string changes exactly when a task changes status or progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowSnapshotTextMovesThroughThreePhases', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const idle: string = graph.snapshotText();
      graph.startAll();
      const running: string = graph.snapshotText();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      const cRunning: string = graph.snapshotText();
      graph.completeTaskC(400);
      const done: string = graph.snapshotText();
      expect(idle).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      expect(running).assertEqual('A:running:0|B:running:0|C:idle:0');
      expect(cRunning).assertEqual('A:completed:100|B:completed:100|C:running:0');
      expect(done).assertEqual('A:completed:100|B:completed:100|C:completed:100');
      expect(idle === done).assertFalse();
    });

    /**
     * @tc.name   flowReverseOrderDoesNotChangeTheFinalState
     * @tc.desc   Both dependency orders converge on the same completed snapshot and progress sum.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowReverseOrderDoesNotChangeTheFinalState', 0, () => {
      const forward: TaskGraph = createTaskGraph();
      const reverse: TaskGraph = createTaskGraph();
      forward.startAll();
      forward.completeTask(TASK_A);
      forward.completeTask(TASK_B);
      reverse.startAll();
      reverse.completeTask(TASK_B);
      reverse.completeTask(TASK_A);
      expect(forward.canRunTaskC()).assertEqual(reverse.canRunTaskC());
      expect(forward.snapshotText()).assertEqual(reverse.snapshotText());
      expect(forward.totalProgress()).assertEqual(reverse.totalProgress());
      expect(forward.completionOrder[0]).assertEqual(TASK_A);
      expect(reverse.completionOrder[0]).assertEqual(TASK_B);
    });

    /**
     * @tc.name   flowPollCountsWhileTheGateIsClosedAndResumesAfterUnlock
     * @tc.desc   Ticks before the unlock are counted but only the post-unlock tick starts C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowPollCountsWhileTheGateIsClosedAndResumesAfterUnlock', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.pollTick(400)).assertFalse();
      graph.completeTask(TASK_B);
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.pollTick(600)).assertTrue();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.events.last()).assertEqual('timer-cleared:C');
    });

    /**
     * @tc.name   flowUnlockIsIdempotentAfterTheGateIsOpen
     * @tc.desc   Additional polls or starts cannot add a second unlocked entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowUnlockIsIdempotentAfterTheGateIsOpen', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      graph.pollTick(200);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      graph.runTaskCIfReady(400);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(3);
    });

    /**
     * @tc.name   flowStartAfterUnlockButBeforePollIsRejected
     * @tc.desc   The button flag is still false while C waits in the timer queue.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowStartAfterUnlockButBeforePollIsRejected', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   flowTwoConsecutiveRunsKeepIndependentEventTraces
     * @tc.desc   Each run starts from an empty trace after reset and records the same phases.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowTwoConsecutiveRunsKeepIndependentEventTraces', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      const firstTrace: string = graph.eventTrace();
      const firstFingerprint: number = graph.events.fingerprint();
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.eventTrace()).assertEqual(firstTrace);
      expect(graph.events.fingerprint()).assertEqual(firstFingerprint);
      expect(graph.pollTicks).assertEqual(1);
    });

    /**
     * @tc.name   flowProgressAccumulatesOnlyFromAcceptedUpdates
     * @tc.desc   Regressions in the progress callback never lower the sum of the three bars.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowProgressAccumulatesOnlyFromAcceptedUpdates', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const c: DownloadTask = graph.taskByNo(TASK_C) as DownloadTask;
      (graph.taskByNo(TASK_A) as DownloadTask).reportProgress(80);
      (graph.taskByNo(TASK_B) as DownloadTask).reportProgress(70);
      expect(graph.totalProgress()).assertEqual(150);
      (graph.taskByNo(TASK_A) as DownloadTask).reportProgress(20);
      expect(graph.totalProgress()).assertEqual(150);
      expect(c.progress).assertEqual(0);
      expect(graph.averageProgress()).assertEqual(50);
      expect(graph.snapshotText().startsWith('A:running:80|B:running:70')).assertTrue();
    });

    /**
     * @tc.name   flowCompletionTimestampsFollowTheCallerClock
     * @tc.desc   Each completion stores the supplied time so a run can be audited in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowCompletionTimestampsFollowTheCallerClock', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1000);
      graph.completeTask(TASK_B, 2000);
      graph.pollTick(2100);
      graph.completeTaskC(3000);
      const a: DownloadTask = graph.taskByNo(TASK_A) as DownloadTask;
      const b: DownloadTask = graph.taskByNo(TASK_B) as DownloadTask;
      const c: DownloadTask = graph.taskByNo(TASK_C) as DownloadTask;
      expect(a.finishedAt).assertEqual(1000);
      expect(b.finishedAt).assertEqual(2000);
      expect(c.finishedAt).assertEqual(3000);
      expect(a.finishedAt < b.finishedAt).assertTrue();
      expect(b.finishedAt < c.finishedAt).assertTrue();
    });

    /**
     * @tc.name   flowCAttemptWhileCIsRunningIsRefused
     * @tc.desc   A manual C start after a successful poll returns false and keeps one attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowCAttemptWhileCIsRunningIsRefused', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick(200)).assertTrue();
      expect(graph.runTaskCIfReady(400)).assertFalse();
      expect((graph.taskByNo(TASK_C) as DownloadTask).attempts).assertEqual(1);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.acquisitions).assertEqual(3);
    });

    /**
     * @tc.name   flowResetAfterFullRunMakesTheSnapshotIdleAgain
     * @tc.desc   The reset clears every visible bar and the start button becomes available.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowResetAfterFullRunMakesTheSnapshotIdleAgain', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.allCompleted()).assertTrue();
      graph.reset();
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.events.countOf('start-all')).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   flowDuplicateBCompletionDoesNotDuplicateTheUnlock
     * @tc.desc   Only the first B completion releases the shared slot and appends the unlock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowDuplicateBCompletionDoesNotDuplicateTheUnlock', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.completeTask(TASK_B)).assertFalse();
      expect(graph.completeTask(TASK_A)).assertFalse();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(countOf(graph.completionOrder, TASK_B)).assertEqual(1);
    });

    /**
     * @tc.name   flowEventsNeverMentionAnUnknownTaskNumber
     * @tc.desc   An unknown completion leaves the trace free of that token.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowEventsNeverMentionAnUnknownTaskNumber', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask('D')).assertFalse();
      const trace: string = graph.eventTrace();
      expect(trace.indexOf('D')).assertEqual(-1);
      expect(trace.split('|').length).assertEqual(4);
      expect(joined(graph.completionOrder, '|')).assertEqual('');
      expect(graph.events.countOf('completed')).assertEqual(0);
    });

    /**
     * @tc.name   flowEveryTaskNumberAppearsInTheCanonicalTrace
     * @tc.desc   The full run mentions A, B and C in started and completed entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowEveryTaskNumberAppearsInTheCanonicalTrace', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      const trace: string = graph.eventTrace();
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        expect(trace.indexOf('started:' + TASK_NUMBERS[index])).assertLarger(0);
        expect(trace.indexOf('completed:' + TASK_NUMBERS[index])).assertLarger(0);
      }
      expect(countOf(graph.completionOrder, TASK_C)).assertEqual(1);
      logStep('CoreOperationFlow', trace);
    });

    /**
     * @tc.name   flowURLIdentitySurvivesTheWholeRun
     * @tc.desc   No flow step rewrites the URL literal of any task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('flowURLIdentitySurvivesTheWholeRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect((graph.taskByNo(TASK_A) as DownloadTask).url).assertEqual(URL_TASK_A);
      expect((graph.taskByNo(TASK_A) as DownloadTask).url.endsWith('.png')).assertTrue();
      expect((graph.taskByNo(TASK_B) as DownloadTask).url.indexOf('after_cache')).assertLarger(0);
      expect((graph.taskByNo(TASK_C) as DownloadTask).url.indexOf('icon_main_color')).assertLarger(0);
    });

    /**
     * @tc.name   flowMidFlowResetDoesNotBreakTheNextRun
     * @tc.desc   A reset between the two dependency completions still allows a clean full run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowMidFlowResetDoesNotBreakTheNextRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_A);
      expect(graph.canRunTaskC()).assertTrue();
      expect(completionTrace(graph)).assertEqual('B|A');
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(2);
    });

    /**
     * @tc.name   flowUnlockPrecedesThePollInTheEventOrder
     * @tc.desc   The unlock entry is appended before started:C and timer-cleared:C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperationFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flowUnlockPrecedesThePollInTheEventOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      graph.pollTick(200);
      const trace: string = graph.eventTrace();
      expect(trace.indexOf('unlocked:C')).assertLarger(0);
      expect(trace.indexOf('started:C')).assertLarger(trace.indexOf('unlocked:C'));
      expect(trace.indexOf('timer-cleared:C')).assertLarger(trace.indexOf('started:C'));
      expect(trace.endsWith('started:C|timer-cleared:C')).assertTrue();
    });
  });
}
