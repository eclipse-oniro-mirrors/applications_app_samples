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
 * CoreModelDeep suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   62       private lock = true, the boolean gate of task C
 *   98-102   checkAndUnlock sets lock = false when A && B completed
 *   105-107  canRunTaskC returns !lock
 *   174-198  startAllTasks: A/B take SHARED, C waits in EXCLUSIVE, 200 ms poll
 *
 * The suite walks the DependencyLock model through every transition the page
 * can produce: shared holders, exclusive blocking, waitingExclusive, holder
 * counts, rejection counters, reset, and the lock/task interleaving that
 * startAll, completeTask and runTaskCIfReady create.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  DependencyLock,
  TaskGraph,
  DownloadTask,
  createTaskGraph,
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  sameStringArray,
  countOf,
  joined
} from '../Shared/SharedDriver';

export default function networkCoreModelDeepTest(): void {
  describe('CoreModelDeep', () => {
    beforeAll(() => {
      logSuite('CoreModelDeep', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreModelDeep', 'end');
    });

    /**
     * @tc.name   freshLockHasNoHolderAndNoCounter
     * @tc.desc   A new DependencyLock is unlocked, empty and has zero acquisitions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshLockHasNoHolderAndNoCounter', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.acquisitions).assertEqual(0);
      expect(lock.rejections).assertEqual(0);
      expect(lock.waitingExclusive).assertFalse();
    });

    /**
     * @tc.name   firstSharedAcquireAddsOneHolder
     * @tc.desc   A shared acquire of A succeeds, records the owner and counts once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('firstSharedAcquireAddsOneHolder', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.hasShared(TASK_A)).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.isUnlocked()).assertFalse();
      expect(lock.exclusiveOwner).assertEqual('');
    });

    /**
     * @tc.name   repeatedSharedAcquireIsIdempotent
     * @tc.desc   The same shared owner twice keeps one holder and one acquisition.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedSharedAcquireIsIdempotent', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.sharedHolders.length).assertEqual(1);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   twoSharedOwnersCoexist
     * @tc.desc   A and B hold the lock together, matching the SHARED pair of startAllTasks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('twoSharedOwnersCoexist', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.holderCount()).assertEqual(2);
      expect(lock.acquisitions).assertEqual(2);
      expect(sameStringArray(lock.sharedHolders, [TASK_A, TASK_B])).assertTrue();
      expect(lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   releaseSharedRemovesExactlyOneHolder
     * @tc.desc   Releasing A leaves B holding the lock and keeps the acquisition count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('releaseSharedRemovesExactlyOneHolder', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.releaseShared(TASK_A)).assertTrue();
      expect(lock.hasShared(TASK_A)).assertFalse();
      expect(lock.hasShared(TASK_B)).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(2);
    });

    /**
     * @tc.name   releaseSharedOfAnUnknownOwnerFailsQuietly
     * @tc.desc   Releasing a non-holder returns false and never touches the counters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('releaseSharedOfAnUnknownOwnerFailsQuietly', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      expect(lock.releaseShared(TASK_C)).assertFalse();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.rejections).assertEqual(0);
      expect(lock.acquisitions).assertEqual(1);
    });

    /**
     * @tc.name   doubleReleaseOfTheSameOwnerFailsTheSecondTime
     * @tc.desc   The second release finds no index, so the lock stays consistent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('doubleReleaseOfTheSameOwnerFailsTheSecondTime', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_B);
      expect(lock.releaseShared(TASK_B)).assertTrue();
      expect(lock.releaseShared(TASK_B)).assertFalse();
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   exclusiveOnAnEmptyLockIsGranted
     * @tc.desc   C can take the exclusive lock when nobody holds a shared slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('exclusiveOnAnEmptyLockIsGranted', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.isUnlocked()).assertFalse();
    });
    /**
     * @tc.name   exclusiveWaitsWhileASharedHolderExists
     * @tc.desc   C is rejected and flagged as waiting while A still holds SHARED.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('exclusiveWaitsWhileASharedHolderExists', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.rejections).assertEqual(1);
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   waitingFlagSurvivesUntilTheGrant
     * @tc.desc   Releasing both shared holders lets the queued exclusive request succeed and clears the flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('waitingFlagSurvivesUntilTheGrant', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.waitingExclusive).assertTrue();
      lock.releaseShared(TASK_A);
      expect(lock.waitingExclusive).assertTrue();
      lock.releaseShared(TASK_B);
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
    });

    /**
     * @tc.name   sharedAcquireIsRejectedUnderAnExclusiveOwner
     * @tc.desc   While C owns the lock, A cannot enter and the rejection is counted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sharedAcquireIsRejectedUnderAnExclusiveOwner', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      expect(lock.acquireShared(TASK_A)).assertFalse();
      expect(lock.hasShared(TASK_A)).assertFalse();
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.rejections).assertEqual(1);
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   secondExclusiveRequestIsRejectedButKeepsTheFirstOwner
     * @tc.desc   Only one exclusive owner is allowed; D cannot displace C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondExclusiveRequestIsRejectedButKeepsTheFirstOwner', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      expect(lock.acquireExclusive('D')).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.rejections).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.waitingExclusive).assertTrue();
    });

    /**
     * @tc.name   releaseExclusiveRejectsAForeignOwner
     * @tc.desc   A release with the wrong name is ignored and the owner stays.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('releaseExclusiveRejectsAForeignOwner', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      expect(lock.releaseExclusive(TASK_A)).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   releaseExclusiveByItsOwnerUnlocksTheGate
     * @tc.desc   C releases its own exclusive slot and a shared acquire becomes possible again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('releaseExclusiveByItsOwnerUnlocksTheGate', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      expect(lock.releaseExclusive(TASK_C)).assertTrue();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   holderCountTreatsTheExclusiveOwnerAsOne
     * @tc.desc   The count is shared holders plus the exclusive owner, never more than one each.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('holderCountTreatsTheExclusiveOwnerAsOne', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      expect(lock.holderCount()).assertEqual(1);
      lock.acquireShared(TASK_B);
      expect(lock.holderCount()).assertEqual(2);
      lock.releaseShared(TASK_A);
      lock.releaseShared(TASK_B);
      lock.acquireExclusive(TASK_C);
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   rejectionsAccumulateAcrossMixedTraffic
     * @tc.desc   One exclusive rejection and one shared rejection leave two in the counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('rejectionsAccumulateAcrossMixedTraffic', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.rejections).assertEqual(1);
      lock.releaseShared(TASK_A);
      lock.acquireExclusive(TASK_C);
      expect(lock.acquireShared(TASK_B)).assertFalse();
      expect(lock.rejections).assertEqual(2);
      expect(lock.acquisitions).assertEqual(2);
    });

    /**
     * @tc.name   acquisitionsCountOnlyGrants
     * @tc.desc   Rejections never increment acquisitions, so the two counters can diverge.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('acquisitionsCountOnlyGrants', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      lock.acquireShared(TASK_A);
      lock.acquireExclusive('D');
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.rejections).assertEqual(2);
      expect(lock.acquisitions + lock.rejections).assertEqual(3);
    });

    /**
     * @tc.name   isUnlockedRequiresBothSidesEmpty
     * @tc.desc   A shared holder alone, or an exclusive owner alone, keeps the lock closed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('isUnlockedRequiresBothSidesEmpty', 0, () => {
      const lock: DependencyLock = new DependencyLock();
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
     * @tc.name   resetClearsHoldersOwnersAndCounters
     * @tc.desc   reset() restores the pristine lock even after traffic and rejection.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetClearsHoldersOwnersAndCounters', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireExclusive(TASK_C);
      lock.reset();
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.acquisitions).assertEqual(0);
      expect(lock.rejections).assertEqual(0);
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   lockIsReusableAfterReset
     * @tc.desc   After a reset the same instance accepts the full startAll arrangement again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lockIsReusableAfterReset', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      lock.reset();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.holderCount()).assertEqual(2);
      expect(lock.acquisitions).assertEqual(2);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.rejections).assertEqual(1);
    });

    /**
     * @tc.name   startAllTakesBothSharedSlots
     * @tc.desc   startAllTasks mirrors A and B as shared holders and leaves C outside.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllTakesBothSharedSlots', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(sameStringArray(graph.lock.sharedHolders, [TASK_A, TASK_B])).assertTrue();
      expect(graph.lock.hasShared(TASK_C)).assertFalse();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.acquisitions).assertEqual(2);
    });

    /**
     * @tc.name   startAllFlagsTheQueuedExclusiveRequest
     * @tc.desc   The graph marks C as waiting in EXCLUSIVE right after the shared pair is taken.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startAllFlagsTheQueuedExclusiveRequest', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   completingASharedTaskFreesItsSlot
     * @tc.desc   completeTask(A) releases A's shared slot while B keeps the gate closed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completingASharedTaskFreesItsSlot', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   completingBothSharedTasksEmptiesTheGate
     * @tc.desc   A and B completing leaves no holder even though C has not started.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completingBothSharedTasksEmptiesTheGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
    });

    /**
     * @tc.name   completingADuplicateDoesNotReleaseTwice
     * @tc.desc   The second completion is refused, so the release path never runs again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completingADuplicateDoesNotReleaseTwice', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.completeTask(TASK_A)).assertFalse();
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   runTaskCTakesTheExclusiveSlot
     * @tc.desc   Once the gate opens, C becomes the single exclusive owner of the lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runTaskCTakesTheExclusiveSlot', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.runTaskCIfReady(10)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.isUnlocked()).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(3);
    });

    /**
     * @tc.name   runTaskCTwiceKeepsOneExclusiveOwner
     * @tc.desc   The second attempt stops at the idle check, so the lock is not re-acquired.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('runTaskCTwiceKeepsOneExclusiveOwner', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.runTaskCIfReady(1)).assertTrue();
      expect(graph.runTaskCIfReady(2)).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
    });

    /**
     * @tc.name   completeTaskCReleasesTheExclusiveSlot
     * @tc.desc   C finishing hands the lock back and the graph becomes fully idle again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeTaskCReleasesTheExclusiveSlot', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady(5);
      expect(graph.completeTaskC(6)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(3);
    });

    /**
     * @tc.name   pollBeforeTheGateLeavesTheHoldersIntact
     * @tc.desc   A poll tick with only A done neither acquires nor releases anything.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('pollBeforeTheGateLeavesTheHoldersIntact', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const before: string = joined(graph.lock.sharedHolders, ',');
      expect(graph.pollTick(1)).assertFalse();
      expect(joined(graph.lock.sharedHolders, ',')).assertEqual(before);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.exclusiveOwner).assertEqual('');
    });

    /**
     * @tc.name   graphResetReturnsTheLockToPristineState
     * @tc.desc   reset() on the graph wipes holders and both counters of its lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphResetReturnsTheLockToPristineState', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady(1);
      graph.reset();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   lockViewMatchesTaskStatesAfterASharedCompletion
     * @tc.desc   A completed task is not a holder, and a running task still is.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lockViewMatchesTaskStatesAfterASharedCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      const done: DownloadTask = graph.taskByNo(TASK_B) as DownloadTask;
      const running: DownloadTask = graph.taskByNo(TASK_A) as DownloadTask;
      expect(done.isComplete()).assertTrue();
      expect(running.isRunning()).assertTrue();
      expect(graph.lock.hasShared(TASK_B)).assertFalse();
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   exclusiveGateBlocksASecondGraphStart
     * @tc.desc   A run in progress refuses a new start and never touches the lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('exclusiveGateBlocksASecondGraphStart', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady(1);
      const acquisitions: number = graph.lock.acquisitions;
      expect(graph.startAll()).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(acquisitions);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   everyTaskNumberParticipatesInTheGate
     * @tc.desc   A and B are the only shared owners; C is only ever the exclusive owner.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everyTaskNumberParticipatesInTheGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(countOf(graph.lock.sharedHolders, TASK_A)).assertEqual(1);
      expect(countOf(graph.lock.sharedHolders, TASK_B)).assertEqual(1);
      expect(countOf(graph.lock.sharedHolders, TASK_C)).assertEqual(0);
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady(1);
      expect(countOf(graph.lock.sharedHolders, TASK_C)).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
    });

    /**
     * @tc.name   lockAcquisitionOrderIsStableAcrossRuns
     * @tc.desc   Two identical runs produce the same holder list and the same counters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lockAcquisitionOrderIsStableAcrossRuns', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A);
      second.completeTask(TASK_A);
      expect(joined(first.lock.sharedHolders, ',')).assertEqual(joined(second.lock.sharedHolders, ','));
      expect(first.lock.acquisitions).assertEqual(second.lock.acquisitions);
      expect(first.lock.rejections).assertEqual(second.lock.rejections);
      expect(first.lock.waitingExclusive).assertEqual(second.lock.waitingExclusive);
      logStep('CoreModelDeep', joined(first.lock.sharedHolders, ','));
    });

    /**
     * @tc.name   waitingFlagIsNotClearedByARelease
     * @tc.desc   Releasing a shared holder while C waits keeps waitingExclusive true.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('waitingFlagIsNotClearedByARelease', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      lock.acquireExclusive(TASK_C);
      lock.releaseShared(TASK_A);
      expect(lock.waitingExclusive).assertTrue();
      lock.releaseShared(TASK_B);
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.rejections).assertEqual(1);
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   sharedReleaseAfterExclusiveGrantIsRefused
     * @tc.desc   Once C owns the lock, a stale shared release of A cannot disturb it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('sharedReleaseAfterExclusiveGrantIsRefused', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      expect(lock.releaseShared(TASK_A)).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
    });

    /**
     * @tc.name   exclusiveReleaseWithoutAnOwnerIsRefused
     * @tc.desc   An empty lock rejects releaseExclusive even for the C task number.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exclusiveReleaseWithoutAnOwnerIsRefused', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.releaseExclusive(TASK_C)).assertFalse();
      expect(lock.releaseExclusive('')).assertFalse();
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   mixedHolderListKeepsInsertionOrderAfterRemoval
     * @tc.desc   Removing the middle owner leaves the remaining owners in insertion order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mixedHolderListKeepsInsertionOrderAfterRemoval', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      lock.acquireShared('D');
      lock.releaseShared(TASK_B);
      expect(sameStringArray(lock.sharedHolders, [TASK_A, 'D'])).assertTrue();
      expect(lock.holderCount()).assertEqual(2);
      expect(lock.hasShared(TASK_B)).assertFalse();
    });

    /**
     * @tc.name   releaseAllThenAcquireAllKeepsCountersMonotone
     * @tc.desc   Acquisitions only grow across a release/re-acquire cycle of the same owners.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('releaseAllThenAcquireAllKeepsCountersMonotone', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      lock.releaseShared(TASK_A);
      lock.releaseShared(TASK_B);
      expect(lock.acquisitions).assertEqual(2);
      lock.acquireShared(TASK_A);
      expect(lock.acquisitions).assertEqual(3);
      expect(lock.acquisitions).assertLarger(2);
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   graphReservationKeepsCWaitingWhileBothHoldersRun
     * @tc.desc   The graph lock reports two holders and a pending exclusive request simultaneously.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphReservationKeepsCWaitingWhileBothHoldersRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
    });

    /**
     * @tc.name   graphGateOpenDoesNotReleaseTheExclusiveRequest
     * @tc.desc   Opening the gate changes only task states; the lock stays free until C runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphGateOpenDoesNotReleaseTheExclusiveRequest', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   sharedHoldersNeverContainDuplicatesAcrossCompletions
     * @tc.desc   Completing and re-completing tasks cannot duplicate a shared holder entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('sharedHoldersNeverContainDuplicatesAcrossCompletions', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_B);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(countOf(graph.lock.sharedHolders, TASK_A)).assertEqual(0);
      expect(countOf(graph.lock.sharedHolders, TASK_B)).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   secondRoundAfterResetRepeatsTheSameLockTraffic
     * @tc.desc   A full reset lets the graph reproduce the identical acquisition count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('secondRoundAfterResetRepeatsTheSameLockTraffic', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady(1);
      graph.completeTaskC(2);
      const firstRound: number = graph.lock.acquisitions;
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady(3);
      expect(graph.lock.acquisitions).assertEqual(firstRound);
      expect(firstRound).assertEqual(3);
      expect(graph.lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   taskNumbersTableCoversEveryLockRole
     * @tc.desc   A and B are shared roles, C is the exclusive role of the dependency model.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskNumbersTableCoversEveryLockRole', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(TASK_NUMBERS.length).assertEqual(3);
      lock.acquireShared(TASK_NUMBERS[0]);
      lock.acquireShared(TASK_NUMBERS[1]);
      expect(lock.holderCount()).assertEqual(2);
      lock.releaseShared(TASK_NUMBERS[0]);
      lock.releaseShared(TASK_NUMBERS[1]);
      expect(lock.acquireExclusive(TASK_NUMBERS[2])).assertTrue();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.acquisitions).assertEqual(3);
    });
    /**
     * @tc.name   holderSnapshotTextSummarisesTheGate
     * @tc.desc   A joined holder listing is empty only when the gate has no shared owner.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('holderSnapshotTextSummarisesTheGate', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(joined(lock.sharedHolders, '+')).assertEqual('');
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(joined(lock.sharedHolders, '+')).assertEqual('A+B');
      lock.releaseShared(TASK_A);
      expect(joined(lock.sharedHolders, '+')).assertEqual('B');
      expect(lock.holderCount()).assertEqual(1);
    });
    /**
     * @tc.name   emptyOwnerNameNeverBecomesAHolder
     * @tc.desc   The empty owner string is not a valid exclusive release target.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emptyOwnerNameNeverBecomesAHolder', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireShared('')).assertTrue();
      expect(lock.releaseShared('')).assertTrue();
      expect(lock.hasShared('')).assertFalse();
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.acquisitions).assertEqual(1);
    });

    /**
     * @tc.name   acquireSharedAfterResetStartsFromZeroCounters
     * @tc.desc   A reset lock behaves like a new one for the next shared acquire.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('acquireSharedAfterResetStartsFromZeroCounters', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireExclusive(TASK_C);
      lock.reset();
      expect(lock.acquireShared(TASK_B)).assertTrue();
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.rejections).assertEqual(0);
      expect(lock.holderCount()).assertEqual(1);
      expect(sameStringArray(lock.sharedHolders, [TASK_B])).assertTrue();
    });

    /**
     * @tc.name   completeSharedTasksInReverseOrderReleasesBothSlots
     * @tc.desc   B then A releases the same two shared slots as A then B.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeSharedTasksInReverseOrderReleasesBothSlots', 0, () => {
      const forward: TaskGraph = createTaskGraph();
      const reverse: TaskGraph = createTaskGraph();
      forward.startAll();
      reverse.startAll();
      forward.completeTask(TASK_A);
      forward.completeTask(TASK_B);
      reverse.completeTask(TASK_B);
      reverse.completeTask(TASK_A);
      expect(forward.lock.holderCount()).assertEqual(0);
      expect(reverse.lock.holderCount()).assertEqual(0);
      expect(forward.lock.acquisitions).assertEqual(reverse.lock.acquisitions);
      expect(reverse.lock.isUnlocked()).assertTrue();
      expect(reverse.lock.waitingExclusive).assertTrue();
    });

    /**
     * @tc.name   repeatedExclusiveAttemptsWhileBlockedAccumulateRejections
     * @tc.desc   Each request that finds a shared holder adds one rejection, never an acquisition.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('repeatedExclusiveAttemptsWhileBlockedAccumulateRejections', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.acquireExclusive('D')).assertFalse();
      expect(lock.rejections).assertEqual(3);
      expect(lock.acquisitions).assertEqual(2);
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.holderCount()).assertEqual(2);
    });

    /**
     * @tc.name   rejectedReleaseCallsDoNotTouchTheCounters
     * @tc.desc   Releasing a non-holder during a wait changes neither rejection nor acquisition totals.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('rejectedReleaseCallsDoNotTouchTheCounters', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.releaseShared('D')).assertFalse();
      expect(lock.releaseExclusive(TASK_C)).assertFalse();
      expect(lock.rejections).assertEqual(1);
      expect(lock.acquisitions).assertEqual(2);
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.holderCount()).assertEqual(2);
    });

    /**
     * @tc.name   pollsDoNotDisturbTheLockWhileTheGateIsClosed
     * @tc.desc   Quiet timer ticks leave the holder list and the counters of the lock intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollsDoNotDisturbTheLockWhileTheGateIsClosed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const holders: string = joined(graph.lock.sharedHolders, ',');
      graph.pollTick(200);
      graph.pollTick(400);
      expect(joined(graph.lock.sharedHolders, ',')).assertEqual(holders);
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.lock.rejections).assertEqual(0);
      graph.completeTask(TASK_A);
      graph.pollTick(600);
      expect(graph.lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   runTaskCAfterResetNeedsTheGateAgain
     * @tc.desc   After a reset the idle dependencies block the exclusive start until they complete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('runTaskCAfterResetNeedsTheGateAgain', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady(1);
      graph.completeTaskC(2);
      graph.reset();
      expect(graph.runTaskCIfReady(3)).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.runTaskCIfReady(4)).assertTrue();
      expect(graph.lock.acquisitions).assertEqual(1);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
    });
    /**
     * @tc.name   lockResetIsIndependentOfTaskAttemptHistory
     * @tc.desc   A graph reset zeroes the lock counters while the task attempt counters survive.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreModelDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lockResetIsIndependentOfTaskAttemptHistory', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady(1);
      expect(graph.lock.acquisitions).assertEqual(3);
      graph.reset();
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.rejections).assertEqual(0);
      expect((graph.taskByNo(TASK_A) as DownloadTask).attempts).assertEqual(1);
      expect((graph.taskByNo(TASK_C) as DownloadTask).attempts).assertEqual(1);
    });
  });
}
