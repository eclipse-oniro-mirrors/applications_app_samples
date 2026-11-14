/*
 * Copyright (c) 2026 Sample Device Co., Ltd.
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
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, runSerialized, startBrowserApp, serializedDelay, MAX_TAB_COUNT,
  TAB_LIMIT_MESSAGE, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockLoadingStatus, MockClock, MockWebController } from '../Shared/BrowserMock';

const TAG: string = 'BrowserConcurrencyControlTest';

/* Tolerances are expressed in operations, never in wall clock seconds. */
const TOLERANCE_QUEUE_DRIFT: number = 0;
const TOLERANCE_INDEX_DELTA: number = 0;
const CONCURRENT_WORKERS: number = 6;
const STRESS_OPERATIONS: number = 48;
const LONG_QUEUE_LENGTH: number = 24;

/** One unit of work submitted to the serialized operation queue. */
interface QueueTask {
  id: number;
  name: string;
  startedAt: number;
  finishedAt: number;
  overlapped: boolean;
}

/**
 * Mirror of BrowserTestKit.runSerialized.
 *
 * UiTest refuses two overlapping operations, therefore every helper chains its
 * work on a single promise. The double below makes the guarantee observable:
 * it records the entry and exit tick of each task and flags any overlap, so a
 * regression of the chaining logic becomes a hard assertion instead of a
 * sporadic device timeout.
 */
class SerializedQueue {
  private tick: number = 0;
  private active: number = 0;
  private maxActive: number = 0;
  private tasks: QueueTask[] = [];
  private rejected: number = 0;
  private closed: boolean = false;

  size(): number {
    return this.tasks.length;
  }

  completedCount(): number {
    let counter: number = 0;
    for (let index = 0; index < this.tasks.length; index++) {
      if (this.tasks[index].finishedAt >= 0) {
        counter += 1;
      }
    }
    return counter;
  }

  rejectedCount(): number {
    return this.rejected;
  }

  peakConcurrency(): number {
    return this.maxActive;
  }

  lastTask(): QueueTask | null {
    if (this.tasks.length === 0) {
      return null;
    }
    return this.tasks[this.tasks.length - 1];
  }

  names(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.tasks.length; index++) {
      result.push(this.tasks[index].name);
    }
    return result;
  }

  /** Runs one task synchronously on the simulated single lane queue. */
  submit(name: string, cost: number = 1): QueueTask {
    if (this.closed) {
      this.rejected += 1;
      throw new Error('queue is closed');
    }
    const task: QueueTask = {
      id: this.tasks.length,
      name: name,
      startedAt: this.tick,
      finishedAt: -1,
      overlapped: this.active > 0
    };
    this.active += 1;
    if (this.active > this.maxActive) {
      this.maxActive = this.active;
    }
    this.tasks.push(task);
    this.tick += cost <= 0 ? 1 : cost;
    task.finishedAt = this.tick;
    this.active -= 1;
    return task;
  }

  /** True when no two tasks occupy the queue at the same time. */
  isFullySerialized(): boolean {
    for (let index = 0; index < this.tasks.length; index++) {
      if (this.tasks[index].overlapped) {
        return false;
      }
    }
    return this.maxActive <= 1;
  }

  /** Tick distance between two consecutive tasks, used for drift checks. */
  driftBetween(firstIndex: number, secondIndex: number): number {
    if (firstIndex < 0 || secondIndex < 0 || firstIndex >= this.tasks.length ||
      secondIndex >= this.tasks.length) {
      return 0;
    }
    return this.tasks[secondIndex].startedAt - this.tasks[firstIndex].finishedAt;
  }

  close(): void {
    this.closed = true;
  }

  isClosed(): boolean {
    return this.closed;
  }

  reset(): void {
    this.tick = 0;
    this.active = 0;
    this.maxActive = 0;
    this.tasks = [];
    this.rejected = 0;
    this.closed = false;
  }
}
/**
 * Applies tab additions and deletions one at a time.
 *
 * The title bar can fire "add tab" and "close tab" in the same frame, for
 * example when the user double taps. Applying both mutations in place would
 * lose the second one because each closure captured the old tab array, so the
 * worker queues the requests and replays them against the live model.
 */
class TabMutationWorker {
  browser: MockBrowser;
  private pendingAdds: number = 0;
  private pendingDeletes: number[] = [];
  appliedAdds: number = 0;
  appliedDeletes: number = 0;
  capacityRejections: number = 0;
  invalidDeletes: number = 0;

  constructor(browser: MockBrowser) {
    this.browser = browser;
  }

  requestAdd(count: number = 1): void {
    this.pendingAdds += count <= 0 ? 1 : count;
  }

  requestDelete(index: number): void {
    this.pendingDeletes.push(index);
  }

  pendingCount(): number {
    return this.pendingAdds + this.pendingDeletes.length;
  }

  /** Replays the queued requests; every request is observed exactly once. */
  flush(): number {
    let applied: number = 0;
    while (this.pendingAdds > 0) {
      if (this.browser.addTab()) {
        this.appliedAdds += 1;
        applied += 1;
      } else {
        this.capacityRejections += 1;
        applied += 1;
      }
      this.pendingAdds -= 1;
    }
    while (this.pendingDeletes.length > 0) {
      const index: number = this.pendingDeletes.shift() as number;
      if (this.browser.deleteTab(index)) {
        this.appliedDeletes += 1;
      } else {
        this.invalidDeletes += 1;
      }
      applied += 1;
    }
    return applied;
  }

  /** Number of mutations that never reached the model. */
  lostMutations(): number {
    return this.pendingAdds + this.pendingDeletes.length;
  }

  reset(): void {
    this.pendingAdds = 0;
    this.pendingDeletes = [];
    this.appliedAdds = 0;
    this.appliedDeletes = 0;
    this.capacityRejections = 0;
    this.invalidDeletes = 0;
  }
}

/**
 * Resolves a navigation request racing with a back gesture.
 *
 * In the sample the back gesture is handled while a page is still loading,
 * because Index.onBackPress consumes the event when loadingStatus is LOADING.
 * The coordinator models the three observable outcomes so the suite can assert
 * that no request is silently dropped: load wins, back wins, or both are applied
 * in submission order.
 */
class LoadBackCoordinator {
  browser: MockBrowser;
  pendingLoad: string = '';
  backRequested: boolean = false;
  loadCount: number = 0;
  backApplied: number = 0;
  backDropped: number = 0;

  constructor(browser: MockBrowser) {
    this.browser = browser;
  }

  requestLoad(url: string): void {
    this.pendingLoad = url;
    this.loadCount += 1;
  }

  requestBack(): void {
    this.backRequested = true;
  }

  hasPending(): boolean {
    return this.pendingLoad.length > 0 || this.backRequested;
  }

  /** Applies the pending requests in submission order exactly once. */
  flush(): boolean {
    let consumed: boolean = false;
    if (this.pendingLoad.length > 0) {
      this.browser.loadUrl(this.pendingLoad);
      this.pendingLoad = '';
      consumed = true;
    }
    if (this.backRequested) {
      if (this.browser.onBackPress()) {
        this.backApplied += 1;
      } else {
        this.backDropped += 1;
      }
      this.backRequested = false;
      consumed = true;
    }
    return consumed;
  }

  reset(): void {
    this.pendingLoad = '';
    this.backRequested = false;
    this.loadCount = 0;
    this.backApplied = 0;
    this.backDropped = 0;
  }
}
export default function browserConcurrencyControlTest() {
  describe('browserConcurrencyControlTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'concurrency control suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Concurrency_Queue_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_Queue_001');
      TestLogger.step(TAG, 'submit three tasks and check the execution order');
      const queue: SerializedQueue = new SerializedQueue();
      queue.submit('open url', 4);
      queue.submit('switch tab', 2);
      queue.submit('close tab', 3);
      const order: string[] = queue.names();
      TestLogger.info(TAG, `queue order ${order.join(' > ')}`);
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual('open url');
      expect(order[1]).assertEqual('switch tab');
      expect(order[2]).assertEqual('close tab');
      expect(queue.completedCount()).assertEqual(3);
      expect(queue.isFullySerialized()).assertTrue();
      TestLogger.pass(TAG, 'Concurrency_Queue_001');
    });

    it('Concurrency_Queue_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_Queue_002');
      TestLogger.step(TAG, 'verify that only one UiTest operation is in flight');
      const queue: SerializedQueue = new SerializedQueue();
      for (let index = 0; index < CONCURRENT_WORKERS; index++) {
        queue.submit(`worker ${index}`, 1);
      }
      TestLogger.info(TAG, `peak concurrency ${queue.peakConcurrency()}`);
      expect(queue.peakConcurrency()).assertEqual(1);
      expect(queue.isFullySerialized()).assertTrue();
      expect(queue.rejectedCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Concurrency_Queue_002');
    });

    it('Concurrency_Queue_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_Queue_003');
      TestLogger.step(TAG, 'drain a queue longer than the tab count');
      const queue: SerializedQueue = new SerializedQueue();
      for (let index = 0; index < LONG_QUEUE_LENGTH; index++) {
        queue.submit(`tab operation ${index}`, 1);
      }
      TestLogger.info(TAG, `completed ${queue.completedCount()} of ${queue.size()}`);
      expect(queue.size()).assertEqual(LONG_QUEUE_LENGTH);
      expect(queue.completedCount()).assertEqual(LONG_QUEUE_LENGTH);
      expect(queue.lastTask() !== null).assertTrue();
      expect(queue.isFullySerialized()).assertTrue();
      TestLogger.pass(TAG, 'Concurrency_Queue_003');
    });

    it('Concurrency_Queue_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_Queue_004');
      TestLogger.step(TAG, 'reject submissions after the queue was closed');
      const queue: SerializedQueue = new SerializedQueue();
      queue.submit('last accepted', 2);
      queue.close();
      let message: string = '';
      try {
        queue.submit('late operation', 1);
      } catch (error) {
        const wrapped: Error = error instanceof Error ? error : new Error(String(error));
        message = wrapped.message;
      }
      TestLogger.info(TAG, `rejection message ${message}`);
      expect(queue.isClosed()).assertTrue();
      expect(message).assertEqual('queue is closed');
      expect(queue.rejectedCount()).assertEqual(1);
      expect(queue.size()).assertEqual(1);
      TestLogger.pass(TAG, 'Concurrency_Queue_004');
    });

    it('Concurrency_Queue_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_Queue_005');
      TestLogger.step(TAG, 'reset the queue between two test cases');
      const queue: SerializedQueue = new SerializedQueue();
      queue.submit('open', 3);
      queue.submit('close', 3);
      queue.reset();
      TestLogger.info(TAG, `after reset size=${queue.size()} peak=${queue.peakConcurrency()}`);
      expect(queue.size()).assertEqual(0);
      expect(queue.completedCount()).assertEqual(0);
      expect(queue.peakConcurrency()).assertEqual(0);
      expect(queue.lastTask()).assertNull();
      expect(queue.isFullySerialized()).assertTrue();
      TestLogger.pass(TAG, 'Concurrency_Queue_005');
    });

    it('Concurrency_Queue_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_Queue_006');
      TestLogger.step(TAG, 'check that consecutive tasks leave no idle drift');
      const queue: SerializedQueue = new SerializedQueue();
      queue.submit('load', 5);
      queue.submit('progress', 2);
      queue.submit('complete', 4);
      const drift: number = queue.driftBetween(0, 1);
      TestLogger.info(TAG, `drift between task 0 and 1 is ${drift} tick`);
      expect(drift).assertEqual(TOLERANCE_QUEUE_DRIFT);
      expect(queue.driftBetween(1, 2)).assertEqual(TOLERANCE_QUEUE_DRIFT);
      const last: QueueTask | null = queue.lastTask();
      expect(last === null).assertFalse();
      if (last !== null) {
        expect(last.finishedAt).assertEqual(11);
      }
      TestLogger.pass(TAG, 'Concurrency_Queue_006');
    });
    /* ---------------------------------------------------------------- */
    /* Tab mutations racing with each other.                             */
    /* ---------------------------------------------------------------- */

    it('Concurrency_TabAdd_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_TabAdd_007');
      TestLogger.step(TAG, 'queue three add tab requests and replay them');
      const browser: MockBrowser = new MockBrowser(1);
      const worker: TabMutationWorker = new TabMutationWorker(browser);
      worker.requestAdd(3);
      expect(worker.pendingCount()).assertEqual(3);
      const applied: number = worker.flush();
      TestLogger.info(TAG, `applied ${applied} add requests, tabs=${browser.tabs.length}`);
      expect(applied).assertEqual(3);
      expect(worker.appliedAdds).assertEqual(3);
      expect(worker.lostMutations()).assertEqual(0);
      expect(browser.tabs.length).assertEqual(4);
      expect(browser.getTabArrayIndex()).assertEqual(3);
      expect(worker.capacityRejections).assertEqual(0);
      TestLogger.pass(TAG, 'Concurrency_TabAdd_007');
    });

    it('Concurrency_TabAdd_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_TabAdd_008');
      TestLogger.step(TAG, 'queue add requests on a full tab strip');
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      const worker: TabMutationWorker = new TabMutationWorker(browser);
      worker.requestAdd(3);
      const applied: number = worker.flush();
      TestLogger.info(TAG, `applied=${applied} rejections=${worker.capacityRejections} tabs=${browser.tabs.length}`);
      expect(applied).assertEqual(3);
      expect(worker.appliedAdds).assertEqual(1);
      expect(worker.capacityRejections).assertEqual(2);
      expect(browser.toasts.length).assertEqual(2);
      expect(browser.toasts[0]).assertEqual(TAB_LIMIT_MESSAGE);
      expect(worker.lostMutations()).assertEqual(0);
      TestLogger.pass(TAG, 'Concurrency_TabAdd_008');
    });

    it('Concurrency_TabDelete_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_TabDelete_009');
      TestLogger.step(TAG, 'queue two deletes while the active tab is in the middle');
      const browser: MockBrowser = new MockBrowser(4);
      browser.selectTab(2);
      const worker: TabMutationWorker = new TabMutationWorker(browser);
      worker.requestDelete(1);
      worker.requestDelete(2);
      const applied: number = worker.flush();
      const index: number = browser.getTabArrayIndex();
      TestLogger.info(TAG, `applied=${applied} tabs=${browser.tabs.length} index=${index}`);
      expect(applied).assertEqual(2);
      expect(worker.appliedDeletes).assertEqual(2);
      expect(worker.invalidDeletes).assertEqual(0);
      expect(browser.tabs.length).assertEqual(2);
      expect(index >= 0 && index < browser.tabs.length).assertTrue();
      expect(browser.getCurrentTab() !== null).assertTrue();
      expect(Math.abs(index - 1)).assertLess(TOLERANCE_INDEX_DELTA + 1);
      TestLogger.pass(TAG, 'Concurrency_TabDelete_009');
    });

    it('Concurrency_TabDelete_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_TabDelete_010');
      TestLogger.step(TAG, 'refuse to close the last remaining tab');
      const browser: MockBrowser = new MockBrowser(1);
      const worker: TabMutationWorker = new TabMutationWorker(browser);
      worker.requestDelete(0);
      worker.requestDelete(3);
      const applied: number = worker.flush();
      TestLogger.info(TAG, `applied=${applied} invalid=${worker.invalidDeletes}`);
      expect(applied).assertEqual(2);
      expect(worker.appliedDeletes).assertEqual(0);
      expect(worker.invalidDeletes).assertEqual(2);
      expect(browser.tabs.length).assertEqual(1);
      expect(browser.getTabArrayIndex()).assertEqual(0);
      expect(worker.lostMutations()).assertEqual(0);
      TestLogger.pass(TAG, 'Concurrency_TabDelete_010');
    });

    /* ---------------------------------------------------------------- */
    /* loadUrl racing with the back gesture.                             */
    /* ---------------------------------------------------------------- */

    it('Concurrency_LoadBack_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_LoadBack_011');
      TestLogger.step(TAG, 'apply a pending load before the queued back gesture');
      const browser: MockBrowser = new MockBrowser(1);
      browser.loadUrl('https://www.example.com/first');
      const coordinator: LoadBackCoordinator = new LoadBackCoordinator(browser);
      coordinator.requestLoad('https://www.example.com/second');
      coordinator.requestBack();
      expect(coordinator.hasPending()).assertTrue();
      const consumed: boolean = coordinator.flush();
      const controller: MockWebController = browser.tabs[0].controller;
      TestLogger.info(TAG, `consumed=${consumed} url=${controller.currentUrl} backApplied=${coordinator.backApplied}`);
      expect(consumed).assertTrue();
      expect(coordinator.hasPending()).assertFalse();
      expect(coordinator.backApplied).assertEqual(1);
      expect(coordinator.backDropped).assertEqual(0);
      expect(controller.currentUrl).assertEqual('https://www.example.com/first');
      expect(controller.history.length).assertEqual(2);
      TestLogger.pass(TAG, 'Concurrency_LoadBack_011');
    });

    it('Concurrency_LoadBack_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_LoadBack_012');
      TestLogger.step(TAG, 'consume the back gesture while a page is loading');
      const browser: MockBrowser = new MockBrowser(1);
      browser.loadingStatus = MockLoadingStatus.LOADING;
      const coordinator: LoadBackCoordinator = new LoadBackCoordinator(browser);
      coordinator.requestBack();
      const consumed: boolean = coordinator.flush();
      TestLogger.info(TAG, `consumed=${consumed} applied=${coordinator.backApplied}`);
      expect(consumed).assertTrue();
      expect(coordinator.backApplied).assertEqual(1);
      expect(coordinator.backDropped).assertEqual(0);
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      expect(browser.tabs[0].controller.history.length).assertEqual(0);
      TestLogger.pass(TAG, 'Concurrency_LoadBack_012');
    });

    it('Concurrency_Stress_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_Stress_013');
      TestLogger.step(TAG, 'interleave forty eight tab and navigation requests');
      const browser: MockBrowser = new MockBrowser(3);
      const worker: TabMutationWorker = new TabMutationWorker(browser);
      const coordinator: LoadBackCoordinator = new LoadBackCoordinator(browser);
      for (let round = 0; round < STRESS_OPERATIONS; round++) {
        const mode: number = round % 4;
        if (mode === 0) {
          worker.requestAdd(1);
        } else if (mode === 1) {
          worker.requestDelete(round % browser.tabs.length);
        } else if (mode === 2) {
          coordinator.requestLoad(`https://www.example.com/page/${round}`);
        } else {
          coordinator.requestBack();
        }
        worker.flush();
        coordinator.flush();
      }
      const index: number = browser.getTabArrayIndex();
      TestLogger.info(TAG, `tabs=${browser.tabs.length} index=${index} history=${browser.tabs[0].controller.history.length}`);
      expect(browser.tabs.length).assertLarger(0);
      expect(index >= 0 && index < browser.tabs.length).assertTrue();
      expect(worker.lostMutations()).assertEqual(0);
      expect(coordinator.hasPending()).assertFalse();
      expect(browser.getCurrentTab() !== null).assertTrue();
      TestLogger.pass(TAG, 'Concurrency_Stress_013');
    });

    it('Concurrency_UI_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Concurrency_UI_014');
      TestLogger.step(TAG, 'run three UI actions through the real serialized helper');
      const order: string[] = [];
      await runSerialized<void>(async () => {
        await serializedDelay(driver, 10);
        order.push('first');
      });
      await runSerialized<void>(async () => {
        await serializedDelay(driver, 10);
        order.push('second');
      });
      await runSerialized<void>(async () => {
        await serializedDelay(driver, 10);
        order.push('third');
      });
      const clock: MockClock = new MockClock(1000);
      clock.advance(DELAY_TAB_OPERATION * 3);
      TestLogger.info(TAG, `order=${order.join(',')} modelled budget=${clock.now() - 1000}`);
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual('first');
      expect(order[1]).assertEqual('second');
      expect(order[2]).assertEqual('third');
      expect(clock.now() - 1000).assertEqual(DELAY_TAB_OPERATION * 3);
      TestLogger.pass(TAG, 'Concurrency_UI_014');
    });
  });
}

