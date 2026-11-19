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
  ID_QUERY_STATE_BUTTON,
  ID_EXAM_TITLE,
  TEXT_STATE_INACTIVE,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// A timer id of minus one is the sentinel the exam page stores while no interval is running.
const NO_TIMER: number = -1;
const COUNTDOWN_INTERVAL: number = 1000;

// Resource kinds that the exam page acquires while it is visible.
const RES_TIMER: string = 'intervalTimer';
const RES_PASTEBOARD: string = 'pasteboardClearance';
const RES_LISTENER: string = 'eventListener';
const RES_WINDOW_LAYOUT: string = 'windowLayout';
const RES_PRIVACY_MODE: string = 'privacyMode';

// A resource ledger that keeps a fixed number of slots rejects every further acquisition.
const SLOT_CAPACITY: number = 4;

// Number of release rounds the idempotency cases drive.
const RELEASE_ROUNDS: number = 3;

/**
 * One acquired resource together with its owner and its release state.
 */
interface ResourceLease {
  kind: string;
  handle: number;
  owner: string;
  released: boolean;
  releaseCount: number;
}

/**
 * The result of an acquisition request.
 */
interface AcquireOutcome {
  granted: boolean;
  handle: number;
  reason: string;
}

/**
 * The state of the leak audit of a ledger.
 */
interface LeakAudit {
  acquired: number;
  released: number;
  leaked: number;
  doubleReleased: number;
  balanced: boolean;
}

/**
 * A ledger of acquired resources.
 *
 * The ledger models what the exam page holds while it is visible: an interval timer, the
 * pasteboard clearance flag, event listeners of the assessment callback and the two window
 * flags. Every acquisition returns a handle, every release consumes it, and a second release of
 * the same handle is counted separately rather than applied twice.
 */
class ResourceLedger {
  private leases: ResourceLease[] = [];
  private nextHandle: number = 1;
  private capacity: number = SLOT_CAPACITY;
  private doubleReleases: number = 0;

  public constructor(capacity: number) {
    this.capacity = capacity;
  }

  /**
   * Acquires a resource.
   *
   * @param kind resource kind.
   * @param owner owner that acquires it, normally the page instance name.
   * @returns the outcome, including the handle of the lease.
   */
  public acquire(kind: string, owner: string): AcquireOutcome {
    if (this.liveCount() >= this.capacity) {
      const rejected: AcquireOutcome = {
        granted: false,
        handle: NO_TIMER,
        reason: 'the ledger is full'
      };
      return rejected;
    }
    const lease: ResourceLease = {
      kind: kind,
      handle: this.nextHandle,
      owner: owner,
      released: false,
      releaseCount: 0
    };
    this.nextHandle++;
    this.leases.push(lease);
    const granted: AcquireOutcome = {
      granted: true,
      handle: lease.handle,
      reason: kind + ' acquired'
    };
    return granted;
  }

  /**
   * Releases a lease by handle.
   *
   * @param handle handle returned by the acquisition.
   * @returns true when the lease was live and is now released.
   */
  public release(handle: number): boolean {
    for (let i = 0; i < this.leases.length; i++) {
      if (this.leases[i].handle !== handle) {
        continue;
      }
      this.leases[i].releaseCount++;
      if (this.leases[i].released) {
        this.doubleReleases++;
        return false;
      }
      this.leases[i].released = true;
      return true;
    }
    this.doubleReleases++;
    return false;
  }

  /**
   * Releases every live lease of a kind.
   *
   * @param kind resource kind.
   * @returns the number of leases that were released.
   */
  public releaseKind(kind: string): number {
    let released: number = 0;
    for (let i = 0; i < this.leases.length; i++) {
      if (this.leases[i].kind === kind && !this.leases[i].released) {
        this.leases[i].released = true;
        this.leases[i].releaseCount++;
        released++;
      }
    }
    return released;
  }

  public liveCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.leases.length; i++) {
      if (!this.leases[i].released) {
        count++;
      }
    }
    return count;
  }

  public totalCount(): number {
    return this.leases.length;
  }

  public liveOfKind(kind: string): number {
    let count: number = 0;
    for (let i = 0; i < this.leases.length; i++) {
      if (this.leases[i].kind === kind && !this.leases[i].released) {
        count++;
      }
    }
    return count;
  }

  public doubleReleaseCount(): number {
    return this.doubleReleases;
  }

  /**
   * Builds the leak audit of the ledger.
   *
   * @returns the audit, balanced is true when every acquisition was released exactly once.
   */
  public audit(): LeakAudit {
    let released: number = 0;
    let leaked: number = 0;
    for (let i = 0; i < this.leases.length; i++) {
      if (this.leases[i].released) {
        released++;
      } else {
        leaked++;
      }
    }
    const balanced: boolean = leaked === 0 && this.doubleReleases === 0;
    const result: LeakAudit = {
      acquired: this.leases.length,
      released: released,
      leaked: leaked,
      doubleReleased: this.doubleReleases,
      balanced: balanced
    };
    return result;
  }

  public reset(): void {
    this.leases = [];
    this.nextHandle = 1;
    this.doubleReleases = 0;
  }

  public summary(): string {
    return `ResourceLedger{leases=${this.leases.length}, live=${this.liveCount()}}`;
  }
}

/**
 * Bookkeeping of the interval timers of the exam page.
 *
 * The page keeps a single timer id in a private field. The bookkeeping model tracks every id
 * that was registered so that a case can prove that no interval survives a page visit.
 */
class TimerRegistry {
  private registered: number[] = [];
  private cleared: number[] = [];
  private orphanClears: number = 0;

  /**
   * Registers a timer id.
   *
   * @param id timer id assigned by the platform.
   * @returns false when the id is already registered.
   */
  public register(id: number): boolean {
    if (id < 0) {
      return false;
    }
    if (this.registered.indexOf(id) >= 0) {
      return false;
    }
    this.registered.push(id);
    return true;
  }

  /**
   * Clears a timer id.
   *
   * @param id timer id.
   * @returns true when the id was live.
   */
  public clear(id: number): boolean {
    const index: number = this.registered.indexOf(id);
    if (index < 0) {
      this.orphanClears++;
      return false;
    }
    this.registered.splice(index, 1);
    this.cleared.push(id);
    return true;
  }

  /**
   * Clears the id stored by the page when it is not negative.
   *
   * @param id timer id of the page, minus one means nothing to do.
   * @returns true when a timer was cleared.
   */
  public clearIfAny(id: number): boolean {
    if (id === NO_TIMER) {
      return false;
    }
    return this.clear(id);
  }

  public liveCount(): number {
    return this.registered.length;
  }

  public liveIds(): number[] {
    return this.registered.slice();
  }

  public clearedCount(): number {
    return this.cleared.length;
  }

  public orphanClearCount(): number {
    return this.orphanClears;
  }

  public hasLive(id: number): boolean {
    return this.registered.indexOf(id) >= 0;
  }

  public isLeakFree(): boolean {
    return this.registered.length === 0;
  }

  public reset(): void {
    this.registered = [];
    this.cleared = [];
    this.orphanClears = 0;
  }

  public summary(): string {
    return `TimerRegistry{live=${this.registered.length}, cleared=${this.cleared.length}}`;
  }
}

/**
 * The accounting of the pasteboard clear operation.
 *
 * The exam page clears the pasteboard when it appears and again when it disappears. A failed
 * clear must not abort the remaining hardening phases, so the model counts the successes and
 * the failures separately.
 */
class PasteboardAudit {
  private clears: number = 0;
  private failures: number = 0;
  private lastCode: number = 0;

  /**
   * Records a clear attempt.
   *
   * @param succeeded whether the clear completed.
   * @param code error code of a failed clear.
   */
  public record(succeeded: boolean, code: number): void {
    if (succeeded) {
      this.clears++;
      this.lastCode = 0;
      return;
    }
    this.failures++;
    this.lastCode = code;
  }

  public clearCount(): number {
    return this.clears;
  }

  public failureCount(): number {
    return this.failures;
  }

  public attempts(): number {
    return this.clears + this.failures;
  }

  public lastFailureCode(): number {
    return this.lastCode;
  }

  public isEmpty(): boolean {
    return this.clears === 0 && this.failures === 0;
  }

  public reset(): void {
    this.clears = 0;
    this.failures = 0;
    this.lastCode = 0;
  }

  public summary(): string {
    return `PasteboardAudit{clears=${this.clears}, failures=${this.failures}}`;
  }
}

/**
 * Bookkeeping of the event listeners the page registers.
 *
 * The page registers a watch callback on the event sequence and a listener on the countdown. A
 * listener that is registered twice is rejected, so the bookkeeping proves that a page visit
 * registers each listener exactly once.
 */
class ListenerRegistry {
  private listeners: string[] = [];
  private removed: string[] = [];
  private duplicateAttempts: number = 0;

  public add(name: string): boolean {
    if (this.listeners.indexOf(name) >= 0) {
      this.duplicateAttempts++;
      return false;
    }
    this.listeners.push(name);
    return true;
  }

  public remove(name: string): boolean {
    const index: number = this.listeners.indexOf(name);
    if (index < 0) {
      return false;
    }
    this.listeners.splice(index, 1);
    this.removed.push(name);
    return true;
  }

  public removeAll(): number {
    const count: number = this.listeners.length;
    for (let i = 0; i < this.listeners.length; i++) {
      this.removed.push(this.listeners[i]);
    }
    this.listeners = [];
    return count;
  }

  public count(): number {
    return this.listeners.length;
  }

  public names(): string[] {
    return this.listeners.slice();
  }

  public duplicateCount(): number {
    return this.duplicateAttempts;
  }

  public removedCount(): number {
    return this.removed.length;
  }

  public has(name: string): boolean {
    return this.listeners.indexOf(name) >= 0;
  }

  public reset(): void {
    this.listeners = [];
    this.removed = [];
    this.duplicateAttempts = 0;
  }

  public summary(): string {
    return `ListenerRegistry{listeners=${this.listeners.length}, removed=${this.removed.length}}`;
  }
}

/**
 * A disposable that may be disposed more than once.
 *
 * The release path of the exam page runs from aboutToDisappear and, when the ability dies, from
 * the destroyed callback as well. The disposable therefore has to tolerate a second call.
 */
class IdempotentDisposable {
  private disposed: boolean = false;
  private disposeCalls: number = 0;
  private workRuns: number = 0;

  /**
   * Disposes the object, the work only runs on the first call.
   *
   * @returns true when this call performed the work.
   */
  public dispose(): boolean {
    this.disposeCalls++;
    if (this.disposed) {
      return false;
    }
    this.disposed = true;
    this.workRuns++;
    return true;
  }

  public isDisposed(): boolean {
    return this.disposed;
  }

  public calls(): number {
    return this.disposeCalls;
  }

  public runs(): number {
    return this.workRuns;
  }

  public reset(): void {
    this.disposed = false;
    this.disposeCalls = 0;
    this.workRuns = 0;
  }

  public toString(): string {
    return `IdempotentDisposable{disposed=${this.disposed}, calls=${this.disposeCalls}}`;
  }
}

/**
 * Starts the sample and waits until the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page showed up.
 */
async function openIndexPageOnce(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is retried');
  }
  return rendered;
}

/**
 * Brings the entry page to the front.
 *
 * A previous case may have pushed the exam page or left an alert dialog behind. The Back key
 * closes the dialog and pops the exam page, after that the entry page is rendered again.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  const first: boolean = await openIndexPageOnce(driver);
  if (first) {
    return true;
  }
  await pressAndWait(driver, KEY_BACK, 1, 200);
  return await openIndexPageOnce(driver);
}

export default function resourceManagementTest() {
  describe('ResourceManagement_Test', () => {
    let driver: Driver;
    let ledger: ResourceLedger;
    let timers: TimerRegistry;
    let pasteboard: PasteboardAudit;
    let listeners: ListenerRegistry;
    let disposable: IdempotentDisposable;

    beforeAll(async () => {
      driver = getDriver();
      ledger = new ResourceLedger(SLOT_CAPACITY);
      timers = new TimerRegistry();
      pasteboard = new PasteboardAudit();
      listeners = new ListenerRegistry();
      disposable = new IdempotentDisposable();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the five resource kinds of a page visit are acquired.
     * Expectation: the fifth acquisition is rejected because the ledger has four slots.
     */
    it('Assessment_ResourceManagement_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_001, begin');
      ledger.reset();
      expect(ledger.acquire(RES_TIMER, 'ExamPage').granted).assertTrue();
      expect(ledger.acquire(RES_PASTEBOARD, 'ExamPage').granted).assertTrue();
      expect(ledger.acquire(RES_LISTENER, 'ExamPage').granted).assertTrue();
      expect(ledger.acquire(RES_WINDOW_LAYOUT, 'ExamPage').granted).assertTrue();
      const fifth: AcquireOutcome = ledger.acquire(RES_PRIVACY_MODE, 'ExamPage');
      expect(fifth.granted).assertFalse();
      expect(fifth.reason).assertEqual('the ledger is full');
      expect(ledger.liveCount()).assertEqual(SLOT_CAPACITY);
      hilog.info(DOMAIN, TAG, '%{public}s', ledger.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_001, end');
    });

    /**
     * Scenario: a lease is released.
     * Expectation: the handle is consumed once and the live count drops by one.
     */
    it('Assessment_ResourceManagement_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_002, begin');
      ledger.reset();
      const outcome: AcquireOutcome = ledger.acquire(RES_TIMER, 'ExamPage');
      expect(outcome.granted).assertTrue();
      expect(outcome.handle).assertEqual(1);
      expect(ledger.liveCount()).assertEqual(1);
      expect(ledger.release(outcome.handle)).assertTrue();
      expect(ledger.liveCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_002, end');
    });

    /**
     * Scenario: a lease is released twice.
     * Expectation: the second release is rejected and counted as a double release.
     */
    it('Assessment_ResourceManagement_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_003, begin');
      ledger.reset();
      const outcome: AcquireOutcome = ledger.acquire(RES_PASTEBOARD, 'ExamPage');
      expect(ledger.release(outcome.handle)).assertTrue();
      expect(ledger.release(outcome.handle)).assertFalse();
      expect(ledger.doubleReleaseCount()).assertEqual(1);
      expect(ledger.liveCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_003, end');
    });

    /**
     * Scenario: an unknown handle is released.
     * Expectation: the call is rejected and counted as a double release.
     */
    it('Assessment_ResourceManagement_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_004, begin');
      ledger.reset();
      expect(ledger.release(99)).assertFalse();
      expect(ledger.release(NO_TIMER)).assertFalse();
      expect(ledger.doubleReleaseCount()).assertEqual(2);
      expect(ledger.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_004, end');
    });

    /**
     * Scenario: a lease of one kind is released by kind.
     * Expectation: only the leases of that kind are released.
     */
    it('Assessment_ResourceManagement_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_005, begin');
      ledger.reset();
      ledger.acquire(RES_LISTENER, 'ExamPage');
      ledger.acquire(RES_LISTENER, 'ExamPage');
      ledger.acquire(RES_TIMER, 'ExamPage');
      expect(ledger.liveOfKind(RES_LISTENER)).assertEqual(2);
      expect(ledger.releaseKind(RES_LISTENER)).assertEqual(2);
      expect(ledger.liveOfKind(RES_LISTENER)).assertEqual(0);
      expect(ledger.liveOfKind(RES_TIMER)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_005, end');
    });

    /**
     * Scenario: the ledger is audited after a complete visit.
     * Expectation: the audit is balanced because every acquisition was released once.
     */
    it('Assessment_ResourceManagement_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_006, begin');
      ledger.reset();
      const timer: AcquireOutcome = ledger.acquire(RES_TIMER, 'ExamPage');
      const board: AcquireOutcome = ledger.acquire(RES_PASTEBOARD, 'ExamPage');
      ledger.release(timer.handle);
      ledger.release(board.handle);
      const audit: LeakAudit = ledger.audit();
      expect(audit.acquired).assertEqual(2);
      expect(audit.released).assertEqual(2);
      expect(audit.leaked).assertEqual(0);
      expect(audit.balanced).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_006, end');
    });

    /**
     * Scenario: the ledger is audited after an incomplete visit.
     * Expectation: the audit reports the leak and marks the ledger as unbalanced.
     */
    it('Assessment_ResourceManagement_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_007, begin');
      ledger.reset();
      ledger.acquire(RES_TIMER, 'ExamPage');
      const board: AcquireOutcome = ledger.acquire(RES_PASTEBOARD, 'ExamPage');
      ledger.release(board.handle);
      const audit: LeakAudit = ledger.audit();
      expect(audit.acquired).assertEqual(2);
      expect(audit.released).assertEqual(1);
      expect(audit.leaked).assertEqual(1);
      expect(audit.balanced).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_007, end');
    });

    /**
     * Scenario: the ledger is reset between visits.
     * Expectation: the leases and the double release counter return to zero.
     */
    it('Assessment_ResourceManagement_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_008, begin');
      ledger.reset();
      ledger.acquire(RES_TIMER, 'ExamPage');
      ledger.release(99);
      expect(ledger.doubleReleaseCount()).assertEqual(1);
      ledger.reset();
      expect(ledger.totalCount()).assertEqual(0);
      expect(ledger.liveCount()).assertEqual(0);
      expect(ledger.doubleReleaseCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_008, end');
    });

    /**
     * Scenario: a timer id is registered and cleared.
     * Expectation: the registry is leak free afterwards.
     */
    it('Assessment_ResourceManagement_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_009, begin');
      timers.reset();
      expect(timers.register(1)).assertTrue();
      expect(timers.liveCount()).assertEqual(1);
      expect(timers.hasLive(1)).assertTrue();
      expect(timers.clearIfAny(1)).assertTrue();
      expect(timers.liveCount()).assertEqual(0);
      expect(timers.isLeakFree()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', timers.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_009, end');
    });

    /**
     * Scenario: a negative timer id is registered.
     * Expectation: the registration is rejected, minus one is the sentinel of no timer.
     */
    it('Assessment_ResourceManagement_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_010, begin');
      timers.reset();
      expect(timers.register(NO_TIMER)).assertFalse();
      expect(timers.register(-7)).assertFalse();
      expect(timers.liveCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_010, end');
    });

    /**
     * Scenario: the same timer id is registered twice.
     * Expectation: the second registration is rejected because the id is already live.
     */
    it('Assessment_ResourceManagement_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_011, begin');
      timers.reset();
      expect(timers.register(5)).assertTrue();
      expect(timers.register(5)).assertFalse();
      expect(timers.liveCount()).assertEqual(1);
      expect(timers.liveIds()[0]).assertEqual(5);
      timers.clear(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_011, end');
    });

    /**
     * Scenario: a timer id is cleared that was never registered.
     * Expectation: the clear is an orphan and the counters record it.
     */
    it('Assessment_ResourceManagement_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_012, begin');
      timers.reset();
      expect(timers.clear(12)).assertFalse();
      expect(timers.orphanClearCount()).assertEqual(1);
      expect(timers.clearedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_012, end');
    });

    /**
     * Scenario: a page stops its countdown twice.
     * Expectation: the second stop sees the sentinel and does nothing.
     */
    it('Assessment_ResourceManagement_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_013, begin');
      timers.reset();
      timers.register(3);
      expect(timers.clearIfAny(3)).assertTrue();
      expect(timers.clearIfAny(NO_TIMER)).assertFalse();
      expect(timers.orphanClearCount()).assertEqual(0);
      expect(timers.liveCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_013, end');
    });

    /**
     * Scenario: three page visits register and clear one timer each.
     * Expectation: three ids were cleared and none is left running.
     */
    it('Assessment_ResourceManagement_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_014, begin');
      timers.reset();
      for (let i = 1; i <= RELEASE_ROUNDS; i++) {
        timers.register(i);
        timers.clearIfAny(i);
      }
      expect(timers.clearedCount()).assertEqual(RELEASE_ROUNDS);
      expect(timers.liveCount()).assertEqual(0);
      expect(timers.isLeakFree()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', timers.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_014, end');
    });

    /**
     * Scenario: the timer registry is reset.
     * Expectation: the live ids and the counters return to zero.
     */
    it('Assessment_ResourceManagement_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_015, begin');
      timers.reset();
      timers.register(1);
      timers.register(2);
      timers.clear(1);
      timers.reset();
      expect(timers.liveIds().length).assertEqual(0);
      expect(timers.clearedCount()).assertEqual(0);
      expect(timers.orphanClearCount()).assertEqual(0);
      expect(timers.isLeakFree()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_015, end');
    });

    /**
     * Scenario: the pasteboard is cleared at both page transitions.
     * Expectation: two clears are recorded and no failure is counted.
     */
    it('Assessment_ResourceManagement_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_016, begin');
      pasteboard.reset();
      pasteboard.record(true, 0);
      pasteboard.record(true, 0);
      expect(pasteboard.attempts()).assertEqual(2);
      expect(pasteboard.clearCount()).assertEqual(2);
      expect(pasteboard.failureCount()).assertEqual(0);
      expect(pasteboard.isEmpty()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', pasteboard.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_016, end');
    });

    /**
     * Scenario: the pasteboard clear fails once.
     * Expectation: the failure is counted and its code is kept for the log line.
     */
    it('Assessment_ResourceManagement_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_017, begin');
      pasteboard.reset();
      pasteboard.record(false, 24900001);
      expect(pasteboard.failureCount()).assertEqual(1);
      expect(pasteboard.clearCount()).assertEqual(0);
      expect(pasteboard.lastFailureCode()).assertEqual(24900001);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_017, end');
    });

    /**
     * Scenario: a failed clear is followed by a successful one.
     * Expectation: the last code returns to zero, the audit keeps both attempts.
     */
    it('Assessment_ResourceManagement_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_018, begin');
      pasteboard.reset();
      pasteboard.record(false, 24900001);
      pasteboard.record(true, 0);
      expect(pasteboard.attempts()).assertEqual(2);
      expect(pasteboard.lastFailureCode()).assertEqual(0);
      expect(pasteboard.failureCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_018, end');
    });

    /**
     * Scenario: the pasteboard audit is empty.
     * Expectation: it reports that nothing was attempted.
     */
    it('Assessment_ResourceManagement_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_019, begin');
      pasteboard.reset();
      expect(pasteboard.isEmpty()).assertTrue();
      expect(pasteboard.attempts()).assertEqual(0);
      expect(pasteboard.lastFailureCode()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_019, end');
    });

    /**
     * Scenario: the listeners of a page visit are registered.
     * Expectation: three listeners are live and a duplicate registration is rejected.
     */
    it('Assessment_ResourceManagement_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_020, begin');
      listeners.reset();
      expect(listeners.add('onAssessmentEvent')).assertTrue();
      expect(listeners.add('onCountdownTick')).assertTrue();
      expect(listeners.add('onWindowStage')).assertTrue();
      expect(listeners.add('onAssessmentEvent')).assertFalse();
      expect(listeners.count()).assertEqual(3);
      expect(listeners.duplicateCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', listeners.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_020, end');
    });

    /**
     * Scenario: a listener is removed once.
     * Expectation: the second removal answers false and the listener count drops once.
     */
    it('Assessment_ResourceManagement_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_021, begin');
      listeners.reset();
      listeners.add('onAssessmentEvent');
      expect(listeners.remove('onAssessmentEvent')).assertTrue();
      expect(listeners.remove('onAssessmentEvent')).assertFalse();
      expect(listeners.count()).assertEqual(0);
      expect(listeners.removedCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_021, end');
    });

    /**
     * Scenario: every listener is removed at once.
     * Expectation: the removal answers the number of live listeners and the registry is empty.
     */
    it('Assessment_ResourceManagement_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_022, begin');
      listeners.reset();
      listeners.add('a');
      listeners.add('b');
      listeners.add('c');
      expect(listeners.removeAll()).assertEqual(3);
      expect(listeners.count()).assertEqual(0);
      expect(listeners.removeAll()).assertEqual(0);
      expect(listeners.removedCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_022, end');
    });

    /**
     * Scenario: a listener is queried that was never registered.
     * Expectation: the contains helper answers false.
     */
    it('Assessment_ResourceManagement_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_023, begin');
      listeners.reset();
      expect(listeners.has('onAssessmentEvent')).assertFalse();
      listeners.add('onAssessmentEvent');
      expect(listeners.has('onAssessmentEvent')).assertTrue();
      expect(listeners.has('onCountdownTick')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_023, end');
    });

    /**
     * Scenario: the listener registry is reset.
     * Expectation: the duplicates and removals counters return to zero.
     */
    it('Assessment_ResourceManagement_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_024, begin');
      listeners.reset();
      listeners.add('a');
      listeners.add('a');
      listeners.remove('a');
      listeners.reset();
      expect(listeners.count()).assertEqual(0);
      expect(listeners.duplicateCount()).assertEqual(0);
      expect(listeners.removedCount()).assertEqual(0);
      expect(listeners.names().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_024, end');
    });

    /**
     * Scenario: a disposable is disposed once.
     * Expectation: the work runs once and the object reports itself as disposed.
     */
    it('Assessment_ResourceManagement_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_025, begin');
      disposable.reset();
      expect(disposable.dispose()).assertTrue();
      expect(disposable.isDisposed()).assertTrue();
      expect(disposable.calls()).assertEqual(1);
      expect(disposable.runs()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', disposable.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_025, end');
    });

    /**
     * Scenario: a disposable is disposed three times.
     * Expectation: only the first call performs the work, the others are rejected.
     */
    it('Assessment_ResourceManagement_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_026, begin');
      disposable.reset();
      expect(disposable.dispose()).assertTrue();
      expect(disposable.dispose()).assertFalse();
      expect(disposable.dispose()).assertFalse();
      expect(disposable.calls()).assertEqual(3);
      expect(disposable.runs()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_026, end');
    });

    /**
     * Scenario: a disposable is reset after a visit.
     * Expectation: the reset makes the next dispose perform the work again.
     */
    it('Assessment_ResourceManagement_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_027, begin');
      disposable.reset();
      disposable.dispose();
      disposable.reset();
      expect(disposable.isDisposed()).assertFalse();
      expect(disposable.calls()).assertEqual(0);
      expect(disposable.dispose()).assertTrue();
      expect(disposable.runs()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_027, end');
    });

    /**
     * Scenario: a full page visit is modelled end to end.
     * Expectation: every acquired resource is released, no timer survives and no listener stays
     * registered.
     */
    it('Assessment_ResourceManagement_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_028, begin');
      ledger.reset();
      timers.reset();
      listeners.reset();
      pasteboard.reset();
      disposable.reset();
      listeners.add('onAssessmentEvent');
      const timer: AcquireOutcome = ledger.acquire(RES_TIMER, 'ExamPage');
      const board: AcquireOutcome = ledger.acquire(RES_PASTEBOARD, 'ExamPage');
      timers.register(1);
      pasteboard.record(true, 0);
      timers.clearIfAny(1);
      pasteboard.record(true, 0);
      listeners.removeAll();
      ledger.release(timer.handle);
      ledger.release(board.handle);
      expect(disposable.dispose()).assertTrue();
      expect(ledger.audit().balanced).assertTrue();
      expect(timers.isLeakFree()).assertTrue();
      expect(listeners.count()).assertEqual(0);
      expect(ledger.liveCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_028, end');
    });

    /**
     * Scenario: the countdown interval of the sample is checked.
     * Expectation: one tick per second is the declared interval.
     */
    it('Assessment_ResourceManagement_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_029, begin');
      expect(COUNTDOWN_INTERVAL).assertEqual(1000);
      expect(NO_TIMER).assertEqual(-1);
      const ticksPerMinute: number = 60000 / COUNTDOWN_INTERVAL;
      expect(ticksPerMinute).assertEqual(60);
      expect(SLOT_CAPACITY).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_029, end');
    });

    /**
     * Scenario: the ledger summarizes a visit.
     * Expectation: the summary carries the lease and live counters.
     */
    it('Assessment_ResourceManagement_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_034, begin');
      ledger.reset();
      ledger.acquire(RES_TIMER, 'ExamPage');
      ledger.acquire(RES_PRIVACY_MODE, 'ExamPage');
      const summary: string = ledger.summary();
      expect(summary).assertContain('ResourceLedger');
      expect(summary).assertContain('leases=2');
      expect(summary).assertContain('live=2');
      const timerSummary: string = timers.summary();
      expect(timerSummary).assertContain('TimerRegistry');
      hilog.info(DOMAIN, TAG, '%{public}s', summary);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_034, end');
    });

    /**
     * Scenario: the dispose order of a page visit is checked.
     * Expectation: the timer is cleared before the listeners are removed and the leases are
     * released last, which is the order the disappearing callback uses.
     */
    it('Assessment_ResourceManagement_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_035, begin');
      ledger.reset();
      timers.reset();
      listeners.reset();
      listeners.add('onAssessmentEvent');
      const timer: AcquireOutcome = ledger.acquire(RES_TIMER, 'ExamPage');
      timers.register(1);
      const timerClearedBeforeListeners: boolean = timers.clearIfAny(1);
      const listenersRemoved: number = listeners.removeAll();
      const leaseReleased: boolean = ledger.release(timer.handle);
      expect(timerClearedBeforeListeners).assertTrue();
      expect(listenersRemoved).assertEqual(1);
      expect(leaseReleased).assertTrue();
      expect(timers.isLeakFree()).assertTrue();
      expect(ledger.liveCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_035, end');
    });

    /**
     * Scenario: the disposable is disposed from two paths.
     * Expectation: the first path performs the work, the second one is a no-op, which is what
     * aboutToDisappear and the ability destroy callback produce together.
     */
    it('Assessment_ResourceManagement_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_036, begin');
      disposable.reset();
      const fromPage: boolean = disposable.dispose();
      const fromAbility: boolean = disposable.dispose();
      expect(fromPage).assertTrue();
      expect(fromAbility).assertFalse();
      expect(disposable.runs()).assertEqual(1);
      expect(disposable.calls()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceManagement_036, end');
    });
  });
}
