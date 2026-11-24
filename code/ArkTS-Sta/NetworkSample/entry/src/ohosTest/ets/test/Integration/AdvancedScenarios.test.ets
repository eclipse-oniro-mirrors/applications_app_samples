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
 * AdvancedScenario suite.
 *
 * The basic paths are covered elsewhere; this suite attacks the edges of the
 * gate: both dependency orders, duplicate completion callbacks, polls that
 * arrive too early or too late, lock misuse, counters, and repeated runs with
 * a reset in between. Every case states which invariant of Index.ets it pins.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   62       lock = true, the exclusive gate of task C
 *   79-102   completeTaskA/B, checkAndUnlock, canRunTaskC
 *   105-107  canRunTaskC returns !lock
 *   174-198  startAllTasks, shared A/B, exclusive C, 200 ms poll
 *   194-196  clearInterval when progressValueC is already 100
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
  DependencyLock,
  SnapshotLog,
  RunSnapshot,
  textFingerprint,
  TaskGraph
} from '../Shared/SharedDriver';

/** Drives the gate to the open state without starting the exclusive task. */
function openGate(graph: TaskGraph): void {
  graph.startAll();
  graph.completeTask(TASK_A);
  graph.completeTask(TASK_B);
}

export default function advancedScenariosTest(): void {
  describe('AdvancedScenarios', () => {
    beforeAll(() => {
      logSuite('AdvancedScenarios', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('AdvancedScenarios', 'end');
    });

    /**
     * @tc.name   aThenBUnlocksExactlyOnce
     * @tc.desc   Completing A before B produces one unlock record and leaves C waiting for a poll.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('aThenBUnlocksExactlyOnce', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      graph.completeTask(TASK_B);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(completionTrace(graph)).assertEqual('A|B');
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.runTaskCIfReady(100)).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
    });

    /**
     * @tc.name   bThenAUnlocksExactlyOnce
     * @tc.desc   The mirrored dependency order is indistinguishable to the gate apart from the trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('bThenAUnlocksExactlyOnce', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      graph.completeTask(TASK_A);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(completionTrace(graph)).assertEqual('B|A');
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.taskAt(2).startedAt).assertEqual(POLL_INTERVAL_MS);
    });

    /**
     * @tc.name   duplicateTaskACompletionIsIgnored
     * @tc.desc   A repeated onCompleted callback for A returns false and adds no event or trace entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateTaskACompletionIsIgnored', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A)).assertTrue();
      const sizeAfterFirst: number = graph.events.size();
      const traceAfterFirst: string = graph.events.trace();
      expect(graph.completeTask(TASK_A)).assertFalse();
      expect(graph.completeTask(TASK_A)).assertFalse();
      expect(graph.events.size()).assertEqual(sizeAfterFirst);
      expect(graph.events.trace()).assertEqual(traceAfterFirst);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.completionOrder[0]).assertEqual(TASK_A);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(0).finishedAt).assertEqual(0);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(1);
    });

    /**
     * @tc.name   duplicateTaskCCompletionIsIgnored
     * @tc.desc   A second completion for the exclusive task is refused without a trace or lock change.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateTaskCCompletionIsIgnored', 0, () => {
      const graph = createTaskGraph();
      openGate(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      expect(graph.completeTaskC(300)).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      const sizeAfterFinish: number = graph.events.size();
      expect(graph.completeTaskC(400)).assertFalse();
      expect(graph.completeTaskC(500)).assertFalse();
      expect(graph.events.size()).assertEqual(sizeAfterFinish);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
      expect(graph.taskAt(2).finishedAt).assertEqual(300);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.taskAt(2).progress).assertEqual(100);
    });

    /**
     * @tc.name   earlyPollBeforeAnyCompletionDoesNothing
     * @tc.desc   Polls fired before a single dependency finished count rounds but never start C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('earlyPollBeforeAnyCompletionDoesNothing', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      for (let round = 0; round < 4; round++) {
        expect(graph.pollTick(POLL_INTERVAL_MS * (round + 1))).assertFalse();
      }
      expect(graph.pollTicks).assertEqual(4);
      expect(graph.timerActive).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   pollBetweenCompletionsDoesNothing
     * @tc.desc   A poll landing after A but before B also leaves the timer armed and C idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollBetweenCompletionsDoesNothing', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.timerActive).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      graph.completeTask(TASK_B);
      expect(graph.pollTick(600)).assertTrue();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   latePollAfterCStartedReturnsFalse
     * @tc.desc   A straggling interval callback after C started cannot launch a second request.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('latePollAfterCStartedReturnsFalse', 0, () => {
      const graph = createTaskGraph();
      openGate(graph);
      expect(graph.runTaskCIfReady(200)).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTick(600)).assertFalse();
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.taskAt(2).startedAt).assertEqual(200);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.pollTicks).assertEqual(2);
    });

    /**
     * @tc.name   lockRejectsSharedAcquireWhileExclusiveHeld
     * @tc.desc   A dependency arriving late cannot take a shared slot while C owns the exclusive slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockRejectsSharedAcquireWhileExclusiveHeld', 0, () => {
      const lock = new DependencyLock();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertFalse();
      expect(lock.acquireShared(TASK_B)).assertFalse();
      expect(lock.rejections).assertEqual(2);
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.isUnlocked()).assertFalse();
      expect(lock.releaseExclusive(TASK_C)).assertTrue();
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   sharedReleaseOfUnknownOwnerFails
     * @tc.desc   Releasing a shared lock that was never granted returns false and keeps holders intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sharedReleaseOfUnknownOwnerFails', 0, () => {
      const lock = new DependencyLock();
      expect(lock.releaseShared(TASK_A)).assertFalse();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.releaseShared(TASK_B)).assertFalse();
      expect(lock.sharedHolders.length).assertEqual(1);
      expect(lock.hasShared(TASK_A)).assertTrue();
      expect(lock.releaseShared(TASK_A)).assertTrue();
      expect(lock.releaseShared(TASK_A)).assertFalse();
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   exclusiveReleaseByWrongOwnerFails
     * @tc.desc   Only the recorded exclusive owner may release the exclusive slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exclusiveReleaseByWrongOwnerFails', 0, () => {
      const lock = new DependencyLock();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.releaseExclusive(TASK_A)).assertFalse();
      expect(lock.releaseExclusive(TASK_B)).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.isUnlocked()).assertFalse();
      expect(lock.releaseExclusive(TASK_C)).assertTrue();
      expect(lock.releaseExclusive(TASK_C)).assertFalse();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.waitingExclusive).assertFalse();
    });

    /**
     * @tc.name   waitingExclusiveFlagTracksQueue
     * @tc.desc   The waiting flag is raised by a refused exclusive request and cleared by a granted one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('waitingExclusiveFlagTracksQueue', 0, () => {
      const lock = new DependencyLock();
      expect(lock.waitingExclusive).assertFalse();
      lock.acquireShared(TASK_A);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.rejections).assertEqual(1);
      lock.acquireShared(TASK_B);
      expect(lock.waitingExclusive).assertTrue();
      lock.releaseShared(TASK_A);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.rejections).assertEqual(2);
      lock.releaseShared(TASK_B);
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.rejections).assertEqual(2);
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   holderCountTracksSharedAndExclusive
     * @tc.desc   The holder count moves 0 -> 2 -> 1 -> 0 across one lifecycle of the mirror lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('holderCountTracksSharedAndExclusive', 0, () => {
      const lock = new DependencyLock();
      expect(lock.holderCount()).assertEqual(0);
      lock.acquireShared(TASK_A);
      expect(lock.holderCount()).assertEqual(1);
      lock.acquireShared(TASK_B);
      expect(lock.holderCount()).assertEqual(2);
      lock.releaseShared(TASK_A);
      expect(lock.holderCount()).assertEqual(1);
      lock.releaseShared(TASK_B);
      expect(lock.holderCount()).assertEqual(0);
      lock.acquireExclusive(TASK_C);
      expect(lock.holderCount()).assertEqual(1);
      lock.releaseExclusive(TASK_C);
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.sharedHolders.length + (lock.exclusiveOwner.length > 0 ? 1 : 0)).assertEqual(0);
    });

    /**
     * @tc.name   acquisitionCounterCountsEachGrant
     * @tc.desc   Only successful grants increase the acquisition counter, and duplicates are free.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('acquisitionCounterCountsEachGrant', 0, () => {
      const lock = new DependencyLock();
      expect(lock.acquisitions).assertEqual(0);
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_A);
      expect(lock.acquisitions).assertEqual(1);
      lock.acquireShared(TASK_B);
      expect(lock.acquisitions).assertEqual(2);
      lock.releaseShared(TASK_A);
      lock.releaseShared(TASK_B);
      lock.acquireExclusive(TASK_C);
      expect(lock.acquisitions).assertEqual(3);
      lock.acquireExclusive(TASK_C);
      expect(lock.acquisitions).assertEqual(3);
      expect(lock.acquisitions === lock.rejections).assertFalse();
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   pollCounterCountsRoundsEvenWhenIdle
     * @tc.desc   pollTick increments its round counter even when no timer is installed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollCounterCountsRoundsEvenWhenIdle', 0, () => {
      const graph = createTaskGraph();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.size()).assertEqual(0);
      graph.startAll();
      expect(graph.pollTick(600)).assertFalse();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.timerActive).assertTrue();
      graph.reset();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.isTaskFinished).assertTrue();
    });

    /**
     * @tc.name   resetClearsCountersAndTrace
     * @tc.desc   A reset zeroes the poll counter, lock statistics, trace and completion order in one step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetClearsCountersAndTrace', 0, () => {
      const graph = createTaskGraph();
      openGate(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.events.size() > 0).assertTrue();
      graph.reset();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.events.trace()).assertEqual('');
      expect(graph.timerActive).assertFalse();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   twoGraphsDoNotShareState
     * @tc.desc   Two graphs driven differently keep separate locks, counters and completion traces.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('twoGraphsDoNotShareState', 0, () => {
      const first = createTaskGraph();
      const second = createTaskGraph();
      openGate(first);
      second.startAll();
      second.completeTask(TASK_B);
      expect(first.lock.isUnlocked()).assertTrue();
      expect(second.lock.hasShared(TASK_A)).assertTrue();
      expect(first.canRunTaskC()).assertTrue();
      expect(second.canRunTaskC()).assertFalse();
      expect(completionTrace(first)).assertEqual('A|B');
      expect(completionTrace(second)).assertEqual('B');
      expect(first.events.countOf('unlocked')).assertEqual(1);
      expect(second.events.countOf('unlocked')).assertEqual(0);
      expect(first.taskAt(2).isIdle()).assertTrue();
      expect(second.taskAt(0).isRunning()).assertTrue();
      expect(first.events.fingerprint() === second.events.fingerprint()).assertFalse();
    });

    /**
     * @tc.name   interleavedProgressKeepsRowsIndependent
     * @tc.desc   Alternating updates from three live requests never bleed between progress rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('interleavedProgressKeepsRowsIndependent', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const values: number[] = [5, 15, 25, 35, 45, 55, 65, 75];
      for (let index = 0; index < values.length; index++) {
        graph.taskAt(0).reportProgress(values[index]);
        graph.taskAt(1).reportProgress(values[values.length - 1 - index]);
        graph.taskAt(2).reportProgress(values[index] + 1);
      }
      expect(graph.taskAt(0).progress).assertEqual(75);
      expect(graph.taskAt(1).progress).assertEqual(75);
      expect(graph.taskAt(2).progress).assertEqual(76);
      expect(graph.totalProgress()).assertEqual(226);
      expect(graph.taskAt(0).label().endsWith('75%')).assertTrue();
      expect(graph.taskAt(2).label().endsWith('76%')).assertTrue();
      expect(graph.taskAt(0).describe()).assertEqual('A:running:75');
      expect(graph.taskAt(1).describe()).assertEqual('B:running:75');
      expect(graph.taskAt(2).describe()).assertEqual('C:idle:76');
      expect(graph.runningCount()).assertEqual(2);
    });

    /**
     * @tc.name   progressAfterCompletionIsFrozen
     * @tc.desc   A late progress callback for a finished row is ignored and the bar stays at one hundred.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressAfterCompletionIsFrozen', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.taskAt(0).reportProgress(5)).assertEqual(100);
      expect(graph.taskAt(0).reportProgress(99)).assertEqual(100);
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(0).progressRatio()).assertEqual(1);
      expect(graph.taskAt(0).label()).assertEqual('任务A当前进度 100%');
      graph.taskAt(0).fail(ERROR_NETWORK);
      expect(graph.taskAt(0).isFailed()).assertFalse();
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(0).lastErrorCode).assertEqual(0);
      expect(graph.taskAt(0).describe()).assertEqual('A:completed:100');
    });

    /**
     * @tc.name   concurrentCompletionOfAAndBIsSymmetric
     * @tc.desc   Both completion orders open the gate identically while the trace keeps the arrival order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('concurrentCompletionOfAAndBIsSymmetric', 0, () => {
      const first = createTaskGraph();
      const second = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A);
      second.completeTask(TASK_B);
      expect(first.canRunTaskC()).assertFalse();
      expect(second.canRunTaskC()).assertFalse();
      first.completeTask(TASK_B);
      second.completeTask(TASK_A);
      expect(first.canRunTaskC()).assertTrue();
      expect(second.canRunTaskC()).assertTrue();
      expect(first.events.countOf('unlocked')).assertEqual(1);
      expect(second.events.countOf('unlocked')).assertEqual(1);
      expect(first.lock.holderCount()).assertEqual(second.lock.holderCount());
      expect(completionTrace(first)).assertEqual('A|B');
      expect(completionTrace(second)).assertEqual('B|A');
      expect(first.events.fingerprint() === second.events.fingerprint()).assertFalse();
      expect(NetworkMetrics.from(first).fingerprint()).assertEqual(NetworkMetrics.from(second).fingerprint());
    });

    /**
     * @tc.name   cPolledEarlyThenGateOpensThenPollSucceeds
     * @tc.desc   Two failed rounds do not consume the timer; a later round starts C normally.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cPolledEarlyThenGateOpensThenPollSucceeds', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.pollTick(200)).assertFalse();
      graph.completeTask(TASK_A);
      expect(graph.pollTick(400)).assertFalse();
      graph.completeTask(TASK_B);
      expect(graph.pollTick(600)).assertTrue();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.taskAt(2).startedAt).assertEqual(600);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   resetRestoresButtonAndTimerState
     * @tc.desc   A reset returns the start button to enabled and removes the exclusive timer completely.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetRestoresButtonAndTimerState', 0, () => {
      const graph = createTaskGraph();
      openGate(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.taskAt(2).isRunning()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).startedAt).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.startAll()).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   doubleCompletionOfAllThreeKeepsSingleTrace
     * @tc.desc   Six completion calls for three tasks produce exactly three trace entries, in first-call order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('doubleCompletionOfAllThreeKeepsSingleTrace', 0, () => {
      const graph = createTaskGraph();
      openGate(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      expect(graph.completeTaskC(300)).assertTrue();
      const cleanTrace: string = graph.events.trace();
      const cleanFingerprint: number = graph.events.fingerprint();
      expect(graph.completeTask(TASK_A)).assertFalse();
      expect(graph.completeTask(TASK_C)).assertFalse();
      expect(graph.completeTask(TASK_B)).assertFalse();
      expect(graph.completeTaskC(400)).assertFalse();
      expect(graph.events.trace()).assertEqual(cleanTrace);
      expect(graph.events.fingerprint()).assertEqual(cleanFingerprint);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(NetworkMetrics.from(graph).completedTasks).assertEqual(3);
      expect(graph.events.fingerprint()).assertEqual(textFingerprint(graph.events.trace()));
    });

    /**
     * @tc.name   failedTaskThenSuccessfulRecoveryKeepsGateRule
     * @tc.desc   A failed dependency blocks the gate; after a successful retry the rule applies unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedTaskThenSuccessfulRecoveryKeepsGateRule', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      graph.taskAt(0).reset();
      graph.taskAt(0).start(400);
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.pollTick(600)).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.taskAt(0).attempts).assertEqual(2);
      expect(graph.completionOrder.length).assertEqual(2);
    });

    /**
     * @tc.name   completionOrderIsAppendOnly
     * @tc.desc   The completion list grows one entry at a time and earlier entries never change.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionOrderIsAppendOnly', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.completionOrder.length).assertEqual(0);
      graph.completeTask(TASK_B);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      graph.completeTask(TASK_A);
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(graph.completionOrder[1]).assertEqual(TASK_A);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(300);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(graph.completionOrder[1]).assertEqual(TASK_A);
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
      expect(completionTrace(graph) === 'B|A|C').assertTrue();
    });

    /**
     * @tc.name   timerStaysArmedUntilCStarts
     * @tc.desc   Nothing except a successful exclusive start clears the timer flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timerStaysArmedUntilCStarts', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.timerActive).assertTrue();
      graph.completeTask(TASK_A);
      expect(graph.timerActive).assertTrue();
      graph.completeTask(TASK_B);
      expect(graph.timerActive).assertTrue();
      graph.pollTick(POLL_INTERVAL_MS);
      expect(graph.timerActive).assertFalse();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      expect(graph.timerActive).assertFalse();
      graph.reset();
      expect(graph.timerActive).assertFalse();
      graph.startAll();
      expect(graph.timerActive).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
    });

    /**
     * @tc.name   startRejectionDoesNotIncrementPollTicks
     * @tc.desc   Repeated taps are refused without touching the poll counter or the timer state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startRejectionDoesNotIncrementPollTicks', 0, () => {
      const graph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.startAll()).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.timerActive).assertTrue();
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(1).attempts).assertEqual(1);
      expect(graph.events.countOf('start-rejected')).assertEqual(2);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('queued')).assertEqual(1);
    });

    /**
     * @tc.name   snapshotEqualityAfterDuplicateCompletion
     * @tc.desc   Duplicate callbacks do not change any snapshot, so two captures remain identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotEqualityAfterDuplicateCompletion', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      openGate(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(300);
      log.capture(graph.tasks);
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_C);
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(6);
      for (let index = 0; index < 3; index++) {
        const earlier: RunSnapshot = log.snapshots[index];
        const later: RunSnapshot = log.snapshots[index + 3];
        expect(earlier.sameAs(later)).assertTrue();
        expect(later.status).assertEqual(STATUS_COMPLETED);
        expect(later.progress).assertEqual(100);
      }
      expect(log.trace().split('|').length).assertEqual(6);
      expect(log.latest(TASK_C) !== undefined).assertTrue();
      const latest = log.latest(TASK_A);
      expect(latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.status).assertEqual(STATUS_COMPLETED);
        expect(latest.progress).assertEqual(PROGRESS_TOTAL);
      }
      expect(log.size()).assertEqual(2 * graph.tasks.length);
    });

    /**
     * @tc.name   graphEndStateAfterTwoSequentialRuns
     * @tc.desc   Two complete runs separated by a reset leave the same coherent terminal state twice.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphEndStateAfterTwoSequentialRuns', 0, () => {
      const graph = createTaskGraph();
      openGate(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      const firstEnd: string = graph.snapshotText();
      const firstFingerprint: number = graph.events.fingerprint();
      graph.reset();
      expect(graph.totalProgress()).assertEqual(0);
      openGate(graph);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      expect(graph.snapshotText()).assertEqual(firstEnd);
      expect(graph.events.fingerprint()).assertEqual(firstFingerprint);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(NetworkMetrics.from(graph).completedTasks).assertEqual(3);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   completionOrderMatrixAlwaysTopological
     * @tc.desc   Four scripts over four graphs all end with C last, whatever order A and B finish in.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionOrderMatrixAlwaysTopological', 0, () => {
      const orders: string[][] = [
        [TASK_A, TASK_B],
        [TASK_B, TASK_A],
        [TASK_A, TASK_B],
        [TASK_B, TASK_A]
      ];
      for (let index = 0; index < orders.length; index++) {
        const graph = createTaskGraph();
        graph.startAll();
        graph.completeTask(orders[index][0]);
        graph.completeTask(orders[index][1]);
        graph.pollTick(POLL_INTERVAL_MS);
        graph.completeTaskC(2 * POLL_INTERVAL_MS);
        expect(graph.completionOrder.length).assertEqual(3);
        expect(graph.completionOrder[2]).assertEqual(TASK_C);
        expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
        expect(completionTrace(graph).endsWith('|C')).assertTrue();
        expect(NetworkMetrics.from(graph).successRatio()).assertEqual(1);
      }
      expect(isTopologicalCompletion([TASK_A, TASK_C, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_C, TASK_A, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_B])).assertFalse();
    });

    /**
     * @tc.name   duplicateStartAttemptsCountedOnce
     * @tc.desc   A refused second start neither increments attempts nor duplicates the shared holders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AdvancedScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateStartAttemptsCountedOnce', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.startAll();
      graph.startAll();
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(1).attempts).assertEqual(1);
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.lock.sharedHolders.length).assertEqual(2);
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('start-rejected')).assertEqual(2);
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.taskAt(0).startedAt).assertEqual(0);
      logStep('AdvancedScenarios', 'rejected=' + String(graph.events.countOf('start-rejected')));
    });

    // End of advanced scenario suite.
  });
}
