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

const PRIORITY_LOW: number = 1;

const PRIORITY_NORMAL: number = 5;

const PRIORITY_HIGH: number = 9;

const PRIORITY_CRITICAL: number = 10;

const MIN_PRIORITY: number = 1;

const MAX_PRIORITY: number = 10;

const MAX_QUEUE: number = 32;

interface DispatchTask {
  id: string;
  priority: number;
  event: string;
  enqueuedAt: number;
}

// Priority queue preserving FIFO order for equal priorities
class PriorityDispatchQueue {
  private tasks: DispatchTask[] = [];
  private readonly capacity: number;
  private sequence: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public enqueue(id: string, priority: number, event: string, now: number): boolean {
    if (id.length === 0 || event.length === 0 || this.tasks.length >= this.capacity) {
      return false;
    }
    if (priority < MIN_PRIORITY || priority > MAX_PRIORITY) {
      return false;
    }
    this.tasks.push({
      id: id,
      priority: priority,
      event: event,
      enqueuedAt: now + this.sequence * 0.001
    });
    this.sequence++;
    return true;
  }

  public dequeue(): DispatchTask | undefined {
    if (this.tasks.length === 0) {
      return undefined;
    }
    let bestIndex: number = 0;
    for (let i = 1; i < this.tasks.length; i++) {
      const current = this.tasks[i];
      const best = this.tasks[bestIndex];
      if (current.priority > best.priority ||
        (current.priority === best.priority && current.enqueuedAt < best.enqueuedAt)) {
        bestIndex = i;
      }
    }
    const task = this.tasks[bestIndex];
    this.tasks.splice(bestIndex, 1);
    return task;
  }

  public peek(): DispatchTask | undefined {
    if (this.tasks.length === 0) {
      return undefined;
    }
    let best: DispatchTask = this.tasks[0];
    for (let i = 1; i < this.tasks.length; i++) {
      const current = this.tasks[i];
      if (current.priority > best.priority ||
        (current.priority === best.priority && current.enqueuedAt < best.enqueuedAt)) {
        best = current;
      }
    }
    return best;
  }

  public size(): number {
    return this.tasks.length;
  }

  public countOfPriority(priority: number): number {
    return this.tasks.filter((task: DispatchTask) => task.priority === priority).length;
  }

  public contains(id: string): boolean {
    for (let i = 0; i < this.tasks.length; i++) {
      if (this.tasks[i].id === id) {
        return true;
      }
    }
    return false;
  }

  public remove(id: string): boolean {
    for (let i = 0; i < this.tasks.length; i++) {
      if (this.tasks[i].id === id) {
        this.tasks.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public drain(): DispatchTask[] {
    const result: DispatchTask[] = [];
    let task = this.dequeue();
    while (task !== undefined) {
      result.push(task);
      task = this.dequeue();
    }
    return result;
  }

  public clear(): void {
    this.tasks = [];
    this.sequence = 0;
  }
}

// Aggregates dispatch results
class DispatchStats {
  private dispatched: number = 0;
  private dropped: number = 0;
  private byEvent: Map<string, number> = new Map<string, number>();

  public record(task: DispatchTask): void {
    this.dispatched++;
    this.byEvent.set(task.event, (this.byEvent.get(task.event) ?? 0) + 1);
  }

  public drop(): void {
    this.dropped++;
  }

  public getDispatched(): number {
    return this.dispatched;
  }

  public getDropped(): number {
    return this.dropped;
  }

  public countOf(event: string): number {
    const value = this.byEvent.get(event);
    return value === undefined ? 0 : value;
  }

  public eventTypes(): number {
    return this.byEvent.size;
  }

  public successRate(): number {
    const total = this.dispatched + this.dropped;
    return total === 0 ? 0 : this.dispatched * 100 / total;
  }

  public reset(): void {
    this.dispatched = 0;
    this.dropped = 0;
    this.byEvent = new Map<string, number>();
  }
}

export default function eventDispatchQueueTest() {
  describe('EventDispatchQueue_Test', () => {

    it('queue_should_enqueue_valid_tasks', 0, () => {
      const queue = new PriorityDispatchQueue(MAX_QUEUE);
      expect(queue.enqueue('t1', PRIORITY_NORMAL, 'tap', 1000)).assertTrue();
      expect(queue.size()).assertEqual(1);
      expect(queue.contains('t1')).assertTrue();
      expect(queue.enqueue('', PRIORITY_NORMAL, 'tap', 1000)).assertFalse();
      expect(queue.enqueue('t2', PRIORITY_NORMAL, '', 1000)).assertFalse();
      expect(queue.size()).assertEqual(1);
    });

    it('queue_should_reject_invalid_priority', 0, () => {
      const queue = new PriorityDispatchQueue(MAX_QUEUE);
      expect(queue.enqueue('t1', MIN_PRIORITY - 1, 'tap', 0)).assertFalse();
      expect(queue.enqueue('t2', MAX_PRIORITY + 1, 'tap', 0)).assertFalse();
      expect(queue.size()).assertEqual(0);
    });

    it('queue_should_dequeue_highest_priority', 0, () => {
      const queue = new PriorityDispatchQueue(MAX_QUEUE);
      queue.enqueue('low', PRIORITY_LOW, 'tap', 1);
      queue.enqueue('high', PRIORITY_HIGH, 'key', 2);
      queue.enqueue('normal', PRIORITY_NORMAL, 'touch', 3);
      const first = queue.dequeue() as DispatchTask;
      expect(first.id).assertEqual('high');
      const second = queue.dequeue() as DispatchTask;
      expect(second.id).assertEqual('normal');
      const third = queue.dequeue() as DispatchTask;
      expect(third.id).assertEqual('low');
      expect(queue.dequeue() === undefined).assertTrue();
    });

    it('queue_should_preserve_fifo_for_equal_priority', 0, () => {
      const queue = new PriorityDispatchQueue(MAX_QUEUE);
      queue.enqueue('first', PRIORITY_NORMAL, 'tap', 1);
      queue.enqueue('second', PRIORITY_NORMAL, 'tap', 1);
      queue.enqueue('third', PRIORITY_NORMAL, 'tap', 1);
      expect((queue.dequeue() as DispatchTask).id).assertEqual('first');
      expect((queue.dequeue() as DispatchTask).id).assertEqual('second');
      expect((queue.dequeue() as DispatchTask).id).assertEqual('third');
    });

    it('queue_should_peek_without_removing', 0, () => {
      const queue = new PriorityDispatchQueue(MAX_QUEUE);
      expect(queue.peek() === undefined).assertTrue();
      queue.enqueue('low', PRIORITY_LOW, 'tap', 1);
      queue.enqueue('critical', PRIORITY_CRITICAL, 'error', 2);
      const peeked = queue.peek() as DispatchTask;
      expect(peeked.id).assertEqual('critical');
      expect(queue.size()).assertEqual(2);
    });

    it('queue_should_enforce_capacity', 0, () => {
      const queue = new PriorityDispatchQueue(2);
      expect(queue.enqueue('a', PRIORITY_NORMAL, 'tap', 1)).assertTrue();
      expect(queue.enqueue('b', PRIORITY_NORMAL, 'tap', 1)).assertTrue();
      expect(queue.enqueue('c', PRIORITY_NORMAL, 'tap', 1)).assertFalse();
      expect(queue.size()).assertEqual(2);
    });

    it('queue_should_count_and_remove', 0, () => {
      const queue = new PriorityDispatchQueue(MAX_QUEUE);
      queue.enqueue('a', PRIORITY_HIGH, 'tap', 1);
      queue.enqueue('b', PRIORITY_HIGH, 'key', 2);
      queue.enqueue('c', PRIORITY_LOW, 'tap', 3);
      expect(queue.countOfPriority(PRIORITY_HIGH)).assertEqual(2);
      expect(queue.countOfPriority(PRIORITY_LOW)).assertEqual(1);
      expect(queue.remove('b')).assertTrue();
      expect(queue.remove('b')).assertFalse();
      expect(queue.size()).assertEqual(2);
      queue.clear();
      expect(queue.size()).assertEqual(0);
    });

    it('queue_should_drain_in_priority_order', 0, () => {
      const queue = new PriorityDispatchQueue(MAX_QUEUE);
      queue.enqueue('low', PRIORITY_LOW, 'tap', 1);
      queue.enqueue('critical', PRIORITY_CRITICAL, 'error', 2);
      queue.enqueue('normal', PRIORITY_NORMAL, 'touch', 3);
      const drained = queue.drain();
      expect(drained.length).assertEqual(3);
      expect(drained[0].priority).assertEqual(PRIORITY_CRITICAL);
      expect(drained[1].priority).assertEqual(PRIORITY_NORMAL);
      expect(drained[2].priority).assertEqual(PRIORITY_LOW);
      expect(queue.size()).assertEqual(0);
    });

    it('stats_should_aggregate_dispatches', 0, () => {
      const stats = new DispatchStats();
      stats.record({ id: 'a', priority: PRIORITY_HIGH, event: 'tap', enqueuedAt: 1 });
      stats.record({ id: 'b', priority: PRIORITY_LOW, event: 'tap', enqueuedAt: 2 });
      stats.record({ id: 'c', priority: PRIORITY_NORMAL, event: 'key', enqueuedAt: 3 });
      stats.drop();
      expect(stats.getDispatched()).assertEqual(3);
      expect(stats.getDropped()).assertEqual(1);
      expect(stats.countOf('tap')).assertEqual(2);
      expect(stats.countOf('key')).assertEqual(1);
      expect(stats.eventTypes()).assertEqual(2);
      expect(stats.successRate()).assertEqual(75);
      stats.reset();
      expect(stats.getDispatched()).assertEqual(0);
    });

    it('dispatch_flow_should_process_events', 0, () => {
      const queue = new PriorityDispatchQueue(MAX_QUEUE);
      const stats = new DispatchStats();
      const events: string[] = ['touch', 'key', 'error'];
      const priorities: number[] = [PRIORITY_LOW, PRIORITY_NORMAL, PRIORITY_CRITICAL];
      for (let i = 0; i < events.length; i++) {
        queue.enqueue(`task-${i}`, priorities[i], events[i], i);
      }
      let task = queue.dequeue();
      while (task !== undefined) {
        stats.record(task);
        task = queue.dequeue();
      }
      expect(stats.getDispatched()).assertEqual(3);
      expect(stats.countOf('error')).assertEqual(1);
      expect(stats.countOf('touch')).assertEqual(1);
      expect(stats.successRate()).assertEqual(100);
      expect(queue.size()).assertEqual(0);
    });

    it('dispatch_constants_should_be_stable', 0, () => {
      expect(PRIORITY_LOW).assertEqual(1);
      expect(PRIORITY_NORMAL).assertEqual(5);
      expect(PRIORITY_HIGH).assertEqual(9);
      expect(PRIORITY_CRITICAL).assertEqual(10);
      expect(MIN_PRIORITY).assertEqual(1);
      expect(MAX_PRIORITY).assertEqual(10);
      expect(MAX_QUEUE).assertEqual(32);
    });
  });
}

