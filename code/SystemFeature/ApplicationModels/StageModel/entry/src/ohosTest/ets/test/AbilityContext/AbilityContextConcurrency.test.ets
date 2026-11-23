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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { ACCOUNT_ID, CONNECTION_NUMBER, RESULT_CODE } from '../Shared/SharedDriver';

enum TaskState {
  QUEUED = 0,
  RUNNING = 1,
  DONE = 2,
  CANCELLED = 3
}

class ConcurrentTask {
  readonly id: number;
  readonly name: string;
  readonly weight: number;
  state: TaskState;

  constructor(id: number, name: string, weight: number) {
    this.id = id;
    this.name = name;
    this.weight = weight;
    this.state = TaskState.QUEUED;
  }

  isQueued(): boolean {
    return this.state === TaskState.QUEUED;
  }

  isDone(): boolean {
    return this.state === TaskState.DONE;
  }

  markRunning(): void {
    this.state = TaskState.RUNNING;
  }

  markDone(): void {
    this.state = TaskState.DONE;
  }

  cancel(): boolean {
    if (this.state === TaskState.QUEUED) {
      this.state = TaskState.CANCELLED;
      return true;
    }
    return false;
  }
}

class SerialQueue {
  private tasks: ConcurrentTask[] = [];
  private completedTasks: ConcurrentTask[] = [];
  private capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  capacityLimit(): number {
    return this.capacity;
  }

  size(): number {
    return this.tasks.length;
  }

  isFull(): boolean {
    return this.tasks.length >= this.capacity;
  }

  has(id: number): boolean {
    for (const task of this.tasks) {
      if (task.id === id) {
        return true;
      }
    }
    return false;
  }

  enqueue(task: ConcurrentTask): boolean {
    if (this.isFull() || this.has(task.id)) {
      return false;
    }
    this.tasks.push(task);
    return true;
  }

  pendingCount(): number {
    let count = 0;
    for (const task of this.tasks) {
      if (task.isQueued()) {
        count += 1;
      }
    }
    return count;
  }

  runNext(): number {
    for (let i = 0; i < this.tasks.length; i++) {
      if (this.tasks[i].isQueued()) {
        const task = this.tasks[i];
        task.markRunning();
        task.markDone();
        this.completedTasks.push(task);
        this.tasks.splice(i, 1);
        return task.id;
      }
    }
    return -1;
  }

  drain(): number {
    let count = 0;
    while (this.runNext() !== -1) {
      count += 1;
    }
    return count;
  }

  completedCount(): number {
    return this.completedTasks.length;
  }

  completedIds(): number[] {
    const ids: number[] = [];
    for (const task of this.completedTasks) {
      ids.push(task.id);
    }
    return ids;
  }

  totalWeight(): number {
    let total = 0;
    for (const task of this.tasks) {
      total += task.weight;
    }
    return total;
  }

  cancel(id: number): boolean {
    for (const task of this.tasks) {
      if (task.id === id) {
        return task.cancel();
      }
    }
    return false;
  }

  clear(): void {
    this.tasks = [];
    this.completedTasks = [];
  }
}

class ConcurrencyGate {
  private maxConcurrent: number;
  private active: number = 0;
  private admitted: number = 0;
  private rejected: number = 0;

  constructor(maxConcurrent: number) {
    this.maxConcurrent = maxConcurrent;
  }

  max(): number {
    return this.maxConcurrent;
  }

  tryEnter(): boolean {
    if (this.active < this.maxConcurrent) {
      this.active += 1;
      this.admitted += 1;
      return true;
    }
    this.rejected += 1;
    return false;
  }

  leave(): boolean {
    if (this.active > 0) {
      this.active -= 1;
      return true;
    }
    return false;
  }

  activeCount(): number {
    return this.active;
  }

  admittedCount(): number {
    return this.admitted;
  }

  rejectedCount(): number {
    return this.rejected;
  }

  isSaturated(): boolean {
    return this.active >= this.maxConcurrent;
  }

  reset(): void {
    this.active = 0;
    this.admitted = 0;
    this.rejected = 0;
  }
}

class RoundRobinScheduler {
  private names: string[] = [];
  private index: number = 0;

  add(name: string): void {
    if (this.names.indexOf(name) < 0) {
      this.names.push(name);
    }
  }

  size(): number {
    return this.names.length;
  }

  next(): string {
    if (this.names.length === 0) {
      return '';
    }
    const name = this.names[this.index];
    this.index = (this.index + 1) % this.names.length;
    return name;
  }

  currentIndex(): number {
    return this.index;
  }

  reset(): void {
    this.index = 0;
  }
}

class WorkerBudget {
  private budget: number;
  private released: number = 0;

  constructor(budget: number) {
    this.budget = budget;
  }

  remaining(): number {
    return this.budget;
  }

  allocate(request: number): number {
    if (request <= 0) {
      return 0;
    }
    const granted = request < this.budget ? request : this.budget;
    this.budget -= granted;
    return granted;
  }

  release(count: number): void {
    if (count <= 0) {
      return;
    }
    this.budget += count;
    this.released += count;
  }

  releasedCount(): number {
    return this.released;
  }
}

function buildTaskBatch(): ConcurrentTask[] {
  return [
    new ConcurrentTask(1, 'startAbility', 1),
    new ConcurrentTask(2, 'startAbilityForResult', 2),
    new ConcurrentTask(3, 'connectServiceExtensionAbility', 3),
    new ConcurrentTask(4, 'disconnectServiceExtensionAbility', 3),
    new ConcurrentTask(5, 'stopServiceExtensionAbility', 2),
    new ConcurrentTask(6, 'terminateSelf', 1)
  ];
}

function buildLoadedQueue(): SerialQueue {
  const queue = new SerialQueue(8);
  for (const task of buildTaskBatch()) {
    queue.enqueue(task);
  }
  return queue;
}

export default function abilityContextConcurrencyTest(): void {
  describe('AbilityContextConcurrencySuite', () => {
    let queue: SerialQueue = buildLoadedQueue();

    beforeAll(() => {
      queue = buildLoadedQueue();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'concurrency suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'concurrency suite end');
    });

    it('AbilityContextConcurrency_001', 0, async (done: Function) => {
      expect(queue.capacityLimit()).assertEqual(8);
      expect(queue.size()).assertEqual(6);
      expect(queue.isFull()).assertFalse();
      expect(queue.pendingCount()).assertEqual(6);
      done();
    });

    it('AbilityContextConcurrency_002', 0, async (done: Function) => {
      expect(queue.totalWeight()).assertEqual(12);
      expect(queue.completedCount()).assertEqual(0);
      expect(queue.has(1)).assertTrue();
      expect(queue.has(99)).assertFalse();
      done();
    });

    it('AbilityContextConcurrency_003', 0, async (done: Function) => {
      const local = new SerialQueue(3);
      expect(local.enqueue(new ConcurrentTask(1, 'a', 1))).assertTrue();
      expect(local.enqueue(new ConcurrentTask(2, 'b', 1))).assertTrue();
      expect(local.enqueue(new ConcurrentTask(3, 'c', 1))).assertTrue();
      expect(local.isFull()).assertTrue();
      expect(local.enqueue(new ConcurrentTask(4, 'd', 1))).assertFalse();
      expect(local.size()).assertEqual(3);
      done();
    });

    it('AbilityContextConcurrency_004', 0, async (done: Function) => {
      const local = new SerialQueue(5);
      expect(local.enqueue(new ConcurrentTask(1, 'a', 1))).assertTrue();
      expect(local.enqueue(new ConcurrentTask(1, 'dup', 1))).assertFalse();
      expect(local.size()).assertEqual(1);
      expect(local.has(1)).assertTrue();
      done();
    });

    it('AbilityContextConcurrency_005', 0, async (done: Function) => {
      const local = buildLoadedQueue();
      const firstId = local.runNext();
      expect(firstId).assertEqual(1);
      expect(local.size()).assertEqual(5);
      expect(local.completedCount()).assertEqual(1);
      expect(local.pendingCount()).assertEqual(5);
      done();
    });

    it('AbilityContextConcurrency_006', 0, async (done: Function) => {
      const local = buildLoadedQueue();
      const processed = local.drain();
      expect(processed).assertEqual(6);
      expect(local.size()).assertEqual(0);
      expect(local.completedCount()).assertEqual(6);
      expect(local.runNext()).assertEqual(-1);
      done();
    });

    it('AbilityContextConcurrency_007', 0, async (done: Function) => {
      const local = buildLoadedQueue();
      local.drain();
      const ids = local.completedIds();
      expect(ids.length).assertEqual(6);
      expect(ids[0]).assertEqual(1);
      expect(ids[5]).assertEqual(6);
      done();
    });

    it('AbilityContextConcurrency_008', 0, async (done: Function) => {
      const local = buildLoadedQueue();
      expect(local.cancel(2)).assertTrue();
      expect(local.pendingCount()).assertEqual(5);
      const processed = local.drain();
      expect(processed).assertEqual(5);
      expect(local.completedIds().indexOf(2)).assertEqual(-1);
      done();
    });

    it('AbilityContextConcurrency_009', 0, async (done: Function) => {
      const local = buildLoadedQueue();
      local.drain();
      expect(local.cancel(1)).assertFalse();
      expect(local.cancel(77)).assertFalse();
      done();
    });

    it('AbilityContextConcurrency_010', 0, async (done: Function) => {
      const local = buildLoadedQueue();
      local.clear();
      expect(local.size()).assertEqual(0);
      expect(local.completedCount()).assertEqual(0);
      expect(local.pendingCount()).assertEqual(0);
      done();
    });

    it('AbilityContextConcurrency_011', 0, async (done: Function) => {
      const gate = new ConcurrencyGate(2);
      expect(gate.max()).assertEqual(2);
      expect(gate.tryEnter()).assertTrue();
      expect(gate.tryEnter()).assertTrue();
      expect(gate.tryEnter()).assertFalse();
      expect(gate.isSaturated()).assertTrue();
      done();
    });

    it('AbilityContextConcurrency_012', 0, async (done: Function) => {
      const gate = new ConcurrencyGate(1);
      expect(gate.tryEnter()).assertTrue();
      expect(gate.activeCount()).assertEqual(1);
      expect(gate.leave()).assertTrue();
      expect(gate.activeCount()).assertEqual(0);
      expect(gate.leave()).assertFalse();
      done();
    });

    it('AbilityContextConcurrency_013', 0, async (done: Function) => {
      const gate = new ConcurrencyGate(2);
      gate.tryEnter();
      gate.tryEnter();
      gate.tryEnter();
      gate.tryEnter();
      expect(gate.admittedCount()).assertEqual(2);
      expect(gate.rejectedCount()).assertEqual(2);
      expect(gate.activeCount()).assertEqual(2);
      done();
    });

    it('AbilityContextConcurrency_014', 0, async (done: Function) => {
      const gate = new ConcurrencyGate(3);
      gate.tryEnter();
      gate.tryEnter();
      gate.reset();
      expect(gate.activeCount()).assertEqual(0);
      expect(gate.admittedCount()).assertEqual(0);
      expect(gate.rejectedCount()).assertEqual(0);
      expect(gate.isSaturated()).assertFalse();
      done();
    });

    it('AbilityContextConcurrency_015', 0, async (done: Function) => {
      const scheduler = new RoundRobinScheduler();
      scheduler.add('startAbility');
      scheduler.add('connectServiceExtensionAbility');
      scheduler.add('stopServiceExtensionAbility');
      expect(scheduler.size()).assertEqual(3);
      expect(scheduler.next()).assertEqual('startAbility');
      expect(scheduler.next()).assertEqual('connectServiceExtensionAbility');
      expect(scheduler.next()).assertEqual('stopServiceExtensionAbility');
      done();
    });

    it('AbilityContextConcurrency_016', 0, async (done: Function) => {
      const scheduler = new RoundRobinScheduler();
      scheduler.add('a');
      scheduler.add('b');
      expect(scheduler.next()).assertEqual('a');
      expect(scheduler.next()).assertEqual('b');
      expect(scheduler.next()).assertEqual('a');
      expect(scheduler.currentIndex()).assertEqual(1);
      done();
    });

    it('AbilityContextConcurrency_017', 0, async (done: Function) => {
      const scheduler = new RoundRobinScheduler();
      scheduler.add('a');
      scheduler.add('a');
      expect(scheduler.size()).assertEqual(1);
      expect(scheduler.next()).assertEqual('a');
      scheduler.reset();
      expect(scheduler.currentIndex()).assertEqual(0);
      done();
    });

    it('AbilityContextConcurrency_018', 0, async (done: Function) => {
      const empty = new RoundRobinScheduler();
      expect(empty.size()).assertEqual(0);
      expect(empty.next()).assertEqual('');
      expect(empty.currentIndex()).assertEqual(0);
      done();
    });

    it('AbilityContextConcurrency_019', 0, async (done: Function) => {
      const budget = new WorkerBudget(10);
      expect(budget.remaining()).assertEqual(10);
      expect(budget.allocate(4)).assertEqual(4);
      expect(budget.remaining()).assertEqual(6);
      expect(budget.allocate(10)).assertEqual(6);
      expect(budget.remaining()).assertEqual(0);
      done();
    });

    it('AbilityContextConcurrency_020', 0, async (done: Function) => {
      const budget = new WorkerBudget(5);
      expect(budget.allocate(0)).assertEqual(0);
      expect(budget.allocate(-3)).assertEqual(0);
      expect(budget.remaining()).assertEqual(5);
      budget.release(2);
      expect(budget.remaining()).assertEqual(7);
      expect(budget.releasedCount()).assertEqual(2);
      done();
    });

    it('AbilityContextConcurrency_021', 0, async (done: Function) => {
      const task = new ConcurrentTask(1, 'startAbility', 2);
      expect(task.isQueued()).assertTrue();
      expect(task.isDone()).assertFalse();
      task.markRunning();
      expect(task.state).assertEqual(TaskState.RUNNING);
      task.markDone();
      expect(task.isDone()).assertTrue();
      done();
    });

    it('AbilityContextConcurrency_022', 0, async (done: Function) => {
      const task = new ConcurrentTask(2, 'connect', 3);
      expect(task.cancel()).assertTrue();
      expect(task.state).assertEqual(TaskState.CANCELLED);
      expect(task.cancel()).assertFalse();
      done();
    });

    it('AbilityContextConcurrency_023', 0, async (done: Function) => {
      expect(ACCOUNT_ID).assertEqual(100);
      expect(CONNECTION_NUMBER).assertEqual(0);
      expect(RESULT_CODE).assertEqual(100);
      expect(ACCOUNT_ID - CONNECTION_NUMBER).assertEqual(100);
      done();
    });

    it('AbilityContextConcurrency_024', 0, async (done: Function) => {
      const local = buildLoadedQueue();
      let rounds = 0;
      while (local.runNext() !== -1) {
        rounds += 1;
      }
      expect(rounds).assertEqual(6);
      expect(local.completedCount()).assertEqual(rounds);
      expect(local.pendingCount()).assertEqual(0);
      done();
    });
  });
}


