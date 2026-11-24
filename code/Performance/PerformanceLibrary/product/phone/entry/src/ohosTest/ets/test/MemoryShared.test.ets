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

import { describe, expect, it } from '@ohos/hypium';
import { ON } from '@ohos.UiTest';
import { NonReentrantLock } from '@ohos/memoryShared';


import { backTo, click, eventually, getDriver, openFeature, requireComponent, withHome }
  from './Shared/PerformanceDriver';

const ATOMIC_RESULT: string = 'memoryAtomicResult';
const ATOMIC_TOTAL: number = 20000;

async function readResultLines(): Promise<string[]> {
  const label = await getDriver().findComponent(ON.id(ATOMIC_RESULT));
  const text: string = label ? await label.getText() : '';
  return text.split('\n').map((line: string) => line.trim()).filter((line: string) => line.length > 0);
}

async function runCounter(button: string): Promise<number> {
  const before: number = (await readResultLines()).length;
  await click(ON.id(button));
  await eventually(async () => (await readResultLines()).length > before, 'new counter result', 8000);
  const results: string[] = await readResultLines();
  expect(results.length).assertEqual(before + 1);
  return Number(results[before]);
}

export default function memorySharedTest(): void {
  describe('PerformanceMemoryShared', () => {
    /**
     * @tc.number SUB_PERFORMANCE_MEMORYSHARED_0100
     * @tc.name lockRejectsReentryAndCanBeReacquired
     * @tc.desc tryLock, unlock: Lock Rejects Reentry And Can Be Reacquired.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('lockRejectsReentryAndCanBeReacquired', 0, () => {
      const lock = new NonReentrantLock(new SharedArrayBuffer(4));
      const acquired: boolean = lock.tryLock();
      expect(acquired).assertTrue();
      try {
        const acquiredAgain: boolean = lock.tryLock();
        expect(acquiredAgain).assertFalse();
      } finally {
        lock.unlock();
      }
      const reacquired: boolean = lock.tryLock();
      expect(reacquired).assertTrue();
      lock.unlock();
    });

    /**
     * @tc.number SUB_PERFORMANCE_MEMORYSHARED_0200
     * @tc.name lockInstancesShareTheSameFlag
     * @tc.desc lock, unlock: Lock Instances Share The Same Flag.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('lockInstancesShareTheSameFlag', 0, () => {
      const buffer = new SharedArrayBuffer(4);
      const owner = new NonReentrantLock(buffer);
      const contender = new NonReentrantLock(buffer);
      owner.lock();
      try {
        const acquired: boolean = contender.tryLock();
        expect(acquired).assertFalse();
      } finally {
        owner.unlock();
      }
      const acquiredAfterRelease: boolean = contender.tryLock();
      expect(acquiredAfterRelease).assertTrue();
      contender.unlock();
    });

    /**
     * @tc.number SUB_PERFORMANCE_MEMORYSHARED_0300
     * @tc.name lockInstancesWithSeparateBuffersDoNotContend
     * @tc.desc lock, tryLock, unlock: Lock Instances With Separate Buffers Do Not Contend.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('lockInstancesWithSeparateBuffersDoNotContend', 0, () => {
      const first = new NonReentrantLock(new SharedArrayBuffer(4));
      const second = new NonReentrantLock(new SharedArrayBuffer(4));
      first.lock();
      try {
        const acquired: boolean = second.tryLock();
        expect(acquired).assertTrue();
        second.unlock();
      } finally {
        first.unlock();
      }
    });

    /**
     * @tc.number SUB_PERFORMANCE_MEMORYSHARED_0400
     * @tc.name lockUsesTheSuppliedSharedFlagWithoutCopying
     * @tc.desc tryLock, unlock: Lock Uses The Supplied Shared Flag Without Copying.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('lockUsesTheSuppliedSharedFlagWithoutCopying', 0, () => {
      const buffer = new SharedArrayBuffer(4);
      const lock = new NonReentrantLock(buffer);
      expect(lock.flag.buffer === buffer).assertTrue();
      expect(lock.flag.length).assertEqual(1);
      expect(Atomics.load(lock.flag, 0)).assertEqual(0);
      expect(lock.tryLock()).assertTrue();
      expect(Atomics.load(new Int32Array(buffer), 0)).assertEqual(1);
      lock.unlock();
      expect(Atomics.load(new Int32Array(buffer), 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_MEMORYSHARED_0500
     * @tc.name uncontendedLockAndUnlockPerformTheExpectedStateTransitions
     * @tc.desc lock, tryLock, unlock: Uncontended Lock And Unlock Perform The Expected State Transitions.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('uncontendedLockAndUnlockPerformTheExpectedStateTransitions', 0, () => {
      const lock = new NonReentrantLock(new SharedArrayBuffer(4));
      lock.lock();
      try {
        expect(Atomics.load(lock.flag, 0)).assertEqual(1);
        expect(lock.tryLock()).assertFalse();
        expect(Atomics.load(lock.flag, 0)).assertEqual(1);
      } finally {
        lock.unlock();
      }
      expect(Atomics.load(lock.flag, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_MEMORYSHARED_0600
     * @tc.name tryLockDoesNotOverwriteTheContendedState
     * @tc.desc tryLock: Try Lock Does Not Overwrite The Contended State.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('tryLockDoesNotOverwriteTheContendedState', 0, () => {
      const lock = new NonReentrantLock(new SharedArrayBuffer(4));
      Atomics.store(lock.flag, 0, 2);
      expect(lock.tryLock()).assertFalse();
      expect(Atomics.load(lock.flag, 0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_PERFORMANCE_MEMORYSHARED_0700
     * @tc.name unlockReleasesTheContendedStateForAnotherInstance
     * @tc.desc lock, unlock, tryLock: Unlock Releases The Contended State For Another Instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('unlockReleasesTheContendedStateForAnotherInstance', 0, () => {
      const buffer = new SharedArrayBuffer(4);
      const owner = new NonReentrantLock(buffer);
      const successor = new NonReentrantLock(buffer);
      owner.lock();
      Atomics.store(owner.flag, 0, 2);
      owner.unlock();
      expect(Atomics.load(owner.flag, 0)).assertEqual(0);
      expect(successor.tryLock()).assertTrue();
      successor.unlock();
      expect(Atomics.load(owner.flag, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_MEMORYSHARED_0800
     * @tc.name threeInstancesExcludeEachOtherAcrossOwnershipTransfer
     * @tc.desc tryLock, unlock: Three Instances Exclude Each Other Across Ownership Transfer.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('threeInstancesExcludeEachOtherAcrossOwnershipTransfer', 0, () => {
      const buffer = new SharedArrayBuffer(4);
      const first = new NonReentrantLock(buffer);
      const second = new NonReentrantLock(buffer);
      const third = new NonReentrantLock(buffer);
      expect(first.tryLock()).assertTrue();
      expect(second.tryLock()).assertFalse();
      expect(third.tryLock()).assertFalse();
      first.unlock();
      expect(second.tryLock()).assertTrue();
      expect(first.tryLock()).assertFalse();
      expect(third.tryLock()).assertFalse();
      second.unlock();
      expect(third.tryLock()).assertTrue();
      expect(first.tryLock()).assertFalse();
      expect(second.tryLock()).assertFalse();
      third.unlock();
      expect(Atomics.load(first.flag, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_MEMORYSHARED_0900
     * @tc.name atomicCounterIsExactOnConsecutiveRuns
     * @tc.desc Atomic Counter Is Exact On Consecutive Runs.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('atomicCounterIsExactOnConsecutiveRuns', 0, async () => {
      await withHome(async () => {
        await openFeature('MemoryShared');
        await click(ON.id('memoryAtomicEntry'));
        await requireComponent(ON.id('memoryNonAtomic'));
        const first: number = await runCounter('memoryAtomic');
        const second: number = await runCounter('memoryAtomic');
        expect(first).assertEqual(ATOMIC_TOTAL);
        expect(second).assertEqual(ATOMIC_TOTAL);
        await backTo(ON.id('memoryAtomicEntry'));
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_MEMORYSHARED_1000
     * @tc.name nonAtomicCounterCanLoseUpdatesButCannotExceedTotal
     * @tc.desc Non Atomic Counter Can Lose Updates But Cannot Exceed Total.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('nonAtomicCounterCanLoseUpdatesButCannotExceedTotal', 0, async () => {
      await withHome(async () => {
        await openFeature('MemoryShared');
        await click(ON.id('memoryAtomicEntry'));
        const count: number = await runCounter('memoryNonAtomic');
        const valid: boolean = Number.isInteger(count) && count > 0 && count <= ATOMIC_TOTAL;
        expect(valid).assertTrue();
        await backTo(ON.id('memoryAtomicEntry'));
      });
    });
  });
}
