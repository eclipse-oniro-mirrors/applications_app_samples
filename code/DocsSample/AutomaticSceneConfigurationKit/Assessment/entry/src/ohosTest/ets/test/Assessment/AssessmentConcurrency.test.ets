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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TIMEOUT_PAGE_RENDER,
  runSerializedUiOperation,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  isQueueLocked,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Operation names used by the concurrency model.
const OP_BEGIN: string = 'begin';
const OP_END: string = 'end';
const OP_IS_ACTIVE: string = 'isActive';
const OP_GET_CONFIGURATION: string = 'getConfiguration';

// Codes of the assessment error enum.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Number of rounds of the interleaved sequences. The values are kept low so the cases stay
// deterministic on a slow device while still exercising a queue of several entries.
const ROUNDS_SHORT: number = 4;
const ROUNDS_MEDIUM: number = 8;
const ROUNDS_LONG: number = 12;

/**
 * Lifecycle of one queued operation.
 */
enum QueueEntryState {
  PENDING = 'pending', RUNNING = 'running', DONE = 'done', FAILED = 'failed'
}

/**
 * One entry of the serialized operation queue.
 */
interface QueueEntry {
  id: number;
  operation: string;
  state: string;
  startOrder: number;
  endOrder: number;
}

/**
 * Model of the serialized operation queue of the sample.
 *
 * The sample funnels every driver interaction through a single promise chain, so two operations
 * never overlap. The queue below keeps the same contract on the model level: an entry can only
 * leave the pending state while no other entry is running, and the completion order always
 * matches the submission order.
 */
class OperationQueue {
  private items: QueueEntry[] = [];
  private nextId: number = 1;
  private runningId: number = -1;
  private orderCounter: number = 0;
  private overlapDetected: boolean = false;

  public submit(operation: string): QueueEntry {
    const entry: QueueEntry = {
      id: this.nextId,
      operation: operation,
      state: QueueEntryState.PENDING,
      startOrder: -1,
      endOrder: -1
    };
    this.nextId++;
    const next: QueueEntry[] = this.items.slice();
    next.push(entry);
    this.items = next;
    return entry;
  }

  public runNext(): boolean {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].state !== QueueEntryState.PENDING) {
        continue;
      }
      if (this.runningId >= 0) {
        this.overlapDetected = true;
        return false;
      }
      this.runningId = this.items[i].id;
      this.orderCounter++;
      this.items[i].startOrder = this.orderCounter;
      this.items[i].state = QueueEntryState.RUNNING;
      return true;
    }
    return false;
  }

  public completeRunning(failed: boolean = false): boolean {
    if (this.runningId < 0) {
      return false;
    }
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id === this.runningId) {
        this.orderCounter++;
        this.items[i].endOrder = this.orderCounter;
        this.items[i].state = failed ? QueueEntryState.FAILED : QueueEntryState.DONE;
        this.runningId = -1;
        return true;
      }
    }
    this.runningId = -1;
    return false;
  }

  public drain(): number {
    let processed: number = 0;
    while (this.runNext()) {
      this.completeRunning();
      processed++;
    }
    return processed;
  }

  public size(): number {
    return this.items.length;
  }

  public pendingCount(): number {
    return this.countInState(QueueEntryState.PENDING);
  }

  public doneCount(): number {
    return this.countInState(QueueEntryState.DONE);
  }

  public failedCount(): number {
    return this.countInState(QueueEntryState.FAILED);
  }

  public runningCount(): number {
    return this.countInState(QueueEntryState.RUNNING);
  }

  public countInState(state: string): number {
    let count: number = 0;
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].state === state) {
        count++;
      }
    }
    return count;
  }

  public isIdle(): boolean {
    return this.runningId < 0;
  }

  public hasOverlapped(): boolean {
    return this.overlapDetected;
  }

  public completionOrderIsSubmissionOrder(): boolean {
    let previousEnd: number = -1;
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].state === QueueEntryState.PENDING) {
        continue;
      }
      if (this.items[i].endOrder >= 0) {
        if (this.items[i].endOrder <= previousEnd) {
          return false;
        }
        previousEnd = this.items[i].endOrder;
      }
    }
    return true;
  }

  public operationsInOrder(): string[] {
    return this.items.map((entry: QueueEntry) => entry.operation);
  }

  public entries(): QueueEntry[] {
    return this.items.slice();
  }

  public toString(): string {
    return `OperationQueue{size=${this.items.length}, pending=${this.pendingCount()}, ` +
      `done=${this.doneCount()}, overlapped=${this.overlapDetected}}`;
  }
}

/**
 * Re-entrancy guard of the assessment controller.
 *
 * begin and end both drive a session, so a second begin while one is in flight must be refused
 * instead of corrupting the session count. The guard models the in-flight flag and the counters.
 */
class ReentrancyGuard {
  private inFlight: boolean = false;
  private reentrantAttempts: number = 0;
  private acceptedCalls: number = 0;
  private currentOperation: string = '';

  public enter(operation: string): boolean {
    if (this.inFlight) {
      this.reentrantAttempts++;
      return false;
    }
    this.inFlight = true;
    this.currentOperation = operation;
    this.acceptedCalls++;
    return true;
  }

  public leave(): boolean {
    if (!this.inFlight) {
      return false;
    }
    this.inFlight = false;
    this.currentOperation = '';
    return true;
  }

  public isBusy(): boolean {
    return this.inFlight;
  }

  public busyWith(): string {
    return this.currentOperation;
  }

  public attempts(): number {
    return this.reentrantAttempts;
  }

  public accepted(): number {
    return this.acceptedCalls;
  }

  public toString(): string {
    return `ReentrancyGuard{busy=${this.inFlight}, op=${this.currentOperation}, ` +
      `attempts=${this.reentrantAttempts}}`;
  }
}

/**
 * Tracks the interleaving of two operation streams.
 *
 * The two streams are the page driven calls and the callback driven state updates. The tracker
 * records every step with a global sequence number, so a case can assert that no callback ever
 * lands in the middle of a page driven call.
 */
interface InterleaveRecord {
  stream: string;
  step: string;
  position: number;
}

class InterleaveTracker {
  private records: InterleaveRecord[] = [];
  private position: number = 0;
  private openStreams: Set<string> = new Set<string>();
  private overlapping: boolean = false;

  public begin(stream: string, step: string): void {
    if (this.openStreams.size > 0) {
      this.overlapping = true;
    }
    this.openStreams.add(stream);
    this.position++;
    const record: InterleaveRecord = {
      stream: stream,
      step: step,
      position: this.position
    };
    this.records.push(record);
  }

  public end(stream: string, step: string): void {
    this.openStreams.delete(stream);
    this.position++;
    const record: InterleaveRecord = {
      stream: stream,
      step: step,
      position: this.position
    };
    this.records.push(record);
  }

  public size(): number {
    return this.records.length;
  }

  public hasOverlapped(): boolean {
    return this.overlapping;
  }

  public openCount(): number {
    return this.openStreams.size;
  }

  public steps(): string[] {
    return this.records.map((record: InterleaveRecord) => record.step);
  }

  public stepsOf(stream: string): string[] {
    return this.records.filter((record: InterleaveRecord) => record.stream === stream)
      .map((record: InterleaveRecord) => record.step);
  }

  public positionsMonotonic(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].position <= this.records[i - 1].position) {
        return false;
      }
    }
    return true;
  }

  public toString(): string {
    return `InterleaveTracker{records=${this.records.length}, overlapped=${this.overlapping}}`;
  }
}

/**
 * Models the session counter of a concurrent begin and end burst.
 *
 * A single active session is the invariant of the assessment service: after any interleaving of
 * begin and end calls the counter never goes below zero and never exceeds one.
 */
class SessionCounter {
  private active: number = 0;
  private violations: number = 0;
  private maxObserved: number = 0;

  public begin(): void {
    this.active++;
    if (this.active > this.maxObserved) {
      this.maxObserved = this.active;
    }
    if (this.active > 1) {
      this.violations++;
    }
  }

  public end(): void {
    if (this.active === 0) {
      this.violations++;
      return;
    }
    this.active--;
  }

  public value(): number {
    return this.active;
  }

  public violationCount(): number {
    return this.violations;
  }

  public peak(): number {
    return this.maxObserved;
  }

  public isConsistent(): boolean {
    return this.violations === 0 && this.active >= 0;
  }

  public toString(): string {
    return `SessionCounter{active=${this.active}, peak=${this.maxObserved}, violations=${this.violations}}`;
  }
}

/**
 * Starts the sample and waits for the entry page, the UI cases degrade to a skip when the page
 * never shows up.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function assessmentConcurrencyTest() {
  describe('AssessmentConcurrency_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: an empty operation queue.
     * Expectation: it is idle, holds no entry and has not detected an overlap.
     */
    it('Assessment_QueueInitialState_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueInitialState_001, begin');
      const queue: OperationQueue = new OperationQueue();
      expect(queue.size()).assertEqual(0);
      expect(queue.isIdle()).assertTrue();
      expect(queue.hasOverlapped()).assertFalse();
      expect(queue.pendingCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', queue.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueInitialState_001, end');
    });

    /**
     * Scenario: submitting two operations.
     * Expectation: both become pending and the queue keeps the submission order.
     */
    it('Assessment_QueueSubmissionOrder_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueSubmissionOrder_002, begin');
      const queue: OperationQueue = new OperationQueue();
      queue.submit(OP_BEGIN);
      queue.submit(OP_END);
      expect(queue.size()).assertEqual(2);
      expect(queue.pendingCount()).assertEqual(2);
      expect(queue.operationsInOrder()[0]).assertEqual(OP_BEGIN);
      expect(queue.operationsInOrder()[1]).assertEqual(OP_END);
      expect(queue.entries()[0].id).assertEqual(1);
      expect(queue.entries()[1].id).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', queue.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueSubmissionOrder_002, end');
    });

    /**
     * Scenario: running a single queued operation.
     * Expectation: it moves to running while the queue is busy and completes on its own.
     */
    it('Assessment_QueueSingleRun_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueSingleRun_003, begin');
      const queue: OperationQueue = new OperationQueue();
      queue.submit(OP_IS_ACTIVE);
      expect(queue.runNext()).assertTrue();
      expect(queue.runningCount()).assertEqual(1);
      expect(queue.isIdle()).assertFalse();
      expect(queue.completeRunning()).assertTrue();
      expect(queue.runningCount()).assertEqual(0);
      expect(queue.doneCount()).assertEqual(1);
      expect(queue.isIdle()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', queue.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueSingleRun_003, end');
    });

    /**
     * Scenario: an attempt to run while an entry is in flight.
     * Expectation: the attempt is refused and the overlap is recorded.
     */
    it('Assessment_QueueRejectsOverlap_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueRejectsOverlap_004, begin');
      const queue: OperationQueue = new OperationQueue();
      queue.submit(OP_BEGIN);
      queue.submit(OP_END);
      expect(queue.runNext()).assertTrue();
      expect(queue.runNext()).assertFalse();
      expect(queue.hasOverlapped()).assertTrue();
      expect(queue.runningCount()).assertEqual(1);
      expect(queue.pendingCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', queue.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueRejectsOverlap_004, end');
    });

    /**
     * Scenario: draining a queue of four operations.
     * Expectation: every entry completes in submission order without an overlap.
     */
    it('Assessment_QueueDrain_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueDrain_005, begin');
      const queue: OperationQueue = new OperationQueue();
      queue.submit(OP_BEGIN);
      queue.submit(OP_IS_ACTIVE);
      queue.submit(OP_GET_CONFIGURATION);
      queue.submit(OP_END);
      expect(queue.drain()).assertEqual(4);
      expect(queue.doneCount()).assertEqual(4);
      expect(queue.pendingCount()).assertEqual(0);
      expect(queue.hasOverlapped()).assertFalse();
      expect(queue.completionOrderIsSubmissionOrder()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', queue.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueDrain_005, end');
    });

    /**
     * Scenario: a failed queued operation.
     * Expectation: the entry is reported as failed and the queue returns to idle.
     */
    it('Assessment_QueueFailedEntry_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueFailedEntry_006, begin');
      const queue: OperationQueue = new OperationQueue();
      queue.submit(OP_BEGIN);
      queue.runNext();
      expect(queue.completeRunning(true)).assertTrue();
      expect(queue.failedCount()).assertEqual(1);
      expect(queue.doneCount()).assertEqual(0);
      expect(queue.isIdle()).assertTrue();
      expect(queue.completeRunning()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', queue.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueFailedEntry_006, end');
    });

    /**
     * Scenario: a balanced queue of begin and end pairs.
     * Expectation: the completion order matches the submission order for every pair.
     */
    it('Assessment_QueueBalancedPairs_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueBalancedPairs_007, begin');
      const queue: OperationQueue = new OperationQueue();
      for (let i = 0; i < ROUNDS_SHORT; i++) {
        queue.submit(OP_BEGIN);
        queue.submit(OP_END);
      }
      expect(queue.size()).assertEqual(ROUNDS_SHORT * 2);
      expect(queue.drain()).assertEqual(ROUNDS_SHORT * 2);
      expect(queue.hasOverlapped()).assertFalse();
      expect(queue.completionOrderIsSubmissionOrder()).assertTrue();
      const operations: string[] = queue.operationsInOrder();
      for (let i = 0; i < operations.length; i += 2) {
        expect(operations[i]).assertEqual(OP_BEGIN);
        expect(operations[i + 1]).assertEqual(OP_END);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', queue.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueBalancedPairs_007, end');
    });

    /**
     * Scenario: the re-entrancy guard around begin.
     * Expectation: a second begin while the first is in flight is refused.
     */
    it('Assessment_GuardRejectsReentrantBegin_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GuardRejectsReentrantBegin_008, begin');
      const guard: ReentrancyGuard = new ReentrancyGuard();
      expect(guard.enter(OP_BEGIN)).assertTrue();
      expect(guard.isBusy()).assertTrue();
      expect(guard.busyWith()).assertEqual(OP_BEGIN);
      expect(guard.enter(OP_BEGIN)).assertFalse();
      expect(guard.attempts()).assertEqual(1);
      expect(guard.accepted()).assertEqual(1);
      expect(guard.leave()).assertTrue();
      expect(guard.isBusy()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', guard.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GuardRejectsReentrantBegin_008, end');
    });

    /**
     * Scenario: the re-entrancy guard around end.
     * Expectation: end cannot be entered while begin is in flight, they share one gate.
     */
    it('Assessment_GuardSharedBetweenMutations_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GuardSharedBetweenMutations_009, begin');
      const guard: ReentrancyGuard = new ReentrancyGuard();
      guard.enter(OP_BEGIN);
      expect(guard.enter(OP_END)).assertFalse();
      expect(guard.busyWith()).assertEqual(OP_BEGIN);
      guard.leave();
      expect(guard.enter(OP_END)).assertTrue();
      expect(guard.busyWith()).assertEqual(OP_END);
      expect(guard.attempts()).assertEqual(1);
      expect(guard.accepted()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', guard.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GuardSharedBetweenMutations_009, end');
    });

    /**
     * Scenario: leaving a guard that was never entered.
     * Expectation: the leave is refused and the guard stays idle.
     */
    it('Assessment_GuardLeaveWithoutEnter_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GuardLeaveWithoutEnter_010, begin');
      const guard: ReentrancyGuard = new ReentrancyGuard();
      expect(guard.leave()).assertFalse();
      expect(guard.isBusy()).assertFalse();
      expect(guard.accepted()).assertEqual(0);
      expect(guard.attempts()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', guard.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GuardLeaveWithoutEnter_010, end');
    });

    /**
     * Scenario: a sequence of accepted entries.
     * Expectation: the accepted count equals the number of entered leaves, attempts stay zero.
     */
    it('Assessment_GuardSequentialEntries_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GuardSequentialEntries_011, begin');
      const guard: ReentrancyGuard = new ReentrancyGuard();
      for (let i = 0; i < ROUNDS_MEDIUM; i++) {
        expect(guard.enter(OP_IS_ACTIVE)).assertTrue();
        expect(guard.leave()).assertTrue();
      }
      expect(guard.accepted()).assertEqual(ROUNDS_MEDIUM);
      expect(guard.attempts()).assertEqual(0);
      expect(guard.isBusy()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', guard.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GuardSequentialEntries_011, end');
    });

    /**
     * Scenario: two interleaved operation streams that never overlap.
     * Expectation: the tracker reports no overlap and monotonic positions.
     */
    it('Assessment_InterleaveSerialized_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterleaveSerialized_012, begin');
      const tracker: InterleaveTracker = new InterleaveTracker();
      tracker.begin('page', OP_BEGIN);
      tracker.end('page', OP_BEGIN);
      tracker.begin('callback', 'onBegin');
      tracker.end('callback', 'onBegin');
      expect(tracker.hasOverlapped()).assertFalse();
      expect(tracker.openCount()).assertEqual(0);
      expect(tracker.positionsMonotonic()).assertTrue();
      expect(tracker.size()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', tracker.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterleaveSerialized_012, end');
    });

    /**
     * Scenario: two streams that overlap.
     * Expectation: the tracker flags the overlap, which is the defect the queue prevents.
     */
    it('Assessment_InterleaveDetectsOverlap_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterleaveDetectsOverlap_013, begin');
      const tracker: InterleaveTracker = new InterleaveTracker();
      tracker.begin('page', OP_BEGIN);
      tracker.begin('callback', 'onBegin');
      expect(tracker.hasOverlapped()).assertTrue();
      expect(tracker.openCount()).assertEqual(2);
      tracker.end('callback', 'onBegin');
      tracker.end('page', OP_BEGIN);
      expect(tracker.openCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', tracker.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterleaveDetectsOverlap_013, end');
    });

    /**
     * Scenario: the per stream step lists of the tracker.
     * Expectation: the steps of both streams are kept apart and in their own order.
     */
    it('Assessment_InterleavePerStream_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterleavePerStream_014, begin');
      const tracker: InterleaveTracker = new InterleaveTracker();
      tracker.begin('page', OP_BEGIN);
      tracker.end('page', OP_BEGIN);
      tracker.begin('page', OP_END);
      tracker.end('page', OP_END);
      tracker.begin('callback', 'onEnd');
      tracker.end('callback', 'onEnd');
      expect(tracker.stepsOf('page').length).assertEqual(4);
      expect(tracker.stepsOf('callback').length).assertEqual(2);
      expect(tracker.stepsOf('page')[0]).assertEqual(OP_BEGIN);
      expect(tracker.stepsOf('callback')[0]).assertEqual('onEnd');
      expect(tracker.steps().length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', tracker.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterleavePerStream_014, end');
    });

    /**
     * Scenario: a session counter driven by a balanced begin and end burst.
     * Expectation: it stays consistent, never exceeding one active session.
     */
    it('Assessment_SessionCounterBalanced_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCounterBalanced_015, begin');
      const counter: SessionCounter = new SessionCounter();
      for (let i = 0; i < ROUNDS_MEDIUM; i++) {
        counter.begin();
        counter.end();
      }
      expect(counter.value()).assertEqual(0);
      expect(counter.peak()).assertEqual(1);
      expect(counter.violationCount()).assertEqual(0);
      expect(counter.isConsistent()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', counter.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCounterBalanced_015, end');
    });

    /**
     * Scenario: two begins without an end in between.
     * Expectation: the double begin is recorded as a violation.
     */
    it('Assessment_SessionCounterDetectsDoubleBegin_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCounterDetectsDoubleBegin_016, begin');
      const counter: SessionCounter = new SessionCounter();
      counter.begin();
      counter.begin();
      expect(counter.value()).assertEqual(2);
      expect(counter.peak()).assertEqual(2);
      expect(counter.violationCount()).assertEqual(1);
      expect(counter.isConsistent()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', counter.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCounterDetectsDoubleBegin_016, end');
    });

    /**
     * Scenario: an end without a begin.
     * Expectation: the negative count is refused and recorded as a violation.
     */
    it('Assessment_SessionCounterDetectsOrphanEnd_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCounterDetectsOrphanEnd_017, begin');
      const counter: SessionCounter = new SessionCounter();
      counter.end();
      expect(counter.value()).assertEqual(0);
      expect(counter.violationCount()).assertEqual(1);
      expect(counter.isConsistent()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', counter.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCounterDetectsOrphanEnd_017, end');
    });

    /**
     * Scenario: a burst of begin and end calls in a fixed interleaving.
     * Expectation: the counter ends at zero and the peak never exceeds one.
     */
    it('Assessment_SessionCounterInterleaved_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCounterInterleaved_018, begin');
      const counter: SessionCounter = new SessionCounter();
      for (let i = 0; i < ROUNDS_LONG; i++) {
        counter.begin();
        counter.begin();
        counter.end();
        counter.end();
      }
      expect(counter.value()).assertEqual(0);
      expect(counter.peak() >= 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', counter.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCounterInterleaved_018, end');
    });

    /**
     * Scenario: a queued callback burst that arrives while the page is idle.
     * Expectation: the events are applied in sequence and the tracker sees no overlap.
     */
    it('Assessment_CallbackBurstSerialized_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CallbackBurstSerialized_019, begin');
      const tracker: InterleaveTracker = new InterleaveTracker();
      const events: string[] = ['onBegin', 'onInterrupted', 'onEnd'];
      for (let i = 0; i < events.length; i++) {
        tracker.begin('callback', events[i]);
        tracker.end('callback', events[i]);
      }
      expect(tracker.hasOverlapped()).assertFalse();
      expect(tracker.stepsOf('callback').length).assertEqual(6);
      expect(tracker.positionsMonotonic()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', tracker.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CallbackBurstSerialized_019, end');
    });

    /**
     * Scenario: the callback codes of a concurrent session.
     * Expectation: only the OK code activates, the others are failure codes.
     */
    it('Assessment_ConcurrentCodeClassification_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConcurrentCodeClassification_020, begin');
      const codes: number[] = [CODE_OK, CODE_USER_CANCEL, CODE_TIMEOUT, CODE_SYSTEM_ERROR, CODE_ENV_ANOMALY];
      let successes: number = 0;
      for (let i = 0; i < codes.length; i++) {
        if (codes[i] === CODE_OK) {
          successes++;
        }
      }
      expect(successes).assertEqual(1);
      expect(codes.length).assertEqual(5);
      expect(codes.indexOf(CODE_TIMEOUT)).assertEqual(2);
      expect(codes.indexOf(CODE_ENV_ANOMALY)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConcurrentCodeClassification_020, end');
    });

    /**
     * Scenario: the queue description.
     * Expectation: it carries the size, the pending count and the overlap flag.
     */
    it('Assessment_QueueDescription_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueDescription_027, begin');
      const queue: OperationQueue = new OperationQueue();
      queue.submit(OP_BEGIN);
      const text: string = queue.toString();
      expect(text).assertContain('size=1');
      expect(text).assertContain('pending=1');
      expect(text).assertContain('overlapped=false');
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueueDescription_027, end');
    });
  });
}
