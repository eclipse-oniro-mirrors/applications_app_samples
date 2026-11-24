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
 * LockAcquisitionMatrix suite.
 *
 * Enumerates the shared and exclusive acquisition states of the AsyncLock
 * arrangement used by the page: A and B hold the lock in SHARED mode, C asks for
 * EXCLUSIVE, and only the release of the final shared holder lets C enter.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   174-198  startAllTasks takes A/B shared then queues C exclusive
 *   105-107  canRunTaskC is the gate predicate read by the 200 ms poll
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  STATUS_RUNNING,
  DependencyLock,
  TaskGraph,
  createTaskGraph,
  hasDuplicateStrings,
  sameStringArray
} from '../Shared/SharedDriver';

export default function lockAcquisitionMatrixTest(): void {
  describe('LockAcquisitionMatrix', () => {
    beforeAll(() => {
      logSuite('LockAcquisitionMatrix', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('LockAcquisitionMatrix', 'end');
    });

    /**
     * @tc.name   freshLockStartsUnlocked
     * @tc.desc   A new lock has no shared holders, no exclusive owner and zeroed counters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshLockStartsUnlocked', 0, () => {
      logStep('LockAcquisitionMatrix', 'fresh lock');
      const lock: DependencyLock = new DependencyLock();
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.acquisitions).assertEqual(0);
      expect(lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   sharedAcquireSingleHolder
     * @tc.desc   One shared acquisition is granted, records the owner and leaves the exclusive side free.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sharedAcquireSingleHolder', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.hasShared(TASK_A)).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   sharedAcquireTwoHoldersKeepOrder
     * @tc.desc   A and B coexist in shared mode in acquisition order without duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sharedAcquireTwoHoldersKeepOrder', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.acquireShared(TASK_B)).assertTrue();
      expect(sameStringArray(lock.sharedHolders, [TASK_A, TASK_B])).assertTrue();
      expect(hasDuplicateStrings(lock.sharedHolders)).assertFalse();
      expect(lock.holderCount()).assertEqual(2);
      expect(lock.acquisitions).assertEqual(2);
      expect(lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   sharedAcquireSameOwnerTwiceIsIdempotent
     * @tc.desc   Re-acquiring shared ownership as the same owner neither duplicates the holder nor the counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sharedAcquireSameOwnerTwiceIsIdempotent', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.sharedHolders.length).assertEqual(1);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.sharedHolders.indexOf(TASK_A)).assertEqual(0);
      expect(lock.sharedHolders.lastIndexOf(TASK_A)).assertEqual(0);
    });

    /**
     * @tc.name   exclusiveAcquireOnFreeLock
     * @tc.desc   C takes exclusive ownership of an idle lock and blocks every shared acquisition afterwards.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('exclusiveAcquireOnFreeLock', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.isUnlocked()).assertFalse();
      expect(lock.acquireShared(TASK_A)).assertFalse();
    });

    /**
     * @tc.name   exclusiveRejectedWhileSharedHeld
     * @tc.desc   An exclusive request while a shared holder exists is refused, flagged as waiting and counted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('exclusiveRejectedWhileSharedHeld', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.rejections).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.hasShared(TASK_A)).assertTrue();
    });

    /**
     * @tc.name   sharedRejectedWhileExclusiveHeld
     * @tc.desc   With an exclusive owner present, a shared acquisition fails and only increments the rejection count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sharedRejectedWhileExclusiveHeld', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertFalse();
      expect(lock.acquireShared(TASK_B)).assertFalse();
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.rejections).assertEqual(2);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.waitingExclusive).assertFalse();
    });

    /**
     * @tc.name   secondExclusiveRejectedWhileFirstHeld
     * @tc.desc   Exclusive ownership is single: a second exclusive request is rejected without displacing the owner.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondExclusiveRejectedWhileFirstHeld', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      expect(lock.acquireExclusive(TASK_A)).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.rejections).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   releaseSharedUnknownOwnerRejected
     * @tc.desc   Releasing a holder that never acquired returns false and changes no counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('releaseSharedUnknownOwnerRejected', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      expect(lock.releaseShared(TASK_B)).assertFalse();
      expect(lock.releaseShared('X')).assertFalse();
      expect(lock.sharedHolders.length).assertEqual(1);
      expect(lock.hasShared(TASK_A)).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   releaseSharedRemovesOnlyRequestedOwner
     * @tc.desc   Releasing A leaves B holding the shared slot and the remaining order intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('releaseSharedRemovesOnlyRequestedOwner', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.releaseShared(TASK_A)).assertTrue();
      expect(lock.hasShared(TASK_A)).assertFalse();
      expect(lock.hasShared(TASK_B)).assertTrue();
      expect(lock.sharedHolders.length).assertEqual(1);
      expect(lock.sharedHolders[0]).assertEqual(TASK_B);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(2);
    });

    /**
     * @tc.name   releaseSharedInReverseOrderPreservesRemainder
     * @tc.desc   Releasing the last acquirer first keeps the earlier holder at the head of the list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('releaseSharedInReverseOrderPreservesRemainder', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.releaseShared(TASK_B)).assertTrue();
      expect(sameStringArray(lock.sharedHolders, [TASK_A])).assertTrue();
      lock.acquireShared(TASK_C);
      expect(sameStringArray(lock.sharedHolders, [TASK_A, TASK_C])).assertTrue();
      expect(lock.holderCount()).assertEqual(2);
      expect(lock.acquisitions).assertEqual(3);
    });

    /**
     * @tc.name   releaseExclusiveWrongOwnerRejected
     * @tc.desc   Only the recorded exclusive owner may release; another task number is refused and keeps the lock held.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('releaseExclusiveWrongOwnerRejected', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      expect(lock.releaseExclusive(TASK_A)).assertFalse();
      expect(lock.releaseExclusive('')).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.isUnlocked()).assertFalse();
      expect(lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   releaseExclusiveCorrectOwnerFreesLock
     * @tc.desc   The recorded owner can release, after which the lock is unlocked and accepts shared holders again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('releaseExclusiveCorrectOwnerFreesLock', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      expect(lock.releaseExclusive(TASK_C)).assertTrue();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.hasShared(TASK_A)).assertTrue();
    });

    /**
     * @tc.name   exclusiveWaitsForFinalSharedRelease
     * @tc.desc   The exclusive request only succeeds after both shared holders are gone, never after the first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('exclusiveWaitsForFinalSharedRelease', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      lock.releaseShared(TASK_A);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.waitingExclusive).assertTrue();
      lock.releaseShared(TASK_B);
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.rejections).assertEqual(2);
    });

    /**
     * @tc.name   waitingExclusiveClearsOnGrant
     * @tc.desc   The waiting flag raised by rejected attempts is cleared the moment the exclusive grant lands.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('waitingExclusiveClearsOnGrant', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireExclusive(TASK_C);
      expect(lock.waitingExclusive).assertTrue();
      lock.releaseShared(TASK_A);
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.acquisitions).assertEqual(2);
      expect(lock.rejections).assertEqual(1);
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   holderCountMatrixAcrossCombinations
     * @tc.desc   Holder count equals shared holders plus the exclusive owner across four distinct combinations.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('holderCountMatrixAcrossCombinations', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.holderCount()).assertEqual(0);
      lock.acquireShared(TASK_A);
      expect(lock.holderCount()).assertEqual(1);
      lock.acquireShared(TASK_B);
      expect(lock.holderCount()).assertEqual(2);
      lock.releaseShared(TASK_A);
      expect(lock.holderCount()).assertEqual(1);
      lock.releaseShared(TASK_B);
      lock.acquireExclusive(TASK_C);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   acquisitionsCountSuccessfulGrantsOnly
     * @tc.desc   The acquisition counter ignores refusals: one shared grant plus one exclusive grant count two.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('acquisitionsCountSuccessfulGrantsOnly', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_A);
      lock.acquireExclusive(TASK_C);
      expect(lock.rejections).assertEqual(1);
      lock.acquireExclusive(TASK_B);
      expect(lock.rejections).assertEqual(2);
      expect(lock.acquisitions).assertEqual(1);
      lock.releaseShared(TASK_A);
      lock.acquireExclusive(TASK_C);
      expect(lock.acquisitions).assertEqual(2);
      expect(lock.rejections).assertEqual(2);
    });

    /**
     * @tc.name   rejectionsCountEveryFailedAttempt
     * @tc.desc   Each refused shared or exclusive request increments rejections exactly once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rejectionsCountEveryFailedAttempt', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      lock.acquireExclusive(TASK_A);
      expect(lock.rejections).assertEqual(3);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.waitingExclusive).assertTrue();
    });

    /**
     * @tc.name   lockMatrixUnlockedRequiresBothSidesEmpty
     * @tc.desc   Only an empty shared list together with an empty owner counts as unlocked.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockMatrixUnlockedRequiresBothSidesEmpty', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.isUnlocked()).assertTrue();
      lock.acquireShared(TASK_A);
      expect(lock.isUnlocked()).assertFalse();
      lock.releaseShared(TASK_A);
      expect(lock.isUnlocked()).assertTrue();
      lock.acquireExclusive(TASK_C);
      expect(lock.isUnlocked()).assertFalse();
      lock.releaseExclusive(TASK_C);
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   resetClearsHoldersAndCounters
     * @tc.desc   Reset drops every holder and both counters in one step, leaving the lock as good as new.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetClearsHoldersAndCounters', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      lock.acquireExclusive(TASK_C);
      lock.reset();
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.acquisitions).assertEqual(0);
      expect(lock.rejections).assertEqual(0);
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   resetClearsWaitingFlag
     * @tc.desc   A queued exclusive request does not survive a reset, so the next run starts without a waiter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetClearsWaitingFlag', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireExclusive(TASK_C);
      expect(lock.waitingExclusive).assertTrue();
      lock.reset();
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.acquisitions).assertEqual(1);
    });

    /**
     * @tc.name   repeatedAcquireReleaseCycleKeepsCounts
     * @tc.desc   Ten grant-and-release cycles accumulate exactly ten acquisitions and no rejections.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedAcquireReleaseCycleKeepsCounts', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      for (let round = 0; round < 10; round++) {
        expect(lock.acquireShared(TASK_A)).assertTrue();
        expect(lock.releaseShared(TASK_A)).assertTrue();
      }
      expect(lock.acquisitions).assertEqual(10);
      expect(lock.rejections).assertEqual(0);
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   gradualReleasePromotesQueuedExclusive
     * @tc.desc   Three shared holders drain one by one; the queue is promotable only after the third release.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('gradualReleasePromotesQueuedExclusive', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      lock.acquireShared('D');
      expect(lock.holderCount()).assertEqual(3);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      lock.releaseShared(TASK_A);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      lock.releaseShared(TASK_B);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.waitingExclusive).assertTrue();
      lock.releaseShared('D');
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.acquisitions).assertEqual(4);
      expect(lock.rejections).assertEqual(3);
    });

    /**
     * @tc.name   exclusiveReleaseAllowsSharedReacquire
     * @tc.desc   After C releases, both prerequisite tasks can take shared ownership again for the next run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exclusiveReleaseAllowsSharedReacquire', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      lock.releaseExclusive(TASK_C);
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.acquireShared(TASK_B)).assertTrue();
      expect(sameStringArray(lock.sharedHolders, [TASK_A, TASK_B])).assertTrue();
      expect(lock.holderCount()).assertEqual(2);
      expect(lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   graphRunMatchesLockMatrix
     * @tc.desc   The lock inside a started graph shows the exact matrix the page creates: A/B shared, C queued.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphRunMatchesLockMatrix', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   graphExclusiveGrantAfterGateOpens
     * @tc.desc   The poll replaces the two shared holders with one exclusive owner exactly when the gate opens.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphExclusiveGrantAfterGateOpens', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      expect(graph.lock.acquireExclusive(TASK_C)).assertFalse();
      graph.completeTask(TASK_B, 2);
      expect(graph.pollTick(3)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(3);
    });

    /**
     * @tc.name   matrixFingerprintOfHolderOrder
     * @tc.desc   The exact holder order is part of the observable matrix, so reversed acquisition differs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('matrixFingerprintOfHolderOrder', 0, () => {
      const forward: DependencyLock = new DependencyLock();
      const reverse: DependencyLock = new DependencyLock();
      forward.acquireShared(TASK_A);
      forward.acquireShared(TASK_B);
      reverse.acquireShared(TASK_B);
      reverse.acquireShared(TASK_A);
      expect(sameStringArray(forward.sharedHolders, reverse.sharedHolders)).assertFalse();
      expect(forward.sharedHolders[0]).assertEqual(TASK_A);
      expect(reverse.sharedHolders[0]).assertEqual(TASK_B);
      expect(forward.holderCount()).assertEqual(reverse.holderCount());
      expect(forward.acquisitions).assertEqual(reverse.acquisitions);
    });

    /**
     * @tc.name   failedGrantDoesNotMutateHolderList
     * @tc.desc   Refused acquisitions leave the holder list byte-identical, so the matrix stays consistent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedGrantDoesNotMutateHolderList', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      const before: string = lock.sharedHolders[0] + '|' + lock.sharedHolders[1];
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.acquireExclusive(TASK_A)).assertFalse();
      const after: string = lock.sharedHolders[0] + '|' + lock.sharedHolders[1];
      expect(after).assertEqual(before);
      expect(lock.sharedHolders.length).assertEqual(2);
      expect(lock.exclusiveOwner).assertEqual('');
    });

    /**
     * @tc.name   holderCountNeverExceedsGrantCount
     * @tc.desc   Across a long mixed sequence the live holder count never exceeds the successful grant count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('holderCountNeverExceedsGrantCount', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.holderCount() <= lock.acquisitions).assertTrue();
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      lock.releaseShared(TASK_A);
      expect(lock.holderCount() <= lock.acquisitions).assertTrue();
      lock.releaseShared(TASK_B);
      lock.acquireExclusive(TASK_C);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(3);
      expect(lock.rejections).assertEqual(1);
    });

    /**
     * @tc.name   graphResetClearsWaitingQueue
     * @tc.desc   Resetting a started graph empties the lock matrix and removes the queued exclusive request.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LockAcquisitionMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphResetClearsWaitingQueue', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      expect(graph.lock.waitingExclusive).assertTrue();
      graph.reset();
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
    });
  });
}
