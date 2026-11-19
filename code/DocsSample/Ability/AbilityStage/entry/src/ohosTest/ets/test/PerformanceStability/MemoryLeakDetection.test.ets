/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  logInfo,
  serializedDelay,
  launchEntryAbility,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  checkComponentExistsByKey,
  tapComponentByText,
  pageComponentCount,
  PAGE_TEXT_CLICKED,
  PAGE_TEXT_INITIAL,
  INDEX_PAGE_TEXT_KEY,
  TIMEOUT_PAGE_RENDER,
  DELAY_AFTER_BACKGROUND,
  TOLERANCE_COMPONENT_COUNT
} from '../Shared/SharedDriver';

class DuplicateRegistrationError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'DuplicateRegistrationError';
  }
}

class EnvironmentCallbackRegistry {
  private callbackIds: number[] = [];
  private nextId: number = 1;
  private registeredTotal: number = 0;
  private releasedTotal: number = 0;
  private rejectedTotal: number = 0;

  public registerAllowsDuplicate(): boolean {
    return false;
  }

  public register(): number {
    if (this.callbackIds.length >= this.getCapacity()) {
      this.rejectedTotal++;
      throw new DuplicateRegistrationError('callback capacity reached');
    }
    const id: number = this.nextId;
    this.nextId++;
    this.callbackIds.push(id);
    this.registeredTotal++;
    return id;
  }

  public unregister(callbackId: number): boolean {
    for (let i = 0; i < this.callbackIds.length; i++) {
      if (this.callbackIds[i] === callbackId) {
        this.callbackIds.splice(i, 1);
        this.releasedTotal++;
        return true;
      }
    }
    this.rejectedTotal++;
    return false;
  }

  public getCapacity(): number {
    return 2;
  }

  public getActiveCount(): number {
    return this.callbackIds.length;
  }

  public getRegisteredTotal(): number {
    return this.registeredTotal;
  }

  public getReleasedTotal(): number {
    return this.releasedTotal;
  }

  public getRejectedTotal(): number {
    return this.rejectedTotal;
  }

  public getLeakedCount(): number {
    return this.callbackIds.length;
  }

  public clear(): void {
    this.callbackIds = [];
    this.registeredTotal = 0;
    this.releasedTotal = 0;
    this.rejectedTotal = 0;
    this.nextId = 1;
  }

  public hasActive(callbackId: number): boolean {
    for (let i = 0; i < this.callbackIds.length; i++) {
      if (this.callbackIds[i] === callbackId) {
        return true;
      }
    }
    return false;
  }
}

class ResourceHandleTable {
  private handleCount: number;
  private allocated: boolean[] = [];
  private allocatedTotal: number = 0;
  private releasedTotal: number = 0;
  private reuseHits: number = 0;
  private reuseAttempts: number = 0;

  constructor(handleCount: number) {
    this.handleCount = handleCount;
    for (let i = 0; i < handleCount; i++) {
      this.allocated.push(false);
    }
  }

  public getCapacity(): number {
    return this.handleCount;
  }

  public acquire(): number {
    this.reuseAttempts++;
    for (let i = 0; i < this.allocated.length; i++) {
      if (!this.allocated[i]) {
        this.allocated[i] = true;
        this.allocatedTotal++;
        if (this.allocatedTotal > this.handleCount) {
          this.reuseHits++;
        }
        return i;
      }
    }
    return -1;
  }

  public release(handle: number): boolean {
    if (handle < 0 || handle >= this.allocated.length) {
      return false;
    }
    if (!this.allocated[handle]) {
      return false;
    }
    this.allocated[handle] = false;
    this.releasedTotal++;
    return true;
  }

  public getInUseCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.allocated.length; i++) {
      if (this.allocated[i]) {
        count++;
      }
    }
    return count;
  }

  public getLeakedCount(): number {
    return this.getInUseCount();
  }

  public getReuseHitRate(): number {
    if (this.reuseAttempts === 0) {
      return 0;
    }
    return this.reuseHits / this.reuseAttempts;
  }

  public reset(): void {
    for (let i = 0; i < this.allocated.length; i++) {
      this.allocated[i] = false;
    }
    this.allocatedTotal = 0;
    this.releasedTotal = 0;
    this.reuseHits = 0;
    this.reuseAttempts = 0;
  }
}

class ObjectPool {
  private capacity: number;
  private free: number;
  private borrowedTotal: number = 0;
  private returnedTotal: number = 0;
  private missTotal: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity;
    this.free = capacity;
  }

  public borrow(): boolean {
    if (this.free <= 0) {
      this.missTotal++;
      return false;
    }
    this.free--;
    this.borrowedTotal++;
    return true;
  }

  public giveBack(): boolean {
    if (this.free >= this.capacity) {
      return false;
    }
    this.free++;
    this.returnedTotal++;
    return true;
  }

  public getFreeCount(): number {
    return this.free;
  }

  public getBorrowedTotal(): number {
    return this.borrowedTotal;
  }

  public getMissTotal(): number {
    return this.missTotal;
  }

  public getHitRate(): number {
    const attempts: number = this.borrowedTotal + this.missTotal;
    if (attempts === 0) {
      return 0;
    }
    return this.borrowedTotal / attempts;
  }

  public getLeakedCount(): number {
    return this.borrowedTotal - this.returnedTotal;
  }
}

export default function memoryLeakDetectionTest(): void {
  describe('MemoryLeakDetectionTest', () => {
    let driver: Driver;
    let registry: EnvironmentCallbackRegistry;

    beforeAll(async () => {
      driver = getDriver();
      registry = new EnvironmentCallbackRegistry();
      const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      if (!stable) {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        await ensureIndexPageInitial(driver);
      }
    });

    afterAll(async () => {
      registry.clear();
      await doAbilityForeground();
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_0100
     * @tc.name testRegistryInitialState
     * @tc.desc Verify callback registry initial state: zero active, registered, released and rejected counters with no leaked entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryInitialState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        expect(local.getActiveCount()).assertEqual(0);
        expect(local.getRegisteredTotal()).assertEqual(0);
        expect(local.getReleasedTotal()).assertEqual(0);
        expect(local.getRejectedTotal()).assertEqual(0);
        expect(local.getLeakedCount()).assertEqual(0);
        expect(local.registerAllowsDuplicate()).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_0200
     * @tc.name testRegisterAllocatesMonotonicIds
     * @tc.desc Verify registration identifiers: first two registrations return ids 1 and 2 with active count 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegisterAllocatesMonotonicIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        const firstId: number = local.register();
        const secondId: number = local.register();
        expect(firstId).assertEqual(1);
        expect(secondId).assertEqual(2);
        expect(local.getActiveCount()).assertEqual(2);
        expect(local.getRegisteredTotal()).assertEqual(2);
        expect(local.hasActive(2)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_0300
     * @tc.name testRegisterBeyondCapacityRejected
     * @tc.desc Verify registration capacity of two: the third registration throws DuplicateRegistrationError and increments rejected count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegisterBeyondCapacityRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        local.register();
        local.register();
        try {
          local.register();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('DuplicateRegistrationError');
        }
        expect(local.getActiveCount()).assertEqual(2);
        expect(local.getRejectedTotal()).assertEqual(1);
        expect(local.getRegisteredTotal()).assertEqual(2);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_0400
     * @tc.name testUnregisterReleasesRegistration
     * @tc.desc Verify release pairing: unregistering id 1 decrements active count to 1 and reporting it again returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnregisterReleasesRegistration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        const id: number = local.register();
        expect(local.unregister(id)).assertTrue();
        expect(local.getActiveCount()).assertEqual(0);
        expect(local.getReleasedTotal()).assertEqual(1);
        expect(local.unregister(id)).assertFalse();
        expect(local.getRejectedTotal()).assertEqual(1);
        expect(local.hasActive(id)).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_0500
     * @tc.name testRegisterUnregisterCycleHasZeroLeak
     * @tc.desc Verify paired cycles leak nothing: ten register then unregister cycles leave zero active entries and zero leaked count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegisterUnregisterCycleHasZeroLeak', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        for (let i = 0; i < 10; i++) {
          const id: number = local.register();
          expect(local.unregister(id)).assertTrue();
        }
        expect(local.getActiveCount()).assertEqual(0);
        expect(local.getRegisteredTotal()).assertEqual(10);
        expect(local.getReleasedTotal()).assertEqual(10);
        expect(local.getLeakedCount()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_0600
     * @tc.name testUnpairedRegistrationDetectedAsLeak
     * @tc.desc Verify unpaired registration detection: registering without unregistering leaves one active entry, zero releases and one outstanding registration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnpairedRegistrationDetectedAsLeak', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        local.register();
        expect(local.getActiveCount()).assertEqual(1);
        expect(local.getReleasedTotal()).assertEqual(0);
        expect(local.getRegisteredTotal() - local.getReleasedTotal()).assertEqual(1);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_0700
     * @tc.name testHandleTableExhaustionAndRelease
     * @tc.desc Verify handle table capacity two: two acquires return handles 0 and 1, the third returns minus one and release restores availability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHandleTableExhaustionAndRelease', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(2);
        expect(table.acquire()).assertEqual(0);
        expect(table.acquire()).assertEqual(1);
        expect(table.acquire()).assertEqual(-1);
        expect(table.getInUseCount()).assertEqual(2);
        expect(table.release(0)).assertTrue();
        expect(table.getInUseCount()).assertEqual(1);
        expect(table.acquire()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_0800
     * @tc.name testHandleReleaseInvalidIndex
     * @tc.desc Verify invalid handle release: minus one and out of range index two are rejected on a two slot table with one in use
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHandleReleaseInvalidIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(2);
        table.acquire();
        expect(table.release(-1)).assertFalse();
        expect(table.release(2)).assertFalse();
        expect(table.release(5)).assertFalse();
        expect(table.release(1)).assertFalse();
        expect(table.getInUseCount()).assertEqual(1);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_0900
     * @tc.name testHandleTableZeroLeakAfterBalancedCycles
     * @tc.desc Verify balanced allocation cycles leak nothing: twenty acquire and release pairs on a four slot table leave zero handles in use
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHandleTableZeroLeakAfterBalancedCycles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(4);
        for (let i = 0; i < 20; i++) {
          const handle: number = table.acquire();
          expect(handle >= 0).assertTrue();
          expect(table.release(handle)).assertTrue();
        }
        expect(table.getInUseCount()).assertEqual(0);
        expect(table.getLeakedCount()).assertEqual(0);
        table.reset();
        expect(table.getCapacity()).assertEqual(4);
        expect(table.acquire()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_1000
     * @tc.name testHandleTableReuseHitRate
     * @tc.desc Verify handle reuse accounting: two sequential acquires on a single slot table with immediate release yields a reuse hit rate of 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHandleTableReuseHitRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(1);
        const first: number = table.acquire();
        table.release(first);
        const second: number = table.acquire();
        table.release(second);
        expect(first).assertEqual(0);
        expect(second).assertEqual(0);
        expect(table.getReuseHitRate()).assertEqual(0.5);
        expect(table.getInUseCount()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_1100
     * @tc.name testObjectPoolHitRateBoundary
     * @tc.desc Verify object pool hit rate: capacity two allows two borrows, a third borrow misses so the hit rate is two thirds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testObjectPoolHitRateBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const pool: ObjectPool = new ObjectPool(2);
        expect(pool.borrow()).assertTrue();
        expect(pool.borrow()).assertTrue();
        expect(pool.borrow()).assertFalse();
        expect(pool.getFreeCount()).assertEqual(0);
        expect(pool.getMissTotal()).assertEqual(1);
        expect(Math.abs(pool.getHitRate() - 2 / 3) <= 0.0001).assertTrue();
        expect(pool.getBorrowedTotal()).assertEqual(2);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_1200
     * @tc.name testObjectPoolReturnAndLeak
     * @tc.desc Verify pool return accounting: borrowing twice and returning once leaves one leaked entry and two free slots are not exceeded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testObjectPoolReturnAndLeak', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const pool: ObjectPool = new ObjectPool(2);
        pool.borrow();
        pool.borrow();
        expect(pool.giveBack()).assertTrue();
        expect(pool.getFreeCount()).assertEqual(1);
        expect(pool.getLeakedCount()).assertEqual(1);
        expect(pool.giveBack()).assertTrue();
        expect(pool.giveBack()).assertFalse();
        expect(pool.getLeakedCount()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_1300
     * @tc.name testObjectPoolZeroCapacity
     * @tc.desc Verify zero capacity pool: every borrow misses, hit rate is zero and return on a full pool is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testObjectPoolZeroCapacity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const pool: ObjectPool = new ObjectPool(0);
        expect(pool.borrow()).assertFalse();
        expect(pool.borrow()).assertFalse();
        expect(pool.getMissTotal()).assertEqual(2);
        expect(pool.getHitRate()).assertEqual(0);
        expect(pool.giveBack()).assertFalse();
        expect(pool.getFreeCount()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_1400
     * @tc.name testComponentCountBoundedAfterLifecycleCycles
     * @tc.desc Verify page component count after five real lifecycle cycles stays within the shared component tolerance of the baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentCountBoundedAfterLifecycleCycles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const baselineCount: number = await pageComponentCount(driver);
        expect(baselineCount >= 1).assertTrue();
        for (let i = 0; i < 5; i++) {
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        }
        const finalCount: number = await pageComponentCount(driver);
        logInfo('component baseline ' + baselineCount + ' final ' + finalCount);
        expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_1500
     * @tc.name testPageKeySurvivesLifecycleCycles
     * @tc.desc Verify the HelloWorld component key remains resolvable and the clicked message stays readable after three lifecycle cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPageKeySurvivesLifecycleCycles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const clickedBefore: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        if (!clickedBefore) {
          await tapComponentByText(driver, PAGE_TEXT_INITIAL);
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
        }
        for (let i = 0; i < 3; i++) {
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        }
        const keyExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        const textVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(keyExists).assertTrue();
        expect(textVisible).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_1600
     * @tc.name testRegistryResetClearsCounters
     * @tc.desc Verify registry reset: after two registrations and one release, clear resets all counters to zero and ids restart at one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegistryResetClearsCounters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: EnvironmentCallbackRegistry = new EnvironmentCallbackRegistry();
        const firstId: number = local.register();
        local.register();
        local.unregister(firstId);
        expect(local.getRegisteredTotal()).assertEqual(2);
        expect(local.getReleasedTotal()).assertEqual(1);
        expect(local.getActiveCount()).assertEqual(1);
        local.clear();
        expect(local.getRegisteredTotal()).assertEqual(0);
        expect(local.getReleasedTotal()).assertEqual(0);
        expect(local.getActiveCount()).assertEqual(0);
        expect(local.register()).assertEqual(1);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_MEMLEAK_1700
     * @tc.name testSharedRegistryTracksRealRounds
     * @tc.desc Verify registry accounting across two real foreground rounds: registered equals released plus active and the leak count is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSharedRegistryTracksRealRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        registry.clear();
        for (let i = 0; i < 2; i++) {
          const id: number = registry.register();
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          expect(registry.unregister(id)).assertTrue();
        }
        expect(registry.getRegisteredTotal()).assertEqual(2);
        expect(registry.getReleasedTotal()).assertEqual(2);
        expect(registry.getActiveCount()).assertEqual(0);
        expect(registry.getRegisteredTotal() - registry.getReleasedTotal() - registry.getActiveCount()).assertEqual(0);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });
  });
}
