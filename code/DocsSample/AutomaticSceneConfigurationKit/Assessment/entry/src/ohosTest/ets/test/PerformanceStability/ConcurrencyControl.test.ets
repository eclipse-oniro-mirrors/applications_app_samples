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
  DELAY_KEY_NAVIGATION,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_INDEX_TITLE,
  ID_QUERY_STATE_BUTTON,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  clickIndexButton,
  findById,
  getDriver,
  indexComponentCount,
  isQueueLocked,
  launchAssessmentApp,
  pressAndWait,
  runSerializedUiOperation,
  serializedDelay,
  waitForIndexPage
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The serialized queue of the shared driver is a single promise chain, so exactly one driver
// call may be in flight at any time. Every model of this suite therefore expects an observed
// concurrency of one and never more.
const MAX_OBSERVED_CONCURRENCY: number = 1;
const ACCESS_CYCLES: number = 100;
const QUEUE_DEPTH: number = 12;
const MODEL_ITERATIONS: number = 500;
const MODEL_BUDGET_MS: number = 5000;
const UI_ROUNDS: number = 3;
const UI_RENDER_TOLERANCE: number = 3;
const UI_ACTION_BUDGET_MS: number = 5000;

// Case identifiers, the trailing number is the sequence number of the case inside the suite.
const CASE_001: string = BUNDLE + 'ConcurrencyControl_001';
const CASE_002: string = BUNDLE + 'ConcurrencyControl_002';
const CASE_003: string = BUNDLE + 'ConcurrencyControl_003';
const CASE_004: string = BUNDLE + 'ConcurrencyControl_004';
const CASE_005: string = BUNDLE + 'ConcurrencyControl_005';
const CASE_006: string = BUNDLE + 'ConcurrencyControl_006';
const CASE_007: string = BUNDLE + 'ConcurrencyControl_007';
const CASE_008: string = BUNDLE + 'ConcurrencyControl_008';
const CASE_009: string = BUNDLE + 'ConcurrencyControl_009';
const CASE_010: string = BUNDLE + 'ConcurrencyControl_010';
const CASE_011: string = BUNDLE + 'ConcurrencyControl_011';
const CASE_012: string = BUNDLE + 'ConcurrencyControl_012';
const CASE_013: string = BUNDLE + 'ConcurrencyControl_013';
const CASE_014: string = BUNDLE + 'ConcurrencyControl_014';
const CASE_015: string = BUNDLE + 'ConcurrencyControl_015';
const CASE_016: string = BUNDLE + 'ConcurrencyControl_016';

/**
 * Phase of the interleaved begin and end state machine.
 */
enum SessionPhase {
  IDLE = 'idle',
  BEGINNING = 'beginning',
  ACTIVE = 'active',
  ENDING = 'ending'
}

/**
 * Tracks the exclusive access slot of the serialized UI operation queue.
 *
 * The UiTest driver must never be entered concurrently, so the shared driver funnels every
 * call into one promise chain. The tracker models that contract: an acquisition that runs
 * while the slot is already taken is rejected, and the observed concurrency therefore never
 * exceeds one.
 */
class ExclusiveAccessTracker {
  private active: number = 0;
  private peakActive: number = 0;
  private acquisitions: number = 0;
  private releases: number = 0;
  private rejections: number = 0;

  /**
   * Acquires the exclusive slot.
   *
   * @returns true when the slot was free and is now held by the caller.
   */
  public acquire(): boolean {
    if (this.active > 0) {
      this.rejections++;
      return false;
    }
    this.active++;
    this.acquisitions++;
    if (this.active > this.peakActive) {
      this.peakActive = this.active;
    }
    return true;
  }

  /**
   * Releases the exclusive slot.
   *
   * @returns true when the slot was held and is now free.
   */
  public release(): boolean {
    if (this.active <= 0) {
      return false;
    }
    this.active--;
    this.releases++;
    return true;
  }

  /**
   * Runs a whole acquire/release cycle.
   *
   * @returns true when the cycle was accepted.
   */
  public runCycle(): boolean {
    const acquired: boolean = this.acquire();
    if (!acquired) {
      return false;
    }
    this.release();
    return true;
  }

  public getActive(): number {
    return this.active;
  }

  public getPeakActive(): number {
    return this.peakActive;
  }

  public getAcquisitions(): number {
    return this.acquisitions;
  }

  public getReleases(): number {
    return this.releases;
  }

  public getRejections(): number {
    return this.rejections;
  }

  public isIdle(): boolean {
    return this.active === 0;
  }

  public isBalanced(): boolean {
    return this.acquisitions === this.releases && this.active === 0;
  }

  public reset(): void {
    this.active = 0;
    this.peakActive = 0;
    this.acquisitions = 0;
    this.releases = 0;
    this.rejections = 0;
  }

  public toString(): string {
    return `ExclusiveAccessTracker{active=${this.active}, peak=${this.peakActive}, acquisitions=${this.acquisitions}}`;
  }
}

/**
 * One operation that waits in the serialized queue.
 */
interface QueuedOperation {
  label: string;
  order: number;
}

/**
 * Models the FIFO discipline of the serialized operation queue.
 *
 * A queued operation is only started after the previous one finished. The model records how
 * many operations were in flight at the same time, which is the value that the UI cases
 * assert against: it must stay at one for the whole stress loop.
 */
class OperationQueueModel {
  private pending: QueuedOperation[] = [];
  private inFlight: number = 0;
  private peakInFlight: number = 0;
  private completed: number = 0;
  private orderSeed: number = 0;

  /**
   * Appends an operation to the queue.
   *
   * @param label name of the operation, it is only used for diagnostics.
   * @returns the queue order assigned to the operation.
   */
  public enqueue(label: string): number {
    const order: number = this.orderSeed;
    const operation: QueuedOperation = {
      label: label,
      order: order
    };
    this.pending.push(operation);
    this.orderSeed++;
    return order;
  }

  /**
   * Starts the operation at the head of the queue.
   *
   * @returns the operation that was started, or null when the queue is empty.
   */
  public startNext(): QueuedOperation | null {
    if (this.pending.length === 0) {
      return null;
    }
    const operation: QueuedOperation = this.pending[0];
    this.pending = this.pending.slice(1);
    this.inFlight++;
    if (this.inFlight > this.peakInFlight) {
      this.peakInFlight = this.inFlight;
    }
    return operation;
  }

  /**
   * Completes the operation that is currently in flight.
   *
   * @returns true when an operation was in flight.
   */
  public complete(): boolean {
    if (this.inFlight <= 0) {
      return false;
    }
    this.inFlight--;
    this.completed++;
    return true;
  }

  /**
   * Drains the queue in FIFO order and records the labels in completion order.
   *
   * The loop bound is the queue depth observed on entry, so an operation that is enqueued while
   * the drain runs is left for the next drain instead of extending this one.
   *
   * @returns the labels in the order in which the operations completed.
   */
  public drain(): string[] {
    const completedLabels: string[] = [];
    const limit: number = this.pending.length;
    for (let i = 0; i < limit; i++) {
      const started: QueuedOperation | null = this.startNext();
      if (started === null) {
        break;
      }
      this.complete();
      completedLabels.push(started.label);
    }
    return completedLabels;
  }

  public pendingCount(): number {
    return this.pending.length;
  }

  public inFlightCount(): number {
    return this.inFlight;
  }

  public getPeakInFlight(): number {
    return this.peakInFlight;
  }

  public getCompleted(): number {
    return this.completed;
  }

  public getEnqueued(): number {
    return this.orderSeed;
  }

  public isDrained(): boolean {
    return this.pending.length === 0 && this.inFlight === 0;
  }

  public reset(): void {
    this.pending = [];
    this.inFlight = 0;
    this.peakInFlight = 0;
    this.completed = 0;
    this.orderSeed = 0;
  }

  public toString(): string {
    return `OperationQueueModel{pending=${this.pending.length}, inFlight=${this.inFlight}, completed=${this.completed}}`;
  }
}

/**
 * Models the interleaving of begin and end requests of the assessment session.
 *
 * The sample only exposes the begin button while no assessment is active and the end button
 * while one is active. The state machine mirrors that guard so that the interleaved UI case
 * can be checked against a deterministic model.
 */
class InterleavedSessionModel {
  private phase: SessionPhase = SessionPhase.IDLE;
  private acceptedBegins: number = 0;
  private acceptedEnds: number = 0;
  private rejectedRequests: number = 0;

  /**
   * Accepts a begin request.
   *
   * @returns true when the request was accepted.
   */
  public requestBegin(): boolean {
    if (this.phase !== SessionPhase.IDLE) {
      this.rejectedRequests++;
      return false;
    }
    this.phase = SessionPhase.BEGINNING;
    this.acceptedBegins++;
    this.phase = SessionPhase.ACTIVE;
    return true;
  }

  /**
   * Accepts an end request.
   *
   * @returns true when the request was accepted.
   */
  public requestEnd(): boolean {
    if (this.phase !== SessionPhase.ACTIVE) {
      this.rejectedRequests++;
      return false;
    }
    this.phase = SessionPhase.ENDING;
    this.phase = SessionPhase.IDLE;
    this.acceptedEnds++;
    return true;
  }

  public getPhase(): SessionPhase {
    return this.phase;
  }

  public isActive(): boolean {
    return this.phase === SessionPhase.ACTIVE;
  }

  public getAcceptedBegins(): number {
    return this.acceptedBegins;
  }

  public getAcceptedEnds(): number {
    return this.acceptedEnds;
  }

  public getRejectedRequests(): number {
    return this.rejectedRequests;
  }

  public isBalanced(): boolean {
    return this.acceptedBegins === this.acceptedEnds && this.phase === SessionPhase.IDLE;
  }

  public reset(): void {
    this.phase = SessionPhase.IDLE;
    this.acceptedBegins = 0;
    this.acceptedEnds = 0;
    this.rejectedRequests = 0;
  }

  public toString(): string {
    return `InterleavedSessionModel{phase=${this.phase}, begins=${this.acceptedBegins}, ends=${this.acceptedEnds}}`;
  }
}

/**
 * Aggregates the pass and fail outcomes of one concurrency run.
 */
class ConcurrencyReport {
  private checks: string[] = [];
  private failures: string[] = [];

  /**
   * Records one named check.
   *
   * @param name name of the check.
   * @param passed outcome of the check.
   * @returns the outcome, so it can be asserted directly.
   */
  public check(name: string, passed: boolean): boolean {
    this.checks.push(name);
    if (!passed) {
      this.failures.push(name);
    }
    return passed;
  }

  /**
   * Records an upper bound check.
   *
   * @param name name of the check.
   * @param value measured value.
   * @param threshold inclusive upper bound.
   * @returns true when the value is inside the bound.
   */
  public checkUpperBound(name: string, value: number, threshold: number): boolean {
    return this.check(name, value <= threshold);
  }

  public count(): number {
    return this.checks.length;
  }

  public passedCount(): number {
    return this.checks.length - this.failures.length;
  }

  public failureCount(): number {
    return this.failures.length;
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failures.length === 0;
  }

  public failureNames(): string[] {
    return this.failures.slice();
  }

  public summary(): string {
    return this.isPassed() ? 'concurrency-pass' : 'concurrency-fail';
  }

  public reset(): void {
    this.checks = [];
    this.failures = [];
  }

  public toString(): string {
    return `ConcurrencyReport{checks=${this.checks.length}, failures=${this.failures.length}}`;
  }
}

/**
 * Logs the begin marker of a case.
 *
 * @param caseName name of the case.
 */
function logBegin(caseName: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', caseName + ', begin');
}

/**
 * Logs the end marker of a case.
 *
 * @param caseName name of the case.
 */
function logEnd(caseName: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', caseName + ', end');
}

/**
 * Launches the sample and waits until the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is available.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  return await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
}

export default function concurrencyControlTest() {
  describe('ConcurrencyControl_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: a fresh exclusive access tracker is created.
     * Expectation: the slot is free, no cycle has been observed and the highest observed
     * concurrency is zero.
     */
    it('Assessment_ConcurrencyControl_001', 0, () => {
      logBegin(CASE_001);
      const tracker: ExclusiveAccessTracker = new ExclusiveAccessTracker();
      expect(tracker.getActive()).assertEqual(0);
      expect(tracker.getPeakActive()).assertEqual(0);
      expect(tracker.getAcquisitions()).assertEqual(0);
      expect(tracker.getReleases()).assertEqual(0);
      expect(tracker.isIdle()).assertTrue();
      expect(tracker.isBalanced()).assertTrue();
      logEnd(CASE_001);
    });

    /**
     * Scenario: the exclusive slot is acquired and released once.
     * Expectation: the acquisition and the release are both accepted and the slot is free
     * afterwards.
     */
    it('Assessment_ConcurrencyControl_002', 0, () => {
      logBegin(CASE_002);
      const tracker: ExclusiveAccessTracker = new ExclusiveAccessTracker();
      expect(tracker.acquire()).assertTrue();
      expect(tracker.getActive()).assertEqual(1);
      expect(tracker.getPeakActive()).assertEqual(1);
      expect(tracker.isIdle()).assertFalse();
      expect(tracker.release()).assertTrue();
      expect(tracker.getActive()).assertEqual(0);
      expect(tracker.isBalanced()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', tracker.toString());
      logEnd(CASE_002);
    });

    /**
     * Scenario: a second acquisition is attempted while the slot is still held.
     * Expectation: the re-entrant acquisition is rejected, the rejection is counted and the
     * observed concurrency stays at one.
     */
    it('Assessment_ConcurrencyControl_003', 0, () => {
      logBegin(CASE_003);
      const tracker: ExclusiveAccessTracker = new ExclusiveAccessTracker();
      expect(tracker.acquire()).assertTrue();
      expect(tracker.acquire()).assertFalse();
      expect(tracker.acquire()).assertFalse();
      expect(tracker.getActive()).assertEqual(1);
      expect(tracker.getPeakActive()).assertEqual(MAX_OBSERVED_CONCURRENCY);
      expect(tracker.getRejections()).assertEqual(2);
      expect(tracker.getAcquisitions()).assertEqual(1);
      logEnd(CASE_003);
    });

    /**
     * Scenario: the exclusive slot is released more often than it was acquired.
     * Expectation: the surplus release is rejected and the tracker never reports a negative
     * number of holders.
     */
    it('Assessment_ConcurrencyControl_004', 0, () => {
      logBegin(CASE_004);
      const tracker: ExclusiveAccessTracker = new ExclusiveAccessTracker();
      expect(tracker.release()).assertFalse();
      expect(tracker.getActive()).assertEqual(0);
      expect(tracker.acquire()).assertTrue();
      expect(tracker.release()).assertTrue();
      expect(tracker.release()).assertFalse();
      expect(tracker.getReleases()).assertEqual(1);
      expect(tracker.isBalanced()).assertTrue();
      logEnd(CASE_004);
    });

    /**
     * Scenario: the tracker is reset after a completed cycle.
     * Expectation: every counter returns to zero and the peak concurrency is forgotten.
     */
    it('Assessment_ConcurrencyControl_006', 0, () => {
      logBegin(CASE_006);
      const tracker: ExclusiveAccessTracker = new ExclusiveAccessTracker();
      tracker.runCycle();
      tracker.acquire();
      tracker.acquire();
      tracker.release();
      expect(tracker.getPeakActive()).assertEqual(1);
      expect(tracker.getRejections()).assertEqual(1);
      tracker.reset();
      expect(tracker.getActive()).assertEqual(0);
      expect(tracker.getPeakActive()).assertEqual(0);
      expect(tracker.getAcquisitions()).assertEqual(0);
      expect(tracker.getReleases()).assertEqual(0);
      expect(tracker.getRejections()).assertEqual(0);
      logEnd(CASE_006);
    });

    /**
     * Scenario: twelve operations are enqueued and drained in FIFO order.
     * Expectation: the completion order equals the insertion order and the queue is drained
     * afterwards.
     */
    it('Assessment_ConcurrencyControl_007', 0, () => {
      logBegin(CASE_007);
      const queue: OperationQueueModel = new OperationQueueModel();
      for (let i = 0; i < QUEUE_DEPTH; i++) {
        expect(queue.enqueue('op_' + i)).assertEqual(i);
      }
      expect(queue.pendingCount()).assertEqual(QUEUE_DEPTH);
      const completed: string[] = queue.drain();
      expect(completed.length).assertEqual(QUEUE_DEPTH);
      expect(completed[0]).assertEqual('op_0');
      expect(completed[QUEUE_DEPTH - 1]).assertEqual('op_' + (QUEUE_DEPTH - 1));
      expect(queue.isDrained()).assertTrue();
      expect(queue.getCompleted()).assertEqual(QUEUE_DEPTH);
      logEnd(CASE_007);
    });

    /**
     * Scenario: the queue model processes operations without overlapping them.
     * Expectation: the peak number of in-flight operations is one, which is the serialization
     * contract of the shared driver.
     */
    it('Assessment_ConcurrencyControl_008', 0, () => {
      logBegin(CASE_008);
      const queue: OperationQueueModel = new OperationQueueModel();
      for (let i = 0; i < QUEUE_DEPTH; i++) {
        queue.enqueue('nav_' + i);
      }
      const first: QueuedOperation | null = queue.startNext();
      expect(first !== null).assertTrue();
      expect(queue.inFlightCount()).assertEqual(1);
      expect(queue.getPeakInFlight()).assertEqual(1);
      expect(queue.complete()).assertTrue();
      expect(queue.complete()).assertFalse();
      queue.drain();
      expect(queue.getPeakInFlight()).assertEqual(MAX_OBSERVED_CONCURRENCY);
      expect(queue.getEnqueued()).assertEqual(QUEUE_DEPTH);
      hilog.info(DOMAIN, TAG, '%{public}s', queue.toString());
      logEnd(CASE_008);
    });

    /**
     * Scenario: the queue is drained while it is empty.
     * Expectation: the drain returns no operation and the counters stay untouched.
     */
    it('Assessment_ConcurrencyControl_009', 0, () => {
      logBegin(CASE_009);
      const queue: OperationQueueModel = new OperationQueueModel();
      expect(queue.startNext()).assertNull();
      expect(queue.drain().length).assertEqual(0);
      expect(queue.getCompleted()).assertEqual(0);
      expect(queue.isDrained()).assertTrue();
      queue.enqueue('single');
      expect(queue.pendingCount()).assertEqual(1);
      queue.reset();
      expect(queue.pendingCount()).assertEqual(0);
      expect(queue.getEnqueued()).assertEqual(0);
      logEnd(CASE_009);
    });

    /**
     * Scenario: begin and end requests of a session are interleaved.
     * Expectation: only the requests that match the current phase are accepted, so the session
     * alternates between active and idle without ever running two sessions at once.
     */
    it('Assessment_ConcurrencyControl_010', 0, () => {
      logBegin(CASE_010);
      const session: InterleavedSessionModel = new InterleavedSessionModel();
      expect(session.getPhase()).assertEqual(SessionPhase.IDLE);
      expect(session.requestEnd()).assertFalse();
      expect(session.requestBegin()).assertTrue();
      expect(session.isActive()).assertTrue();
      expect(session.requestBegin()).assertFalse();
      expect(session.requestEnd()).assertTrue();
      expect(session.getPhase()).assertEqual(SessionPhase.IDLE);
      expect(session.getAcceptedBegins()).assertEqual(1);
      expect(session.getAcceptedEnds()).assertEqual(1);
      expect(session.getRejectedRequests()).assertEqual(2);
      expect(session.isBalanced()).assertTrue();
      logEnd(CASE_010);
    });

    /**
     * Scenario: the interleaved session model is reset in the middle of a session.
     * Expectation: the reset returns the model to the idle phase and clears every counter.
     */
    it('Assessment_ConcurrencyControl_012', 0, () => {
      logBegin(CASE_012);
      const session: InterleavedSessionModel = new InterleavedSessionModel();
      session.requestBegin();
      session.requestBegin();
      expect(session.getRejectedRequests()).assertEqual(1);
      session.reset();
      expect(session.getPhase()).assertEqual(SessionPhase.IDLE);
      expect(session.isActive()).assertFalse();
      expect(session.getAcceptedBegins()).assertEqual(0);
      expect(session.getAcceptedEnds()).assertEqual(0);
      expect(session.getRejectedRequests()).assertEqual(0);
      expect(session.isBalanced()).assertTrue();
      logEnd(CASE_012);
    });

    /**
     * Scenario: the report aggregates the deterministic model results of one run.
     * Expectation: a report without a failing check is passed and its summary carries the pass
     * marker, while a failed check turns the summary into the failure marker.
     */
    it('Assessment_ConcurrencyControl_013', 0, () => {
      logBegin(CASE_013);
      const tracker: ExclusiveAccessTracker = new ExclusiveAccessTracker();
      for (let i = 0; i < ACCESS_CYCLES; i++) {
        tracker.runCycle();
      }
      const report: ConcurrencyReport = new ConcurrencyReport();
      report.check('idle', tracker.isIdle());
      report.check('balanced', tracker.isBalanced());
      report.checkUpperBound('peak', tracker.getPeakActive(), MAX_OBSERVED_CONCURRENCY);
      expect(report.isPassed()).assertTrue();
      expect(report.count()).assertEqual(3);
      expect(report.failureCount()).assertEqual(0);
      expect(report.summary()).assertEqual('concurrency-pass');
      expect(report.checkUpperBound('peak-recheck', tracker.getPeakActive(), 0)).assertFalse();
      expect(report.isPassed()).assertFalse();
      expect(report.summary()).assertEqual('concurrency-fail');
      expect(report.failureNames()[0]).assertEqual('peak-recheck');
      hilog.info(DOMAIN, TAG, '%{public}s', report.toString());
      logEnd(CASE_013);
    });
  });
}
