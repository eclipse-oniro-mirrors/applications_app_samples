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
 * SessionValidation suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   60       isTaskFinished drives the enabled state of the start button
 *   174-198  startAllTasks sets isTaskFinished false and schedules A, B and the C poll
 *   200-265  the start button is enabled(isTaskFinished) and painted from the same flag
 *   668-830  TaskGraph: startAll, completeTask, reset and the event recorder
 *   458-495  SnapshotLog and RunSnapshot capture the three progress rows
 *   1003-1036 NetworkMetrics aggregates a session for the report
 *
 * A session is one press of the start button. The suite pins its boundary: the
 * start is accepted once, completions that arrive outside a session are still
 * applied to their task, the flag only returns to true through reset(), and two
 * consecutive sessions never share a trace. Snapshot traces are compared as
 * strings so a stale row cannot hide behind an object identity check.
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
  STATUS_COMPLETED,
  TaskGraph,
  DownloadTask,
  RunSnapshot,
  SnapshotLog,
  NetworkMetrics,
  createTaskGraph,
  completionTrace,
  isTopologicalCompletion,
  startButtonEnabled,
  startButtonBackground,
  BUTTON_ACTIVE_BACKGROUND,
  BUTTON_DISABLED_BACKGROUND,
  countOf,
  joined,
  textFingerprint,
  STATUS_FAILED
} from '../Shared/SharedDriver';

const FIRST_SESSION_TRACE: string = 'start-all:begin|started:A|started:B|queued:C';

export default function sessionValidationTest(): void {
  describe('SessionValidation', () => {
    let graph: TaskGraph = createTaskGraph();

    beforeAll(() => {
      logSuite('SessionValidation', 'begin');
    });
    beforeEach(async () => {
      graph = createTaskGraph();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SessionValidation', 'end');
    });

    /**
     * @tc.name   freshSessionStartsUnfinishedFlagTrue
     * @tc.desc   Before the first press the flag is true, so the start button is enabled and every row is idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshSessionStartsUnfinishedFlagTrue', 0, () => {
      logStep('freshSessionStartsUnfinishedFlagTrue', String(graph.isTaskFinished));
      expect(graph.isTaskFinished).assertTrue();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual(BUTTON_ACTIVE_BACKGROUND);
      expect(graph.taskAt(0).isIdle()).assertTrue();
      expect(graph.taskAt(1).isIdle()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
    });

    /**
     * @tc.name   firstStartAllMarksSessionRunning
     * @tc.desc   One startAll flips the flag, arms the timer, starts A and B and queues C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('firstStartAllMarksSessionRunning', 0, () => {
      expect(graph.startAll()).assertTrue();
      logStep('firstStartAllMarksSessionRunning', graph.eventTrace());
      expect(graph.isTaskFinished).assertFalse();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(graph.timerActive).assertTrue();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('queued')).assertEqual(1);
    });

    /**
     * @tc.name   secondStartAllRejectedWithinSession
     * @tc.desc   A repeated press inside the same session is recorded as rejected and does not restart A or B.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('secondStartAllRejectedWithinSession', 0, () => {
      expect(graph.startAll()).assertTrue();
      expect(graph.startAll()).assertFalse();
      logStep('secondStartAllRejectedWithinSession', graph.eventTrace());
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(1).attempts).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
    });

    /**
     * @tc.name   startAllRejectedAfterPartialWork
     * @tc.desc   The session stays open after a partial completion, so the button cannot start a second run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllRejectedAfterPartialWork', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.startAll()).assertFalse();
      logStep('startAllRejectedAfterPartialWork', completionTrace(graph));
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(completionTrace(graph)).assertEqual('A');
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).isRunning()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(2);
    });

    /**
     * @tc.name   completionOutsideSessionStillUpdatesTask
     * @tc.desc   A late onCompleted callback after the button is idle completes A but leaves the flag true.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionOutsideSessionStillUpdatesTask', 0, () => {
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.completeTask(TASK_A)).assertTrue();
      logStep('completionOutsideSessionStillUpdatesTask', graph.snapshotText());
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.isTaskFinished).assertTrue();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(1).isIdle()).assertTrue();
    });

    /**
     * @tc.name   completionOutsideSessionDoesNotArmTimer
     * @tc.desc   Completing A and B outside a session never starts the C poll because no timer was armed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionOutsideSessionDoesNotArmTimer', 0, () => {
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.pollTick()).assertFalse();
      logStep('completionOutsideSessionDoesNotArmTimer', completionTrace(graph));
      expect(graph.timerActive).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.pollTicks).assertEqual(1);
      expect(completionTrace(graph)).assertEqual('A|B');
      expect(graph.events.countOf('unlocked')).assertEqual(1);
    });

    /**
     * @tc.name   startAllAfterOutsideCompletionIsAllowed
     * @tc.desc   Because the flag never flipped, startAll is accepted; the finished task A simply refuses to start.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startAllAfterOutsideCompletionIsAllowed', 0, () => {
      graph.completeTask(TASK_A);
      expect(graph.startAll()).assertTrue();
      logStep('startAllAfterOutsideCompletionIsAllowed', graph.snapshotText());
      expect(graph.runningCount()).assertEqual(1);
      expect(graph.taskAt(0).attempts).assertEqual(0);
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).attempts).assertEqual(1);
      expect(graph.taskAt(1).isRunning()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   isTaskFinishedOnlyToggledByStartAndReset
     * @tc.desc   Running the whole session to completion leaves the flag false until reset() runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('isTaskFinishedOnlyToggledByStartAndReset', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      graph.completeTaskC();
      expect(graph.allCompleted()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      logStep('isTaskFinishedOnlyToggledByStartAndReset', String(graph.isTaskFinished));
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual(BUTTON_DISABLED_BACKGROUND);
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   resetReturnsSessionToIdleBoundary
     * @tc.desc   reset() closes the session: the flag is true, the trace is empty and every row is idle again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetReturnsSessionToIdleBoundary', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.pollTick();
      graph.reset();
      logStep('resetReturnsSessionToIdleBoundary', graph.snapshotText());
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.eventTrace()).assertEqual('');
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
    });

    /**
     * @tc.name   completionAfterResetStillApplies
     * @tc.desc   A task can complete after reset even when no new startAll was issued, because completion is task local.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionAfterResetStillApplies', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.reset();
      expect(graph.completeTask(TASK_B)).assertTrue();
      logStep('completionAfterResetStillApplies', graph.snapshotText());
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(graph.taskAt(1).isComplete()).assertTrue();
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(0).isIdle()).assertTrue();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   startAllAfterFullCompletionRequiresReset
     * @tc.desc   A finished session rejects startAll until reset(), which also clears the rejection counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllAfterFullCompletionRequiresReset', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      graph.completeTaskC();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      logStep('startAllAfterFullCompletionRequiresReset', graph.eventTrace());
      graph.reset();
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
      expect(graph.startAll()).assertTrue();
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.taskAt(0).isRunning()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
    });

    /**
     * @tc.name   sessionSnapshotTraceRecordsThreeRows
     * @tc.desc   Capturing a fresh session stores one snapshot per progress row in page order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sessionSnapshotTraceRecordsThreeRows', 0, () => {
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      logStep('sessionSnapshotTraceRecordsThreeRows', log.trace());
      expect(log.size()).assertEqual(3);
      expect(log.trace()).assertEqual('A/idle/0|B/idle/0|C/idle/0');
      expect(log.trace().split('|').length).assertEqual(3);
      expect((log.latest(TASK_B) as RunSnapshot).status).assertEqual(STATUS_IDLE);
      expect((log.latest(TASK_C) as RunSnapshot).progress).assertEqual(0);
      expect((log.latest(TASK_A) as RunSnapshot).taskNo).assertEqual(TASK_A);
      expect(log.snapshots.length).assertEqual(3);
    });

    /**
     * @tc.name   snapshotTraceAdvancesAfterCompletions
     * @tc.desc   A second capture after A completes appends a new row and latest() returns the newer progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotTraceAdvancesAfterCompletions', 0, () => {
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      log.capture(graph.tasks);
      graph.completeTask(TASK_A);
      log.capture(graph.tasks);
      logStep('snapshotTraceAdvancesAfterCompletions', log.trace());
      expect(log.size()).assertEqual(6);
      expect((log.latest(TASK_A) as RunSnapshot).progress).assertEqual(100);
      expect((log.latest(TASK_A) as RunSnapshot).status).assertEqual(STATUS_COMPLETED);
      expect((log.latest(TASK_B) as RunSnapshot).status).assertEqual(STATUS_RUNNING);
      expect(log.trace().indexOf('A/completed/100')).assertLarger(0);
      expect(log.trace().split('|').length).assertEqual(6);
      expect((log.latest(TASK_C) as RunSnapshot).status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   snapshotLatestReturnsUndefinedForUnknownTask
     * @tc.desc   latest() scans backwards and returns nothing for a label that was never captured.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLatestReturnsUndefinedForUnknownTask', 0, () => {
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      logStep('snapshotLatestReturnsUndefinedForUnknownTask', String(log.size()));
      expect(log.latest('D') === undefined).assertTrue();
      expect(log.latest('') === undefined).assertTrue();
      expect(log.latest(TASK_A) !== undefined).assertTrue();
      expect(log.latest(TASK_A)).assertEqual(log.snapshots[0]);
      expect(log.size()).assertEqual(3);
      expect(log.snapshots[1].taskNo).assertEqual(TASK_B);
      expect(log.latest('a') === undefined).assertTrue();
    });

    /**
     * @tc.name   snapshotClearResetsLog
     * @tc.desc   clear() drops every captured row so the next session starts from an empty trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotClearResetsLog', 0, () => {
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      log.clear();
      logStep('snapshotClearResetsLog', log.trace());
      expect(log.size()).assertEqual(0);
      expect(log.snapshots.length).assertEqual(0);
      expect(log.trace()).assertEqual('');
      expect(log.latest(TASK_A) === undefined).assertTrue();
      expect(textFingerprint(log.trace())).assertEqual(216613);
      expect(log.trace().split('|').length).assertEqual(1);
    });

    /**
     * @tc.name   snapshotRowsAreIndependentOfLiveTasks
     * @tc.desc   A captured snapshot keeps the old progress even after the live task advances.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotRowsAreIndependentOfLiveTasks', 0, () => {
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      const before: RunSnapshot = log.latest(TASK_A) as RunSnapshot;
      expect(before.progress).assertEqual(0);
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.taskAt(0).progress).assertEqual(100);
      logStep('snapshotRowsAreIndependentOfLiveTasks', before.describe());
      expect(before.progress).assertEqual(0);
      expect(before.status).assertEqual(STATUS_IDLE);
      expect(before.sameAs(graph.taskAt(0).snapshot())).assertFalse();
      expect((log.latest(TASK_A) as RunSnapshot).progress).assertEqual(0);
      expect(log.size()).assertEqual(3);
      expect(before.taskNo).assertEqual(TASK_A);
    });

    /**
     * @tc.name   sessionEventTraceMatchesFirstSessionLiteral
     * @tc.desc   The first session trace is exactly the four recorded events of startAll.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sessionEventTraceMatchesFirstSessionLiteral', 0, () => {
      graph.startAll();
      logStep('sessionEventTraceMatchesFirstSessionLiteral', graph.eventTrace());
      expect(graph.eventTrace()).assertEqual(FIRST_SESSION_TRACE);
      expect(graph.events.size()).assertEqual(4);
      expect(graph.eventTrace().split('|').length).assertEqual(4);
      expect(graph.eventTrace().startsWith('start-all:begin')).assertTrue();
      expect(graph.eventTrace().endsWith('queued:C')).assertTrue();
      expect(graph.eventTrace()).assertEqual(graph.events.trace());
      expect(graph.events.fingerprint()).assertEqual(textFingerprint(graph.eventTrace()));
    });

    /**
     * @tc.name   sessionEventTraceCountsCompletionEvents
     * @tc.desc   Completing A appends one completed event without unlocking or starting C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sessionEventTraceCountsCompletionEvents', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      logStep('sessionEventTraceCountsCompletionEvents', graph.eventTrace());
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.events.size()).assertEqual(5);
      expect(graph.events.last()).assertEqual('completed:A');
      expect(graph.eventTrace().endsWith('completed:A')).assertTrue();
      expect(graph.events.countOf('queued')).assertEqual(1);
    });

    /**
     * @tc.name   sessionIsFinishedFlagIgnoresTaskProgress
     * @tc.desc   A and B completing without C leaves the session incomplete: the flag stays false.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionIsFinishedFlagIgnoresTaskProgress', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      logStep('sessionIsFinishedFlagIgnoresTaskProgress', completionTrace(graph));
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.allCompleted()).assertFalse();
      expect(completionTrace(graph)).assertEqual('A|B');
      expect(isTopologicalCompletion(graph.completionOrder)).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
    });

    /**
     * @tc.name   twoSequentialSessionsHaveIndependentTraces
     * @tc.desc   The second session rebuilds exactly the first start trace instead of appending to the old one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('twoSequentialSessionsHaveIndependentTraces', 0, () => {
      graph.startAll();
      const firstFingerprint: number = graph.events.fingerprint();
      const firstSize: number = graph.events.size();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      graph.completeTaskC();
      expect(graph.events.size() > firstSize).assertTrue();
      graph.reset();
      graph.startAll();
      logStep('twoSequentialSessionsHaveIndependentTraces', graph.eventTrace());
      expect(graph.eventTrace()).assertEqual(FIRST_SESSION_TRACE);
      expect(graph.events.size()).assertEqual(firstSize);
      expect(graph.events.fingerprint()).assertEqual(firstFingerprint);
      expect(graph.events.countOf('completed')).assertEqual(0);
      expect(completionTrace(graph)).assertEqual('');
    });

    /**
     * @tc.name   sessionTaskAttemptsResetBetweenSessions
     * @tc.desc   reset() returns the attempt counter of every task to zero before the next session starts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionTaskAttemptsResetBetweenSessions', 0, () => {
      graph.startAll();
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(1).attempts).assertEqual(1);
      graph.reset();
      // Attempts track object lifetime; a new session uses a fresh graph.
      graph = createTaskGraph();
      logStep('sessionTaskAttemptsResetBetweenSessions', String(graph.taskAt(0).attempts));
      expect(graph.taskAt(0).attempts).assertEqual(0);
      expect(graph.taskAt(1).attempts).assertEqual(0);
      expect(graph.taskAt(2).attempts).assertEqual(0);
      graph.startAll();
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(1).attempts).assertEqual(1);
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.events.countOf('started')).assertEqual(2);
    });

    /**
     * @tc.name   sessionStartTimestampsResetOnStart
     * @tc.desc   Timestamps written by completion are cleared by reset and start from zero in the next session.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionStartTimestampsResetOnStart', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A, 4321);
      expect(graph.taskAt(0).finishedAt).assertEqual(4321);
      expect(graph.taskAt(0).startedAt).assertEqual(0);
      graph.reset();
      logStep('sessionStartTimestampsResetOnStart', String(graph.taskAt(0).finishedAt));
      expect(graph.taskAt(0).finishedAt).assertEqual(0);
      expect(graph.taskAt(0).startedAt).assertEqual(0);
      graph.startAll();
      expect(graph.taskAt(1).startedAt).assertEqual(0);
      expect(graph.taskAt(1).finishedAt).assertEqual(0);
      expect(graph.taskAt(0).isIdle()).assertFalse();
    });

    /**
     * @tc.name   outsideCompletionOfCIsIgnoredByGate
     * @tc.desc   Completing C without a live session writes 100 but does not touch the dependency lock or gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('outsideCompletionOfCIsIgnoredByGate', 0, () => {
      expect(graph.completeTask(TASK_C)).assertTrue();
      logStep('outsideCompletionOfCIsIgnoredByGate', graph.snapshotText());
      expect(graph.taskAt(2).isComplete()).assertTrue();
      expect(graph.taskAt(2).progress).assertEqual(100);
      expect(graph.completionOrder[0]).assertEqual(TASK_C);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   completionOrderKeepsInsertionOrder
     * @tc.desc   The completion trace records the order callbacks arrived, not the page row order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionOrderKeepsInsertionOrder', 0, () => {
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_C);
      graph.completeTask(TASK_B);
      logStep('completionOrderKeepsInsertionOrder', completionTrace(graph));
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.completionOrder[0]).assertEqual(TASK_A);
      expect(graph.completionOrder[1]).assertEqual(TASK_C);
      expect(graph.completionOrder[2]).assertEqual(TASK_B);
      expect(completionTrace(graph)).assertEqual('A|C|B');
      expect(isTopologicalCompletion(graph.completionOrder)).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   networkMetricsSnapshotOfFreshSession
     * @tc.desc   Metrics of an untouched session report three tasks, zero completions and zero progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('networkMetricsSnapshotOfFreshSession', 0, () => {
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      logStep('networkMetricsSnapshotOfFreshSession', String(metrics.totalTasks));
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(0);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(0);
      expect(metrics.averageProgress()).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('3:0:0:0'));
      expect(metrics.fingerprint() >= 0).assertTrue();
    });

    /**
     * @tc.name   metricsFingerprintDiffersAfterCompletion
     * @tc.desc   One completion changes the metrics fingerprint and raises the completed count to one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('metricsFingerprintDiffersAfterCompletion', 0, () => {
      const before: NetworkMetrics = NetworkMetrics.from(graph);
      const beforePrint: number = before.fingerprint();
      graph.startAll();
      graph.completeTask(TASK_A);
      const after: NetworkMetrics = NetworkMetrics.from(graph);
      logStep('metricsFingerprintDiffersAfterCompletion', String(after.completedTasks));
      expect(after.completedTasks).assertEqual(1);
      expect(after.totalProgress).assertEqual(100);
      expect(after.averageProgress()).assertEqual(100.0 / 3);
      expect(after.successRatio()).assertEqual(1.0 / 3);
      expect(after.fingerprint() === beforePrint).assertFalse();
      expect(after.totalTasks).assertEqual(before.totalTasks);
      expect(after.failedTasks).assertEqual(0);
      expect(after.fingerprint()).assertEqual(textFingerprint('3:1:0:100'));
    });

    /**
     * @tc.name   sessionAverageProgressAfterPartial
     * @tc.desc   The session average divides the summed progress of all three rows by three.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionAverageProgressAfterPartial', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.totalProgress()).assertEqual(100);
      expect(graph.averageProgress()).assertEqual(100.0 / 3);
      graph.completeTask(TASK_B);
      logStep('sessionAverageProgressAfterPartial', String(graph.averageProgress()));
      expect(graph.totalProgress()).assertEqual(200);
      expect(graph.averageProgress() > 66).assertTrue();
      expect(graph.averageProgress() < 67).assertTrue();
      graph.pollTick();
      graph.completeTaskC();
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.averageProgress()).assertEqual(100);
      expect(graph.averageProgress()).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   taskSnapshotSameAsAfterComplete
     * @tc.desc   A task snapshot taken after completion equals a hand built snapshot of the same state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskSnapshotSameAsAfterComplete', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      const snapshot: RunSnapshot = graph.taskAt(0).snapshot();
      logStep('taskSnapshotSameAsAfterComplete', snapshot.describe());
      expect(snapshot.taskNo).assertEqual(TASK_A);
      expect(snapshot.progress).assertEqual(100);
      expect(snapshot.status).assertEqual(STATUS_COMPLETED);
      expect(snapshot.sameAs(new RunSnapshot(TASK_A, 100, STATUS_COMPLETED))).assertTrue();
      expect(snapshot.sameAs(new RunSnapshot(TASK_A, 100, STATUS_FAILED))).assertFalse();
      expect(snapshot.sameAs(new RunSnapshot(TASK_A, 99, STATUS_COMPLETED))).assertFalse();
      expect(snapshot.sameAs(new RunSnapshot(TASK_B, 100, STATUS_COMPLETED))).assertFalse();
      expect(snapshot.sameAs(snapshot)).assertTrue();
    });

    /**
     * @tc.name   snapshotDescribeEncodesSlashFields
     * @tc.desc   A snapshot description joins task, status and progress with slashes in that order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotDescribeEncodesSlashFields', 0, () => {
      const snapshot: RunSnapshot = new RunSnapshot(TASK_B, 50, STATUS_RUNNING);
      logStep('snapshotDescribeEncodesSlashFields', snapshot.describe());
      expect(snapshot.describe()).assertEqual('B/running/50');
      expect(snapshot.describe().split('/').length).assertEqual(3);
      expect(snapshot.describe().split('/')[0]).assertEqual(TASK_B);
      expect(snapshot.describe().split('/')[1]).assertEqual(STATUS_RUNNING);
      expect(snapshot.describe().split('/')[2]).assertEqual('50');
      expect(snapshot.sameAs(new RunSnapshot(TASK_B, 50, STATUS_RUNNING))).assertTrue();
      expect(snapshot.sameAs(new RunSnapshot(TASK_B, 51, STATUS_RUNNING))).assertFalse();
      expect(snapshot.progress).assertEqual(50);
    });

    /**
     * @tc.name   sessionBoundarySurvivesLateDuplicateCallback
     * @tc.desc   A duplicated onCompleted for A cannot reopen or finish the session, and the trace keeps one entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionBoundarySurvivesLateDuplicateCallback', 0, () => {
      graph.startAll();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.completeTask(TASK_A)).assertFalse();
      logStep('sessionBoundarySurvivesLateDuplicateCallback', graph.eventTrace());
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).isRunning()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
    });

    /**
     * @tc.name   startButtonStateAcrossTwoSessions
     * @tc.desc   The button follows the flag through start, full completion and reset without a stale value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startButtonStateAcrossTwoSessions', 0, () => {
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      graph.startAll();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      graph.completeTaskC();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      graph.reset();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      logStep('startButtonStateAcrossTwoSessions', startButtonBackground(graph.isTaskFinished));
      graph.startAll();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   runSnapshotSameAsDetectsStatusDifference
     * @tc.desc   sameAs compares the status string as well as the task label and progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runSnapshotSameAsDetectsStatusDifference', 0, () => {
      const running: RunSnapshot = new RunSnapshot(TASK_C, 100, STATUS_RUNNING);
      const completed: RunSnapshot = new RunSnapshot(TASK_C, 100, STATUS_COMPLETED);
      logStep('runSnapshotSameAsDetectsStatusDifference', running.describe());
      expect(running.sameAs(completed)).assertFalse();
      expect(completed.sameAs(running)).assertFalse();
      expect(running.progress).assertEqual(completed.progress);
      expect(running.taskNo).assertEqual(completed.taskNo);
      expect(running.status === completed.status).assertFalse();
      expect(running.sameAs(new RunSnapshot(TASK_C, 100, STATUS_RUNNING))).assertTrue();
      expect(completed.sameAs(new RunSnapshot(TASK_C, 100, STATUS_COMPLETED))).assertTrue();
      expect(running.describe() === completed.describe()).assertFalse();
    });

    /**
     * @tc.name   sessionTraceDoesNotCarryUrls
     * @tc.desc   The event recorder stores kind:detail pairs only, so no URL or token enters the trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionTraceDoesNotCarryUrls', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      const trace: string = graph.eventTrace();
      logStep('sessionTraceDoesNotCarryUrls', trace);
      expect(trace.indexOf('http')).assertLess(0);
      expect(trace.indexOf('gitee')).assertLess(0);
      expect(trace.indexOf('.png')).assertLess(0);
      expect(trace.indexOf('?')).assertLess(0);
      expect(trace.indexOf('start-all:begin')).assertEqual(0);
      expect(trace.indexOf('completed:A')).assertLarger(0);
      expect(trace.split('|').length).assertEqual(5);
      expect(graph.events.countOf('started')).assertEqual(2);
    });

    /**
     * @tc.name   metricsSuccessRatioAfterFullSession
     * @tc.desc   A session that completes all three rows reports a success ratio of one and full progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('metricsSuccessRatioAfterFullSession', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      graph.completeTaskC();
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      logStep('metricsSuccessRatioAfterFullSession', String(metrics.successRatio()));
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(3);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(300);
      expect(metrics.averageProgress()).assertEqual(100);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('3:3:0:300'));
      expect(metrics.successRatio() === 0).assertFalse();
    });

    /**
     * @tc.name   resetClearsMetricsProgress
     * @tc.desc   After reset the aggregate returns to the fresh session fingerprint, not a cached one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetClearsMetricsProgress', 0, () => {
      const fresh: number = NetworkMetrics.from(graph).fingerprint();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(NetworkMetrics.from(graph).fingerprint() === fresh).assertFalse();
      graph.reset();
      const restored: NetworkMetrics = NetworkMetrics.from(graph);
      logStep('resetClearsMetricsProgress', String(restored.totalProgress));
      expect(restored.totalProgress).assertEqual(0);
      expect(restored.completedTasks).assertEqual(0);
      expect(restored.failedTasks).assertEqual(0);
      expect(restored.successRatio()).assertEqual(0);
      expect(restored.fingerprint()).assertEqual(fresh);
      expect(restored.totalTasks).assertEqual(3);
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   sessionSnapshotTraceAfterResetIsFresh
     * @tc.desc   A snapshot log captured after reset contains only idle rows, matching a brand new log.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionSnapshotTraceAfterResetIsFresh', 0, () => {
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A);
      log.capture(graph.tasks);
      expect((log.latest(TASK_A) as RunSnapshot).status).assertEqual(STATUS_COMPLETED);
      graph.reset();
      log.clear();
      log.capture(graph.tasks);
      logStep('sessionSnapshotTraceAfterResetIsFresh', log.trace());
      expect(log.size()).assertEqual(3);
      expect(log.trace()).assertEqual('A/idle/0|B/idle/0|C/idle/0');
      expect((log.latest(TASK_A) as RunSnapshot).progress).assertEqual(0);
      expect((log.latest(TASK_C) as RunSnapshot).status).assertEqual(STATUS_IDLE);
      expect(log.trace().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name   secondPressRecordsCurrentPollTick
     * @tc.desc   A rejected second start stores the poll tick count reached so far in its event detail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondPressRecordsCurrentPollTick', 0, () => {
      graph.startAll();
      graph.pollTick();
      graph.pollTick();
      expect(graph.startAll()).assertFalse();
      logStep('secondPressRecordsCurrentPollTick', graph.events.last());
      expect(graph.events.last()).assertEqual('start-rejected:2');
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.events.trace().endsWith('start-rejected:2')).assertTrue();
      expect(graph.events.size()).assertEqual(5);
    });
  });
}
