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
 * Whole-system integration suite.
 *
 * It walks one full lifecycle of the model rebuilt in Shared/SharedDriver:
 * seed -> start -> progress -> A/B completion -> gate -> C start -> C finish
 * -> metrics. Every stage is asserted before the next one runs, so a break in
 * the middle of the chain is reported at the stage that caused it.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-65   three progress values, isTaskFinished, lock, A/B completion flags
 *   68-76   updateProgress writes 100 for one task only
 *   79-102  completeTaskA/B, checkAndUnlock, canRunTaskC
 *   109-148 download(): DOWNLOAD, overwrite, GET, './' saveas
 *   174-198 startAllTasks(): shared A/B, exclusive C, 200 ms poll
 *   200-265 progress rows, labels and the enabled(isTaskFinished) button
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
  createTaskGraph,
  expectedGateOpen,
  expectedStepStatus,
  isTopologicalCompletion,
  completionTrace,
  progressLabel,
  startButtonEnabled,
  startButtonBackground,
  NetworkMetrics,
  ReferenceGraph,
  PollClock,
  SnapshotLog,
  textFingerprint,
  TaskGraph
} from '../Shared/SharedDriver';

/** Module-level graph reused by the ordered lifecycle cases. */
let sharedGraph: TaskGraph = createTaskGraph();

export default function systemIntegrationTest(): void {
  describe('SystemIntegration', () => {
    beforeAll(() => {
      logSuite('SystemIntegration', 'begin');
    });
    beforeEach(async () => {
      sharedGraph = createTaskGraph();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SystemIntegration', 'end');
    });

    /**
     * @tc.name   freshGraphIsIdleBeforeFirstRun
     * @tc.desc   A seeded graph renders three idle rows, a full progress budget and an enabled start button.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshGraphIsIdleBeforeFirstRun', 0, () => {
      const graph = createTaskGraph();
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.allCompleted()).assertFalse();
      for (let index = 0; index < graph.tasks.length; index++) {
        expect(graph.taskAt(index).status).assertEqual(STATUS_IDLE);
        expect(graph.taskAt(index).isIdle()).assertTrue();
        expect(graph.taskAt(index).progress).assertEqual(0);
      }
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
    });

    /**
     * @tc.name   startAllFlipsFinishedFlagAndStartsSharedPair
     * @tc.desc   startAllTasks disables the button, runs A and B together and leaves C untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllFlipsFinishedFlagAndStartsSharedPair', 0, () => {
      const graph = createTaskGraph();
      const accepted = graph.startAll();
      expect(accepted).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(0).isRunning()).assertTrue();
      expect(graph.taskAt(1).isRunning()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(1).attempts).assertEqual(1);
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.size()).assertEqual(4);
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#C0C4CC');
    });

    /**
     * @tc.name   startAllQueuesExclusiveTaskCBehindSharedHolders
     * @tc.desc   The lock mirror reports two shared holders, a waiting exclusive request and no grant yet.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllQueuesExclusiveTaskCBehindSharedHolders', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.sharedHolders.length).assertEqual(2);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.lock.isUnlocked()).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.events.last()).assertEqual('queued:C');
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   secondStartRejectedWhileFirstRunInFlight
     * @tc.desc   A second tap during a run is refused without touching attempts, timer or lock holders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('secondStartRejectedWhileFirstRunInFlight', 0, () => {
      const graph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      const before = graph.events.size();
      expect(graph.startAll()).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.size()).assertEqual(before + 2);
      expect(graph.events.countOf('start-rejected')).assertEqual(2);
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(1).attempts).assertEqual(1);
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.timerActive).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
    });

    /**
     * @tc.name   gateClosedAfterOnlyTaskACompletes
     * @tc.desc   Completing A alone releases one shared holder but keeps C locked and idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateClosedAfterOnlyTaskACompletes', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.runTaskCIfReady()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(expectedGateOpen(true, false)).assertFalse();
      expect(expectedStepStatus(true, false)).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   gateClosedAfterOnlyTaskBCompletes
     * @tc.desc   The mirror case: B finishing first is not enough to unlock the exclusive task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateClosedAfterOnlyTaskBCompletes', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_B)).assertTrue();
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.lock.hasShared(TASK_B)).assertFalse();
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(expectedGateOpen(false, true)).assertFalse();
    });

    /**
     * @tc.name   gateOpensOnSecondDependencyCompletion
     * @tc.desc   With A and B both complete the gate predicate holds and one unlock event is recorded.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateOpensOnSecondDependencyCompletion', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.completeTask(TASK_B)).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(expectedGateOpen(true, true)).assertTrue();
      expect(expectedStepStatus(true, true)).assertEqual(STATUS_COMPLETED);
      expect(isTopologicalCompletion([TASK_A, TASK_B, TASK_C])).assertTrue();
    });

    /**
     * @tc.name   unlockEventRecordedExactlyOnce
     * @tc.desc   Repeated completion calls on A and B keep a single unlock record for the run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unlockEventRecordedExactlyOnce', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      const afterGate = graph.events.size();
      expect(graph.completeTask(TASK_A)).assertFalse();
      expect(graph.completeTask(TASK_B)).assertFalse();
      expect(graph.events.size()).assertEqual(afterGate);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_TOTAL);
      logStep('SystemIntegration', 'unlock=' + String(graph.events.countOf('unlocked')));
    });

    /**
     * @tc.name   earlyPollKeepsTimerAliveWithoutStartingC
     * @tc.desc   A 200 ms round fired before the gate opens counts but never starts the exclusive task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('earlyPollKeepsTimerAliveWithoutStartingC', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.timerActive).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      graph.completeTask(TASK_A);
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.runningCount()).assertEqual(1);
    });

    /**
     * @tc.name   pollStartsTaskCOnceGateOpens
     * @tc.desc   The first poll after both dependencies finish grants the exclusive lock and starts C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollStartsTaskCOnceGateOpens', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick(600)).assertTrue();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.taskAt(2).startedAt).assertEqual(600);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.runningCount()).assertEqual(1);
      expect(graph.completionOrder.length).assertEqual(2);
      logStep('SystemIntegration', 'poll=' + String(graph.pollTicks));
    });

    /**
     * @tc.name   pollStopsTimerWhenTaskCStarts
     * @tc.desc   Starting C clears the polling timer so a later round cannot start a second request.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollStopsTimerWhenTaskCStarts', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      expect(graph.timerActive).assertFalse();
      const eventsAfterStart = graph.events.size();
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTick(600)).assertFalse();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.events.size()).assertEqual(eventsAfterStart);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.lock.acquisitions).assertEqual(3);
    });

    /**
     * @tc.name   taskCCompletionReleasesExclusiveSlot
     * @tc.desc   completeTaskC writes the final row, releases the exclusive owner and leaves the lock fully free.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskCCompletionReleasesExclusiveSlot', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      expect(graph.completeTaskC(900)).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(2).finishedAt).assertEqual(900);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.allCompleted()).assertTrue();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.taskAt(2).label()).assertEqual(progressLabel(TASK_C, 100));
      expect(graph.totalProgress()).assertEqual(3 * PROGRESS_TOTAL);
    });

    /**
     * @tc.name   fullRunCompletionTraceIsTopological
     * @tc.desc   The recorded completion order of one full run is a valid topological order of the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fullRunCompletionTraceIsTopological', 0, () => {
      const graph = sharedGraph;
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(3 * POLL_INTERVAL_MS);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.averageProgress()).assertEqual(100);
      expect(graph.snapshotText().indexOf('completed') > 0).assertTrue();
      expect(graph.snapshotText().indexOf(STATUS_IDLE)).assertLess(0);
    });

    /**
     * @tc.name   fullRunEventTraceEndsWithTaskCFinish
     * @tc.desc   The tail of the event trace is the gate unlock, C start, timer clear and C completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fullRunEventTraceEndsWithTaskCFinish', 0, () => {
      const graph = sharedGraph;
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(500);
      const trace = graph.eventTrace();
      expect(trace.startsWith('start-all:begin|started:A|started:B|queued:C')).assertTrue();
      expect(trace.endsWith('completed:C|unlocked:C')).assertTrue();
      expect(trace.indexOf('unlocked:C')).assertLarger(trace.indexOf('completed:B'));
      expect(trace.indexOf('started:C')).assertLarger(trace.indexOf('unlocked:C'));
      expect(trace.indexOf('timer-cleared:C')).assertLarger(trace.indexOf('started:C'));
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.size()).assertEqual(11);
    });

    /**
     * @tc.name   startedEventsCoverAllThreeTasks
     * @tc.desc   Each task number appears exactly once among started events, and C appears last.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startedEventsCoverAllThreeTasks', 0, () => {
      const graph = sharedGraph;
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      graph.runTaskCIfReady();
      const started: string[] = [];
      for (let index = 0; index < graph.events.entries.length; index++) {
        const entry: string = graph.events.entries[index];
        if (entry.startsWith('started:')) {
          started.push(entry.substring('started:'.length));
        }
      }
      expect(started.length).assertEqual(3);
      expect(started[0]).assertEqual(TASK_A);
      expect(started[1]).assertEqual(TASK_B);
      expect(started[2]).assertEqual(TASK_C);
      expect(started.indexOf(TASK_C)).assertEqual(2);
      expect(completionTrace(graph)).assertEqual('B|A');
      expect(graph.taskAt(2).isRunning()).assertTrue();
    });

    /**
     * @tc.name   metricsAfterFullRunReportThreeCompleted
     * @tc.desc   The metrics aggregate counts all three tasks as completed and none as failed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('metricsAfterFullRunReportThreeCompleted', 0, () => {
      const graph = sharedGraph;
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(400);
      const metrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(3);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.averageProgress()).assertEqual(100);
      expect(metrics.totalProgress).assertEqual(300);
      expect(metrics.fingerprint()).assertLarger(0);
      expect(metrics.fingerprint()).assertEqual(NetworkMetrics.from(graph).fingerprint());
      expect(NetworkMetrics.from(createTaskGraph()).completedTasks).assertEqual(0);
    });

    /**
     * @tc.name   metricsTotalProgressSumsThreeFullBars
     * @tc.desc   Partial progress is summed exactly, and the average divides by the number of tasks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsTotalProgressSumsThreeFullBars', 0, () => {
      const graph = sharedGraph;
      graph.startAll();
      graph.taskAt(0).reportProgress(40);
      graph.taskAt(1).reportProgress(25);
      graph.taskAt(2).reportProgress(10);
      const metrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(75);
      expect(metrics.averageProgress()).assertEqual(25);
      expect(metrics.successRatio()).assertEqual(0);
      graph.completeTask(TASK_A);
      const afterOne = NetworkMetrics.from(graph);
      expect(afterOne.totalProgress).assertEqual(135);
      expect(afterOne.completedTasks).assertEqual(1);
      expect(afterOne.averageProgress()).assertEqual(45);
      expect(afterOne.fingerprint() === metrics.fingerprint()).assertFalse();
    });

    /**
     * @tc.name   averageProgressRisesFromZeroToHundred
     * @tc.desc   A scripted three-stage progression produces an increasing average without overshoot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('averageProgressRisesFromZeroToHundred', 0, () => {
      const graph = sharedGraph;
      graph.startAll();
      expect(graph.averageProgress()).assertEqual(0);
      graph.taskAt(0).reportProgress(30);
      graph.taskAt(1).reportProgress(60);
      graph.taskAt(2).reportProgress(90);
      expect(graph.averageProgress()).assertEqual(60);
      expect(graph.totalProgress()).assertEqual(180);
      graph.completeTask(TASK_A);
      expect(graph.averageProgress()).assertEqual(250.0 / 3);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(400);
      expect(graph.averageProgress()).assertEqual(100);
      expect(graph.totalProgress()).assertEqual(PROGRESS_TOTAL * 3);
      expect(graph.averageProgress() > 99).assertTrue();
      expect(graph.averageProgress()).assertLessOrEqual(100);
    });

    /**
     * @tc.name   snapshotTraceCapturesThreeRowsPerCapture
     * @tc.desc   Each capture appends exactly one snapshot per task and the trace keeps capture order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotTraceCapturesThreeRowsPerCapture', 0, () => {
      const graph = sharedGraph;
      const log = new SnapshotLog();
      graph.startAll();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(6);
      expect(log.snapshots[0].describe()).assertEqual('A/running/0');
      expect(log.snapshots[5].describe()).assertEqual('C/idle/0');
      expect(log.trace().split('|').length).assertEqual(6);
      expect(log.trace().indexOf('A/completed/100') >= 0).assertTrue();
      expect(log.trace().indexOf('B/completed/100') >= 0).assertTrue();
      expect(log.trace().indexOf('C/idle/0') >= 0).assertTrue();
      expect(log.snapshots[3].sameAs(graph.taskAt(0).snapshot())).assertTrue();
    });

    /**
     * @tc.name   latestSnapshotReflectsTerminalState
     * @tc.desc   The last snapshot per task carries the completed status and a full bar after the run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('latestSnapshotReflectsTerminalState', 0, () => {
      const graph = sharedGraph;
      const log = new SnapshotLog();
      graph.startAll();
      log.capture(graph.tasks);
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(300);
      log.capture(graph.tasks);
      const snapA = log.latest(TASK_A);
      const snapC = log.latest(TASK_C);
      expect(snapA !== undefined).assertTrue();
      expect(snapC !== undefined).assertTrue();
      if (snapA !== undefined && snapC !== undefined) {
        expect(snapA.status).assertEqual(STATUS_COMPLETED);
        expect(snapA.progress).assertEqual(PROGRESS_TOTAL);
        expect(snapC.status).assertEqual(STATUS_COMPLETED);
        expect(snapC.sameAs(graph.taskAt(2).snapshot())).assertTrue();
        expect(snapA.sameAs(snapC)).assertFalse();
      }
      const missing = log.latest('Z');
      expect(missing === undefined).assertTrue();
      const snapB = log.latest(TASK_B);
      expect(snapB !== undefined).assertTrue();
      if (snapB !== undefined) {
        expect(snapB.progress).assertEqual(PROGRESS_TOTAL);
        expect(snapB.taskNo).assertEqual(TASK_B);
      }
    });

    /**
     * @tc.name   referenceGraphAgreesWithDriverGate
     * @tc.desc   The independent two-boolean oracle unlocks in the same round as the driver graph.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('referenceGraphAgreesWithDriverGate', 0, () => {
      const graph = sharedGraph;
      const reference = new ReferenceGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      reference.markComplete(TASK_A);
      expect(reference.unlocked()).assertEqual(graph.canRunTaskC());
      expect(reference.unlocked()).assertFalse();
      expect(reference.poll()).assertFalse();
      graph.completeTask(TASK_B);
      reference.markComplete(TASK_B);
      expect(reference.unlocked()).assertTrue();
      expect(reference.unlocked()).assertEqual(graph.canRunTaskC());
      expect(reference.poll()).assertTrue();
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertTrue();
      expect(reference.rounds).assertEqual(2);
      expect(graph.pollTicks).assertEqual(1);
      expect(reference.cStarted).assertEqual(graph.taskAt(2).isRunning());
      expect(reference.trace()).assertEqual('true,true,true,false');
      const drivingGraph = createTaskGraph();
      drivingGraph.startAll();
      drivingGraph.completeTask(TASK_A);
      expect(drivingGraph.canRunTaskC()).assertEqual(false);
    });

    /**
     * @tc.name   pollClockElapsedMatchesTickCount
     * @tc.desc   The mirrored 200 ms clock advances by exactly one interval per tick and stops cleanly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollClockElapsedMatchesTickCount', 0, () => {
      const clock = new PollClock();
      expect(clock.intervalMs).assertEqual(POLL_INTERVAL_MS);
      expect(clock.active).assertFalse();
      expect(clock.tick()).assertEqual(0);
      clock.start();
      expect(clock.active).assertTrue();
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.tick()).assertEqual(200);
      expect(clock.tick()).assertEqual(400);
      expect(clock.tick()).assertEqual(600);
      expect(clock.ticks).assertEqual(3);
      expect(clock.isDueAfter(3)).assertTrue();
      expect(clock.isDueAfter(4)).assertFalse();
      clock.stop();
      expect(clock.active).assertFalse();
      expect(clock.tick()).assertEqual(600);
      expect(clock.ticks).assertEqual(3);
      clock.start();
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.tick()).assertEqual(POLL_INTERVAL_MS);
    });

    /**
     * @tc.name   startButtonDisabledDuringRun
     * @tc.desc   The button is disabled exactly while isTaskFinished is false, mirroring the page binding.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startButtonDisabledDuringRun', 0, () => {
      const graph = sharedGraph;
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#409EFF');
      graph.startAll();
      expect(graph.isTaskFinished).assertFalse();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#C0C4CC');
      expect(startButtonBackground(graph.isTaskFinished) === '#409EFF').assertFalse();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      graph.completeTaskC(400);
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(graph.allCompleted()).assertTrue();
      graph.reset();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#409EFF');
    });

    /**
     * @tc.name   progressLabelsTrackEachRow
     * @tc.desc   Each of the three rows renders its own task number and current percentage.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLabelsTrackEachRow', 0, () => {
      const graph = sharedGraph;
      graph.startAll();
      graph.taskAt(0).reportProgress(35);
      graph.taskAt(1).reportProgress(70);
      expect(graph.taskAt(0).label()).assertEqual('任务A当前进度 35%');
      expect(graph.taskAt(1).label()).assertEqual('任务B当前进度 70%');
      expect(graph.taskAt(2).label()).assertEqual('任务C当前进度 0%');
      expect(graph.taskAt(0).label().indexOf(TASK_A) >= 0).assertTrue();
      expect(graph.taskAt(1).label().indexOf(TASK_B) >= 0).assertTrue();
      expect(graph.taskAt(2).label().indexOf(TASK_C) >= 0).assertTrue();
      expect(graph.taskAt(0).label().endsWith('35%')).assertTrue();
      expect(graph.taskAt(0).label() === graph.taskAt(1).label()).assertFalse();
      graph.completeTask(TASK_A);
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, PROGRESS_TOTAL));
      expect(graph.taskAt(0).label().indexOf('100') >= 0).assertTrue();
    });

    /**
     * @tc.name   exclusiveQueueCountsRejectedAttempts
     * @tc.desc   While A and B hold shared locks, exclusive requests are refused and counted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exclusiveQueueCountsRejectedAttempts', 0, () => {
      const graph = sharedGraph;
      graph.startAll();
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.lock.acquireExclusive(TASK_C)).assertFalse();
      expect(graph.lock.rejections).assertEqual(1);
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      graph.completeTask(TASK_A);
      expect(graph.lock.acquireExclusive(TASK_C)).assertFalse();
      expect(graph.lock.rejections).assertEqual(2);
      expect(graph.lock.holderCount()).assertEqual(1);
      graph.completeTask(TASK_B);
      expect(graph.lock.acquireExclusive(TASK_C)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.lock.acquireShared(TASK_A)).assertFalse();
      expect(graph.lock.rejections).assertEqual(3);
    });

    /**
     * @tc.name   taskCSecondStartRequiresIdleTask
     * @tc.desc   Even with the gate open, a running exclusive task refuses a second runTaskCIfReady call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskCSecondStartRequiresIdleTask', 0, () => {
      const graph = sharedGraph;
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.runTaskCIfReady(200)).assertTrue();
      expect(graph.runTaskCIfReady(400)).assertFalse();
      expect(graph.runTaskCIfReady(600)).assertFalse();
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.taskAt(2).startedAt).assertEqual(200);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.lock.acquisitions).assertEqual(3);
      graph.completeTaskC(800);
      expect(graph.runTaskCIfReady(1000)).assertFalse();
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.taskAt(2).status).assertEqual(STATUS_COMPLETED);
    });

    /**
     * @tc.name   eventFingerprintStableAcrossEquivalentRuns
     * @tc.desc   Two graphs driven by the same script produce identical event traces and fingerprints.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventFingerprintStableAcrossEquivalentRuns', 0, () => {
      const first = createTaskGraph();
      const second = createTaskGraph();
      const graphs: TaskGraph[] = [first, second];
      for (let index = 0; index < graphs.length; index++) {
        graphs[index].startAll();
        graphs[index].completeTask(TASK_A);
        graphs[index].completeTask(TASK_B);
        graphs[index].pollTick(POLL_INTERVAL_MS);
        graphs[index].completeTaskC(400);
      }
      expect(first.eventTrace()).assertEqual(second.eventTrace());
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.fingerprint()).assertLarger(0);
      expect(first.snapshotText()).assertEqual(second.snapshotText());
      expect(completionTrace(first)).assertEqual(completionTrace(second));
      expect(NetworkMetrics.from(first).fingerprint()).assertEqual(NetworkMetrics.from(second).fingerprint());
      expect(first.events.fingerprint() === textFingerprint(first.eventTrace())).assertTrue();
      expect(first.events.size()).assertEqual(11);
    });

    /**
     * @tc.name   fingerprintDiffersWhenCompletionOrderChanges
     * @tc.desc   Swapping which dependency finishes first changes the trace fingerprint but not the end state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintDiffersWhenCompletionOrderChanges', 0, () => {
      const forward = createTaskGraph();
      const reverse = createTaskGraph();
      forward.startAll();
      forward.completeTask(TASK_A);
      forward.completeTask(TASK_B);
      forward.pollTick(POLL_INTERVAL_MS);
      forward.completeTaskC(300);
      reverse.startAll();
      reverse.completeTask(TASK_B);
      reverse.completeTask(TASK_A);
      reverse.pollTick(POLL_INTERVAL_MS);
      reverse.completeTaskC(300);
      expect(completionTrace(forward)).assertEqual('A|B|C');
      expect(completionTrace(reverse)).assertEqual('B|A|C');
      expect(forward.events.fingerprint() === reverse.events.fingerprint()).assertFalse();
      expect(forward.snapshotText()).assertEqual(reverse.snapshotText());
      expect(NetworkMetrics.from(forward).fingerprint()).assertEqual(NetworkMetrics.from(reverse).fingerprint());
      expect(isTopologicalCompletion(reverse.completionOrder)).assertTrue();
      expect(forward.events.countOf('unlocked')).assertEqual(reverse.events.countOf('unlocked'));
    });

    /**
     * @tc.name   resetBetweenRunsRestoresBaseline
     * @tc.desc   After a completed run, reset returns every mirror field to the seed values the page starts with.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetBetweenRunsRestoresBaseline', 0, () => {
      const graph = sharedGraph;
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(400);
      expect(graph.allCompleted()).assertTrue();
      graph.reset();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.allCompleted()).assertFalse();
      for (let index = 0; index < graph.tasks.length; index++) {
        expect(graph.taskAt(index).isIdle()).assertTrue();
        expect(graph.taskAt(index).lastErrorCode).assertEqual(0);
      }
      expect(graph.taskAt(0).label()).assertEqual('任务A当前进度 0%');
    });

    /**
     * @tc.name   wholePipelineEndStateIsCoherent
     * @tc.desc   After the full lifecycle the graph, lock, metrics and event log all describe a clean finish.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SystemIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('wholePipelineEndStateIsCoherent', 0, () => {
      const graph = sharedGraph;
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      const metrics = NetworkMetrics.from(graph);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(3 * PROGRESS_TOTAL);
      expect(metrics.completedTasks).assertEqual(metrics.totalTasks);
      expect(metrics.failedTasks).assertEqual(0);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
      expect(graph.completionOrder.indexOf(TASK_C)).assertEqual(2);
      logStep('SystemIntegration', 'fingerprint=' + String(graph.events.fingerprint()));
    });

    // End of lifecycle suite.
  });
}
