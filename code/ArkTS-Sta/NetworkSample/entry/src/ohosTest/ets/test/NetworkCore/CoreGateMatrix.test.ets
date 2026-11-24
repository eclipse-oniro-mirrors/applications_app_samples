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
 * CoreGateMatrix suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   62       private lock = true, the boolean gate of task C
 *   98-102   checkAndUnlock: A && B && lock -> lock = false
 *   105-107  canRunTaskC returns !lock
 *   174-198  startAllTasks: shared A/B, exclusive C, 200 ms poll
 *   151-171  runTaskA / runTaskB / runTaskC URL literals
 *
 * SharedDriver anchors:
 *   502-569  DependencyLock, the SHARED / EXCLUSIVE mirror
 *   668-830  TaskGraph, startAll / pollTick / reset
 *   909-942  PollClock, the 200 ms timer model
 *   1044-1052 isTopologicalCompletion
 *
 * The suite enumerates the gate truth table, both lock modes, every
 * completion ordering of the three rows, poll timing and a reset / re-run.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TaskGraph,
  DependencyLock,
  DownloadTask,
  PollClock,
  ReferenceGraph,
  createTaskGraph,
  completionTrace,
  isTopologicalCompletion,
  expectedGateOpen,
  expectedStepStatus,
  countOf,
  joined,
  sortedCopy,
  reversedCopy,
  TASK_A,
  TASK_B,
  TASK_C,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  STATUS_FAILED,
  ERROR_NONE,
  ERROR_NETWORK,
  ERROR_TIMEOUT,
  POLL_INTERVAL_MS
} from '../Shared/SharedDriver';

export default function networkCoreGateMatrixTest(): void {
  describe('CoreGateMatrix', () => {
    beforeAll(() => {
      logSuite('CoreGateMatrix', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreGateMatrix', 'end');
    });

    /**
     * @tc.name   gateMatrixGateClosedBeforeAnyCompletion
     * @tc.desc   With A and B idle the gate predicate is false and the lock is free.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Create the graph and read canRunTaskC.
     *                   2. Compare the value with expectedGateOpen(false, false).
     *                   3. Confirm both dependencies are still idle.
     * @tc.expected      The gate is closed, the lock is unlocked and no task is complete.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixGateClosedBeforeAnyCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.canRunTaskC()).assertEqual(expectedGateOpen(false, false));
      expect(graph.tasks[0].isIdle()).assertTrue();
      expect(graph.tasks[1].isIdle()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   gateMatrixGateStaysClosedWithOnlyAComplete
     * @tc.desc   Completing A alone never satisfies the two-input conjunction.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Complete A through the graph callback entry.
     *                   2. Read canRunTaskC and the lock holder list.
     *                   3. Compare with expectedGateOpen(true, false).
     * @tc.expected      The gate remains closed while B is not complete.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixGateStaysClosedWithOnlyAComplete', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.canRunTaskC()).assertEqual(expectedGateOpen(true, false));
      expect(graph.tasks[0].isComplete()).assertTrue();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
    });

    /**
     * @tc.name   gateMatrixGateStaysClosedWithOnlyBComplete
     * @tc.desc   Completing B alone is symmetric and also leaves the gate closed.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Complete B through the graph callback entry.
     *                   2. Read canRunTaskC and the A row status.
     *                   3. Compare with expectedGateOpen(false, true).
     * @tc.expected      The gate remains closed while A is not complete.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixGateStaysClosedWithOnlyBComplete', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_B)).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.canRunTaskC()).assertEqual(expectedGateOpen(false, true));
      expect(graph.tasks[0].isRunning()).assertTrue();
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
    });

    /**
     * @tc.name   gateMatrixGateOpensWhenBothDependenciesComplete
     * @tc.desc   The conjunction is true exactly when A and B are both complete.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Complete A and then B.
     *                   2. Read canRunTaskC after each callback.
     *                   3. Compare the final value with expectedGateOpen(true, true).
     * @tc.expected      The gate closes after A, opens after B and the lock is empty.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixGateOpensWhenBothDependenciesComplete', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.canRunTaskC()).assertEqual(expectedGateOpen(true, true));
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   gateMatrixGateTruthTableOverDependencyPairs
     * @tc.desc   All four done/not-done pairs of A and B agree with the gate oracle.
     * @tc.precondition  Four independent graphs are built inside the case body.
     * @tc.steps         1. Iterate the four done flags of A and B.
     *                   2. Complete the matching dependency in a fresh graph.
     *                   3. Compare canRunTaskC with expectedGateOpen of the pair.
     * @tc.expected      Every pair matches the oracle and four pairs were visited.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixGateTruthTableOverDependencyPairs', 0, () => {
      const flags: boolean[] = [false, true];
      let visited: number = 0;
      for (let aIndex = 0; aIndex < flags.length; aIndex++) {
        for (let bIndex = 0; bIndex < flags.length; bIndex++) {
          const graph: TaskGraph = createTaskGraph();
          if (flags[aIndex]) {
            graph.completeTask(TASK_A);
          }
          if (flags[bIndex]) {
            graph.completeTask(TASK_B);
          }
          expect(graph.canRunTaskC()).assertEqual(expectedGateOpen(flags[aIndex], flags[bIndex]));
          visited = visited + 1;
        }
      }
      expect(visited).assertEqual(4);
      expect(expectedGateOpen(false, false)).assertFalse();
    });

    /**
     * @tc.name   gateMatrixStatusMatrixKeepsGateClosedUnlessBothCompleted
     * @tc.desc   A sixteen cell matrix of idle / running / completed / failed pairs.
     * @tc.precondition  Sixteen independent graphs are built inside the case body.
     * @tc.steps         1. Iterate the four statuses for A and for B.
     *                   2. Apply each status directly to the seeded DownloadTask.
     *                   3. Compare the gate with the both-completed predicate.
     * @tc.expected      Only the completed/completed cell opens the gate.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixStatusMatrixKeepsGateClosedUnlessBothCompleted', 0, () => {
      const statuses: string[] = [STATUS_IDLE, STATUS_RUNNING, STATUS_COMPLETED, STATUS_FAILED];
      let openCells: number = 0;
      for (let aIndex = 0; aIndex < statuses.length; aIndex++) {
        for (let bIndex = 0; bIndex < statuses.length; bIndex++) {
          const graph: TaskGraph = createTaskGraph();
          const a: DownloadTask = graph.tasks[0];
          const b: DownloadTask = graph.tasks[1];
          if (statuses[aIndex] === STATUS_RUNNING) {
            a.start(0);
          } else if (statuses[aIndex] === STATUS_COMPLETED) {
            a.complete(0);
          } else if (statuses[aIndex] === STATUS_FAILED) {
            a.fail(ERROR_NETWORK);
          }
          if (statuses[bIndex] === STATUS_RUNNING) {
            b.start(0);
          } else if (statuses[bIndex] === STATUS_COMPLETED) {
            b.complete(0);
          } else if (statuses[bIndex] === STATUS_FAILED) {
            b.fail(ERROR_TIMEOUT);
          }
          expect(graph.canRunTaskC()).assertEqual(a.isComplete() && b.isComplete());
          if (graph.canRunTaskC()) {
            openCells = openCells + 1;
          }
        }
      }
      expect(openCells).assertEqual(1);
      expect(statuses.length).assertEqual(4);
    });

    /**
     * @tc.name   gateMatrixRunningDependencyKeepsGateClosed
     * @tc.desc   A started but unfinished A cannot satisfy the gate even if B is done.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Start the run so A and B are running.
     *                   2. Complete B only and read the gate.
     *                   3. Compare with expectedGateOpen(false, true).
     * @tc.expected      The gate stays closed while A is running.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixRunningDependencyKeepsGateClosed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      expect(graph.tasks[0].isRunning()).assertTrue();
      graph.completeTask(TASK_B);
      expect(graph.tasks[0].isRunning()).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.canRunTaskC()).assertEqual(expectedGateOpen(false, true));
      expect(graph.runningCount()).assertEqual(1);
    });

    /**
     * @tc.name   gateMatrixFailedDependencyKeepsGateClosed
     * @tc.desc   A failed A is terminal but not complete, so the gate stays closed.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Start the run and fail A with a transient code.
     *                   2. Complete B through the graph callback.
     *                   3. Read the gate and the failed flag of A.
     * @tc.expected      A is failed, B is complete and the gate stays closed.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixFailedDependencyKeepsGateClosed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.tasks[0].fail(ERROR_NETWORK)).assertTrue();
      expect(graph.tasks[0].isFailed()).assertTrue();
      expect(graph.tasks[0].lastErrorCode).assertEqual(ERROR_NETWORK);
      graph.completeTask(TASK_B);
      expect(graph.tasks[1].isComplete()).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.canRunTaskC()).assertEqual(expectedGateOpen(false, true));
    });

    /**
     * @tc.name   gateMatrixStepStatusOracleMatchesPairTable
     * @tc.desc   expectedStepStatus reports completed only for the true/true pair.
     * @tc.precondition  The shared oracle functions are imported by the suite.
     * @tc.steps         1. Evaluate the oracle for the four boolean pairs.
     *                   2. Count how many pairs report completed.
     *                   3. Compare with the gate predicate on the same inputs.
     * @tc.expected      Exactly one pair reports completed and it is the open gate.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixStepStatusOracleMatchesPairTable', 0, () => {
      const completedPairs: number = (expectedStepStatus(false, false) === STATUS_COMPLETED ? 1 : 0) +
        (expectedStepStatus(true, false) === STATUS_COMPLETED ? 1 : 0) +
        (expectedStepStatus(false, true) === STATUS_COMPLETED ? 1 : 0) +
        (expectedStepStatus(true, true) === STATUS_COMPLETED ? 1 : 0);
      expect(completedPairs).assertEqual(1);
      expect(expectedStepStatus(true, true)).assertEqual(STATUS_COMPLETED);
      expect(expectedStepStatus(true, false)).assertEqual(STATUS_RUNNING);
      expect(expectedStepStatus(false, false)).assertEqual(STATUS_RUNNING);
      expect(expectedStepStatus(true, true) === STATUS_COMPLETED).assertEqual(expectedGateOpen(true, true));
    });

    /**
     * @tc.name   gateMatrixReferenceModelMatchesGraphAcrossCombinations
     * @tc.desc   The boolean ReferenceGraph and TaskGraph agree on every pair.
     * @tc.precondition  Paired graph and reference objects are built per combination.
     * @tc.steps         1. Iterate the four completion pairs.
     *                   2. Mark the same tasks in both models.
     *                   3. Compare unlocked() with canRunTaskC() each round.
     * @tc.expected      Both models agree and the reference trace is a boolean quadruple.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixReferenceModelMatchesGraphAcrossCombinations', 0, () => {
      const flags: boolean[] = [false, true];
      let agreements: number = 0;
      for (let aIndex = 0; aIndex < flags.length; aIndex++) {
        for (let bIndex = 0; bIndex < flags.length; bIndex++) {
          const graph: TaskGraph = createTaskGraph();
          const reference: ReferenceGraph = new ReferenceGraph();
          if (flags[aIndex]) {
            graph.completeTask(TASK_A);
            reference.markComplete(TASK_A);
          }
          if (flags[bIndex]) {
            graph.completeTask(TASK_B);
            reference.markComplete(TASK_B);
          }
          expect(reference.unlocked()).assertEqual(graph.canRunTaskC());
          agreements = agreements + 1;
        }
      }
      expect(agreements).assertEqual(4);
      expect(new ReferenceGraph().trace()).assertEqual('false,false,false,false');
    });

    /**
     * @tc.name   gateMatrixSharedHoldersCoexist
     * @tc.desc   Two SHARED owners can hold the dependency lock at the same time.
     * @tc.precondition  A fresh DependencyLock is created inside the case body.
     * @tc.steps         1. Acquire SHARED for A and then for B.
     *                   2. Read the holder list and the holder count.
     *                   3. Confirm EXCLUSIVE is refused while both are held.
     * @tc.expected      Both shared owners are present and the exclusive request fails.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixSharedHoldersCoexist', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.acquireShared(TASK_B)).assertTrue();
      expect(lock.holderCount()).assertEqual(2);
      expect(lock.hasShared(TASK_A)).assertTrue();
      expect(lock.hasShared(TASK_B)).assertTrue();
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.isUnlocked()).assertFalse();
      expect(lock.exclusiveOwner).assertEqual('');
    });

    /**
     * @tc.name   gateMatrixExclusiveRejectedWhileSharedHeld
     * @tc.desc   An EXCLUSIVE request fails while any SHARED holder remains.
     * @tc.precondition  A fresh DependencyLock is created inside the case body.
     * @tc.steps         1. Acquire SHARED for A.
     *                   2. Ask for EXCLUSIVE for C.
     *                   3. Read the rejection counter and the waiting flag.
     * @tc.expected      The request is refused, one rejection is counted and C waits.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixExclusiveRejectedWhileSharedHeld', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.rejections).assertEqual(1);
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   gateMatrixExclusiveGrantedAfterBothSharesReleased
     * @tc.desc   Once A and B release, C is the only holder and takes EXCLUSIVE.
     * @tc.precondition  A fresh DependencyLock is created inside the case body.
     * @tc.steps         1. Acquire SHARED for A and B, then release both.
     *                   2. Acquire EXCLUSIVE for C.
     *                   3. Read owner, count and acquisition total.
     * @tc.expected      The lock is exclusive to C and the third acquisition is recorded.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixExclusiveGrantedAfterBothSharesReleased', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.releaseShared(TASK_A)).assertTrue();
      expect(lock.releaseShared(TASK_B)).assertTrue();
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(3);
      expect(lock.waitingExclusive).assertFalse();
    });

    /**
     * @tc.name   gateMatrixSharedRejectedWhileExclusiveHeld
     * @tc.desc   A SHARED request is refused while C owns the exclusive mode.
     * @tc.precondition  A fresh DependencyLock is created inside the case body.
     * @tc.steps         1. Acquire EXCLUSIVE for C on the empty lock.
     *                   2. Ask for SHARED for A and for B.
     *                   3. Read the rejection counter.
     * @tc.expected      Both shared requests fail and two rejections are counted.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixSharedRejectedWhileExclusiveHeld', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertFalse();
      expect(lock.acquireShared(TASK_B)).assertFalse();
      expect(lock.rejections).assertEqual(2);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.hasShared(TASK_A)).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
    });

    /**
     * @tc.name   gateMatrixDuplicateSharedAcquireIsIdempotent
     * @tc.desc   Re-acquiring SHARED for the same owner does not duplicate the holder.
     * @tc.precondition  A fresh DependencyLock is created inside the case body.
     * @tc.steps         1. Acquire SHARED for A three times.
     *                   2. Read the holder count and acquisition counter.
     *                   3. Release A once and read the lock again.
     * @tc.expected      One holder entry exists, one acquisition is counted and release empties it.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixDuplicateSharedAcquireIsIdempotent', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.releaseShared(TASK_A)).assertTrue();
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   gateMatrixReleaseUnknownSharedHolderFails
     * @tc.desc   Releasing a SHARED owner that never acquired reports failure.
     * @tc.precondition  A fresh DependencyLock is created inside the case body.
     * @tc.steps         1. Acquire SHARED for A.
     *                   2. Release B, which was never a holder.
     *                   3. Release A to drain the lock.
     * @tc.expected      The unknown release fails, A stays held, the real release succeeds.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixReleaseUnknownSharedHolderFails', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      expect(lock.releaseShared(TASK_B)).assertFalse();
      expect(lock.hasShared(TASK_A)).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.releaseShared(TASK_A)).assertTrue();
      expect(lock.releaseShared(TASK_A)).assertFalse();
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   gateMatrixExclusiveReleaseRequiresOwner
     * @tc.desc   Only the recorded exclusive owner can release the exclusive mode.
     * @tc.precondition  A fresh DependencyLock is created inside the case body.
     * @tc.steps         1. Acquire EXCLUSIVE for C.
     *                   2. Attempt release by A and then by C.
     *                   3. Read the owner after each attempt.
     * @tc.expected      A is refused, C succeeds and the owner field becomes empty.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixExclusiveReleaseRequiresOwner', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      expect(lock.releaseExclusive(TASK_A)).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.releaseExclusive(TASK_C)).assertTrue();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertTrue();
    });

    /**
     * @tc.name   gateMatrixLockResetClearsCountersAndModes
     * @tc.desc   reset() returns the lock to the pristine state after mixed traffic.
     * @tc.precondition  A fresh DependencyLock is created inside the case body.
     * @tc.steps         1. Generate shared, exclusive and rejected requests.
     *                   2. Call reset on the lock.
     *                   3. Read every counter and both mode fields.
     * @tc.expected      No holder remains and all counters are zero.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixLockResetClearsCountersAndModes', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireExclusive(TASK_C);
      lock.releaseShared(TASK_A);
      lock.acquireExclusive(TASK_C);
      expect(lock.rejections).assertEqual(1);
      lock.reset();
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.acquisitions).assertEqual(0);
      expect(lock.rejections).assertEqual(0);
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   gateMatrixWaitingExclusiveFlagSetOnRejection
     * @tc.desc   The waiting flag rises on a refused exclusive request and falls on success.
     * @tc.precondition  A fresh DependencyLock is created inside the case body.
     * @tc.steps         1. Hold SHARED for A and request EXCLUSIVE.
     *                   2. Release A and request EXCLUSIVE again.
     *                   3. Read the waiting flag before and after each request.
     * @tc.expected      The flag is true while blocked and false once C owns the lock.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('gateMatrixWaitingExclusiveFlagSetOnRejection', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.waitingExclusive).assertFalse();
      lock.acquireShared(TASK_A);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.waitingExclusive).assertTrue();
      lock.releaseShared(TASK_A);
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.rejections).assertEqual(1);
    });

    /**
     * @tc.name   gateMatrixCompletionOrderABCPassesTopology
     * @tc.desc   A then B then C is a valid topological order of the gate.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Complete A and B in that order.
     *                   2. Start and complete C.
     *                   3. Validate the observed order with the oracle.
     * @tc.expected      The trace is A|B|C and the oracle accepts it.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixCompletionOrderABCPassesTopology', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady(200);
      graph.completeTaskC(400);
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.allCompleted()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   gateMatrixCompletionOrderBACPassesTopology
     * @tc.desc   B may complete before A because the pair has no internal order.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Complete B and then A.
     *                   2. Start and complete C.
     *                   3. Validate the observed order with the oracle.
     * @tc.expected      The trace is B|A|C and the oracle accepts it.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixCompletionOrderBACPassesTopology', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      graph.runTaskCIfReady(200);
      graph.completeTaskC(400);
      expect(completionTrace(graph)).assertEqual('B|A|C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
      expect(graph.events.countOf('completed')).assertEqual(3);
    });

    /**
     * @tc.name   gateMatrixAllSixPermutationsClassified
     * @tc.desc   Exactly the two permutations that end with C are topological.
     * @tc.precondition  The order oracle is imported from the shared driver.
     * @tc.steps         1. Build all six permutations of A, B and C.
     *                   2. Classify each permutation with the oracle.
     *                   3. Count the accepted permutations.
     * @tc.expected      Two permutations pass and both place C in the last slot.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixAllSixPermutationsClassified', 0, () => {
      const permutations: string[][] = [
        [TASK_A, TASK_B, TASK_C],
        [TASK_A, TASK_C, TASK_B],
        [TASK_B, TASK_A, TASK_C],
        [TASK_B, TASK_C, TASK_A],
        [TASK_C, TASK_A, TASK_B],
        [TASK_C, TASK_B, TASK_A]
      ];
      let accepted: number = 0;
      let lastIsC: number = 0;
      for (let index = 0; index < permutations.length; index++) {
        const order: string[] = permutations[index];
        if (isTopologicalCompletion(order)) {
          accepted = accepted + 1;
        }
        if (order[order.length - 1] === TASK_C) {
          lastIsC = lastIsC + 1;
        }
      }
      expect(accepted).assertEqual(2);
      expect(lastIsC).assertEqual(2);
      expect(accepted).assertEqual(lastIsC);
      expect(permutations.length).assertEqual(6);
    });

    /**
     * @tc.name   gateMatrixOrderWithCEarlyRejected
     * @tc.desc   Any plan that completes C before a dependency is rejected.
     * @tc.precondition  The order oracle is imported from the shared driver.
     * @tc.steps         1. Supply orders that place C first or in the middle.
     *                   2. Classify each order.
     *                   3. Confirm a full three element set is required.
     * @tc.expected      Every order with C before A or B is rejected.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixOrderWithCEarlyRejected', 0, () => {
      expect(isTopologicalCompletion([TASK_C, TASK_A, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_C, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_B, TASK_C, TASK_A])).assertFalse();
      expect(isTopologicalCompletion([TASK_C])).assertFalse();
      expect(isTopologicalCompletion([TASK_C, TASK_B, TASK_A])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_B, TASK_C])).assertTrue();
    });

    /**
     * @tc.name   gateMatrixOrderWithMissingDependencyRejected
     * @tc.desc   A trace that omits A or B cannot describe a complete run.
     * @tc.precondition  The order oracle is imported from the shared driver.
     * @tc.steps         1. Supply pairs and singletons that omit a task.
     *                   2. Classify each shortened trace.
     *                   3. Confirm the empty trace is rejected too.
     * @tc.expected      Every incomplete trace is rejected by the oracle.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixOrderWithMissingDependencyRejected', 0, () => {
      expect(isTopologicalCompletion([TASK_A, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_C])).assertFalse();
      expect(isTopologicalCompletion([TASK_B, TASK_C])).assertFalse();
      expect(isTopologicalCompletion([])).assertFalse();
      expect(isTopologicalCompletion([TASK_A])).assertFalse();
      expect(isTopologicalCompletion([TASK_C, TASK_A, TASK_B])).assertFalse();
    });

    /**
     * @tc.name   gateMatrixObservedCompletionOrderIsTopological
     * @tc.desc   The order recorded by the graph after a real run satisfies the oracle.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Run the full three task cycle through the graph.
     *                   2. Read completionOrder and the trace text.
     *                   3. Compare with the reversed order.
     * @tc.expected      The recorded order is topological and its reverse is not.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('gateMatrixObservedCompletionOrderIsTopological', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(isTopologicalCompletion(reversedCopy(graph.completionOrder))).assertFalse();
      expect(joined(sortedCopy(graph.completionOrder), '')).assertEqual('ABC');
      logStep('CoreGateMatrix', completionTrace(graph));
    });

    /**
     * @tc.name   gateMatrixDuplicateCompletionDoesNotAppend
     * @tc.desc   A second completion callback for the same task is refused.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Complete A twice through the graph entry.
     *                   2. Read the order list and the completed event count.
     *                   3. Confirm the A failure path is untouched.
     * @tc.expected      Only one A entry exists and only one completed event was logged.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixDuplicateCompletionDoesNotAppend', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.completeTask(TASK_A)).assertFalse();
      expect(graph.completionOrder.length).assertEqual(1);
      expect(countOf(graph.completionOrder, TASK_A)).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.tasks[0].lastErrorCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name   gateMatrixCompletionOfUnknownTaskIgnored
     * @tc.desc   A completion callback for an unknown row leaves the graph unchanged.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Deliver a completion for row Z.
     *                   2. Read the order list and the snapshot text.
     *                   3. Deliver a valid completion afterwards.
     * @tc.expected      The unknown row is ignored and the valid row is recorded.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixCompletionOfUnknownTaskIgnored', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const before: string = graph.snapshotText();
      expect(graph.completeTask('Z')).assertFalse();
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.snapshotText()).assertEqual(before);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.completeTask(TASK_B)).assertTrue();
      expect(completionTrace(graph)).assertEqual('B');
    });

    /**
     * @tc.name   gateMatrixPollTicksCountEvenWhenInactive
     * @tc.desc   The poll counter advances on an inactive timer but no task starts.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Tick the poll before startAll arms the timer.
     *                   2. Read the counter and the C row status.
     *                   3. Arm the timer and read the counter again.
     * @tc.expected      One tick is counted while idle and the counter survives the start.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixPollTicksCountEvenWhenInactive', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.tasks[2].isIdle()).assertTrue();
      expect(graph.timerActive).assertFalse();
      graph.startAll();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   gateMatrixPollBeforeGateOpensReturnsFalse
     * @tc.desc   A poll while only one dependency is complete reports no start.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Start the run and complete A.
     *                   2. Poll the timer once.
     *                   3. Read the C row, the counter and the timer flag.
     * @tc.expected      The poll fails, C stays idle and the timer stays armed.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixPollBeforeGateOpensReturnsFalse', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.tasks[2].isIdle()).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
    });

    /**
     * @tc.name   gateMatrixPollOpensCAndClearsTimer
     * @tc.desc   The first poll after both dependencies complete starts C and stops the timer.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Start the run and complete A and B.
     *                   2. Poll the timer with a 200 ms timestamp.
     *                   3. Read the C row, timer flag and event counts.
     * @tc.expected      C runs, the timer is cleared and exactly one clear event is logged.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixPollOpensCAndClearsTimer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick(200)).assertTrue();
      expect(graph.tasks[2].isRunning()).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.pollTicks).assertEqual(1);
    });

    /**
     * @tc.name   gateMatrixPollAfterTimerClearedReturnsFalse
     * @tc.desc   Polling again after C started counts the tick but starts nothing.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Run the gate and let the first poll start C.
     *                   2. Poll a second and a third time.
     *                   3. Compare the tick counter with the running count.
     * @tc.expected      Later polls return false while the tick counter keeps rising.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixPollAfterTimerClearedReturnsFalse', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTick(600)).assertFalse();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.runningCount()).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.tasks[2].attempts).assertEqual(1);
    });

    /**
     * @tc.name   gateMatrixPollDoesNotConsumeTheDependencies
     * @tc.desc   The poll that starts C leaves the completed A and B rows intact.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Complete A and B, then poll once.
     *                   2. Read the status of both dependencies.
     *                   3. Read progress totals and the exclusive owner.
     * @tc.expected      A and B still hold 100 each and only C owns the lock.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('gateMatrixPollDoesNotConsumeTheDependencies', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      expect(graph.tasks[0].isComplete()).assertTrue();
      expect(graph.tasks[1].isComplete()).assertTrue();
      expect(graph.tasks[0].progress).assertEqual(100);
      expect(graph.tasks[1].progress).assertEqual(100);
      expect(graph.totalProgress()).assertEqual(200);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
    });

    /**
     * @tc.name   gateMatrixPollClockAccumulatesInterval
     * @tc.desc   Three ticks of the model clock add three 200 ms intervals.
     * @tc.precondition  A fresh PollClock is created with the page interval.
     * @tc.steps         1. Start the clock.
     *                   2. Tick it three times and read the elapsed time.
     *                   3. Read the tick counter and the interval.
     * @tc.expected      Elapsed is 600 ms, ticks is three and the interval is 200 ms.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixPollClockAccumulatesInterval', 0, () => {
      const clock: PollClock = new PollClock();
      expect(clock.intervalMs).assertEqual(POLL_INTERVAL_MS);
      clock.start();
      expect(clock.tick()).assertEqual(200);
      expect(clock.tick()).assertEqual(400);
      expect(clock.tick()).assertEqual(600);
      expect(clock.ticks).assertEqual(3);
      expect(clock.elapsedMs).assertEqual(POLL_INTERVAL_MS * 3);
      expect(clock.active).assertTrue();
    });

    /**
     * @tc.name   gateMatrixPollClockIsDueAfterRounds
     * @tc.desc   isDueAfter compares interval times rounds with the elapsed time.
     * @tc.precondition  A fresh PollClock is created with the page interval.
     * @tc.steps         1. Read due flags before any tick.
     *                   2. Tick twice and read the due flags again.
     *                   3. Confirm a later round is still not due.
     * @tc.expected      Only rounds covered by the elapsed time report due.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixPollClockIsDueAfterRounds', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      expect(clock.isDueAfter(1)).assertFalse();
      clock.tick();
      clock.tick();
      expect(clock.isDueAfter(1)).assertTrue();
      expect(clock.isDueAfter(2)).assertTrue();
      expect(clock.isDueAfter(3)).assertFalse();
      expect(clock.elapsedMs).assertEqual(400);
      expect(clock.intervalMs * 2 <= clock.elapsedMs).assertTrue();
    });

    /**
     * @tc.name   gateMatrixPollClockStopFreezesElapsed
     * @tc.desc   Ticking a stopped clock neither advances time nor ticks.
     * @tc.precondition  A fresh PollClock is created with the page interval.
     * @tc.steps         1. Start and tick the clock once.
     *                   2. Stop it and tick twice more.
     *                   3. Compare the elapsed time and tick counter.
     * @tc.expected      The elapsed time stays at one interval and ticks stays at one.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixPollClockStopFreezesElapsed', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.stop();
      expect(clock.active).assertFalse();
      expect(clock.tick()).assertEqual(200);
      expect(clock.tick()).assertEqual(200);
      expect(clock.ticks).assertEqual(1);
      expect(clock.elapsedMs).assertEqual(POLL_INTERVAL_MS);
      expect(clock.isDueAfter(1)).assertTrue();
    });

    /**
     * @tc.name   gateMatrixPollClockStartRebasesCounters
     * @tc.desc   A restart clears the accumulated time but keeps the configured interval.
     * @tc.precondition  A fresh PollClock is created with the page interval.
     * @tc.steps         1. Tick a started clock twice.
     *                   2. Stop and start the clock again.
     *                   3. Read the counters and interval.
     * @tc.expected      Ticks and elapsed return to zero and the interval is unchanged.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixPollClockStartRebasesCounters', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      expect(clock.elapsedMs).assertEqual(400);
      clock.stop();
      clock.start();
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.active).assertTrue();
      expect(clock.intervalMs).assertEqual(POLL_INTERVAL_MS);
      expect(clock.tick()).assertEqual(POLL_INTERVAL_MS);
    });

    /**
     * @tc.name   gateMatrixResetRestoresIdleGraph
     * @tc.desc   After reset every row is idle and every aggregate is cleared.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Run a partial cycle with one completion.
     *                   2. Call reset on the graph.
     *                   3. Read statuses, counters, lock and event recorder.
     * @tc.expected      No task holds state, the lock is free and the trace is empty.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateMatrixResetRestoresIdleGraph', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.pollTick(200);
      graph.reset();
      expect(graph.tasks[0].isIdle()).assertTrue();
      expect(graph.tasks[1].isIdle()).assertTrue();
      expect(graph.tasks[2].isIdle()).assertTrue();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   gateMatrixSecondRunAfterResetSucceeds
     * @tc.desc   A reset graph accepts a second start and completes the same trace.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Run and complete the three tasks once.
     *                   2. Reset and run the same sequence again.
     *                   3. Compare the second trace with the first.
     * @tc.expected      Both runs produce A|B|C and both finish with all rows complete.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixSecondRunAfterResetSucceeds', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      const first: string = completionTrace(graph);
      graph.reset();
      expect(graph.startAll()).assertTrue();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(completionTrace(graph)).assertEqual(first);
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(graph.allCompleted()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.events.countOf('start-all')).assertEqual(1);
    });

    /**
     * @tc.name   gateMatrixRestartRejectedWhileRunActive
     * @tc.desc   startAll refuses a second start while the run is still in flight.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Start the run successfully.
     *                   2. Call startAll a second time.
     *                   3. Read the rejection event and the attempt counters.
     * @tc.expected      The second start returns false and logs one start-rejected event.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixRestartRejectedWhileRunActive', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      expect(graph.startAll()).assertFalse();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.tasks[0].attempts).assertEqual(1);
      expect(graph.tasks[1].attempts).assertEqual(1);
      expect(graph.tasks[2].attempts).assertEqual(0);
    });

    /**
     * @tc.name   gateMatrixAttemptCounterAccumulatesAcrossRuns
     * @tc.desc   reset keeps the attempt history, so the second start is attempt two.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Start once and read the A attempt counter.
     *                   2. Reset and start again.
     *                   3. Compare the counter with the run count.
     * @tc.expected      The attempt counter reaches two while progress restarts at zero.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('gateMatrixAttemptCounterAccumulatesAcrossRuns', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.tasks[0].attempts).assertEqual(1);
      graph.reset();
      expect(graph.tasks[0].attempts).assertEqual(1);
      graph.startAll();
      expect(graph.tasks[0].attempts).assertEqual(2);
      expect(graph.tasks[1].attempts).assertEqual(2);
      expect(graph.tasks[0].progress).assertEqual(0);
      expect(graph.tasks[0].startedAt).assertEqual(0);
    });

    /**
     * @tc.name   gateMatrixEventTraceIsStableAcrossTwoRuns
     * @tc.desc   The same scripted run twice yields the same event trace and fingerprint.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Execute the scripted cycle and capture the trace.
     *                   2. Reset and execute the identical cycle.
     *                   3. Compare traces and fingerprints.
     * @tc.expected      Both traces match, both fingerprints match and the size is non-zero.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('gateMatrixEventTraceIsStableAcrossTwoRuns', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      const firstTrace: string = graph.eventTrace();
      const firstFingerprint: number = graph.events.fingerprint();
      const firstSize: number = graph.events.size();
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.eventTrace()).assertEqual(firstTrace);
      expect(graph.events.fingerprint()).assertEqual(firstFingerprint);
      expect(graph.events.size()).assertEqual(firstSize);
      expect(firstTrace.indexOf('start-all')).assertEqual(0);
      expect(firstTrace.split('|').length).assertEqual(firstSize);
    });

    /**
     * @tc.name   gateMatrixRunCyclePreservesTopologyAndUrls
     * @tc.desc   Repeated runs never reorder or rewrite the three seeded rows.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Execute three full run and reset cycles.
     *                   2. Read the row order and the three URL literals.
     *                   3. Read the final aggregates.
     * @tc.expected      The row order stays A, B, C with the original URLs and zero progress.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('gateMatrixRunCyclePreservesTopologyAndUrls', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let cycle = 0; cycle < 3; cycle++) {
        graph.startAll();
        graph.completeTask(TASK_A);
        graph.completeTask(TASK_B);
        graph.pollTick(200);
        graph.completeTaskC(400);
        graph.reset();
      }
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect(graph.tasks[0].url).assertEqual(URL_TASK_A);
      expect(graph.tasks[1].url).assertEqual(URL_TASK_B);
      expect(graph.tasks[2].url).assertEqual(URL_TASK_C);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   gateMatrixExclusiveOwnerBlocksSecondExclusive
     * @tc.desc   A second EXCLUSIVE request is refused while another owner holds the mode.
     * @tc.precondition  A fresh DependencyLock is created inside the case body.
     * @tc.steps         1. Acquire EXCLUSIVE for C on the empty lock.
     *                   2. Request EXCLUSIVE for row D.
     *                   3. Release C and grant D.
     * @tc.expected      D waits while C owns the lock and succeeds after the release.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixExclusiveOwnerBlocksSecondExclusive', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.acquireExclusive('D')).assertFalse();
      expect(lock.rejections).assertEqual(1);
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.releaseExclusive(TASK_C)).assertTrue();
      expect(lock.acquireExclusive('D')).assertTrue();
      expect(lock.exclusiveOwner).assertEqual('D');
      expect(lock.acquisitions).assertEqual(2);
    });

    /**
     * @tc.name   gateMatrixStartAllArmsSharedPairAndWaiter
     * @tc.desc   startAll wires A and B as SHARED holders and parks C as the waiter.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Call startAll on the fresh graph.
     *                   2. Read the shared holder list and the acquisition counter.
     *                   3. Read the waiting flag and the exclusive owner.
     * @tc.expected      Both dependencies hold the lock, C waits and no owner is granted yet.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixStartAllArmsSharedPairAndWaiter', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      expect(graph.lock.sharedHolders.length).assertEqual(2);
      expect(joined(graph.lock.sharedHolders, ',')).assertEqual('A,B');
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.countOf('queued')).assertEqual(1);
    });

    /**
     * @tc.name   gateMatrixUnlockEventFiresOnGateTransition
     * @tc.desc   The unlock event is recorded when the gate opens and again when C finishes.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Complete A and read the unlock count.
     *                   2. Complete B and start C without a poll.
     *                   3. Complete C and read every event counter.
     * @tc.expected      One unlock follows B, a second follows C and three completions exist.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('gateMatrixUnlockEventFiresOnGateTransition', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      graph.completeTask(TASK_B);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.runTaskCIfReady(200)).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      graph.completeTaskC(400);
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.countOf('started')).assertEqual(3);
    });

    /**
     * @tc.name   gateMatrixPollGateReopensAfterReset
     * @tc.desc   After a full run and reset the poll must wait for both dependencies again.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Finish a run where the poll starts C, then reset.
     *                   2. Start the second run and poll before the gate opens.
     *                   3. Complete A and B and poll again.
     * @tc.expected      The early polls fail, the final poll starts C and ticks restart at zero.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('gateMatrixPollGateReopensAfterReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick(200)).assertTrue();
      graph.completeTaskC(400);
      graph.reset();
      expect(graph.tasks[2].isIdle()).assertTrue();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.startAll()).assertTrue();
      expect(graph.pollTick(200)).assertFalse();
      graph.completeTask(TASK_A);
      expect(graph.pollTick(400)).assertFalse();
      graph.completeTask(TASK_B);
      expect(graph.pollTick(600)).assertTrue();
      expect(graph.tasks[2].isRunning()).assertTrue();
      expect(graph.pollTicks).assertEqual(3);
    });

    /**
     * @tc.name   gateMatrixCompletionOrderClearedBeforeRestart
     * @tc.desc   reset drops the recorded order so the second run begins with an empty trace.
     * @tc.precondition  A fresh graph is created after the beforeEach yield.
     * @tc.steps         1. Record a full three row order in the first run.
     *                   2. Reset and read the trace text.
     *                   3. Start again and complete a single row.
     * @tc.expected      The trace is empty after reset and holds only B after one callback.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateMatrixCompletionOrderClearedBeforeRestart', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(completionTrace(graph)).assertEqual('A|B|C');
      graph.reset();
      expect(graph.completionOrder.length).assertEqual(0);
      expect(completionTrace(graph)).assertEqual('');
      expect(graph.startAll()).assertTrue();
      expect(graph.completeTask(TASK_B)).assertTrue();
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(completionTrace(graph)).assertEqual('B');
    });
  });
}
