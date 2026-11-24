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
 * SessionManagement suite.
 *
 * Treats one press of the start button as a run session. A session owns the
 * flag, the lock, the interval and the completion order, and reset is the only
 * way to open the next session. The suite pins that isolation so callbacks from
 * an old session cannot leak into a new one.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   60       isTaskFinished is the single session latch
 *   62-65    lock, completion booleans and the interval handle of one session
 *   174-198  startAllTasks builds a fresh AsyncLock and a fresh setInterval
 *   98-102   checkAndUnlock only consults the two booleans of this session
 *   250-259  the start button is disabled for the whole session
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  PROGRESS_TOTAL,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_FAILED,
  ERROR_NETWORK,
  DownloadTask,
  RunSnapshot,
  SnapshotLog,
  DependencyLock,
  TaskGraph,
  NetworkMetrics,
  createTaskGraph,
  completionTrace,
  isTopologicalCompletion,
  startButtonEnabled,
  textFingerprint
} from '../Shared/SharedDriver';

export default function sessionManagementTest(): void {
  describe('SessionManagement', () => {
    beforeAll(() => {
      logSuite('SessionManagement', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SessionManagement', 'end');
    });

    /**
     * @tc.name   freshGraphRepresentsAnIdleSession
     * @tc.desc   Before the first press the graph holds no session: no events, no holders and no ticks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshGraphRepresentsAnIdleSession', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
    });

    /**
     * @tc.name   onlyOneSessionRunsAtATime
     * @tc.desc   A second start while the first session runs is rejected and the first session survives intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('onlyOneSessionRunsAtATime', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      expect(graph.startAll()).assertFalse();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   sessionStartsWithTheBeginEvent
     * @tc.desc   The first recorded entry of a session is the start-all marker, which opens the trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionStartsWithTheBeginEvent', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.events.entries[0]).assertEqual('start-all:begin');
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.trace().startsWith('start-all:begin|')).assertTrue();
      expect(graph.events.size()).assertEqual(4);
    });

    /**
     * @tc.name   rejectionRecordsThePollTickOfTheSession
     * @tc.desc   The rejected second press logs the poll counter value the active session had reached.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rejectionRecordsThePollTickOfTheSession', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.pollTick(200);
      graph.pollTick(400);
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.startAll()).assertFalse();
      expect(graph.events.last()).assertEqual('start-rejected:2');
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   sessionSnapshotAtStartShowsTwoRunningRows
     * @tc.desc   A capture taken right after start records A and B running and C still idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sessionSnapshotAtStartShowsTwoRunningRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      expect(log.trace()).assertEqual('A/running/0|B/running/0|C/idle/0');
      const b: RunSnapshot | undefined = log.latest(TASK_B);
      expect(b !== undefined).assertTrue();
      if (b !== undefined) {
        expect(b.status).assertEqual(STATUS_RUNNING);
      }
    });

    /**
     * @tc.name   sessionSnapshotBeforeStartShowsIdleRows
     * @tc.desc   A capture taken before the first press stores three idle rows and no progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sessionSnapshotBeforeStartShowsIdleRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      expect(log.trace()).assertEqual('A/idle/0|B/idle/0|C/idle/0');
      expect(log.snapshots[0].status).assertEqual(STATUS_IDLE);
      expect(log.snapshots[1].progress).assertEqual(0);
      expect(log.snapshots[2].taskNo).assertEqual(TASK_C);
      expect(log.size()).assertEqual(3);
    });

    /**
     * @tc.name   sessionSnapshotAfterRunShowsThreeCompletedRows
     * @tc.desc   The final capture of a successful session reports every row completed at 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionSnapshotAfterRunShowsThreeCompletedRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      log.capture(graph.tasks);
      expect(log.trace()).assertEqual('A/completed/100|B/completed/100|C/completed/100');
      expect(log.size()).assertEqual(3);
      expect(log.latest(TASK_C) !== undefined).assertTrue();
      expect(graph.totalProgress()).assertEqual(3 * PROGRESS_TOTAL);
    });

    /**
     * @tc.name   sessionCompletionOrderFollowsCallbacks
     * @tc.desc   The order records the accepted callbacks of this session in arrival order and stays topological.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sessionCompletionOrderFollowsCallbacks', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
      expect(graph.completionOrder[0]).assertEqual(TASK_A);
    });

    /**
     * @tc.name   newSessionCompletionOrderStartsEmpty
     * @tc.desc   Reset drops the order of the previous session so the next session begins with no entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('newSessionCompletionOrderStartsEmpty', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 1);
      graph.completeTask(TASK_A, 2);
      expect(graph.completionOrder.length).assertEqual(2);
      graph.reset();
      expect(graph.completionOrder.length).assertEqual(0);
      expect(completionTrace(graph)).assertEqual('');
      expect(graph.events.size()).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
    });

    /**
     * @tc.name   resetOpensANewSessionWithEmptyTimeline
     * @tc.desc   After reset the timeline restarts: first entry is the new start-all marker and ticks are zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetOpensANewSessionWithEmptyTimeline', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.pollTick(1);
      graph.reset();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      graph.startAll();
      expect(graph.events.entries[0]).assertEqual('start-all:begin');
      expect(graph.events.size()).assertEqual(4);
      expect(graph.pollTicks).assertEqual(0);
    });

    /**
     * @tc.name   resetKeepsIdentityAndAttemptCounters
     * @tc.desc   A new session reuses the same task objects, so URLs and accumulated attempts survive the reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetKeepsIdentityAndAttemptCounters', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const a: DownloadTask = graph.taskAt(0);
      const url: string = a.url;
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.reset();
      expect(graph.taskAt(0).taskNo).assertEqual(a.taskNo);
      expect(a.url).assertEqual(url);
      expect(a.attempts).assertEqual(1);
      expect(a.status).assertEqual(STATUS_IDLE);
      expect(graph.tasks.length).assertEqual(3);
    });

    /**
     * @tc.name   secondSessionIgnoresFirstSessionOrder
     * @tc.desc   The order of session one does not reappear in session two, and the new order can be different.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondSessionIgnoresFirstSessionOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(completionTrace(graph)).assertEqual('A|B|C');
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_B, 11);
      graph.completeTask(TASK_A, 12);
      graph.pollTick(13);
      graph.completeTaskC(14);
      expect(completionTrace(graph)).assertEqual('B|A|C');
      expect(graph.completionOrder.length).assertEqual(3);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
    });

    /**
     * @tc.name   sessionTraceQueuesTaskCAfterTwoStarts
     * @tc.desc   The begin trace of a session announces exactly two starts followed by the queued exclusive C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionTraceQueuesTaskCAfterTwoStarts', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.eventTrace()).assertEqual('start-all:begin|started:A|started:B|queued:C');
      expect(graph.eventTrace().endsWith('queued:C')).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.countOf('queued')).assertEqual(1);
    });

    /**
     * @tc.name   sessionEndsOnlyWhenAllThreeRowsComplete
     * @tc.desc   The session remains open through every intermediate phase and closes only after C finishes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sessionEndsOnlyWhenAllThreeRowsComplete', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.allCompleted()).assertFalse();
      graph.completeTask(TASK_A, 1);
      expect(graph.allCompleted()).assertFalse();
      graph.completeTask(TASK_B, 2);
      expect(graph.allCompleted()).assertFalse();
      graph.pollTick(3);
      expect(graph.allCompleted()).assertFalse();
      graph.completeTaskC(4);
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   sessionTimerBelongsToOneSession
     * @tc.desc   The interval flag is raised by start, lowered when C starts and lowered again by reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionTimerBelongsToOneSession', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.timerActive).assertFalse();
      graph.startAll();
      expect(graph.timerActive).assertTrue();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(graph.timerActive).assertFalse();
      graph.reset();
      expect(graph.timerActive).assertFalse();
      graph.startAll();
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   startRejectionNeverOpensASecondSession
     * @tc.desc   A rejected press adds only a rejection marker; session counters and rows stay as they were.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startRejectionNeverOpensASecondSession', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const startedBefore: number = graph.events.countOf('started');
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(startedBefore);
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
    });

    /**
     * @tc.name   snapshotLogCanSpanTwoSessions
     * @tc.desc   The log keeps both sessions' captures, and the newest entry reflects the second session.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLogCanSpanTwoSessions', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.reset();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(6);
      expect(log.snapshots[0].status).assertEqual(STATUS_IDLE);
      expect(log.snapshots[3].status).assertEqual(STATUS_IDLE);
      expect(log.snapshots[3].progress).assertEqual(0);
      expect(log.trace().split('|').length).assertEqual(6);
    });

    /**
     * @tc.name   resetClearsLockCountersButKeepsTheObject
     * @tc.desc   The new session inherits the same lock object with acquisitions, rejections and owners cleared.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetClearsLockCountersButKeepsTheObject', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const lockBefore: DependencyLock = graph.lock;
      graph.startAll();
      graph.lock.acquireExclusive(TASK_C);
      expect(graph.lock.rejections).assertEqual(1);
      graph.reset();
      expect(graph.lock === lockBefore).assertTrue();
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   failureLeavesTheSessionOpenUntilReset
     * @tc.desc   A failed branch does not end the session: the flag stays false and the button stays disabled.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failureLeavesTheSessionOpenUntilReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      expect(graph.isTaskFinished).assertFalse();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(graph.allCompleted()).assertFalse();
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
    });

    /**
     * @tc.name   exclusiveOwnershipBelongsToTaskCOnly
     * @tc.desc   In a normal session only C ever takes the exclusive slot, and it gives it back on completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exclusiveOwnershipBelongsToTaskCOnly', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      graph.completeTaskC(4);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   sessionEventFingerprintDiffersBetweenSessions
     * @tc.desc   Two sessions with different completion orders leave different event fingerprints.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('sessionEventFingerprintDiffersBetweenSessions', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const firstPrint: number = graph.events.fingerprint();
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_B, 11);
      graph.completeTask(TASK_A, 12);
      graph.pollTick(13);
      graph.completeTaskC(14);
      const secondPrint: number = graph.events.fingerprint();
      expect(firstPrint === secondPrint).assertFalse();
      expect(textFingerprint(graph.eventTrace())).assertEqual(secondPrint);
      expect(graph.events.countOf('start-all')).assertEqual(1);
    });

    /**
     * @tc.name   sessionCompletionTraceUsesPipeFormat
     * @tc.desc   The session order string joins exactly three accepted task numbers with pipes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sessionCompletionTraceUsesPipeFormat', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const trace: string = completionTrace(graph);
      expect(trace).assertEqual('A|B|C');
      expect(trace.split('|').length).assertEqual(3);
      expect(trace.indexOf('|')).assertEqual(1);
      expect(trace.endsWith(TASK_C)).assertTrue();
    });

    /**
     * @tc.name   sessionRoundTripPreservesAllTaskUrls
     * @tc.desc   A whole session plus reset leaves the three download URLs untouched and still distinct.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sessionRoundTripPreservesAllTaskUrls', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const urls: string[] = [graph.taskAt(0).url, graph.taskAt(1).url, graph.taskAt(2).url];
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      graph.reset();
      expect(graph.taskAt(0).url).assertEqual(urls[0]);
      expect(graph.taskAt(1).url).assertEqual(urls[1]);
      expect(graph.taskAt(2).url).assertEqual(urls[2]);
      expect(urls[0] === urls[1]).assertFalse();
      expect(graph.taskAt(0).url.startsWith('https://')).assertTrue();
    });

    /**
     * @tc.name   repeatedRejectionsAccumulateInsideOneSession
     * @tc.desc   Three rejected presses inside one session add three markers that all quote the same tick count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedRejectionsAccumulateInsideOneSession', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.startAll()).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(3);
      expect(graph.events.last()).assertEqual('start-rejected:0');
      expect(graph.events.countOf('start-all')).assertEqual(1);
    });

    /**
     * @tc.name   standbyTaskCStaysIdleWhenNeverPolled
     * @tc.desc   A session whose interval never fires leaves C queued until reset ends the session.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('standbyTaskCStaysIdleWhenNeverPolled', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(graph.allCompleted()).assertFalse();
      graph.reset();
      expect(graph.taskAt(2).progress).assertEqual(0);
    });

    /**
     * @tc.name   completedSessionStillRefusesANewStart
     * @tc.desc   The latch is only reopened by reset, so a completed session cannot be restarted in place.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completedSessionStillRefusesANewStart', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.completionOrder.length).assertEqual(3);
    });

    /**
     * @tc.name   sessionMetricsAfterEachSession
     * @tc.desc   Metrics sampled before, during and after a session count completions per session snapshot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionMetricsAfterEachSession', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(NetworkMetrics.from(graph).completedTasks).assertEqual(0);
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const mid: NetworkMetrics = NetworkMetrics.from(graph);
      expect(mid.completedTasks).assertEqual(1);
      expect(mid.totalTasks).assertEqual(3);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const done: NetworkMetrics = NetworkMetrics.from(graph);
      expect(done.completedTasks).assertEqual(3);
      expect(done.totalProgress).assertEqual(300);
    });

    /**
     * @tc.name   threeSessionsKeepOrderIsolation
     * @tc.desc   Three consecutive sessions each record their own order without leaking entries between runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('threeSessionsKeepOrderIsolation', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const traces: string[] = [];
      for (let round = 0; round < 3; round++) {
        graph.startAll();
        graph.completeTask(TASK_B, round * 10 + 1);
        graph.completeTask(TASK_A, round * 10 + 2);
        graph.pollTick(round * 10 + 3);
        graph.completeTaskC(round * 10 + 4);
        traces.push(completionTrace(graph));
        expect(graph.startAll()).assertFalse();
        graph.reset();
      }
      expect(traces.length).assertEqual(3);
      expect(traces[0]).assertEqual('B|A|C');
      expect(traces[1]).assertEqual('B|A|C');
      expect(traces[2]).assertEqual('B|A|C');
      expect(graph.completionOrder.length).assertEqual(0);
    });

    /**
     * @tc.name   abortedSessionRestartsCleanlyAfterReset
     * @tc.desc   A session stopped by a failed branch leaves failed rows, and reset lets the next session finish.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('abortedSessionRestartsCleanlyAfterReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      expect(graph.taskAt(0).status).assertEqual(STATUS_FAILED);
      expect(graph.allCompleted()).assertFalse();
      graph.reset();
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
      graph.startAll();
      graph.completeTask(TASK_A, 5);
      graph.completeTask(TASK_B, 6);
      graph.pollTick(7);
      graph.completeTaskC(8);
      expect(graph.allCompleted()).assertTrue();
      expect(completionTrace(graph)).assertEqual('A|B|C');
    });

    /**
     * @tc.name   startButtonEnabledOnlyBetweenSessions
     * @tc.desc   The button helper maps exactly onto the session latch across three transitions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startButtonEnabledOnlyBetweenSessions', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      graph.startAll();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      graph.completeTask(TASK_A, 1);
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      graph.reset();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      graph.startAll();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
    });

    /**
     * @tc.name   sessionSnapshotCapturesMidRunProgress
     * @tc.desc   A capture taken while both shared downloads stream stores their partial values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionSnapshotCapturesMidRunProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.taskAt(0).reportProgress(30);
      graph.taskAt(1).reportProgress(55);
      log.capture(graph.tasks);
      expect(log.trace()).assertEqual('A/running/30|B/running/55|C/idle/0');
      expect(log.snapshots[0].progress).assertEqual(30);
      expect(log.snapshots[1].progress).assertEqual(55);
      expect(log.snapshots[2].progress).assertEqual(0);
      expect(log.size()).assertEqual(3);
    });

    /**
     * @tc.name   sessionLockAcquisitionsRestartForNewSession
     * @tc.desc   The acquisition counter of a finished session is cleared before the next session takes its slots.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionLockAcquisitionsRestartForNewSession', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(graph.lock.acquisitions).assertEqual(3);
      graph.reset();
      expect(graph.lock.acquisitions).assertEqual(0);
      graph.startAll();
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.lock.holderCount()).assertEqual(2);
    });

    /**
     * @tc.name   sessionTraceAfterFullRunEndsWithUnlockedC
     * @tc.desc   A finished session closes on the C completion followed by the final unlock announcement.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionTraceAfterFullRunEndsWithUnlockedC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const trace: string = graph.eventTrace();
      expect(trace.endsWith('completed:C|unlocked:C')).assertTrue();
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   newSessionStartsWithIdleTaskC
     * @tc.desc   The next session begins with C back at idle, zero progress and no exclusive owner.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('newSessionStartsWithIdleTaskC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      graph.reset();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.taskAt(2).startedAt).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   pollCountsBelongToTheirSession
     * @tc.desc   Each session counts its own ticks and a reset starts the counter from zero again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollCountsBelongToTheirSession', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.pollTick(1);
      graph.pollTick(2);
      expect(graph.pollTicks).assertEqual(2);
      graph.reset();
      expect(graph.pollTicks).assertEqual(0);
      graph.startAll();
      graph.pollTick(3);
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
    });

    /**
     * @tc.name   sessionWithoutTaskCCompletionNeverEnds
     * @tc.desc   A running C keeps the session open even though both prerequisites are already complete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionWithoutTaskCCompletionNeverEnds', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.allCompleted()).assertFalse();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.startAll()).assertFalse();
    });

    /**
     * @tc.name   secondSessionSnapshotsAreTheNewestEntries
     * @tc.desc   After a second capture the latest lookup returns the second session values, not the first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondSessionSnapshotsAreTheNewestEntries', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      log.capture(graph.tasks);
      graph.reset();
      graph.startAll();
      log.capture(graph.tasks);
      const latest: RunSnapshot | undefined = log.latest(TASK_A);
      expect(latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.status).assertEqual(STATUS_RUNNING);
        expect(latest.progress).assertEqual(0);
      }
      expect(log.size()).assertEqual(6);
      expect(log.snapshots[3].status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   failedSessionTraceDiffersFromCleanSession
     * @tc.desc   A session that logged a failure cannot share the fingerprint of a clean session with equal rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedSessionTraceDiffersFromCleanSession', 0, () => {
      const clean: TaskGraph = createTaskGraph();
      clean.startAll();
      clean.completeTask(TASK_A, 1);
      clean.completeTask(TASK_B, 2);
      clean.pollTick(3);
      clean.completeTaskC(4);
      const failed: TaskGraph = createTaskGraph();
      failed.startAll();
      failed.taskAt(1).fail(ERROR_NETWORK);
      failed.events.record('failed', TASK_B);
      expect(clean.events.size()).assertEqual(11);
      expect(failed.events.size()).assertEqual(5);
      expect(clean.events.fingerprint() === failed.events.fingerprint()).assertFalse();
      expect(failed.events.last()).assertEqual('failed:B');
      expect(clean.events.last()).assertEqual('unlocked:C');
    });

    /**
     * @tc.name   taskCRemainsLastInEveryLegalOrder
     * @tc.desc   Across both prerequisite orders the session always records C as the last accepted completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskCRemainsLastInEveryLegalOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const firstOrder: string[] = graph.completionOrder.slice();
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_B, 11);
      graph.completeTask(TASK_A, 12);
      graph.pollTick(13);
      graph.completeTaskC(14);
      expect(firstOrder[firstOrder.length - 1]).assertEqual(TASK_C);
      expect(graph.completionOrder[graph.completionOrder.length - 1]).assertEqual(TASK_C);
      expect(isTopologicalCompletion(firstOrder)).assertTrue();
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
    });
  });
}
