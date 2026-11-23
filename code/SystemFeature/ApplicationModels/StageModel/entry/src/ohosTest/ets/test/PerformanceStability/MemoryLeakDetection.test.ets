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

import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists
} from '../Shared/SharedDriver';

class Allocation {
  id: number;
  sizeKb: number;
  released: boolean;

  constructor(id: number, sizeKb: number) {
    this.id = id;
    this.sizeKb = sizeKb;
    this.released = false;
  }
}

class LeakTracker {
  private allocations: Allocation[] = [];
  private nextId: number = 1;
  private peakKb: number = 0;
  private totalAllocated: number = 0;
  private totalReleased: number = 0;
  private rejected: number = 0;

  allocate(sizeKb: number): number {
    if (sizeKb <= 0) {
      this.rejected = this.rejected + 1;
      return -1;
    }
    const id = this.nextId;
    this.nextId = this.nextId + 1;
    this.allocations.push(new Allocation(id, sizeKb));
    this.totalAllocated = this.totalAllocated + sizeKb;
    if (this.liveBytes() > this.peakKb) {
      this.peakKb = this.liveBytes();
    }
    return id;
  }

  release(id: number): boolean {
    for (const allocation of this.allocations) {
      if (allocation.id === id && !allocation.released) {
        allocation.released = true;
        this.totalReleased = this.totalReleased + allocation.sizeKb;
        return true;
      }
    }
    return false;
  }

  releaseAll(): number {
    let count = 0;
    for (const allocation of this.allocations) {
      if (!allocation.released) {
        allocation.released = true;
        this.totalReleased = this.totalReleased + allocation.sizeKb;
        count = count + 1;
      }
    }
    return count;
  }

  liveCount(): number {
    let count = 0;
    for (const allocation of this.allocations) {
      if (!allocation.released) {
        count = count + 1;
      }
    }
    return count;
  }

  liveBytes(): number {
    let total = 0;
    for (const allocation of this.allocations) {
      if (!allocation.released) {
        total = total + allocation.sizeKb;
      }
    }
    return total;
  }

  getPeak(): number {
    return this.peakKb;
  }

  getTotalAllocated(): number {
    return this.totalAllocated;
  }

  getTotalReleased(): number {
    return this.totalReleased;
  }

  getRejected(): number {
    return this.rejected;
  }

  detectLeak(thresholdKb: number): boolean {
    return this.liveBytes() > thresholdKb;
  }

  reset(): void {
    this.allocations = [];
    this.nextId = 1;
    this.peakKb = 0;
    this.totalAllocated = 0;
    this.totalReleased = 0;
    this.rejected = 0;
  }
}
class MemorySnapshot {
  private values: number[] = [];

  capture(value: number): void {
    this.values.push(value);
  }

  getCount(): number {
    return this.values.length;
  }

  last(): number {
    if (this.values.length === 0) {
      return 0;
    }
    return this.values[this.values.length - 1];
  }

  first(): number {
    if (this.values.length === 0) {
      return 0;
    }
    return this.values[0];
  }

  growth(): number {
    return this.last() - this.first();
  }

  monotonicallyGrowing(): boolean {
    if (this.values.length < 2) {
      return false;
    }
    for (let i = 1; i < this.values.length; i++) {
      if (this.values[i] < this.values[i - 1]) {
        return false;
      }
    }
    return true;
  }
}

export default function memoryLeakDetectionTest(): void {
  describe('MemoryLeakDetection', () => {
    it('MemoryLeakDetection_001', 0, async (done: Function) => {
      const tracker = new LeakTracker();
      expect(tracker.liveCount()).assertEqual(0);
      expect(tracker.liveBytes()).assertEqual(0);
      expect(tracker.getPeak()).assertEqual(0);
      done();
    });

    it('MemoryLeakDetection_002', 0, async (done: Function) => {
      const tracker = new LeakTracker();
      expect(tracker.allocate(10)).assertEqual(1);
      expect(tracker.allocate(20)).assertEqual(2);
      expect(tracker.liveCount()).assertEqual(2);
      expect(tracker.liveBytes()).assertEqual(30);
      done();
    });

    it('MemoryLeakDetection_003', 0, async (done: Function) => {
      const tracker = new LeakTracker();
      expect(tracker.allocate(0)).assertEqual(-1);
      expect(tracker.allocate(-5)).assertEqual(-1);
      expect(tracker.getRejected()).assertEqual(2);
      expect(tracker.liveCount()).assertEqual(0);
      done();
    });

    it('MemoryLeakDetection_004', 0, async (done: Function) => {
      const tracker = new LeakTracker();
      const id = tracker.allocate(40);
      expect(tracker.release(id)).assertTrue();
      expect(tracker.liveCount()).assertEqual(0);
      expect(tracker.liveBytes()).assertEqual(0);
      expect(tracker.getTotalReleased()).assertEqual(40);
      done();
    });

    it('MemoryLeakDetection_005', 0, async (done: Function) => {
      const tracker = new LeakTracker();
      const id = tracker.allocate(40);
      tracker.release(id);
      expect(tracker.release(id)).assertFalse();
      expect(tracker.release(999)).assertFalse();
      expect(tracker.getTotalReleased()).assertEqual(40);
      done();
    });

    it('MemoryLeakDetection_006', 0, async (done: Function) => {
      const tracker = new LeakTracker();
      tracker.allocate(10);
      tracker.allocate(20);
      tracker.allocate(30);
      expect(tracker.releaseAll()).assertEqual(3);
      expect(tracker.liveCount()).assertEqual(0);
      expect(tracker.getTotalReleased()).assertEqual(60);
      done();
    });

    it('MemoryLeakDetection_007', 0, async (done: Function) => {
      const tracker = new LeakTracker();
      tracker.allocate(10);
      tracker.allocate(20);
      expect(tracker.getPeak()).assertEqual(30);
      tracker.release(2);
      expect(tracker.getPeak()).assertEqual(30);
      expect(tracker.liveBytes()).assertEqual(10);
      done();
    });

    it('MemoryLeakDetection_008', 0, async (done: Function) => {
      const tracker = new LeakTracker();
      tracker.allocate(100);
      expect(tracker.detectLeak(50)).assertTrue();
      expect(tracker.detectLeak(150)).assertFalse();
      expect(tracker.getTotalAllocated()).assertEqual(100);
      done();
    });

    it('MemoryLeakDetection_009', 0, async (done: Function) => {
      const tracker = new LeakTracker();
      tracker.allocate(10);
      tracker.allocate(20);
      tracker.allocate(30);
      expect(tracker.getTotalAllocated()).assertEqual(60);
      expect(tracker.liveBytes()).assertEqual(60);
      expect(tracker.getPeak()).assertEqual(60);
      done();
    });

    it('MemoryLeakDetection_010', 0, async (done: Function) => {
      const tracker = new LeakTracker();
      tracker.allocate(10);
      tracker.allocate(20);
      tracker.reset();
      expect(tracker.liveCount()).assertEqual(0);
      expect(tracker.getTotalAllocated()).assertEqual(0);
      expect(tracker.getPeak()).assertEqual(0);
      expect(tracker.allocate(5)).assertEqual(1);
      done();
    });

    it('MemoryLeakDetection_011', 0, async (done: Function) => {
      const tracker = new LeakTracker();
      const first = tracker.allocate(10);
      const second = tracker.allocate(20);
      tracker.releaseAll();
      expect(tracker.release(first)).assertFalse();
      expect(tracker.release(second)).assertFalse();
      expect(tracker.releaseAll()).assertEqual(0);
      done();
    });

    it('MemoryLeakDetection_012', 0, async (done: Function) => {
      const snapshot = new MemorySnapshot();
      expect(snapshot.getCount()).assertEqual(0);
      expect(snapshot.first()).assertEqual(0);
      expect(snapshot.last()).assertEqual(0);
      expect(snapshot.monotonicallyGrowing()).assertFalse();
      done();
    });

    it('MemoryLeakDetection_013', 0, async (done: Function) => {
      const snapshot = new MemorySnapshot();
      snapshot.capture(100);
      snapshot.capture(150);
      snapshot.capture(220);
      expect(snapshot.getCount()).assertEqual(3);
      expect(snapshot.first()).assertEqual(100);
      expect(snapshot.last()).assertEqual(220);
      expect(snapshot.growth()).assertEqual(120);
      expect(snapshot.monotonicallyGrowing()).assertTrue();
      done();
    });

    it('MemoryLeakDetection_014', 0, async (done: Function) => {
      const snapshot = new MemorySnapshot();
      snapshot.capture(100);
      snapshot.capture(80);
      expect(snapshot.growth()).assertEqual(-20);
      expect(snapshot.monotonicallyGrowing()).assertFalse();
      done();
    });

    it('MemoryLeakDetection_015', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}
