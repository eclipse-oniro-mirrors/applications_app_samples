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
 * CoreEndToEnd suite of the NetworkSample ohosTest module.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-65    progress cells, isTaskFinished and the private lock
 *   174-198  startAllTasks: flag flip, shared A/B, exclusive C, 200 ms poll
 *   200-265  three progress rows and the enabled(isTaskFinished) start button
 *
 * The suite walks the whole user journey once per case: press start, watch the
 * two shared tasks, poll the gate, run C, then check the final button and row
 * state. Each case asserts one checkpoint of that journey.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  PROGRESS_TOTAL,
  POLL_INTERVAL_MS,
  PAGE_TITLE,
  BUTTON_ACTIVE_BACKGROUND,
  BUTTON_DISABLED_BACKGROUND,
  ERROR_NETWORK,
  DownloadTask,
  NetworkMetrics,
  createTaskGraph,
  startButtonEnabled,
  startButtonBackground,
  completionTrace,
  isTopologicalCompletion,
  joined
} from '../Shared/SharedDriver';

export default function networkCoreEndToEndTest(): void {
  describe('CoreEndToEnd', () => {
    beforeAll(() => {
      logSuite('CoreEndToEnd', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreEndToEnd', 'end');
    });

    /**
     * @tc.name   initialJourneyStateHasThreeIdleRows
     * @tc.desc   Before the first tap all three rows are idle at zero and no completion has been recorded.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('initialJourneyStateHasThreeIdleRows', 0, () => {
      const graph = createTaskGraph();
      logStep('CoreEndToEnd', 'initial rows ' + graph.snapshotText());
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(1).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
    });

    /**
     * @tc.name   initialButtonIsEnabledWithActiveColour
     * @tc.desc   The start button is tappable on first render because isTaskFinished begins true.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('initialButtonIsEnabledWithActiveColour', 0, () => {
      const graph = createTaskGraph();
      const enabled = startButtonEnabled(graph.isTaskFinished);
      const colour = startButtonBackground(graph.isTaskFinished);
      logStep('CoreEndToEnd', 'initial button ' + String(enabled) + ' ' + colour);
      expect(graph.isTaskFinished).assertTrue();
      expect(enabled).assertTrue();
      expect(colour).assertEqual(BUTTON_ACTIVE_BACKGROUND);
      expect(colour).assertEqual('#409EFF');
      expect(colour === BUTTON_DISABLED_BACKGROUND).assertFalse();
      expect(PAGE_TITLE).assertEqual('网络场景');
    });

    /**
     * @tc.name   startAllMarksRunActiveAndKeepsRowsAtZero
     * @tc.desc   Pressing start flips isTaskFinished immediately but does not invent progress for any row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllMarksRunActiveAndKeepsRowsAtZero', 0, () => {
      const graph = createTaskGraph();
      const accepted = graph.startAll();
      logStep('CoreEndToEnd', 'after start finished=' + String(graph.isTaskFinished));
      expect(accepted).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTicks).assertEqual(0);
    });

    /**
     * @tc.name   startAllEmitsStartEventsInPageOrder
     * @tc.desc   The recorded trace opens with the start marker, then A, then B, then the queued C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllEmitsStartEventsInPageOrder', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const trace = graph.eventTrace();
      logStep('CoreEndToEnd', 'start trace ' + trace);
      expect(trace).assertEqual('start-all:begin|started:A|started:B|queued:C');
      expect(graph.events.size()).assertEqual(4);
      expect(graph.events.entries[0]).assertEqual('start-all:begin');
      expect(graph.events.entries[1]).assertEqual('started:A');
      expect(graph.events.entries[2]).assertEqual('started:B');
      expect(graph.events.entries[3]).assertEqual('queued:C');
      expect(graph.events.last()).assertEqual('queued:C');
    });

    /**
     * @tc.name   startAllQueuesTaskCWithoutStartingIt
     * @tc.desc   C is announced as queued but stays idle with no attempt and no exclusive grant.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllQueuesTaskCWithoutStartingIt', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      logStep('CoreEndToEnd', 'queued C status ' + c.status);
      expect(c.status).assertEqual(STATUS_IDLE);
      expect(c.attempts).assertEqual(0);
      expect(c.startedAt).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   midRunButtonIsDisabledWithMutedColour
     * @tc.desc   While the run is in flight the same button renders disabled with the grey background literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('midRunButtonIsDisabledWithMutedColour', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const enabled = startButtonEnabled(graph.isTaskFinished);
      const colour = startButtonBackground(graph.isTaskFinished);
      logStep('CoreEndToEnd', 'mid-run button ' + String(enabled) + ' ' + colour);
      expect(enabled).assertFalse();
      expect(colour).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(colour).assertEqual('#C0C4CC');
      expect(colour === BUTTON_ACTIVE_BACKGROUND).assertFalse();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.taskAt(0).isRunning()).assertTrue();
    });

    /**
     * @tc.name   firstPollBeforeDependenciesKeepsGateClosed
     * @tc.desc   The first 200 ms round fires with no completion and reports nothing started.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('firstPollBeforeDependenciesKeepsGateClosed', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const started = graph.pollTick(POLL_INTERVAL_MS);
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      logStep('CoreEndToEnd', 'first poll ' + String(started));
      expect(started).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(c.isIdle()).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.lock.sharedHolders.length).assertEqual(2);
    });

    /**
     * @tc.name   completingTaskAFillsOnlyItsOwnRow
     * @tc.desc   The first finished download writes 100 to row A and leaves B and C exactly as they were.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completingTaskAFillsOnlyItsOwnRow', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.reportProgress(35);
      const accepted = graph.completeTask(TASK_A);
      logStep('CoreEndToEnd', 'after A ' + graph.snapshotText());
      expect(accepted).assertTrue();
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:running:35|C:idle:0');
      expect(graph.totalProgress()).assertEqual(135);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.completionOrder[0]).assertEqual(TASK_A);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(1);
    });

    /**
     * @tc.name   completingTaskBEmitsUnlockMarker
     * @tc.desc   The last shared completion emits exactly one unlocked marker for C in the event trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completingTaskBEmitsUnlockMarker', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const before = graph.events.countOf('unlocked');
      graph.completeTask(TASK_B);
      const after = graph.events.countOf('unlocked');
      const lastEntry = graph.events.last();
      logStep('CoreEndToEnd', 'unlock markers ' + String(before) + ' -> ' + String(after));
      expect(before).assertEqual(0);
      expect(after).assertEqual(1);
      expect(lastEntry).assertEqual('unlocked:C');
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   partialJourneyLeavesTaskCRowUntouched
     * @tc.desc   With both dependencies done and C merely unlocked, the C row still reads idle at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('partialJourneyLeavesTaskCRowUntouched', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      logStep('CoreEndToEnd', 'C row before poll ' + c.describe());
      expect(c.describe()).assertEqual('C:idle:0');
      expect(c.progress).assertEqual(0);
      expect(c.attempts).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(200);
      expect(graph.averageProgress()).assertEqual(200.0 / 3);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   pollAfterBothCompletionsStartsTaskC
     * @tc.desc   A single timer round after the unlock starts C, takes the exclusive lock and clears the timer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollAfterBothCompletionsStartsTaskC', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      const started = graph.pollTick(POLL_INTERVAL_MS);
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      logStep('CoreEndToEnd', 'gate poll started ' + String(started));
      expect(started).assertTrue();
      expect(c.isRunning()).assertTrue();
      expect(c.attempts).assertEqual(1);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.last()).assertEqual('timer-cleared:C');
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   taskCRowStaysZeroUntilItsCompletion
     * @tc.desc   Starting C does not fill its row: the page only writes 100 from the completion callback.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskCRowStaysZeroUntilItsCompletion', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      logStep('CoreEndToEnd', 'started C row ' + c.describe());
      expect(c.status).assertEqual(STATUS_RUNNING);
      expect(c.progress).assertEqual(0);
      expect(c.progressRatio()).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(200);
      expect(graph.runningCount()).assertEqual(1);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(2);
    });

    /**
     * @tc.name   completingTaskCEndsWithThreeFullRows
     * @tc.desc   The final completion turns the third row into 100 and the whole snapshot into three full rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completingTaskCEndsWithThreeFullRows', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      const done = graph.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreEndToEnd', 'final rows ' + graph.snapshotText());
      expect(done).assertTrue();
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:completed:100|C:completed:100');
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.averageProgress()).assertEqual(100);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   fullJourneyCompletionTraceIsTopological
     * @tc.desc   The recorded completion order ends with C and is therefore a valid topological order of the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fullJourneyCompletionTraceIsTopological', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const trace = completionTrace(graph);
      logStep('CoreEndToEnd', 'completion trace ' + trace);
      expect(trace).assertEqual('A|B|C');
      expect(graph.completionOrder.length).assertEqual(TASK_NUMBERS.length);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
      expect(graph.events.countOf('completed')).assertEqual(3);
    });

    /**
     * @tc.name   fullJourneyEventTraceShape
     * @tc.desc   The whole run is eleven ordered entries ending with C's completion and its second unlock marker.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fullJourneyEventTraceShape', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const trace = graph.eventTrace();
      const expected = 'start-all:begin|started:A|started:B|queued:C|completed:A|completed:B|unlocked:C|' +
        'started:C|timer-cleared:C|completed:C|unlocked:C';
      logStep('CoreEndToEnd', 'event trace ' + trace);
      expect(trace).assertEqual(expected);
      expect(graph.events.size()).assertEqual(11);
      expect(graph.events.entries[4]).assertEqual('completed:A');
      expect(graph.events.entries[6]).assertEqual('unlocked:C');
      expect(graph.events.entries[7]).assertEqual('started:C');
      expect(graph.events.entries[8]).assertEqual('timer-cleared:C');
      expect(joined(graph.events.entries, '>').endsWith('completed:C>unlocked:C')).assertTrue();
    });

    /**
     * @tc.name   isTaskFinishedStaysFalseAfterFullCompletion
     * @tc.desc   Finishing all three downloads never re-enables the button on its own; the flag is reset elsewhere.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('isTaskFinishedStaysFalseAfterFullCompletion', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const enabled = startButtonEnabled(graph.isTaskFinished);
      logStep('CoreEndToEnd', 'finished flag after journey ' + String(graph.isTaskFinished));
      expect(graph.allCompleted()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(enabled).assertFalse();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(graph.events.countOf('start-all')).assertEqual(1);
    });

    /**
     * @tc.name   completedGraphHasNoRunningRows
     * @tc.desc   After the final completion the running counter drops to zero and every row reports complete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completedGraphHasNoRunningRows', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreEndToEnd', 'running rows ' + String(graph.runningCount()));
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).isComplete()).assertTrue();
      expect(graph.taskAt(2).isComplete()).assertTrue();
      expect(graph.taskAt(0).isRunning()).assertFalse();
      expect(graph.taskAt(2).status).assertEqual(STATUS_COMPLETED);
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   completedGraphTotalAndAverageProgress
     * @tc.desc   The aggregate of the finished journey is 300 total and a 100 average, with a ratio of one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completedGraphTotalAndAverageProgress', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const metrics = NetworkMetrics.from(graph);
      logStep('CoreEndToEnd', 'final total ' + String(graph.totalProgress()));
      expect(graph.totalProgress()).assertEqual(PROGRESS_TOTAL * 3);
      expect(graph.averageProgress()).assertEqual(PROGRESS_TOTAL);
      expect(metrics.averageProgress()).assertEqual(PROGRESS_TOTAL);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.completedTasks).assertEqual(3);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(300);
    });

    /**
     * @tc.name   pollAfterTaskCStartedIsIgnored
     * @tc.desc   Once the timer is cleared an extra round only bumps the counter and starts nothing new.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollAfterTaskCStartedIsIgnored', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      const startedBefore = graph.events.countOf('started');
      const extra = graph.pollTick(POLL_INTERVAL_MS * 2);
      logStep('CoreEndToEnd', 'extra poll ' + String(extra));
      expect(extra).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.events.countOf('started')).assertEqual(startedBefore);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      expect(c.isRunning()).assertTrue();
      expect(graph.completionOrder.length).assertEqual(2);
    });

    /**
     * @tc.name   journeyWithReversedOrderReachesSameFinalState
     * @tc.desc   Completing B before A changes the trace order but not the final rows, totals or lock state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyWithReversedOrderReachesSameFinalState', 0, () => {
      const forward = createTaskGraph();
      forward.startAll();
      forward.completeTask(TASK_A);
      forward.completeTask(TASK_B);
      forward.pollTick(POLL_INTERVAL_MS);
      forward.completeTaskC(POLL_INTERVAL_MS);
      const backward = createTaskGraph();
      backward.startAll();
      backward.completeTask(TASK_B);
      backward.completeTask(TASK_A);
      backward.pollTick(POLL_INTERVAL_MS);
      backward.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreEndToEnd', 'orders ' + completionTrace(forward) + ' / ' + completionTrace(backward));
      expect(completionTrace(backward)).assertEqual('B|A|C');
      expect(backward.snapshotText()).assertEqual(forward.snapshotText());
      expect(backward.totalProgress()).assertEqual(forward.totalProgress());
      expect(backward.lock.acquisitions).assertEqual(forward.lock.acquisitions);
      expect(backward.lock.isUnlocked()).assertTrue();
      expect(backward.events.fingerprint() === forward.events.fingerprint()).assertFalse();
    });

    /**
     * @tc.name   restartAfterResetReplaysTheJourney
     * @tc.desc   After a reset the same script reproduces every checkpoint, including the button flip and the trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('restartAfterResetReplaysTheJourney', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const firstTrace = graph.eventTrace();
      graph.reset();
      const idleButton = startButtonEnabled(graph.isTaskFinished);
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreEndToEnd', 'replay trace ' + graph.eventTrace());
      expect(idleButton).assertTrue();
      expect(graph.eventTrace()).assertEqual(firstTrace);
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:completed:100|C:completed:100');
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.completionOrder.length).assertEqual(3);
    });

    /**
     * @tc.name   finalSnapshotTextListsAllThreeRows
     * @tc.desc   The serialised end state contains exactly three pipe separated rows in A, B, C order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('finalSnapshotTextListsAllThreeRows', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const rows = graph.snapshotText().split('|');
      logStep('CoreEndToEnd', 'row count ' + String(rows.length));
      expect(rows.length).assertEqual(3);
      expect(rows[0]).assertEqual('A:completed:100');
      expect(rows[1]).assertEqual('B:completed:100');
      expect(rows[2]).assertEqual('C:completed:100');
      expect(graph.snapshotText().indexOf('A:')).assertEqual(0);
      expect(graph.snapshotText().endsWith('C:completed:100')).assertTrue();
      expect(graph.snapshotText()).assertEqual(graph.taskAt(0).describe() + '|' + graph.taskAt(1).describe() +
        '|' + graph.taskAt(2).describe());
    });

    /**
     * @tc.name   eventTraceOrdersTimerClearBeforeFinalCompletion
     * @tc.desc   Position matters: the timer clears right after C starts, before C's completion and unlock entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventTraceOrdersTimerClearBeforeFinalCompletion', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const trace = graph.eventTrace();
      logStep('CoreEndToEnd', 'first and last ' + graph.events.entries[0] + ' / ' + graph.events.last());
      expect(trace.startsWith('start-all:begin')).assertTrue();
      expect(graph.events.entries[8]).assertEqual('timer-cleared:C');
      expect(graph.events.entries[9]).assertEqual('completed:C');
      expect(graph.events.entries[0]).assertEqual('start-all:begin');
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.events.entries.indexOf('queued:C')).assertLess(graph.events.entries.indexOf('started:C'));
      expect(graph.events.entries.indexOf('completed:B')).assertLess(graph.events.entries.indexOf('unlocked:C'));
    });

    /**
     * @tc.name   buttonStateReturnsOnlyAfterReset
     * @tc.desc   The enabled button comes back from reset(), not from a completion, and its colour flips with it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('buttonStateReturnsOnlyAfterReset', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const afterJourney = startButtonEnabled(graph.isTaskFinished);
      graph.reset();
      const afterReset = startButtonEnabled(graph.isTaskFinished);
      logStep('CoreEndToEnd', 'button ' + String(afterJourney) + ' -> ' + String(afterReset));
      expect(afterJourney).assertFalse();
      expect(afterReset).assertTrue();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual(BUTTON_ACTIVE_BACKGROUND);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   metricsSnapshotMatchesCompletedJourney
     * @tc.desc   The metrics object built from the finished graph agrees with the rows, and its hash is reproducible.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsSnapshotMatchesCompletedJourney', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const metrics = NetworkMetrics.from(graph);
      const repeated = NetworkMetrics.from(graph);
      logStep('CoreEndToEnd', 'metrics hash ' + String(metrics.fingerprint()));
      expect(metrics.totalTasks).assertEqual(graph.tasks.length);
      expect(metrics.totalProgress).assertEqual(graph.totalProgress());
      expect(metrics.completedTasks).assertEqual(3);
      expect(metrics.fingerprint()).assertEqual(repeated.fingerprint());
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.averageProgress()).assertEqual(100);
    });

    /**
     * @tc.name   taskCCompletionIsRecordedLastInOrder
     * @tc.desc   C appears exactly once, at the end of the completion order, and never in the shared prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskCCompletionIsRecordedLastInOrder', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const order = graph.completionOrder;
      logStep('CoreEndToEnd', 'order ' + joined(order, '->'));
      expect(order.indexOf(TASK_C)).assertEqual(2);
      expect(order.lastIndexOf(TASK_C)).assertEqual(2);
      expect(order.indexOf(TASK_A)).assertLess(order.indexOf(TASK_C));
      expect(order.indexOf(TASK_B)).assertLess(order.indexOf(TASK_C));
      expect(joined(order, '->')).assertEqual('A->B->C');
      expect(graph.events.countOf('completed')).assertEqual(3);
    });

    /**
     * @tc.name   journeyUsesTheThreePageUrls
     * @tc.desc   The three rows keep the download URLs copied from runTaskA, runTaskB and runTaskC.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyUsesTheThreePageUrls', 0, () => {
      const graph = createTaskGraph();
      logStep('CoreEndToEnd', 'url C ' + graph.taskAt(2).url);
      expect(graph.taskAt(0).url).assertEqual(URL_TASK_A);
      expect(graph.taskAt(1).url).assertEqual(URL_TASK_B);
      expect(graph.taskAt(2).url).assertEqual(URL_TASK_C);
      expect(graph.taskAt(0).url.endsWith('favor_list_tea.png')).assertTrue();
      expect(graph.taskAt(1).url.endsWith('after_cache.png')).assertTrue();
      expect(graph.taskAt(2).url.endsWith('icon_main_color.png')).assertTrue();
      expect(graph.taskAt(2).url.startsWith('https://')).assertTrue();
      expect(graph.taskAt(0).url === graph.taskAt(2).url).assertFalse();
    });

    /**
     * @tc.name   startAfterFullRunIsRejectedUntilReset
     * @tc.desc   A finished journey cannot be restarted: startAll refuses and only appends the rejection marker.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startAfterFullRunIsRejectedUntilReset', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const sizeBefore = graph.events.size();
      const accepted = graph.startAll();
      logStep('CoreEndToEnd', 'restart accepted ' + String(accepted));
      expect(accepted).assertFalse();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.events.size()).assertEqual(sizeBefore + 1);
      expect(graph.events.last()).assertEqual('start-rejected:1');
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:completed:100|C:completed:100');
    });

    /**
     * @tc.name   rowsReachFullOnlyThroughCompletionCallbacks
     * @tc.desc   High intermediate percentages leave every row below 100 and keep the gate closed for C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rowsReachFullOnlyThroughCompletionCallbacks', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      a.reportProgress(99);
      b.reportProgress(99);
      const polled = graph.pollTick(POLL_INTERVAL_MS);
      logStep('CoreEndToEnd', 'near-full rows ' + graph.snapshotText());
      expect(a.progress).assertEqual(99);
      expect(b.progress).assertEqual(99);
      expect(graph.totalProgress()).assertEqual(198);
      expect(polled).assertFalse();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.allCompleted()).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(0);
    });

    /**
     * @tc.name   failedDependencyLeavesJourneyUnfinished
     * @tc.desc   A failure on B keeps the gate closed, so the journey can never reach its three-full-row end state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedDependencyLeavesJourneyUnfinished', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.fail(ERROR_NETWORK);
      const polled = graph.pollTick(POLL_INTERVAL_MS);
      const metrics = NetworkMetrics.from(graph);
      logStep('CoreEndToEnd', 'failed journey ' + graph.snapshotText());
      expect(polled).assertFalse();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.allCompleted()).assertFalse();
      expect(metrics.completedTasks).assertEqual(1);
      expect(metrics.failedTasks).assertEqual(1);
      expect(metrics.successRatio()).assertLess(1);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   secondRunAfterResetStartsFromCleanCounters
     * @tc.desc   Reset zeroes the poll clock, lock counters and completion list before the journey is replayed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondRunAfterResetStartsFromCleanCounters', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      graph.reset();
      logStep('CoreEndToEnd', 'clean counters ' + String(graph.pollTicks) + ' ' +
        String(graph.lock.acquisitions));
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      graph.startAll();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.size()).assertEqual(4);
    });

    /**
     * @tc.name   sharedPrefixCompletesBeforeExclusiveSection
     * @tc.desc   The journey splits into a two-task shared prefix and a one-task exclusive tail, in that order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('sharedPrefixCompletesBeforeExclusiveSection', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      const prefixSize = graph.completionOrder.length;
      const holdersIdle = graph.lock.holderCount();
      graph.pollTick(POLL_INTERVAL_MS);
      const exclusiveGranted = graph.lock.exclusiveOwner;
      graph.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreEndToEnd', 'prefix ' + String(prefixSize) + ' then ' + exclusiveGranted);
      expect(prefixSize).assertEqual(2);
      expect(holdersIdle).assertEqual(0);
      expect(exclusiveGranted).assertEqual(TASK_C);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   journeyPollCountMatchesTimerRounds
     * @tc.desc   Three empty rounds plus the successful round add up to four poll ticks for the journey.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('journeyPollCountMatchesTimerRounds', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.pollTick(POLL_INTERVAL_MS);
      graph.pollTick(POLL_INTERVAL_MS * 2);
      graph.pollTick(POLL_INTERVAL_MS * 3);
      const ticksBeforeGate = graph.pollTicks;
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      const started = graph.pollTick(POLL_INTERVAL_MS * 4);
      logStep('CoreEndToEnd', 'ticks ' + String(ticksBeforeGate) + ' -> ' + String(graph.pollTicks));
      expect(ticksBeforeGate).assertEqual(3);
      expect(started).assertTrue();
      expect(graph.pollTicks).assertEqual(4);
      expect(graph.timerActive).assertFalse();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.pollTicks * POLL_INTERVAL_MS).assertEqual(800);
    });
  });
}
