/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
import { NonReentrantLock } from '@ohos/memoryShared';



export default function lockBufferTest(): void {
  describe('PerformanceLockBuffer', () => {
    // @tc.number SUB_PERFORMANCE_LOCKBUFFER_0001
    // @tc.name creatingAnAliasWhileHeldCannotResetTheSharedLock
    // @tc.desc Verify constructing a second lock during ownership preserves the held flag and blocks the new alias.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('creatingAnAliasWhileHeldCannotResetTheSharedLock', 0, () => {
      const buffer = new SharedArrayBuffer(4);
      const owner = new NonReentrantLock(buffer);
      owner.lock();
      try {
        const late = new NonReentrantLock(buffer);
        const held = Atomics.load(late.flag, 0);
        const acquired = late.tryLock();
        expect(held).assertEqual(1);
        expect(acquired).assertFalse();
      } finally { owner.unlock(); }
      const released = Atomics.load(new Int32Array(buffer), 0);
      expect(released).assertEqual(0);
    });

    // @tc.number SUB_PERFORMANCE_LOCKBUFFER_0002
    // @tc.name creatingAnAliasWhileContendedPreservesTheWakeupState
    // @tc.desc Verify constructing a new lock alias does not overwrite the shared contended flag.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('creatingAnAliasWhileContendedPreservesTheWakeupState', 0, () => {
      const buffer = new SharedArrayBuffer(4);
      const shared = new Int32Array(buffer);
      Atomics.store(shared, 0, 2);
      const alias = new NonReentrantLock(buffer);
      const acquired = alias.tryLock();
      const state = Atomics.load(shared, 0);
      expect(acquired).assertFalse();
      expect(state).assertEqual(2);
    });

    // @tc.number SUB_PERFORMANCE_LOCKBUFFER_0003
    // @tc.name tryLockTouchesOnlyTheFirstWordOfALargerSharedBuffer
    // @tc.desc Verify lock acquisition, failed reentry and release leave adjacent shared payload words intact.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('tryLockTouchesOnlyTheFirstWordOfALargerSharedBuffer', 0, () => {
      const buffer = new SharedArrayBuffer(16);
      const words = new Int32Array(buffer);
      words.set([0, 17, -31, 2147483647]);
      const lock = new NonReentrantLock(buffer);
      const acquired = lock.tryLock();
      expect(acquired).assertTrue();
      try {
        const reentered = lock.tryLock();
        const held = Array.from(words).join(',');
        expect(reentered).assertFalse();
        expect(held).assertEqual('1,17,-31,2147483647');
      } finally { lock.unlock(); }
      const after = Array.from(words).join(',');
      expect(after).assertEqual('0,17,-31,2147483647');
    });

    // @tc.number SUB_PERFORMANCE_LOCKBUFFER_0004
    // @tc.name blockingAcquisitionAlsoPreservesAdjacentPayloadWords
    // @tc.desc Verify the uncontended blocking path and unlock preserve data stored beside the lock flag.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('blockingAcquisitionAlsoPreservesAdjacentPayloadWords', 0, () => {
      const buffer = new SharedArrayBuffer(12);
      const words = new Int32Array(buffer);
      words.set([0, -2147483648, 93]);
      const lock = new NonReentrantLock(buffer);
      lock.lock();
      try {
        const held = Array.from(words).join(',');
        expect(held).assertEqual('1,-2147483648,93');
      } finally { lock.unlock(); }
      const released = Array.from(words).join(',');
      expect(released).assertEqual('0,-2147483648,93');
    });

    // @tc.number SUB_PERFORMANCE_LOCKBUFFER_0005
    // @tc.name contendedUnlockPreservesPayloadBesideTheWakeupFlag
    // @tc.desc Verify the contended release branch clears only the synchronization word.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('contendedUnlockPreservesPayloadBesideTheWakeupFlag', 0, () => {
      const buffer = new SharedArrayBuffer(12);
      const words = new Int32Array(buffer);
      words.set([2, 101, -103]);
      const owner = new NonReentrantLock(buffer);
      owner.unlock();
      const released = Array.from(words).join(',');
      expect(released).assertEqual('0,101,-103');
      const acquired = owner.tryLock();
      expect(acquired).assertTrue();
      try {
        const held = Array.from(words).join(',');
        expect(held).assertEqual('1,101,-103');
      } finally { owner.unlock(); }
    });

    // @tc.number SUB_PERFORMANCE_LOCKBUFFER_0006
    // @tc.name aLateAliasObservesPayloadWrittenByThePreviousOwner
    // @tc.desc Verify a lock constructed after release sees the same shared payload and can acquire without copying it.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('aLateAliasObservesPayloadWrittenByThePreviousOwner', 0, () => {
      const buffer = new SharedArrayBuffer(8);
      const words = new Int32Array(buffer);
      const first = new NonReentrantLock(buffer);
      first.lock();
      try { Atomics.store(words, 1, 127); }
      finally { first.unlock(); }
      const next = new NonReentrantLock(buffer);
      const acquired = next.tryLock();
      expect(acquired).assertTrue();
      try {
        const actual = Atomics.load(next.flag, 1);
        expect(actual).assertEqual(127);
        Atomics.store(next.flag, 1, 131);
      } finally { next.unlock(); }
      const final = Atomics.load(words, 1);
      const released = Atomics.load(words, 0);
      expect(final).assertEqual(131);
      expect(released).assertEqual(0);
    });
  });
}
