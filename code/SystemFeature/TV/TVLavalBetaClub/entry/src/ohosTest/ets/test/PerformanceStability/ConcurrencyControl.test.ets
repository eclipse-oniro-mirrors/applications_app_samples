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

const MAX_CONCURRENT_TASKS: number = 2;

const RATE_LIMIT_TOKENS: number = 5;

const RATE_LIMIT_WINDOW_MS: number = 1000;

interface QueuedTask {
  id: string;
  order: number;
}

// Executes tasks strictly in submission order
class SerialQueue {
  private queue: QueuedTask[] = [];
  private executed: string[] = [];
  private running: boolean = false;

  public enqueue(id: string): boolean {
    if (id.length === 0) {
      return false;
    }
    this.queue.push({ id: id, order: this.queue.length });
    return true;
  }

  public runNext(): string {
    if (this.queue.length === 0) {
      return '';
    }
    const task = this.queue.shift();
    if (task === undefined) {
      return '';
    }
    this.executed.push(task.id);
    return task.id;
  }

  public runAll(): number {
    const count = this.queue.length;
    while (this.queue.length > 0) {
      this.runNext();
    }
    return count;
  }

  public size(): number {
    return this.queue.length;
  }

  public getExecuted(): string[] {
    return [...this.executed];
  }

  public getExecutedCount(): number {
    return this.executed.length;
  }

  public setRunning(flag: boolean): void {
    this.running = flag;
  }

  public isRunning(): boolean {
    return this.running;
  }

  public clear(): void {
    this.queue = [];
    this.executed = [];
    this.running = false;
  }
}

// Limits the number of simultaneously running tasks
class TaskGate {
  private readonly maxConcurrent: number;
  private active: number = 0;
  private peak: number = 0;
  private rejected: number = 0;

  constructor(maxConcurrent: number) {
    this.maxConcurrent = maxConcurrent;
  }

  public tryAcquire(): boolean {
    if (this.active >= this.maxConcurrent) {
      this.rejected++;
      return false;
    }
    this.active++;
    if (this.active > this.peak) {
      this.peak = this.active;
    }
    return true;
  }

  public release(): boolean {
    if (this.active <= 0) {
      return false;
    }
    this.active--;
    return true;
  }

  public getActive(): number {
    return this.active;
  }

  public getPeak(): number {
    return this.peak;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public isFull(): boolean {
    return this.active >= this.maxConcurrent;
  }

  public getCapacity(): number {
    return this.maxConcurrent;
  }

  public reset(): void {
    this.active = 0;
    this.peak = 0;
    this.rejected = 0;
  }
}

// Deduplicates identical in-flight requests
class RequestDeduplicator {
  private inFlight: Set<string> = new Set<string>();
  private joined: number = 0;
  private started: number = 0;
  private completed: number = 0;

  public start(key: string): boolean {
    if (key.length === 0) {
      return false;
    }
    if (this.inFlight.has(key)) {
      this.joined++;
      return false;
    }
    this.inFlight.add(key);
    this.started++;
    return true;
  }

  public finish(key: string): boolean {
    if (!this.inFlight.has(key)) {
      return false;
    }
    this.inFlight.delete(key);
    this.completed++;
    return true;
  }

  public isInFlight(key: string): boolean {
    return this.inFlight.has(key);
  }

  public pendingCount(): number {
    return this.inFlight.size;
  }

  public getJoined(): number {
    return this.joined;
  }

  public getStarted(): number {
    return this.started;
  }

  public getCompleted(): number {
    return this.completed;
  }

  public reset(): void {
    this.inFlight = new Set<string>();
    this.joined = 0;
    this.started = 0;
    this.completed = 0;
  }
}

// Token bucket used to throttle uploads
class RateLimiter {
  private readonly capacity: number;
  private readonly windowMs: number;
  private available: number;
  private windowStart: number = -1;
  private denied: number = 0;

  constructor(capacity: number, windowMs: number) {
    this.capacity = capacity;
    this.windowMs = windowMs;
    this.available = capacity;
  }

  public allow(now: number): boolean {
    if (this.windowStart < 0) {
      this.windowStart = now;
    }
    if (now - this.windowStart >= this.windowMs) {
      this.windowStart = now;
      this.available = this.capacity;
    }
    if (this.available <= 0) {
      this.denied++;
      return false;
    }
    this.available--;
    return true;
  }

  public getAvailable(): number {
    return this.available;
  }

  public getDenied(): number {
    return this.denied;
  }

  public reset(): void {
    this.available = this.capacity;
    this.windowStart = 0;
    this.denied = 0;
  }
}

// Atomic counter abstraction for outstanding work tracking
class AtomicCounter {
  private value: number = 0;

  public increment(): number {
    this.value++;
    return this.value;
  }

  public decrement(): number {
    this.value--;
    return this.value;
  }

  public get(): number {
    return this.value;
  }

  public compareAndSet(expected: number, next: number): boolean {
    if (this.value !== expected) {
      return false;
    }
    this.value = next;
    return true;
  }

  public reset(): void {
    this.value = 0;
  }
}

export default function concurrencyControlTest() {
  describe('ConcurrencyControl_Test', () => {

    it('serial_queue_should_preserve_submission_order', 0, () => {
      const queue = new SerialQueue();
      expect(queue.enqueue('first')).assertTrue();
      expect(queue.enqueue('second')).assertTrue();
      expect(queue.enqueue('third')).assertTrue();
      expect(queue.size()).assertEqual(3);
      expect(queue.runNext()).assertEqual('first');
      expect(queue.runNext()).assertEqual('second');
      expect(queue.runNext()).assertEqual('third');
      expect(queue.runNext()).assertEqual('');
      expect(queue.getExecuted()).assertDeepEquals(['first', 'second', 'third']);
    });

    it('serial_queue_should_reject_empty_ids', 0, () => {
      const queue = new SerialQueue();
      expect(queue.enqueue('')).assertFalse();
      expect(queue.size()).assertEqual(0);
      expect(queue.getExecutedCount()).assertEqual(0);
      expect(queue.isRunning()).assertFalse();
      queue.setRunning(true);
      expect(queue.isRunning()).assertTrue();
    });

    it('serial_queue_should_run_all_and_clear', 0, () => {
      const queue = new SerialQueue();
      queue.enqueue('a');
      queue.enqueue('b');
      queue.enqueue('c');
      expect(queue.runAll()).assertEqual(3);
      expect(queue.size()).assertEqual(0);
      expect(queue.getExecutedCount()).assertEqual(3);
      queue.clear();
      expect(queue.getExecutedCount()).assertEqual(0);
      expect(queue.getExecuted().length).assertEqual(0);
      expect(queue.isRunning()).assertFalse();
    });

    it('task_gate_should_limit_concurrency', 0, () => {
      const gate = new TaskGate(2);
      expect(gate.getCapacity()).assertEqual(2);
      expect(gate.tryAcquire()).assertTrue();
      expect(gate.tryAcquire()).assertTrue();
      expect(gate.isFull()).assertTrue();
      expect(gate.tryAcquire()).assertFalse();
      expect(gate.getActive()).assertEqual(2);
      expect(gate.getPeak()).assertEqual(2);
      expect(gate.getRejected()).assertEqual(1);
    });

    it('task_gate_should_release_slots', 0, () => {
      const gate = new TaskGate(1);
      expect(gate.tryAcquire()).assertTrue();
      expect(gate.release()).assertTrue();
      expect(gate.release()).assertFalse();
      expect(gate.getActive()).assertEqual(0);
      expect(gate.tryAcquire()).assertTrue();
      expect(gate.isFull()).assertTrue();
      gate.reset();
      expect(gate.getActive()).assertEqual(0);
      expect(gate.getRejected()).assertEqual(0);
    });

    it('task_gate_should_track_peak_concurrency', 0, () => {
      const gate = new TaskGate(3);
      gate.tryAcquire();
      gate.tryAcquire();
      gate.tryAcquire();
      gate.release();
      gate.release();
      expect(gate.getPeak()).assertEqual(3);
      expect(gate.getActive()).assertEqual(1);
      expect(gate.tryAcquire()).assertTrue();
      expect(gate.getPeak()).assertEqual(3);
      expect(gate.getActive()).assertEqual(2);
    });

    it('deduplicator_should_reject_duplicate_requests', 0, () => {
      const dedup = new RequestDeduplicator();
      expect(dedup.start('list')).assertTrue();
      expect(dedup.start('list')).assertFalse();
      expect(dedup.isInFlight('list')).assertTrue();
      expect(dedup.getStarted()).assertEqual(1);
      expect(dedup.getJoined()).assertEqual(1);
      expect(dedup.pendingCount()).assertEqual(1);
    });

    it('deduplicator_should_allow_after_finish', 0, () => {
      const dedup = new RequestDeduplicator();
      expect(dedup.start('detail')).assertTrue();
      expect(dedup.finish('detail')).assertTrue();
      expect(dedup.finish('detail')).assertFalse();
      expect(dedup.isInFlight('detail')).assertFalse();
      expect(dedup.getCompleted()).assertEqual(1);
      expect(dedup.start('detail')).assertTrue();
      expect(dedup.getStarted()).assertEqual(2);
    });

    it('deduplicator_should_isolate_distinct_keys', 0, () => {
      const dedup = new RequestDeduplicator();
      expect(dedup.start('report')).assertTrue();
      expect(dedup.start('upload')).assertTrue();
      expect(dedup.start('')).assertFalse();
      expect(dedup.pendingCount()).assertEqual(2);
      expect(dedup.getJoined()).assertEqual(0);
      dedup.reset();
      expect(dedup.pendingCount()).assertEqual(0);
      expect(dedup.getStarted()).assertEqual(0);
      expect(dedup.getCompleted()).assertEqual(0);
    });

    it('rate_limiter_should_allow_within_capacity', 0, () => {
      const limiter = new RateLimiter(RATE_LIMIT_TOKENS, RATE_LIMIT_WINDOW_MS);
      for (let i = 0; i < RATE_LIMIT_TOKENS; i++) {
        expect(limiter.allow(100)).assertTrue();
      }
      expect(limiter.getAvailable()).assertEqual(0);
      expect(limiter.allow(100)).assertFalse();
      expect(limiter.getDenied()).assertEqual(1);
    });

    it('rate_limiter_should_refill_after_window', 0, () => {
      const limiter = new RateLimiter(2, 1000);
      expect(limiter.allow(0)).assertTrue();
      expect(limiter.allow(0)).assertTrue();
      expect(limiter.allow(0)).assertFalse();
      expect(limiter.allow(1000)).assertTrue();
      expect(limiter.getAvailable()).assertEqual(1);
      expect(limiter.allow(1001)).assertTrue();
      expect(limiter.getAvailable()).assertEqual(0);
    });

    it('rate_limiter_should_reset_state', 0, () => {
      const limiter = new RateLimiter(1, 100);
      limiter.allow(10);
      expect(limiter.getAvailable()).assertEqual(0);
      limiter.reset();
      expect(limiter.getAvailable()).assertEqual(1);
      expect(limiter.getDenied()).assertEqual(0);
      expect(limiter.allow(20)).assertTrue();
    });

    it('atomic_counter_should_support_cas', 0, () => {
      const counter = new AtomicCounter();
      expect(counter.get()).assertEqual(0);
      expect(counter.compareAndSet(0, 5)).assertTrue();
      expect(counter.get()).assertEqual(5);
      expect(counter.compareAndSet(0, 9)).assertFalse();
      expect(counter.increment()).assertEqual(6);
      expect(counter.decrement()).assertEqual(5);
      counter.reset();
      expect(counter.get()).assertEqual(0);
    });

    it('concurrency_flow_should_bound_upload_slots', 0, () => {
      const gate = new TaskGate(MAX_CONCURRENT_TASKS);
      const dedup = new RequestDeduplicator();
      let accepted: number = 0;
      for (let i = 0; i < 5; i++) {
        const key = `upload-${i}`;
        if (dedup.start(key) && gate.tryAcquire()) {
          accepted++;
        }
      }
      expect(accepted).assertEqual(2);
      expect(gate.getActive()).assertEqual(2);
      expect(dedup.pendingCount()).assertEqual(5);
      expect(gate.getRejected()).assertEqual(3);
    });

    it('concurrency_constants_should_be_stable', 0, () => {
      expect(MAX_CONCURRENT_TASKS).assertEqual(2);
      expect(RATE_LIMIT_TOKENS).assertEqual(5);
      expect(RATE_LIMIT_WINDOW_MS).assertEqual(1000);
      expect(MAX_CONCURRENT_TASKS).assertLess(RATE_LIMIT_TOKENS);
    });
  });
}

