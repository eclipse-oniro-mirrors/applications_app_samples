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
 * CoreConcurrency suite of the NetworkSample ohosTest module.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   62       private lock = true, the single gate of task C
 *   63-64    taskACompleted / taskBCompleted booleans
 *   98-102   checkAndUnlock opens the gate only when both flags are set
 *   105-107  canRunTaskC returns the negated lock
 *   174-198  startAllTasks: A and B under SHARED, C under EXCLUSIVE
 *   179-197  the 200 ms setInterval poll that starts C once and clears itself
 *
 * The suite pins the concurrency contract: A and B are peers, their finish
 * order is free, and C is strictly downstream of both of them.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  POLL_INTERVAL_MS,
  PROGRESS_TOTAL,
  DependencyLock,
  DownloadTask,
  RunSnapshot,
  SnapshotLog,
  createTaskGraph,
  expectedGateOpen,
  isTopologicalCompletion,
  completionTrace,
  joined,
  uniqueStrings,
  reversedCopy
} from '../Shared/SharedDriver';

export default function networkCoreConcurrencyTest(): void {
  describe('CoreConcurrency', () => {
    beforeAll(() => {
      logSuite('CoreConcurrency', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreConcurrency', 'end');
    });

    /**
     * @tc.name   sharedLockAdmitsBothTaskOwnersBeforeAnyCompletion
     * @tc.desc   A and B take the lock in SHARED mode together, so two holders coexist and the lock is not free.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sharedLockAdmitsBothTaskOwnersBeforeAnyCompletion', 0, () => {
      const lock = new DependencyLock();
      const first = lock.acquireShared(TASK_A);
      const second = lock.acquireShared(TASK_B);
      logStep('CoreConcurrency', 'shared holders ' + String(lock.holderCount()));
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(lock.holderCount()).assertEqual(2);
      expect(lock.hasShared(TASK_A)).assertTrue();
      expect(lock.hasShared(TASK_B)).assertTrue();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   sharedLockReleasesEachOwnerIndependently
     * @tc.desc   Releasing A leaves B holding the shared lock, and only the second release frees the lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sharedLockReleasesEachOwnerIndependently', 0, () => {
      const lock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      const releasedA = lock.releaseShared(TASK_A);
      logStep('CoreConcurrency', 'after release A holders ' + String(lock.holderCount()));
      expect(releasedA).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.hasShared(TASK_A)).assertFalse();
      expect(lock.hasShared(TASK_B)).assertTrue();
      expect(lock.isUnlocked()).assertFalse();
      const releasedB = lock.releaseShared(TASK_B);
      expect(releasedB).assertTrue();
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   completingTaskAFirstProducesTopologicalOrder
     * @tc.desc   With A finishing first the recorded order is A then B then C and the C position still wins.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completingTaskAFirstProducesTopologicalOrder', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const trace = completionTrace(graph);
      logStep('CoreConcurrency', 'A first trace ' + trace);
      expect(trace).assertEqual('A|B|C');
      expect(graph.completionOrder.length).assertEqual(3);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   completingTaskBFirstProducesTopologicalOrder
     * @tc.desc   The mirrored interleaving is equally valid: B may finish before A without delaying the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completingTaskBFirstProducesTopologicalOrder', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const trace = completionTrace(graph);
      logStep('CoreConcurrency', 'B first trace ' + trace);
      expect(trace).assertEqual('B|A|C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(graph.completionOrder[1]).assertEqual(TASK_A);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.totalProgress()).assertEqual(PROGRESS_TOTAL * 3);
    });

    /**
     * @tc.name   taskCStaysIdleWhileOnlyTaskACompleted
     * @tc.desc   One finished dependency keeps the gate shut: C is idle and the poll reports no start.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskCStaysIdleWhileOnlyTaskACompleted', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const started = graph.pollTick(POLL_INTERVAL_MS);
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      logStep('CoreConcurrency', 'A only, poll started C: ' + String(started));
      expect(started).assertFalse();
      expect(graph.canRunTaskC()).assertFalse();
      expect(c.status).assertEqual(STATUS_IDLE);
      expect(c.progress).assertEqual(0);
      expect(graph.timerActive).assertTrue();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
    });

    /**
     * @tc.name   taskCStaysIdleWhileOnlyTaskBCompleted
     * @tc.desc   The symmetric half-finished case must also keep C blocked, proving neither dependency is optional.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskCStaysIdleWhileOnlyTaskBCompleted', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      const started = graph.pollTick(POLL_INTERVAL_MS);
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      logStep('CoreConcurrency', 'B only, poll started C: ' + String(started));
      expect(started).assertFalse();
      expect(graph.canRunTaskC()).assertFalse();
      expect(c.isIdle()).assertTrue();
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.lock.hasShared(TASK_B)).assertFalse();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      expect(expectedGateOpen(a.isComplete(), true)).assertFalse();
    });

    /**
     * @tc.name   repeatedPollsBeforeGateNeverStartTaskC
     * @tc.desc   Four timer rounds with only A done leave C untouched while the poll counter keeps rising.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('repeatedPollsBeforeGateNeverStartTaskC', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      let attempts = 0;
      for (let round = 0; round < 4; round++) {
        if (graph.pollTick(POLL_INTERVAL_MS * (round + 1))) {
          attempts = attempts + 1;
        }
      }
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      logStep('CoreConcurrency', 'polls ' + String(graph.pollTicks) + ' starts ' + String(attempts));
      expect(attempts).assertEqual(0);
      expect(graph.pollTicks).assertEqual(4);
      expect(c.isIdle()).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.events.countOf('started')).assertEqual(2);
    });

    /**
     * @tc.name   taskCStartsOnlyAfterBothSharedHoldersRelease
     * @tc.desc   The exclusive acquisition needs an empty shared holder list, so the release order does not matter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskCStartsOnlyAfterBothSharedHoldersRelease', 0, () => {
      const lock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      const early = lock.acquireExclusive(TASK_C);
      logStep('CoreConcurrency', 'early exclusive ' + String(early));
      expect(early).assertFalse();
      expect(lock.waitingExclusive).assertTrue();
      lock.releaseShared(TASK_A);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      lock.releaseShared(TASK_B);
      const granted = lock.acquireExclusive(TASK_C);
      expect(granted).assertTrue();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   exclusiveAcquisitionIsRejectedWhileOneSharedHolderRemains
     * @tc.desc   A rejected exclusive attempt is counted but does not evict the surviving shared holder.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exclusiveAcquisitionIsRejectedWhileOneSharedHolderRemains', 0, () => {
      const lock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.releaseShared(TASK_A);
      lock.acquireShared(TASK_B);
      const rejected = lock.acquireExclusive(TASK_C);
      logStep('CoreConcurrency', 'rejections ' + String(lock.rejections));
      expect(rejected).assertFalse();
      expect(lock.rejections).assertEqual(1);
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.hasShared(TASK_B)).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(2);
    });

    /**
     * @tc.name   repeatedSharedAcquireKeepsSingleHolderEntry
     * @tc.desc   Acquiring twice for the same owner is idempotent, so a retried start cannot double-count holders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedSharedAcquireKeepsSingleHolderEntry', 0, () => {
      const lock = new DependencyLock();
      lock.acquireShared(TASK_A);
      const again = lock.acquireShared(TASK_A);
      logStep('CoreConcurrency', 'holders ' + String(lock.holderCount()) + ' acquisitions ' + String(lock.acquisitions));
      expect(again).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.hasShared(TASK_A)).assertTrue();
      lock.releaseShared(TASK_A);
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.releaseShared(TASK_A)).assertFalse();
    });

    /**
     * @tc.name   exclusiveOwnerRejectsNewSharedHolders
     * @tc.desc   Once C owns the lock exclusively a late A or B acquisition is refused and counted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exclusiveOwnerRejectsNewSharedHolders', 0, () => {
      const lock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      const lateA = lock.acquireShared(TASK_A);
      const lateB = lock.acquireShared(TASK_B);
      logStep('CoreConcurrency', 'late shared A ' + String(lateA) + ' B ' + String(lateB));
      expect(lateA).assertFalse();
      expect(lateB).assertFalse();
      expect(lock.rejections).assertEqual(2);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.sharedHolders.length).assertEqual(0);
    });

    /**
     * @tc.name   releaseSharedFromNonHolderReturnsFalse
     * @tc.desc   Releasing a task that never held the shared lock reports failure and leaves the holder list intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('releaseSharedFromNonHolderReturnsFalse', 0, () => {
      const lock = new DependencyLock();
      lock.acquireShared(TASK_A);
      const bogus = lock.releaseShared(TASK_C);
      logStep('CoreConcurrency', 'bogus shared release ' + String(bogus));
      expect(bogus).assertFalse();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.hasShared(TASK_A)).assertTrue();
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   releaseExclusiveRejectsWrongOwner
     * @tc.desc   Only the recorded exclusive owner can release its grant, so a mismatched release is a no-op.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('releaseExclusiveRejectsWrongOwner', 0, () => {
      const lock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      const wrong = lock.releaseExclusive(TASK_A);
      const ownerAfterWrong = lock.exclusiveOwner;
      const right = lock.releaseExclusive(TASK_C);
      logStep('CoreConcurrency', 'wrong owner release ' + String(wrong));
      expect(wrong).assertFalse();
      expect(ownerAfterWrong).assertEqual(TASK_C);
      expect(lock.holderCount()).assertEqual(0);
      expect(right).assertTrue();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   completingTaskADoesNotChangeTaskBProgress
     * @tc.desc   The two shared tasks own separate rows: finishing A leaves the B cell exactly where it was.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completingTaskADoesNotChangeTaskBProgress', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.reportProgress(40);
      graph.completeTask(TASK_A);
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      logStep('CoreConcurrency', 'A ' + String(a.progress) + ' / B ' + String(b.progress));
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(b.progress).assertEqual(40);
      expect(b.isRunning()).assertTrue();
      expect(a.isComplete()).assertTrue();
      expect(graph.totalProgress()).assertEqual(140);
      expect(graph.averageProgress()).assertEqual(140.0 / 3);
    });

    /**
     * @tc.name   completingTaskBDoesNotChangeTaskAProgress
     * @tc.desc   The mirrored mutation check: B reaching full progress must not write into the A cell.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completingTaskBDoesNotChangeTaskAProgress', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      a.reportProgress(15);
      graph.completeTask(TASK_B);
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      logStep('CoreConcurrency', 'B ' + String(b.progress) + ' / A ' + String(a.progress));
      expect(b.progress).assertEqual(PROGRESS_TOTAL);
      expect(a.progress).assertEqual(15);
      expect(a.isRunning()).assertTrue();
      expect(b.isComplete()).assertTrue();
      expect(graph.snapshotText()).assertEqual('A:running:15|B:completed:100|C:idle:0');
    });

    /**
     * @tc.name   interleavedProgressReportsStayPerTask
     * @tc.desc   Two interleaved progress streams each keep their own monotone cell, not a shared counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('interleavedProgressReportsStayPerTask', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      a.reportProgress(10);
      b.reportProgress(40);
      a.reportProgress(55);
      b.reportProgress(20);
      logStep('CoreConcurrency', 'interleaved A ' + String(a.progress) + ' B ' + String(b.progress));
      expect(a.progress).assertEqual(55);
      expect(b.progress).assertEqual(40);
      expect(a.progress).assertLarger(b.progress);
      expect(graph.totalProgress()).assertEqual(95);
      expect(a.progressRatio()).assertEqual(0.55);
    });

    /**
     * @tc.name   higherThenLowerReportKeepsTheHigherValue
     * @tc.desc   A late callback carrying a smaller number cannot roll a row backwards while the task runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('higherThenLowerReportKeepsTheHigherValue', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const first = a.reportProgress(80);
      const second = a.reportProgress(30);
      logStep('CoreConcurrency', 'reports 80 then 30 keep ' + String(second));
      expect(first).assertEqual(80);
      expect(second).assertEqual(80);
      expect(a.progress).assertEqual(80);
      expect(a.isRunning()).assertTrue();
      expect(a.progressRatio()).assertEqual(0.8);
    });

    /**
     * @tc.name   pollAfterTaskCStartedIsInactive
     * @tc.desc   Once C runs the timer is already cleared, so later poll rounds report no new start.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollAfterTaskCStartedIsInactive', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      const firstTick = graph.pollTick(POLL_INTERVAL_MS);
      const secondTick = graph.pollTick(POLL_INTERVAL_MS * 2);
      logStep('CoreConcurrency', 'first ' + String(firstTick) + ' second ' + String(secondTick));
      expect(firstTick).assertTrue();
      expect(secondTick).assertFalse();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.runningCount()).assertEqual(1);
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      expect(c.isRunning()).assertTrue();
      expect(c.status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   timerClearsExactlyOnceWhenTaskCStarts
     * @tc.desc   The timer-cleared marker is emitted once for the run, not once per poll round.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timerClearsExactlyOnceWhenTaskCStarts', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.pollTick(POLL_INTERVAL_MS * 2);
      graph.pollTick(POLL_INTERVAL_MS * 3);
      logStep('CoreConcurrency', 'cleared markers ' + String(graph.events.countOf('timer-cleared')));
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.events.last()).assertEqual('timer-cleared:C');
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   lockAcquisitionCountTotalsThreeForOneRun
     * @tc.desc   A full run takes the lock three times: twice shared and once exclusive for C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockAcquisitionCountTotalsThreeForOneRun', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const afterStart = graph.lock.acquisitions;
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      logStep('CoreConcurrency', 'acquisitions ' + String(graph.lock.acquisitions));
      expect(afterStart).assertEqual(2);
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
    });

    /**
     * @tc.name   concurrentStartsIncrementAttemptsPerTaskOnly
     * @tc.desc   Starting the pair bumps the attempt counter of A and B but never touches the queued C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('concurrentStartsIncrementAttemptsPerTaskOnly', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      logStep('CoreConcurrency', 'attempts ' + String(a.attempts) + String(b.attempts) + String(c.attempts));
      expect(a.attempts).assertEqual(1);
      expect(b.attempts).assertEqual(1);
      expect(c.attempts).assertEqual(0);
      expect(c.status).assertEqual(STATUS_IDLE);
      expect(a.status).assertEqual(STATUS_RUNNING);
      expect(b.status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   startAllStartsExactlyTwoTasksAtOnce
     * @tc.desc   A start round leaves two running rows and one idle row, which is the whole concurrency shape.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllStartsExactlyTwoTasksAtOnce', 0, () => {
      const graph = createTaskGraph();
      const started = graph.startAll();
      logStep('CoreConcurrency', 'running after start ' + String(graph.runningCount()));
      expect(started).assertTrue();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(0).isRunning()).assertTrue();
      expect(graph.taskAt(1).isRunning()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   snapshotTextKeepsFileOrderRegardlessOfCompletionOrder
     * @tc.desc   Rows are serialised by task number, so finishing B first does not reorder the A|B|C text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotTextKeepsFileOrderRegardlessOfCompletionOrder', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      const text = graph.snapshotText();
      logStep('CoreConcurrency', 'snapshot ' + text);
      expect(text.startsWith('A:completed:100')).assertTrue();
      expect(text.endsWith('C:idle:0')).assertTrue();
      expect(text.indexOf('B:completed:100')).assertLarger(text.indexOf('A:completed:100'));
      expect(text === 'B:completed:100|A:completed:100|C:idle:0').assertFalse();
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
    });

    /**
     * @tc.name   bothInterleavingsShareTheSameFinalSnapshot
     * @tc.desc   A-first and B-first journeys converge on one identical snapshot even though their event traces differ.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bothInterleavingsShareTheSameFinalSnapshot', 0, () => {
      const first = createTaskGraph();
      first.startAll();
      first.completeTask(TASK_A);
      first.completeTask(TASK_B);
      first.pollTick(POLL_INTERVAL_MS);
      first.completeTaskC(POLL_INTERVAL_MS);
      const second = createTaskGraph();
      second.startAll();
      second.completeTask(TASK_B);
      second.completeTask(TASK_A);
      second.pollTick(POLL_INTERVAL_MS);
      second.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreConcurrency', 'order1 ' + completionTrace(first) + ' order2 ' + completionTrace(second));
      expect(first.snapshotText()).assertEqual(second.snapshotText());
      expect(first.totalProgress()).assertEqual(second.totalProgress());
      expect(completionTrace(first) === completionTrace(second)).assertFalse();
      expect(first.events.fingerprint() === second.events.fingerprint()).assertFalse();
      expect(first.allCompleted()).assertTrue();
      expect(second.allCompleted()).assertTrue();
      expect(first.taskAt(2).status).assertEqual(STATUS_COMPLETED);
    });

    /**
     * @tc.name   reversedTaskListStillKeepsCBehindAAndB
     * @tc.desc   The gate is positional-independent: even walking the task list backwards, C remains last.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reversedTaskListStillKeepsCBehindAAndB', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const reversed = reversedCopy(TASK_NUMBERS);
      for (let index = 0; index < reversed.length; index++) {
        const taskNo = reversed[index];
        if (taskNo !== TASK_C) {
          graph.completeTask(taskNo);
        }
      }
      const readyBeforePoll = graph.canRunTaskC();
      graph.pollTick(POLL_INTERVAL_MS);
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      logStep('CoreConcurrency', 'reversed walk ' + joined(reversed, '>') + ' ready ' + String(readyBeforePoll));
      expect(reversed[0]).assertEqual(TASK_C);
      expect(readyBeforePoll).assertTrue();
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.canRunTaskC()).assertTrue();
      expect(c.isRunning()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
    });

    /**
     * @tc.name   lockResetClearsHoldersWaitersAndCounters
     * @tc.desc   Rebuilding the lock for a new run must drop stale holders, the waiter flag and both counters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockResetClearsHoldersWaitersAndCounters', 0, () => {
      const lock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      lock.acquireExclusive(TASK_C);
      const beforeAcquisitions = lock.acquisitions;
      const beforeRejections = lock.rejections;
      lock.reset();
      logStep('CoreConcurrency', 'reset lock before ' + String(beforeAcquisitions) + '/' + String(beforeRejections));
      expect(beforeAcquisitions).assertEqual(2);
      expect(beforeRejections).assertEqual(1);
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.acquisitions).assertEqual(0);
      expect(lock.rejections).assertEqual(0);
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.sharedHolders.length).assertEqual(0);
    });

    /**
     * @tc.name   completingUnknownTaskLeavesLockAndOrderUntouched
     * @tc.desc   A completion callback for an unmapped task number is refused before any lock or trace mutation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completingUnknownTaskLeavesLockAndOrderUntouched', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const accepted = graph.completeTask('D');
      logStep('CoreConcurrency', 'unknown completion accepted ' + String(accepted));
      expect(accepted).assertFalse();
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.lock.isUnlocked()).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(0);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.runningCount()).assertEqual(2);
    });

    /**
     * @tc.name   gateOracleRequiresBothFlagsNotJustOne
     * @tc.desc   The independent gate oracle enumerates all four flag pairs and only the double-true pair opens.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateOracleRequiresBothFlagsNotJustOne', 0, () => {
      const none = expectedGateOpen(false, false);
      const onlyA = expectedGateOpen(true, false);
      const onlyB = expectedGateOpen(false, true);
      const both = expectedGateOpen(true, true);
      logStep('CoreConcurrency', 'gate ' + String(none) + String(onlyA) + String(onlyB) + String(both));
      expect(none).assertFalse();
      expect(onlyA).assertFalse();
      expect(onlyB).assertFalse();
      expect(both).assertTrue();
      expect(onlyA === onlyB).assertTrue();
      expect(both === none).assertFalse();
    });

    /**
     * @tc.name   sharedHoldersDuringRunListBothPeerTasks
     * @tc.desc   While the run is in flight the lock exposes both peer holders and the pending exclusive waiter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sharedHoldersDuringRunListBothPeerTasks', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const holders = graph.lock.sharedHolders.slice();
      logStep('CoreConcurrency', 'holders ' + joined(holders, '+'));
      expect(holders.length).assertEqual(2);
      expect(holders[0]).assertEqual(TASK_A);
      expect(holders[1]).assertEqual(TASK_B);
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   exclusiveWaitFlagClearsOnlyAfterGrant
     * @tc.desc   A refused exclusive attempt raises the waiter flag; only the successful grant lowers it again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exclusiveWaitFlagClearsOnlyAfterGrant', 0, () => {
      const lock = new DependencyLock();
      lock.acquireShared(TASK_A);
      const refused = lock.acquireExclusive(TASK_C);
      const flagAfterRefusal = lock.waitingExclusive;
      lock.releaseShared(TASK_A);
      const granted = lock.acquireExclusive(TASK_C);
      logStep('CoreConcurrency', 'refused ' + String(refused) + ' granted ' + String(granted));
      expect(refused).assertFalse();
      expect(flagAfterRefusal).assertTrue();
      expect(granted).assertTrue();
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.rejections).assertEqual(1);
      expect(lock.acquisitions).assertEqual(2);
    });

    /**
     * @tc.name   readytaskCStillWaitsWhenExclusiveLockIsTaken
     * @tc.desc   The dependency gate can be open while the lock is busy, and C must not start through a foreign owner.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readytaskCStillWaitsWhenExclusiveLockIsTaken', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      const foreignGrant = graph.lock.acquireExclusive('X');
      const started = graph.runTaskCIfReady(POLL_INTERVAL_MS);
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      logStep('CoreConcurrency', 'foreign grant ' + String(foreignGrant) + ' C started ' + String(started));
      expect(graph.canRunTaskC()).assertTrue();
      expect(foreignGrant).assertTrue();
      expect(started).assertFalse();
      expect(c.isIdle()).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('X');
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   gateReopensNoEarlierThanTheSecondSharedRelease
     * @tc.desc   Walking the release sequence step by step shows the gate flips exactly on the last shared release.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateReopensNoEarlierThanTheSecondSharedRelease', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      const gateBefore = graph.canRunTaskC();
      graph.completeTask(TASK_A);
      const gateAfterA = graph.canRunTaskC();
      const holdersAfterA = graph.lock.holderCount();
      graph.completeTask(TASK_B);
      const gateAfterB = graph.canRunTaskC();
      logStep('CoreConcurrency', 'gate ' + String(gateBefore) + String(gateAfterA) + String(gateAfterB));
      expect(gateBefore).assertFalse();
      expect(gateAfterA).assertFalse();
      expect(holdersAfterA).assertEqual(1);
      expect(a.isComplete()).assertTrue();
      expect(b.isComplete()).assertTrue();
      expect(gateAfterB).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.waitingExclusive).assertTrue();
    });

    /**
     * @tc.name   interleavedCompletionPollsKeepOneRowPerTask
     * @tc.desc   Alternating a completion with a poll round never duplicates a trace entry or a snapshot row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('interleavedCompletionPollsKeepOneRowPerTask', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const log = new SnapshotLog();
      log.capture(graph.tasks);
      graph.completeTask(TASK_A);
      graph.pollTick(POLL_INTERVAL_MS);
      log.capture(graph.tasks);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS * 2);
      log.capture(graph.tasks);
      const completedEvents = graph.events.countOf('completed');
      const unique = uniqueStrings(graph.completionOrder);
      const latestA = log.latest(TASK_A) as RunSnapshot;
      const latestB = log.latest(TASK_B) as RunSnapshot;
      const latestC = log.latest(TASK_C) as RunSnapshot;
      logStep('CoreConcurrency', 'rows ' + String(log.size()) + ' unique ' + String(unique.length));
      expect(log.size()).assertEqual(9);
      expect(unique.length).assertEqual(2);
      expect(completedEvents).assertEqual(2);
      expect(latestA.progress).assertEqual(PROGRESS_TOTAL);
      expect(latestB.status).assertEqual(STATUS_COMPLETED);
      expect(latestC.status).assertEqual(STATUS_RUNNING);
      expect(graph.completionOrder.length).assertEqual(2);
    });

    /**
     * @tc.name   twoCompletionsBeforeFirstPollUnlockOnlyOnce
     * @tc.desc   If both peers finish between timer rounds the first poll unlocks once, starts C and clears the timer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreConcurrency scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoCompletionsBeforeFirstPollUnlockOnlyOnce', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      const beforePollUnlocks = graph.events.countOf('unlocked');
      const started = graph.pollTick(POLL_INTERVAL_MS);
      const afterPollUnlocks = graph.events.countOf('unlocked');
      logStep('CoreConcurrency', 'unlocks ' + String(beforePollUnlocks) + '->' + String(afterPollUnlocks));
      expect(beforePollUnlocks).assertEqual(1);
      expect(afterPollUnlocks).assertEqual(1);
      expect(started).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.timerActive).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.isUnlocked()).assertFalse();
      expect(graph.taskAt(2).isRunning()).assertTrue();
    });
  });
}
