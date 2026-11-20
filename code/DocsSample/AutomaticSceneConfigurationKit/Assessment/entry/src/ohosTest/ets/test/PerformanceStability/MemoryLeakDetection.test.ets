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
  ID_INDEX_TITLE,
  ID_QUERY_STATE_BUTTON,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  addAllowedApp,
  allowedAppRowCount,
  clickIndexButton,
  findById,
  getDriver,
  indexComponentCount,
  launchAssessmentApp,
  pressAndWait,
  removeFirstAllowedApp,
  serializedDelay,
  waitForIndexPage
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Bookkeeping values of the assessment sample. The exam page keeps exactly one countdown
// interval alive, the event log is a bounded ring and the whitelist holds at most twenty
// bundle names.
const COUNTDOWN_INTERVAL: number = 1000;
const MAX_EVENT_LOG: number = 20;
const MAX_ALLOWED_APPS: number = 20;
const TIMER_RELEASED: number = -1;
const TIMER_RUNNING: number = 0;
const MODEL_ITERATIONS: number = 1000;
const MODEL_BUDGET_MS: number = 5000;
const LIFECYCLE_CYCLES: number = 50;
const HARDENING_MEASURES: number = 4;
const UI_RENDER_TOLERANCE: number = 3;
const UI_ROUNDS: number = 3;
const MAX_COMPONENT_DRIFT: number = UI_RENDER_TOLERANCE * 2;

// Case identifiers, the trailing number is the sequence number of the case inside the suite.
const CASE_001: string = BUNDLE + 'MemoryLeakDetection_001';
const CASE_002: string = BUNDLE + 'MemoryLeakDetection_002';
const CASE_003: string = BUNDLE + 'MemoryLeakDetection_003';
const CASE_004: string = BUNDLE + 'MemoryLeakDetection_004';
const CASE_005: string = BUNDLE + 'MemoryLeakDetection_005';
const CASE_006: string = BUNDLE + 'MemoryLeakDetection_006';
const CASE_007: string = BUNDLE + 'MemoryLeakDetection_007';
const CASE_008: string = BUNDLE + 'MemoryLeakDetection_008';
const CASE_009: string = BUNDLE + 'MemoryLeakDetection_009';
const CASE_010: string = BUNDLE + 'MemoryLeakDetection_010';
const CASE_011: string = BUNDLE + 'MemoryLeakDetection_011';
const CASE_012: string = BUNDLE + 'MemoryLeakDetection_012';
const CASE_013: string = BUNDLE + 'MemoryLeakDetection_013';
const CASE_014: string = BUNDLE + 'MemoryLeakDetection_014';
const CASE_015: string = BUNDLE + 'MemoryLeakDetection_015';
const CASE_016: string = BUNDLE + 'MemoryLeakDetection_016';
const CASE_017: string = BUNDLE + 'MemoryLeakDetection_017';
const CASE_018: string = BUNDLE + 'MemoryLeakDetection_018';

/**
 * Models the countdown timer bookkeeping of the exam page.
 *
 * The exam page stores the identifier returned by setInterval in a single field and uses -1 as
 * the released sentinel. Starting a countdown while one is alive would leak the previous
 * interval, so the model rejects the second start and counts every leak that would have been
 * created.
 */
class TimerLedger {
  private timerId: number = TIMER_RELEASED;
  private started: number = 0;
  private stopped: number = 0;
  private leaksPrevented: number = 0;
  private doubleStops: number = 0;

  /**
   * Registers a started interval.
   *
   * @returns the identifier the page would have stored, or TIMER_RELEASED when the start was
   * rejected because an interval is already alive.
   */
  public start(): number {
    if (this.timerId !== TIMER_RELEASED) {
      this.leaksPrevented++;
      return TIMER_RELEASED;
    }
    this.timerId = TIMER_RUNNING;
    this.started++;
    return this.timerId;
  }

  /**
   * Releases the current interval.
   *
   * @returns true when an alive interval was released, false when the ledger was already clear.
   */
  public stop(): boolean {
    if (this.timerId === TIMER_RELEASED) {
      this.doubleStops++;
      return false;
    }
    this.timerId = TIMER_RELEASED;
    this.stopped++;
    return true;
  }

  /**
   * Runs a full appear and disappear cycle.
   *
   * @returns true when the cycle started and stopped one interval.
   */
  public runCycle(): boolean {
    if (this.start() === TIMER_RELEASED) {
      return false;
    }
    return this.stop();
  }

  public isAlive(): boolean {
    return this.timerId !== TIMER_RELEASED;
  }

  public getTimerId(): number {
    return this.timerId;
  }

  public getStarted(): number {
    return this.started;
  }

  public getStopped(): number {
    return this.stopped;
  }

  public getLeaksPrevented(): number {
    return this.leaksPrevented;
  }

  public getDoubleStops(): number {
    return this.doubleStops;
  }

  public isBalanced(): boolean {
    return this.started === this.stopped && !this.isAlive();
  }

  public reset(): void {
    this.timerId = TIMER_RELEASED;
    this.started = 0;
    this.stopped = 0;
    this.leaksPrevented = 0;
    this.doubleStops = 0;
  }

  public toString(): string {
    return `TimerLedger{started=${this.started}, stopped=${this.stopped}, alive=${this.isAlive()}}`;
  }
}

/**
 * Pairs listener registrations with their removals.
 *
 * The exam page subscribes to the AppStorage event sequence while it is displayed and the
 * hardening utility applies and releases four measures. Every registration must have exactly
 * one removal, otherwise the page keeps a reference to the destroyed component.
 */
class ListenerRegistry {
  private registrations: number = 0;
  private removals: number = 0;
  private readonly names: string[] = [];
  private readonly removed: string[] = [];

  /**
   * Registers a listener by name.
   *
   * @param name listener name.
   * @returns false when the listener is already registered.
   */
  public add(name: string): boolean {
    if (name.length === 0 || this.names.indexOf(name) >= 0) {
      return false;
    }
    this.names.push(name);
    this.registrations++;
    return true;
  }

  /**
   * Removes a listener by name.
   *
   * @param name listener name.
   * @returns false when the listener was never registered.
   */
  public remove(name: string): boolean {
    const index: number = this.names.indexOf(name);
    if (index < 0) {
      return false;
    }
    this.names.splice(index, 1);
    this.removed.push(name);
    this.removals++;
    return true;
  }

  public removeAll(): number {
    const pending: string[] = this.names.slice();
    let released: number = 0;
    for (let i = 0; i < pending.length; i++) {
      if (this.remove(pending[i])) {
        released++;
      }
    }
    return released;
  }

  public activeCount(): number {
    return this.names.length;
  }

  public getRegistrations(): number {
    return this.registrations;
  }

  public getRemovals(): number {
    return this.removals;
  }

  public isPaired(): boolean {
    return this.registrations === this.removals && this.names.length === 0;
  }

  public isRegistered(name: string): boolean {
    return this.names.indexOf(name) >= 0;
  }

  public removedNames(): string[] {
    return this.removed.slice();
  }

  public reset(): void {
    this.names.splice(0, this.names.length);
    this.removed.splice(0, this.removed.length);
    this.registrations = 0;
    this.removals = 0;
  }

  public toString(): string {
    return `ListenerRegistry{active=${this.names.length}, registrations=${this.registrations}, removals=${this.removals}}`;
  }
}

/**
 * Models the immutable whitelist array of the entry page.
 *
 * Every mutation of the sample copies the array, changes the copy and assigns the copy back to
 * the state variable. The model proves that the previously published array is never touched,
 * which is what keeps the diff of the framework small and prevents stale references.
 */
class WhitelistModel {
  private apps: string[] = [];

  constructor(seed: string[]) {
    this.apps = seed.slice();
  }

  /**
   * Appends a bundle name.
   *
   * @param bundleName bundle name to append.
   * @returns true when the name was appended.
   */
  public add(bundleName: string): boolean {
    const trimmed: string = bundleName.trim();
    if (trimmed.length === 0) {
      return false;
    }
    if (this.apps.indexOf(trimmed) >= 0) {
      return false;
    }
    if (this.apps.length >= MAX_ALLOWED_APPS) {
      return false;
    }
    const next: string[] = this.apps.slice();
    next.push(trimmed);
    this.apps = next;
    return true;
  }

  /**
   * Removes a bundle name.
   *
   * @param bundleName bundle name to remove.
   * @returns true when the name was present.
   */
  public remove(bundleName: string): boolean {
    const index: number = this.apps.indexOf(bundleName);
    if (index < 0) {
      return false;
    }
    const next: string[] = this.apps.slice();
    next.splice(index, 1);
    this.apps = next;
    return true;
  }

  public size(): number {
    return this.apps.length;
  }

  public snapshot(): string[] {
    return this.apps.slice();
  }

  public contains(bundleName: string): boolean {
    return this.apps.indexOf(bundleName) >= 0;
  }

  public isWithinLimit(): boolean {
    return this.apps.length <= MAX_ALLOWED_APPS;
  }

  public isEmpty(): boolean {
    return this.apps.length === 0;
  }

  public reset(): void {
    this.apps = [];
  }

  public toString(): string {
    return `WhitelistModel{size=${this.apps.length}, limit=${MAX_ALLOWED_APPS}}`;
  }
}

/**
 * Verifies that a disposal routine is idempotent.
 *
 * A page may be destroyed while an asynchronous hardening request is still in flight, so the
 * release path can run more than once. The ledger counts the effective disposals and rejects
 * the repeated ones instead of releasing an already released resource.
 */
class DisposalLedger {
  private readonly resources: number;
  private disposed: number = 0;
  private redundant: number = 0;

  constructor(resources: number) {
    this.resources = resources > 0 ? resources : HARDENING_MEASURES;
  }

  /**
   * Disposes the resources.
   *
   * @returns the number of resources that were actually released by this call.
   */
  public dispose(): number {
    if (this.disposed >= this.resources) {
      this.redundant++;
      return 0;
    }
    const released: number = this.resources - this.disposed;
    this.disposed = this.resources;
    return released;
  }

  public getResources(): number {
    return this.resources;
  }

  public getDisposed(): number {
    return this.disposed;
  }

  public getRedundantCalls(): number {
    return this.redundant;
  }

  public isFullyDisposed(): boolean {
    return this.disposed === this.resources;
  }

  public reset(): void {
    this.disposed = 0;
    this.redundant = 0;
  }

  public toString(): string {
    return `DisposalLedger{resources=${this.resources}, disposed=${this.disposed}, redundant=${this.redundant}}`;
  }
}

/**
 * Aggregates the pass and fail outcomes of one leak run.
 */
class LeakReport {
  private checks: string[] = [];
  private failures: string[] = [];

  public check(name: string, passed: boolean): boolean {
    this.checks.push(name);
    if (!passed) {
      this.failures.push(name);
    }
    return passed;
  }

  public checkUpperBound(name: string, value: number, threshold: number): boolean {
    return this.check(name, value <= threshold);
  }

  public checkLowerBound(name: string, value: number, threshold: number): boolean {
    return this.check(name, value >= threshold);
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
    return this.isPassed() ? 'leak-pass' : 'leak-fail';
  }

  public reset(): void {
    this.checks = [];
    this.failures = [];
  }

  public toString(): string {
    return `LeakReport{checks=${this.checks.length}, failures=${this.failures.length}}`;
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

export default function memoryLeakDetectionTest() {
  describe('MemoryLeakDetection_Test', () => {
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
     * Scenario: a fresh timer ledger is created next to the documented sample bounds.
     * Expectation: no interval is alive, the identifier carries the released sentinel, the ledger
     * is balanced and the documented tick period and log bound of the sample are unchanged.
     */
    it('Assessment_MemoryLeakDetection_001', 0, () => {
      logBegin(CASE_001);
      const ledger: TimerLedger = new TimerLedger();
      expect(ledger.isAlive()).assertFalse();
      expect(ledger.getTimerId()).assertEqual(TIMER_RELEASED);
      expect(ledger.getStarted()).assertEqual(0);
      expect(ledger.getStopped()).assertEqual(0);
      expect(ledger.getLeaksPrevented()).assertEqual(0);
      expect(ledger.isBalanced()).assertTrue();
      expect(COUNTDOWN_INTERVAL).assertEqual(1000);
      expect(MAX_EVENT_LOG).assertEqual(20);
      logEnd(CASE_001);
    });

    /**
     * Scenario: an interval is started and stopped once.
     * Expectation: the identifier is alive between the two calls and the sentinel is restored
     * after the stop.
     */
    it('Assessment_MemoryLeakDetection_002', 0, () => {
      logBegin(CASE_002);
      const ledger: TimerLedger = new TimerLedger();
      expect(ledger.start()).assertEqual(TIMER_RUNNING);
      expect(ledger.isAlive()).assertTrue();
      expect(ledger.stop()).assertTrue();
      expect(ledger.isAlive()).assertFalse();
      expect(ledger.getTimerId()).assertEqual(TIMER_RELEASED);
      expect(ledger.isBalanced()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', ledger.toString());
      logEnd(CASE_002);
    });

    /**
     * Scenario: a second interval is started while the first one is alive.
     * Expectation: the start is rejected and the would-be leaked interval is counted, so two
     * intervals can never tick in parallel.
     */
    it('Assessment_MemoryLeakDetection_003', 0, () => {
      logBegin(CASE_003);
      const ledger: TimerLedger = new TimerLedger();
      expect(ledger.start()).assertEqual(TIMER_RUNNING);
      expect(ledger.start()).assertEqual(TIMER_RELEASED);
      expect(ledger.getStarted()).assertEqual(1);
      expect(ledger.getLeaksPrevented()).assertEqual(1);
      expect(ledger.isAlive()).assertTrue();
      expect(ledger.stop()).assertTrue();
      logEnd(CASE_003);
    });

    /**
     * Scenario: the interval is stopped twice.
     * Expectation: the second stop is rejected and counted, the clearInterval path is never
     * entered with the sentinel value.
     */
    it('Assessment_MemoryLeakDetection_004', 0, () => {
      logBegin(CASE_004);
      const ledger: TimerLedger = new TimerLedger();
      ledger.start();
      expect(ledger.stop()).assertTrue();
      expect(ledger.stop()).assertFalse();
      expect(ledger.getDoubleStops()).assertEqual(1);
      expect(ledger.getStopped()).assertEqual(1);
      expect(ledger.isBalanced()).assertTrue();
      logEnd(CASE_004);
    });

    /**
     * Scenario: the timer ledger is reset between two sessions.
     * Expectation: the counters and the identifier return to their initial values.
     */
    it('Assessment_MemoryLeakDetection_006', 0, () => {
      logBegin(CASE_006);
      const ledger: TimerLedger = new TimerLedger();
      ledger.runCycle();
      ledger.runCycle();
      ledger.stop();
      expect(ledger.getDoubleStops()).assertEqual(1);
      ledger.reset();
      expect(ledger.getStarted()).assertEqual(0);
      expect(ledger.getStopped()).assertEqual(0);
      expect(ledger.getDoubleStops()).assertEqual(0);
      expect(ledger.getTimerId()).assertEqual(TIMER_RELEASED);
      expect(ledger.isBalanced()).assertTrue();
      logEnd(CASE_006);
    });

    /**
     * Scenario: the four hardening measures are registered and released in pairs.
     * Expectation: every registration has exactly one removal and no listener stays registered.
     */
    it('Assessment_MemoryLeakDetection_007', 0, () => {
      logBegin(CASE_007);
      const registry: ListenerRegistry = new ListenerRegistry();
      expect(registry.add('window-layout')).assertTrue();
      expect(registry.add('privacy-mode')).assertTrue();
      expect(registry.add('simple-keyboard')).assertTrue();
      expect(registry.add('pasteboard')).assertTrue();
      expect(registry.activeCount()).assertEqual(HARDENING_MEASURES);
      expect(registry.removeAll()).assertEqual(HARDENING_MEASURES);
      expect(registry.activeCount()).assertEqual(0);
      expect(registry.getRegistrations()).assertEqual(HARDENING_MEASURES);
      expect(registry.getRemovals()).assertEqual(HARDENING_MEASURES);
      expect(registry.isPaired()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', registry.toString());
      logEnd(CASE_007);
    });

    /**
     * Scenario: a listener is registered twice and a foreign one is removed.
     * Expectation: the duplicate registration and the unknown removal are both rejected and the
     * active list is unchanged.
     */
    it('Assessment_MemoryLeakDetection_008', 0, () => {
      logBegin(CASE_008);
      const registry: ListenerRegistry = new ListenerRegistry();
      expect(registry.add('event-seq')).assertTrue();
      expect(registry.add('event-seq')).assertFalse();
      expect(registry.remove('unknown')).assertFalse();
      expect(registry.add('')).assertFalse();
      expect(registry.activeCount()).assertEqual(1);
      expect(registry.isRegistered('event-seq')).assertTrue();
      expect(registry.getRegistrations()).assertEqual(1);
      expect(registry.getRemovals()).assertEqual(0);
      logEnd(CASE_008);
    });

    /**
     * Scenario: the whitelist is seeded with the default allowed application.
     * Expectation: the default bundle is present and the whitelist is inside its limit.
     */
    it('Assessment_MemoryLeakDetection_010', 0, () => {
      logBegin(CASE_010);
      const whitelist: WhitelistModel = new WhitelistModel(['com.samples.assessment']);
      expect(whitelist.size()).assertEqual(1);
      expect(whitelist.contains('com.samples.assessment')).assertTrue();
      expect(whitelist.isWithinLimit()).assertTrue();
      expect(whitelist.isEmpty()).assertFalse();
      expect(whitelist.add('com.samples.dictionary')).assertTrue();
      expect(whitelist.size()).assertEqual(2);
      logEnd(CASE_010);
    });

    /**
     * Scenario: a bundle name is added twice and a blank name is added.
     * Expectation: the duplicate and the blank name are rejected, so the whitelist never grows
     * from a repeated tap.
     */
    it('Assessment_MemoryLeakDetection_011', 0, () => {
      logBegin(CASE_011);
      const whitelist: WhitelistModel = new WhitelistModel([]);
      expect(whitelist.add('com.samples.reader')).assertTrue();
      expect(whitelist.add('com.samples.reader')).assertFalse();
      expect(whitelist.add('   ')).assertFalse();
      expect(whitelist.add('')).assertFalse();
      expect(whitelist.size()).assertEqual(1);
      expect(whitelist.remove('com.samples.reader')).assertTrue();
      expect(whitelist.remove('com.samples.reader')).assertFalse();
      expect(whitelist.isEmpty()).assertTrue();
      logEnd(CASE_011);
    });

    /**
     * Scenario: the whitelist is filled up to its twenty entry limit.
     * Expectation: the twenty first entry is accepted, the twenty first duplicate of the limit
     * is rejected, and the size never exceeds the bound.
     */
    it('Assessment_MemoryLeakDetection_012', 0, () => {
      logBegin(CASE_012);
      const whitelist: WhitelistModel = new WhitelistModel([]);
      let accepted: number = 0;
      for (let i = 0; i < MAX_ALLOWED_APPS; i++) {
        if (whitelist.add('com.samples.app' + i)) {
          accepted++;
        }
      }
      expect(accepted).assertEqual(MAX_ALLOWED_APPS);
      expect(whitelist.size()).assertEqual(MAX_ALLOWED_APPS);
      expect(whitelist.add('com.samples.overflow')).assertFalse();
      expect(whitelist.size()).assertEqual(MAX_ALLOWED_APPS);
      expect(whitelist.isWithinLimit()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', whitelist.toString());
      logEnd(CASE_012);
    });

    /**
     * Scenario: the published slice of the whitelist is modified by a reader.
     * Expectation: the modification never reaches the model, which is the immutability guarantee
     * of the state array of the entry page.
     */
    it('Assessment_MemoryLeakDetection_013', 0, () => {
      logBegin(CASE_013);
      const whitelist: WhitelistModel = new WhitelistModel(['com.samples.assessment']);
      const published: string[] = whitelist.snapshot();
      published.push('com.samples.injected');
      published[0] = 'com.samples.overwritten';
      expect(published.length).assertEqual(2);
      expect(whitelist.size()).assertEqual(1);
      expect(whitelist.contains('com.samples.injected')).assertFalse();
      expect(whitelist.contains('com.samples.overwritten')).assertFalse();
      expect(whitelist.contains('com.samples.assessment')).assertTrue();
      logEnd(CASE_013);
    });

    /**
     * Scenario: the disposal routine of the hardening measures runs twice.
     * Expectation: the first call releases every resource, the second call releases nothing and
     * the redundancy is counted instead of throwing.
     */
    it('Assessment_MemoryLeakDetection_015', 0, () => {
      logBegin(CASE_015);
      const disposer: DisposalLedger = new DisposalLedger(HARDENING_MEASURES);
      expect(disposer.dispose()).assertEqual(HARDENING_MEASURES);
      expect(disposer.isFullyDisposed()).assertTrue();
      expect(disposer.dispose()).assertEqual(0);
      expect(disposer.getRedundantCalls()).assertEqual(1);
      expect(disposer.getDisposed()).assertEqual(HARDENING_MEASURES);
      disposer.reset();
      expect(disposer.isFullyDisposed()).assertFalse();
      expect(disposer.dispose()).assertEqual(HARDENING_MEASURES);
      hilog.info(DOMAIN, TAG, '%{public}s', disposer.toString());
      logEnd(CASE_015);
    });

    /**
     * Scenario: the leak report aggregates the deterministic model results.
     * Expectation: a report without a failing check passes, a failing upper bound flips the
     * summary and the failing check is retained by name.
     */
    it('Assessment_MemoryLeakDetection_016', 0, () => {
      logBegin(CASE_016);
      const timers: TimerLedger = new TimerLedger();
      const listeners: ListenerRegistry = new ListenerRegistry();
      const whitelist: WhitelistModel = new WhitelistModel([]);
      for (let i = 0; i < LIFECYCLE_CYCLES; i++) {
        timers.runCycle();
        listeners.add('listener_' + i);
      }
      listeners.removeAll();
      whitelist.add('com.samples.assessment');
      const report: LeakReport = new LeakReport();
      report.check('timers-balanced', timers.isBalanced());
      report.check('listeners-paired', listeners.isPaired());
      report.checkUpperBound('whitelist', whitelist.size(), MAX_ALLOWED_APPS);
      report.check('whitelist-immutable', whitelist.contains('com.samples.assessment'));
      expect(report.isPassed()).assertTrue();
      expect(report.checkUpperBound('overflow', whitelist.size(), 0)).assertFalse();
      expect(report.isPassed()).assertFalse();
      expect(report.summary()).assertEqual('leak-fail');
      expect(report.failureNames()[0]).assertEqual('overflow');
      hilog.info(DOMAIN, TAG, '%{public}s', report.toString());
      logEnd(CASE_016);
    });
  });
}
