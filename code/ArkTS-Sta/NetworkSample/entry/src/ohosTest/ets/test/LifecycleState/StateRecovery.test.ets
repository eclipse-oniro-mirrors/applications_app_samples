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
 * StateRecovery suite.
 *
 * Studies resumption rather than first-run behaviour: a run that stopped after
 * only one prerequisite, a run reset in the middle of the gate window, a run
 * whose exclusive C failed, and the retry delays a caller should observe while
 * recovering. The independent ReferenceGraph supplies the expected gate.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   63-64    taskACompleted / taskBCompleted survive until the page is rebuilt
 *   79-90    each completion callback is independent, so a late one can still finish
 *   98-102   the gate needs both booleans, never a single one
 *   133-142  a failed start returns early without touching the completion flags
 *   188-196  the interval keeps retrying the gate every 200 ms until C runs
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
  STATUS_FAILED,
  ERROR_NETWORK,
  ERROR_TIMEOUT,
  DownloadTask,
  RunSnapshot,
  SnapshotLog,
  TaskGraph,
  RetryPolicy,
  ReferenceGraph,
  createTaskGraph,
  completionTrace,
  isTopologicalCompletion,
  startButtonEnabled
} from '../Shared/SharedDriver';

export default function stateRecoveryTest(): void {
  describe('StateRecovery', () => {
    beforeAll(() => {
      logSuite('StateRecovery', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('StateRecovery', 'end');
    });

    /**
     * @tc.name   partialCompletionResumesWithTheMissingBranch
     * @tc.desc   A run that finished only A resumes when B arrives, opening the gate without a reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('partialCompletionResumesWithTheMissingBranch', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_B, 20);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   partialCompletionSnapshotShowsOneFinishedRow
     * @tc.desc   A capture in the half-finished state stores one completed row and one still running row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('partialCompletionSnapshotShowsOneFinishedRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      log.capture(graph.tasks);
      expect(log.trace()).assertEqual('A/completed/100|B/running/0|C/idle/0');
      expect(log.snapshots[0].status).assertEqual(STATUS_COMPLETED);
      expect(log.snapshots[1].status).assertEqual(STATUS_RUNNING);
      expect(log.size()).assertEqual(3);
    });

    /**
     * @tc.name   partialCompletionKeepsTheLockOnTheMissingBranch
     * @tc.desc   After A finishes the lock still holds B and the queued exclusive request stays pending.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('partialCompletionKeepsTheLockOnTheMissingBranch', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
    });

    /**
     * @tc.name   missingBranchCompletionAnnouncesUnlockOnce
     * @tc.desc   Resuming with B produces exactly one unlock announcement for the whole recovery.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('missingBranchCompletionAnnouncesUnlockOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.pollTick(210);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      graph.completeTask(TASK_B, 420);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.pollTicks).assertEqual(1);
    });

    /**
     * @tc.name   repeatedMissingBranchCompletionDoesNotReannounce
     * @tc.desc   A duplicated B callback during recovery cannot announce the unlock a second time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedMissingBranchCompletionDoesNotReannounce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      const duplicate: boolean = graph.completeTask(TASK_B, 30);
      expect(duplicate).assertFalse();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.taskAt(1).finishedAt).assertEqual(20);
    });

    /**
     * @tc.name   resumedGateIsServicedByTheNextPoll
     * @tc.desc   After the missing branch finishes the next 200 ms tick starts C and clears the interval.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resumedGateIsServicedByTheNextPoll', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.pollTick(210);
      graph.completeTask(TASK_B, 220);
      const started: boolean = graph.pollTick(420);
      expect(started).assertTrue();
      expect(graph.taskAt(2).startedAt).assertEqual(420);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.taskAt(2).status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   stoppedRunWithoutCompletionsCannotAdvance
     * @tc.desc   Progress without completion is not resumable state: the gate stays shut and polls do nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stoppedRunWithoutCompletionsCannotAdvance', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(90);
      graph.taskAt(1).reportProgress(95);
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(2);
    });

    /**
     * @tc.name   resetMidRunRestoresIdleRows
     * @tc.desc   Resetting inside the gate window returns the finished row to idle with zero progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetMidRunRestoresIdleRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.taskAt(1).reportProgress(64);
      graph.reset();
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.taskAt(1).status).assertEqual(STATUS_IDLE);
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   resetMidRunClearsHoldersAndQueuedRequest
     * @tc.desc   The interrupted gate window leaves no shared holder, no waiting marker and no exclusive owner.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetMidRunClearsHoldersAndQueuedRequest', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 10);
      graph.reset();
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   runResumesAfterMidRunReset
     * @tc.desc   A reset in the middle of a session is not a failure: the next start completes normally.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runResumesAfterMidRunReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.pollTick(210);
      graph.reset();
      expect(graph.startAll()).assertTrue();
      graph.completeTask(TASK_A, 20);
      graph.completeTask(TASK_B, 30);
      graph.pollTick(40);
      graph.completeTaskC(50);
      expect(graph.allCompleted()).assertTrue();
      expect(completionTrace(graph)).assertEqual('A|B|C');
    });

    /**
     * @tc.name   resetMidRunStartsAFreshCompletionOrder
     * @tc.desc   An order entry from the interrupted attempt never appears in the resumed attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetMidRunStartsAFreshCompletionOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      expect(completionTrace(graph)).assertEqual('A');
      graph.reset();
      expect(completionTrace(graph)).assertEqual('');
      graph.startAll();
      graph.completeTask(TASK_B, 20);
      graph.completeTask(TASK_A, 30);
      graph.pollTick(40);
      graph.completeTaskC(50);
      expect(completionTrace(graph)).assertEqual('B|A|C');
      expect(graph.completionOrder.length).assertEqual(3);
    });

    /**
     * @tc.name   resetMidRunReenablesTheButton
     * @tc.desc   The interrupted session restores the start button before the operator retries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetMidRunReenablesTheButton', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      graph.reset();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
    });

    /**
     * @tc.name   failedTaskCIsRecoveredInPlaceAfterReset
     * @tc.desc   A failed exclusive row keeps its identity and URL, and reset makes it runnable again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedTaskCIsRecoveredInPlaceAfterReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const c: DownloadTask = graph.taskAt(2);
      const url: string = c.url;
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      c.fail(ERROR_NETWORK);
      expect(c.status).assertEqual(STATUS_FAILED);
      graph.reset();
      expect(c.taskNo).assertEqual(TASK_C);
      expect(c.url).assertEqual(url);
      expect(c.status).assertEqual(STATUS_IDLE);
      expect(c.lastErrorCode).assertEqual(0);
    });

    /**
     * @tc.name   failedTaskCRowStillBlocksPolling
     * @tc.desc   A failed C is not idle, so a poll after the gate opens refuses to start it again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedTaskCRowStillBlocksPolling', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(2).fail(ERROR_TIMEOUT);
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.pollTick(30)).assertFalse();
      expect(graph.taskAt(2).status).assertEqual(STATUS_FAILED);
      expect(graph.timerActive).assertTrue();
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   failedTaskCSnapshotRecordsTheFailure
     * @tc.desc   A capture taken while C is failed stores the failed status for the exclusive row only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedTaskCSnapshotRecordsTheFailure', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      graph.taskAt(2).fail(ERROR_NETWORK);
      log.capture(graph.tasks);
      expect(log.trace()).assertEqual('A/completed/100|B/completed/100|C/failed/0');
      expect(log.snapshots[2].status).assertEqual(STATUS_FAILED);
      expect(log.size()).assertEqual(3);
    });

    /**
     * @tc.name   accumulatedRetryDelayMatchesTheAttemptSeries
     * @tc.desc   The waiting time of a three attempt recovery is the sum of the linear backoff steps.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('accumulatedRetryDelayMatchesTheAttemptSeries', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      let waited: number = 0;
      for (let attempt = 1; attempt <= 3; attempt++) {
        waited = waited + policy.delayFor(attempt);
      }
      expect(waited).assertEqual(600);
      expect(policy.delayFor(1)).assertEqual(100);
      expect(policy.delayFor(3)).assertEqual(300);
      expect(waited > policy.delayFor(3)).assertTrue();
    });

    /**
     * @tc.name   freshPolicyRestartsTheBackoffSeries
     * @tc.desc   A new policy object recreated for the next recovery begins again at the base delay.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('freshPolicyRestartsTheBackoffSeries', 0, () => {
      const first: RetryPolicy = new RetryPolicy(3, 200);
      expect(first.delayFor(3)).assertEqual(600);
      const second: RetryPolicy = new RetryPolicy(3, 200);
      expect(second.delayFor(1)).assertEqual(200);
      expect(second.delayFor(3)).assertEqual(600);
      expect(second.maxAttempts).assertEqual(first.maxAttempts);
      expect(second.baseDelayMs).assertEqual(first.baseDelayMs);
    });

    /**
     * @tc.name   recoveryAcrossTwoFailuresKeepsAttemptsGrowing
     * @tc.desc   Two failed attempts plus two resets leave the prerequisite row with two recorded starts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveryAcrossTwoFailuresKeepsAttemptsGrowing', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      graph.reset();
      graph.startAll();
      graph.taskAt(1).reportProgress(25);
      graph.taskAt(1).fail(ERROR_NETWORK);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.taskAt(1).attempts).assertEqual(3);
      expect(graph.taskAt(1).lastErrorCode).assertEqual(0);
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   partialProgressIsDiscardedByReset
     * @tc.desc   A row interrupted at 64 percent restarts from zero rather than from the stored fraction.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('partialProgressIsDiscardedByReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(64);
      graph.reset();
      graph.startAll();
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(0).progressRatio()).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   snapshotBeforeAndAfterResetDiffer
     * @tc.desc   Captures on both sides of a mid run reset show the loss of the completed row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotBeforeAndAfterResetDiffer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      log.capture(graph.tasks);
      graph.reset();
      log.capture(graph.tasks);
      expect(log.snapshots[0].status).assertEqual(STATUS_COMPLETED);
      expect(log.snapshots[3].status).assertEqual(STATUS_IDLE);
      expect(log.snapshots[0].sameAs(log.snapshots[3])).assertFalse();
      expect(log.size()).assertEqual(6);
    });

    /**
     * @tc.name   progressAfterRecoveryRestartsFromZero
     * @tc.desc   The first report of a recovered run is stored as absolute progress, not added to the old value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressAfterRecoveryRestartsFromZero', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).reportProgress(88);
      graph.reset();
      graph.startAll();
      const resumed: number = graph.taskAt(1).reportProgress(12);
      expect(resumed).assertEqual(12);
      expect(graph.taskAt(1).progress).assertEqual(12);
      expect(graph.totalProgress()).assertEqual(12);
      expect(graph.taskAt(1).progressRatio()).assertEqual(0.12);
    });

    /**
     * @tc.name   referenceGraphAgreesAfterPartialCompletion
     * @tc.desc   The independent two boolean oracle keeps the gate shut after only A completes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('referenceGraphAgreesAfterPartialCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const ref: ReferenceGraph = new ReferenceGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      ref.markComplete(TASK_A);
      expect(ref.unlocked()).assertFalse();
      expect(graph.canRunTaskC()).assertEqual(ref.unlocked());
      expect(ref.poll()).assertFalse();
      expect(ref.cStarted).assertFalse();
      expect(ref.rounds).assertEqual(1);
    });

    /**
     * @tc.name   referenceGraphOpensOnTheMissingBranch
     * @tc.desc   Supplying the second completion opens the oracle gate and it starts C on the next poll.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('referenceGraphOpensOnTheMissingBranch', 0, () => {
      const ref: ReferenceGraph = new ReferenceGraph();
      ref.markComplete(TASK_A);
      ref.markComplete(TASK_B);
      expect(ref.unlocked()).assertTrue();
      expect(ref.poll()).assertTrue();
      expect(ref.cStarted).assertTrue();
      expect(ref.poll()).assertFalse();
      expect(ref.rounds).assertEqual(2);
      expect(ref.trace()).assertEqual('true,true,true,false');
    });

    /**
     * @tc.name   referenceGraphMatchesTheRecoveredRun
     * @tc.desc   A graph recovered through reset reaches the same final gate state as the boolean oracle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('referenceGraphMatchesTheRecoveredRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const ref: ReferenceGraph = new ReferenceGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 20);
      graph.completeTask(TASK_B, 30);
      graph.pollTick(40);
      graph.completeTaskC(50);
      ref.markComplete(TASK_A);
      ref.markComplete(TASK_B);
      ref.poll();
      ref.markComplete(TASK_C);
      expect(ref.trace()).assertEqual('true,true,true,true');
      expect(graph.allCompleted()).assertTrue();
      expect(graph.taskAt(2).isComplete()).assertEqual(ref.cDone);
      expect(graph.events.countOf('start-all')).assertEqual(1);
    });

    /**
     * @tc.name   recoveryKeepsTaskObjectReferences
     * @tc.desc   Reset does not rebuild the row objects, so a captured reference observes the next run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveryKeepsTaskObjectReferences', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const a: DownloadTask = graph.taskAt(0);
      const c: DownloadTask = graph.taskAt(2);
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 20);
      expect(a.status).assertEqual(STATUS_COMPLETED);
      expect(a.finishedAt).assertEqual(20);
      expect(c.status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(0) === a).assertTrue();
      expect(graph.taskAt(2) === c).assertTrue();
    });

    /**
     * @tc.name   resetDiscardsAStaleUnlockAnnouncement
     * @tc.desc   An opened but unserviced gate is fully forgotten by reset, including its unlock event.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetDiscardsAStaleUnlockAnnouncement', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      graph.reset();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(2).startedAt).assertEqual(0);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   secondAttemptIgnoresFirstAttemptTimestamps
     * @tc.desc   Timestamps from the interrupted attempt are cleared, so the resumed run writes its own.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondAttemptIgnoresFirstAttemptTimestamps', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1111);
      graph.reset();
      expect(graph.taskAt(0).finishedAt).assertEqual(0);
      graph.startAll();
      graph.completeTask(TASK_A, 2222);
      expect(graph.taskAt(0).finishedAt).assertEqual(2222);
      expect(graph.taskAt(0).finishedAt === 1111).assertFalse();
      expect(graph.taskAt(1).finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   recoveredRunEventTraceIsClean
     * @tc.desc   The resumed attempt starts its own trace, so no failure or rejection marker survives the reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveredRunEventTraceIsClean', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      graph.startAll();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.entries[0]).assertEqual('start-all:begin');
      expect(graph.events.size()).assertEqual(5);
    });

    /**
     * @tc.name   failedPrerequisiteCompletedLaterReopensTheGate
     * @tc.desc   A row failed during the run may still be completed, and with B done that opens the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedPrerequisiteCompletedLaterReopensTheGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_TIMEOUT);
      graph.completeTask(TASK_B, 10);
      expect(graph.canRunTaskC()).assertFalse();
      const completed: boolean = graph.completeTask(TASK_A, 20);
      expect(completed).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.pollTick(30)).assertTrue();
    });

    /**
     * @tc.name   resetMidRunThenPollDoesNotStartTaskC
     * @tc.desc   A tick arriving after a mid run reset is ignored because the timer and gate were cleared.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetMidRunThenPollDoesNotStartTaskC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.reset();
      const ignored: boolean = graph.pollTick(200);
      expect(ignored).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   recoveredRowsStartWithZeroTimestamps
     * @tc.desc   The resumed run stamps start times only when it starts, leaving old values at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveredRowsStartWithZeroTimestamps', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 40);
      graph.reset();
      expect(graph.taskAt(0).startedAt).assertEqual(0);
      expect(graph.taskAt(0).finishedAt).assertEqual(0);
      expect(graph.taskAt(1).startedAt).assertEqual(0);
      expect(graph.taskAt(2).startedAt).assertEqual(0);
      expect(graph.taskAt(2).finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   gateOpenCaptureAfterRecoveryShowsPrerequisitesDone
     * @tc.desc   A capture at the recovered gate window shows two completed rows and C still idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateOpenCaptureAfterRecoveryShowsPrerequisitesDone', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_B, 20);
      graph.completeTask(TASK_A, 30);
      log.capture(graph.tasks);
      expect(log.trace()).assertEqual('A/completed/100|B/completed/100|C/idle/0');
      expect(log.latest(TASK_C) !== undefined).assertTrue();
      expect(graph.allCompleted()).assertFalse();
      expect(log.size()).assertEqual(3);
    });

    /**
     * @tc.name   recoveredCompletionOrderIsTopological
     * @tc.desc   The order produced after a recovery still respects the gate, with C strictly last.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveredCompletionOrderIsTopological', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 20);
      graph.completeTask(TASK_B, 30);
      graph.pollTick(40);
      graph.completeTaskC(50);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.completionOrder.indexOf(TASK_C)).assertEqual(2);
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(graph.completionOrder.length).assertEqual(3);
    });

    /**
     * @tc.name   retryPolicySkipsACompletedPrerequisite
     * @tc.desc   Recovery never retries a row that already completed in the interrupted attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryPolicySkipsACompletedPrerequisite', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      expect(policy.shouldRetry(0, ERROR_NETWORK, graph.taskAt(0).status)).assertFalse();
      expect(policy.shouldRetry(1, ERROR_NETWORK, graph.taskAt(1).status)).assertTrue();
      expect(policy.delayFor(1)).assertEqual(200);
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
    });

    /**
     * @tc.name   recoveredTaskCRestartsItsAttemptCounter
     * @tc.desc   C starts once in the first attempt and once again after reset, ending with two attempts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveredTaskCRestartsItsAttemptCounter', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      graph.taskAt(2).fail(ERROR_NETWORK);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 40);
      graph.completeTask(TASK_B, 50);
      graph.pollTick(60);
      graph.completeTaskC(70);
      expect(graph.taskAt(2).attempts).assertEqual(2);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(2).isComplete()).assertTrue();
    });

    /**
     * @tc.name   repeatedResetsBeforeAFreshRunStayClean
     * @tc.desc   Five resets on an idle graph keep it ready, then the first real run still behaves normally.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedResetsBeforeAFreshRunStayClean', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 5; round++) {
        graph.reset();
        expect(graph.isTaskFinished).assertTrue();
      }
      expect(graph.events.size()).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      graph.startAll();
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.lock.holderCount()).assertEqual(2);
    });

    /**
     * @tc.name   recoveredGateStillQueuesTheExclusiveRequest
     * @tc.desc   After a recovery the lock again marks the exclusive C request as waiting before any poll.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveredGateStillQueuesTheExclusiveRequest', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      graph.reset();
      graph.startAll();
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      graph.completeTask(TASK_A, 40);
      graph.completeTask(TASK_B, 50);
      expect(graph.pollTick(60)).assertTrue();
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
    });

    /**
     * @tc.name   snapshotLogAuditsBothAttempts
     * @tc.desc   The log keeps the interrupted and resumed captures, and the newest lookup is the resumed one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLogAuditsBothAttempts', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      log.capture(graph.tasks);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 20);
      log.capture(graph.tasks);
      const newest: RunSnapshot | undefined = log.latest(TASK_A);
      expect(newest !== undefined).assertTrue();
      if (newest !== undefined) {
        expect(newest.status).assertEqual(STATUS_COMPLETED);
      }
      expect(log.size()).assertEqual(6);
      expect(log.snapshots[1].status).assertEqual(STATUS_RUNNING);
      expect(log.snapshots[3].status).assertEqual(STATUS_COMPLETED);
    });

    /**
     * @tc.name   recoveryAfterFailedCRestoresEveryRow
     * @tc.desc   The reset that follows a late C failure leaves no completed, failed or running row behind.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('recoveryAfterFailedCRestoresEveryRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      graph.taskAt(2).fail(ERROR_TIMEOUT);
      graph.reset();
      for (let index = 0; index < graph.tasks.length; index++) {
        expect(graph.taskAt(index).isIdle()).assertTrue();
        expect(graph.taskAt(index).progress).assertEqual(0);
      }
      expect(graph.allCompleted()).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
    });
  });
}
