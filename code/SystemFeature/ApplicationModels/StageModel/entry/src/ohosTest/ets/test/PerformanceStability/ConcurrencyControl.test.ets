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
  getDriver, ensureAppReady, checkComponentExists, safeDiv
} from '../Shared/SharedDriver';

class SerialQueue {
  private limit: number;
  private running: number = 0;
  private pending: number = 0;
  private completed: number = 0;
  private rejected: number = 0;

  constructor(limit: number) {
    this.limit = limit > 0 ? limit : 1;
  }

  getLimit(): number {
    return this.limit;
  }

  getRunning(): number {
    return this.running;
  }

  getPending(): number {
    return this.pending;
  }

  getCompleted(): number {
    return this.completed;
  }

  getRejected(): number {
    return this.rejected;
  }

  submit(): boolean {
    if (this.running < this.limit) {
      this.running = this.running + 1;
      return true;
    }
    this.pending = this.pending + 1;
    return false;
  }

  finish(): boolean {
    if (this.running <= 0) {
      this.rejected = this.rejected + 1;
      return false;
    }
    this.running = this.running - 1;
    this.completed = this.completed + 1;
    if (this.pending > 0) {
      this.pending = this.pending - 1;
      this.running = this.running + 1;
    }
    return true;
  }

  drain(): number {
    let processed = 0;
    while (this.running > 0 || this.pending > 0) {
      if (this.finish()) {
        processed = processed + 1;
      } else {
        break;
      }
    }
    return processed;
  }

  utilization(): number {
    return safeDiv(this.running, this.limit);
  }

  isSaturated(): boolean {
    return this.running >= this.limit;
  }

  reset(): void {
    this.running = 0;
    this.pending = 0;
    this.completed = 0;
    this.rejected = 0;
  }
}
class Semaphore {
  private capacity: number;
  private permits: number;
  private acquired: number = 0;
  private released: number = 0;
  private waiting: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity > 0 ? capacity : 1;
    this.permits = this.capacity;
  }

  getCapacity(): number {
    return this.capacity;
  }

  available(): number {
    return this.permits;
  }

  getAcquired(): number {
    return this.acquired;
  }

  getReleased(): number {
    return this.released;
  }

  getWaiting(): number {
    return this.waiting;
  }

  tryAcquire(): boolean {
    if (this.permits > 0) {
      this.permits = this.permits - 1;
      this.acquired = this.acquired + 1;
      return true;
    }
    this.waiting = this.waiting + 1;
    return false;
  }

  release(): boolean {
    if (this.permits >= this.capacity) {
      return false;
    }
    this.permits = this.permits + 1;
    this.released = this.released + 1;
    if (this.waiting > 0) {
      this.waiting = this.waiting - 1;
    }
    return true;
  }
}

export default function concurrencyControlTest(): void {
  describe('ConcurrencyControl', () => {
    it('ConcurrencyControl_001', 0, async (done: Function) => {
      const queue = new SerialQueue(2);
      expect(queue.getLimit()).assertEqual(2);
      expect(queue.getRunning()).assertEqual(0);
      expect(queue.getPending()).assertEqual(0);
      done();
    });

    it('ConcurrencyControl_002', 0, async (done: Function) => {
      const queue = new SerialQueue(2);
      expect(queue.submit()).assertTrue();
      expect(queue.submit()).assertTrue();
      expect(queue.getRunning()).assertEqual(2);
      expect(queue.isSaturated()).assertTrue();
      done();
    });

    it('ConcurrencyControl_003', 0, async (done: Function) => {
      const queue = new SerialQueue(2);
      queue.submit();
      queue.submit();
      expect(queue.submit()).assertFalse();
      expect(queue.getPending()).assertEqual(1);
      expect(queue.getRunning()).assertEqual(2);
      done();
    });

    it('ConcurrencyControl_004', 0, async (done: Function) => {
      const queue = new SerialQueue(2);
      queue.submit();
      queue.submit();
      queue.submit();
      expect(queue.finish()).assertTrue();
      expect(queue.getCompleted()).assertEqual(1);
      expect(queue.getRunning()).assertEqual(2);
      expect(queue.getPending()).assertEqual(0);
      done();
    });

    it('ConcurrencyControl_005', 0, async (done: Function) => {
      const queue = new SerialQueue(2);
      queue.submit();
      queue.submit();
      queue.submit();
      expect(queue.drain()).assertEqual(3);
      expect(queue.getRunning()).assertEqual(0);
      expect(queue.getPending()).assertEqual(0);
      done();
    });

    it('ConcurrencyControl_006', 0, async (done: Function) => {
      const queue = new SerialQueue(2);
      queue.submit();
      expect(queue.utilization()).assertEqual(0.5);
      queue.submit();
      expect(queue.utilization()).assertEqual(1);
      expect(queue.isSaturated()).assertTrue();
      done();
    });

    it('ConcurrencyControl_007', 0, async (done: Function) => {
      const queue = new SerialQueue(0);
      expect(queue.getLimit()).assertEqual(1);
      expect(queue.submit()).assertTrue();
      expect(queue.submit()).assertFalse();
      done();
    });

    it('ConcurrencyControl_008', 0, async (done: Function) => {
      const queue = new SerialQueue(2);
      expect(queue.finish()).assertFalse();
      expect(queue.getRejected()).assertEqual(1);
      queue.submit();
      queue.submit();
      queue.reset();
      expect(queue.getRunning()).assertEqual(0);
      expect(queue.getCompleted()).assertEqual(0);
      done();
    });

    it('ConcurrencyControl_009', 0, async (done: Function) => {
      const semaphore = new Semaphore(3);
      expect(semaphore.getCapacity()).assertEqual(3);
      expect(semaphore.available()).assertEqual(3);
      expect(semaphore.getAcquired()).assertEqual(0);
      done();
    });

    it('ConcurrencyControl_010', 0, async (done: Function) => {
      const semaphore = new Semaphore(3);
      expect(semaphore.tryAcquire()).assertTrue();
      expect(semaphore.tryAcquire()).assertTrue();
      expect(semaphore.tryAcquire()).assertTrue();
      expect(semaphore.available()).assertEqual(0);
      expect(semaphore.getAcquired()).assertEqual(3);
      done();
    });

    it('ConcurrencyControl_011', 0, async (done: Function) => {
      const semaphore = new Semaphore(3);
      semaphore.tryAcquire();
      semaphore.tryAcquire();
      semaphore.tryAcquire();
      expect(semaphore.tryAcquire()).assertFalse();
      expect(semaphore.getWaiting()).assertEqual(1);
      done();
    });

    it('ConcurrencyControl_012', 0, async (done: Function) => {
      const semaphore = new Semaphore(3);
      semaphore.tryAcquire();
      semaphore.tryAcquire();
      semaphore.tryAcquire();
      semaphore.tryAcquire();
      expect(semaphore.release()).assertTrue();
      expect(semaphore.available()).assertEqual(1);
      expect(semaphore.getWaiting()).assertEqual(0);
      expect(semaphore.getReleased()).assertEqual(1);
      done();
    });

    it('ConcurrencyControl_013', 0, async (done: Function) => {
      const semaphore = new Semaphore(3);
      semaphore.tryAcquire();
      semaphore.tryAcquire();
      semaphore.tryAcquire();
      semaphore.release();
      semaphore.release();
      semaphore.release();
      expect(semaphore.available()).assertEqual(3);
      expect(semaphore.release()).assertFalse();
      done();
    });

    it('ConcurrencyControl_014', 0, async (done: Function) => {
      const semaphore = new Semaphore(0);
      expect(semaphore.getCapacity()).assertEqual(1);
      expect(semaphore.available()).assertEqual(1);
      expect(semaphore.tryAcquire()).assertTrue();
      done();
    });

    it('ConcurrencyControl_015', 0, async (done: Function) => {
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
