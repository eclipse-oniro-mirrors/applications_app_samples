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
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, inputById, clickById, waitForId, countById,
  normalizeUrl, isValidAddress, MAX_TAB_COUNT, TAB_LIMIT_MESSAGE, ID_INPUT_URL,
  ID_ACTION_SUBMIT, ID_ACTION_ADD, ID_CANCEL_TAB, TIMEOUT_TAB_SWITCH,
  TIMEOUT_PAGE_LOAD, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import {
  MockBrowser, MockBrowserTab, MockWebController, MockLoadingStatus, MockNetwork, MockClock
} from '../Shared/BrowserMock';

const TAG: string = 'BrowserErrorRecoveryTest';

/** Retry budget of the guarded navigation path. */
const MAX_RETRIES: number = 3;
const RETRY_BACKOFF_MS: number = 250;
const RECOVERY_SAMPLES: number = 12;
const TOLERANCE_RETRY_COUNT: number = 0;

/** Addresses that the address bar must refuse before touching the engine. */
const REJECTED_ADDRESSES: string[] = ['', '   ', '.', 'http://', 'a b', 'localhost'];

/** Addresses that must be accepted after the https normalization step. */
const ACCEPTED_ADDRESSES: string[] = ['example.com', 'www.example.com', 'news.example.com/a?b=c'];

/** One recovery attempt and its observable outcome. */
interface RecoveryRecord {
  attempt: number;
  address: string;
  accepted: boolean;
  reason: string;
}

/**
 * Collects the recovery outcomes of a suite that mixes expected failures.
 *
 * A negative test passes when the failure is refused cleanly, so passing and
 * failing assertions look identical in the hilog stream. The ledger keeps the
 * intent next to the observation: which input was used, whether the engine was
 * touched, and whether the state was restored afterwards.
 */
class RecoveryLedger {
  records: RecoveryRecord[] = [];
  stateRestorations: number = 0;
  leakedControllers: number = 0;

  add(address: string, accepted: boolean, reason: string): RecoveryRecord {
    const record: RecoveryRecord = {
      attempt: this.records.length + 1,
      address: address,
      accepted: accepted,
      reason: reason
    };
    this.records.push(record);
    return record;
  }

  size(): number {
    return this.records.length;
  }

  acceptedCount(): number {
    return this.records.filter((record: RecoveryRecord) => record.accepted).length;
  }

  rejectedCount(): number {
    return this.records.filter((record: RecoveryRecord) => !record.accepted).length;
  }

  reasons(): string[] {
    return this.records.map((record: RecoveryRecord) => record.reason);
  }

  last(): RecoveryRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  /** Every rejected address must carry a non empty diagnostic reason. */
  everyRejectionExplained(): boolean {
    return this.records.filter((record: RecoveryRecord) => !record.accepted)
      .every((record: RecoveryRecord) => record.reason.length > 0);
  }

  reset(): void {
    this.records = [];
    this.stateRestorations = 0;
    this.leakedControllers = 0;
  }
}

/**
 * Drives a navigation that may fail and repairs the observable state.
 *
 * The real title bar validates the address, then hands it to the controller.
 * A rejected address must never reach the engine, and a failed load must leave
 * the strip in a usable state: END status, hidden progress bar and an input
 * field the user can retype into. The harness encodes that contract.
 */
class RecoveryHarness {
  model: MockBrowser;
  ledger: RecoveryLedger = new RecoveryLedger();
  network: MockNetwork = new MockNetwork();

  constructor(tabCount: number = 1) {
    this.model = new MockBrowser(tabCount);
  }

  /** Validates then loads; never touches the engine for a rejected address. */
  attempt(address: string): boolean {
    if (!isValidAddress(address)) {
      this.ledger.add(address, false, 'invalid address');
      return false;
    }
    const tab: MockBrowserTab | null = this.model.getCurrentTab();
    if (tab === null) {
      this.ledger.add(address, false, 'missing controller');
      return false;
    }
    const resolved: string = normalizeUrl(address);
    if (!this.network.fetch(resolved)) {
      this.ledger.add(address, false, 'network unreachable');
      this.restoreState();
      return false;
    }
    const accepted: boolean = tab.controller.loadUrl(resolved);
    this.ledger.add(address, accepted, accepted ? 'loaded' : 'controller refused');
    if (!accepted) {
      this.restoreState();
    }
    return accepted;
  }

  /** Puts the strip back into the idle END state after a failure. */
  restoreState(): void {
    this.model.loadingStatus = MockLoadingStatus.END;
    this.model.progress = 0;
    this.model.hideProgress = true;
    this.ledger.stateRestorations += 1;
  }

  isIdle(): boolean {
    return this.model.loadingStatus === MockLoadingStatus.END &&
      this.model.progress === 0 && this.model.hideProgress;
  }

  loadFailureOf(index: number): string {
    return this.model.tabs[index].controller.getLoadFailure();
  }
}

/**
 * Bounded retry driver with a deterministic clock.
 *
 * The sample does not retry automatically, but the recovery contract used by
 * the suite is: at most three attempts, a fixed backoff between them, and a
 * hard deadline so a wedged engine cannot block the UI thread forever.
 */
class RetryGuard {
  private clock: MockClock = new MockClock(0);
  attempts: number = 0;
  failures: number = 0;
  successes: number = 0;
  deadlineMs: number;

  constructor(budgetMs: number = MAX_RETRIES * RETRY_BACKOFF_MS * 2) {
    this.deadlineMs = budgetMs;
  }

  /** Runs the action until it succeeds, the budget or the deadline is hit. */
  run(action: (attempt: number) => boolean): boolean {
    while (this.attempts < MAX_RETRIES && this.clock.now() < this.deadlineMs) {
      this.attempts += 1;
      if (action(this.attempts)) {
        this.successes += 1;
        return true;
      }
      this.failures += 1;
      this.clock.advance(RETRY_BACKOFF_MS);
    }
    return false;
  }

  elapsed(): number {
    return this.clock.now();
  }

  exhausted(): boolean {
    return this.attempts >= MAX_RETRIES && this.successes === 0;
  }

  reset(): void {
    this.clock.reset(0);
    this.attempts = 0;
    this.failures = 0;
    this.successes = 0;
  }
}

export default function browserErrorRecoveryTest() {
  describe('browserErrorRecoveryTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'error recovery suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Error_EmptyAddress_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_EmptyAddress_001');
      TestLogger.step(TAG, 'submit an empty address and prove the engine is untouched');
      const harness: RecoveryHarness = new RecoveryHarness(1);
      harness.network.setOnline(true);
      expect(harness.attempt('')).assertFalse();
      const controller: MockWebController = harness.model.tabs[0].controller;
      TestLogger.info(TAG, `loads=${controller.loadCount} requests=${harness.network.requestCount()}`);
      expect(controller.loadCount).assertEqual(0);
      expect(controller.getLoadFailure()).assertEqual('');
      expect(harness.network.requestCount()).assertEqual(0);
      expect(harness.ledger.rejectedCount()).assertEqual(1);
      expect(harness.ledger.reasons()[0]).assertEqual('invalid address');
      expect(harness.isIdle()).assertTrue();
      TestLogger.pass(TAG, 'Browser_Error_EmptyAddress_001');
    });

    it('Browser_Error_BlankAddress_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_BlankAddress_002');
      TestLogger.step(TAG, 'submit a whitespace only address');
      const harness: RecoveryHarness = new RecoveryHarness(1);
      expect(harness.attempt('   ')).assertFalse();
      expect(harness.attempt('\n')).assertFalse();
      const reasons: string[] = harness.ledger.reasons();
      TestLogger.info(TAG, `size=${harness.ledger.size()} reasons=${reasons.join('|')}`);
      expect(harness.ledger.size()).assertEqual(2);
      expect(harness.ledger.rejectedCount()).assertEqual(2);
      expect(harness.ledger.acceptedCount()).assertEqual(0);
      expect(harness.ledger.everyRejectionExplained()).assertTrue();
      expect(harness.model.tabs[0].controller.loadCount).assertEqual(0);
      expect(harness.model.getInputVal()).assertEqual('');
      expect(harness.isIdle()).assertTrue();
      TestLogger.pass(TAG, 'Browser_Error_BlankAddress_002');
    });

    it('Browser_Error_InvalidFormat_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_InvalidFormat_003');
      TestLogger.step(TAG, 'reject every malformed address of the table');
      const harness: RecoveryHarness = new RecoveryHarness(1);
      for (let index = 0; index < REJECTED_ADDRESSES.length; index++) {
        const address: string = REJECTED_ADDRESSES[index];
        expect(harness.attempt(address)).assertFalse();
        expect(isValidAddress(address)).assertFalse();
      }
      TestLogger.info(TAG, `rejected=${harness.ledger.rejectedCount()} of ${REJECTED_ADDRESSES.length}`);
      expect(harness.ledger.size()).assertEqual(REJECTED_ADDRESSES.length);
      expect(harness.ledger.rejectedCount()).assertEqual(REJECTED_ADDRESSES.length);
      expect(harness.ledger.everyRejectionExplained()).assertTrue();
      expect(harness.model.tabs[0].controller.loadCount).assertEqual(0);
      expect(harness.model.toasts.length).assertEqual(0);
      expect(harness.model.tabs.length).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_Error_InvalidFormat_003');
    });

    it('Browser_Error_AcceptTable_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_AcceptTable_004');
      TestLogger.step(TAG, 'accept every well formed address of the table');
      const harness: RecoveryHarness = new RecoveryHarness(1);
      for (let index = 0; index < ACCEPTED_ADDRESSES.length; index++) {
        expect(harness.attempt(ACCEPTED_ADDRESSES[index])).assertTrue();
      }
      const controller: MockWebController = harness.model.tabs[0].controller;
      TestLogger.info(TAG, `accepted=${harness.ledger.acceptedCount()} history=${controller.history.length}`);
      expect(harness.ledger.acceptedCount()).assertEqual(ACCEPTED_ADDRESSES.length);
      expect(harness.ledger.rejectedCount()).assertEqual(0);
      expect(controller.loadCount).assertEqual(ACCEPTED_ADDRESSES.length);
      expect(controller.currentUrl).assertEqual(normalizeUrl(ACCEPTED_ADDRESSES[2]));
      expect(harness.network.requestCount()).assertEqual(ACCEPTED_ADDRESSES.length);
      expect(harness.ledger.stateRestorations).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Error_AcceptTable_004');
    });

    it('Browser_Error_Scheme_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_Scheme_005');
      TestLogger.step(TAG, 'check the https prefix of the normalization step');
      const table: string[] = ['example.com', 'www.example.com/x', 'http://plain.example.com'];
      const expected: string[] = [
        'https://example.com',
        'https://www.example.com/x',
        'http://plain.example.com'
      ];
      for (let index = 0; index < table.length; index++) {
        const resolved: string = normalizeUrl(table[index]);
        TestLogger.info(TAG, `${table[index]} -> ${resolved}`);
        expect(resolved).assertEqual(expected[index]);
        expect(resolved.indexOf('http') >= 0).assertTrue();
      }
      expect(normalizeUrl('https://secure.example.com')).assertEqual('https://secure.example.com');
      expect(normalizeUrl('https://secure.example.com').split('https://').length).assertEqual(2);
      TestLogger.pass(TAG, 'Browser_Error_Scheme_005');
    });

    it('Browser_Error_EngineRefusal_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_EngineRefusal_006');
      TestLogger.step(TAG, 'hand an empty url directly to the controller');
      const controller: MockWebController = new MockWebController();
      const accepted: boolean = controller.loadUrl('');
      TestLogger.info(TAG, `accepted=${accepted} failure=${controller.getLoadFailure()}`);
      expect(accepted).assertFalse();
      expect(controller.getLoadFailure()).assertEqual('empty url');
      expect(controller.loadCount).assertEqual(0);
      expect(controller.history.length).assertEqual(0);
      expect(controller.historyIndex).assertEqual(-1);
      expect(controller.accessBackward()).assertFalse();
      expect(controller.accessForward()).assertFalse();
      controller.reset();
      expect(controller.getLoadFailure()).assertEqual('');
      expect(controller.currentUrl).assertEqual('');
      TestLogger.pass(TAG, 'Browser_Error_EngineRefusal_006');
    });

    it('Browser_Error_NoNetwork_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_NoNetwork_007');
      TestLogger.step(TAG, 'attempt a load while the device is offline');
      const harness: RecoveryHarness = new RecoveryHarness(1);
      harness.network.setOnline(false);
      expect(harness.attempt('www.example.com/offline')).assertFalse();
      const record: RecoveryRecord | null = harness.ledger.last();
      TestLogger.info(TAG, `reason=${record === null ? 'none' : record.reason} requests=${harness.network.requestCount()}`);
      expect(record === null).assertFalse();
      if (record !== null) {
        expect(record.accepted).assertFalse();
        expect(record.reason).assertEqual('network unreachable');
      }
      expect(harness.network.requestCount()).assertEqual(1);
      expect(harness.model.tabs[0].controller.loadCount).assertEqual(0);
      expect(harness.ledger.stateRestorations).assertEqual(1);
      expect(harness.isIdle()).assertTrue();
      TestLogger.pass(TAG, 'Browser_Error_NoNetwork_007');
    });

    it('Browser_Error_NetworkRecover_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_NetworkRecover_008');
      TestLogger.step(TAG, 'retry the same address once connectivity returns');
      const harness: RecoveryHarness = new RecoveryHarness(1);
      harness.network.setOnline(false);
      expect(harness.attempt('www.example.com/recover')).assertFalse();
      harness.network.setOnline(true);
      expect(harness.attempt('www.example.com/recover')).assertTrue();
      const controller: MockWebController = harness.model.tabs[0].controller;
      TestLogger.info(TAG, `requests=${harness.network.requestCount()} url=${controller.currentUrl}`);
      expect(harness.network.requestCount()).assertEqual(2);
      expect(controller.loadCount).assertEqual(1);
      expect(controller.currentUrl).assertEqual('https://www.example.com/recover');
      expect(harness.ledger.rejectedCount()).assertEqual(1);
      expect(harness.ledger.acceptedCount()).assertEqual(1);
      expect(harness.ledger.size()).assertEqual(2);
      expect(harness.isIdle()).assertTrue();
      TestLogger.pass(TAG, 'Browser_Error_NetworkRecover_008');
    });

    it('Browser_Error_FailureRate_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_FailureRate_009');
      TestLogger.step(TAG, 'drive the network double at both failure extremes');
      const network: MockNetwork = new MockNetwork();
      network.setFailureRate(1);
      let failed: number = 0;
      for (let index = 0; index < RECOVERY_SAMPLES; index++) {
        if (!network.fetch(`https://www.example.com/sample/${index}`)) {
          failed += 1;
        }
      }
      expect(failed).assertEqual(RECOVERY_SAMPLES);
      network.setFailureRate(0);
      network.setOnline(true);
      let succeeded: number = 0;
      for (let index = 0; index < RECOVERY_SAMPLES; index++) {
        if (network.fetch(`https://www.example.com/sample/${index}`)) {
          succeeded += 1;
        }
      }
      TestLogger.info(TAG, `failed=${failed} succeeded=${succeeded} requests=${network.requestCount()}`);
      expect(succeeded).assertEqual(RECOVERY_SAMPLES);
      expect(network.requestCount()).assertEqual(RECOVERY_SAMPLES * 2);
      expect(failed + succeeded).assertEqual(RECOVERY_SAMPLES * 2);
      network.reset();
      expect(network.requestCount()).assertEqual(0);
      expect(network.online).assertTrue();
      expect(network.failureRate).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Error_FailureRate_009');
    });

    it('Browser_Error_MissingController_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_MissingController_010');
      TestLogger.step(TAG, 'navigate with an out of range active index');
      const model: MockBrowser = new MockBrowser(2);
      model.setTabArrayIndex(7);
      const loadAccepted: boolean = model.loadUrl('www.example.com/ghost');
      const backMoved: boolean = model.back();
      const forwardMoved: boolean = model.forward();
      model.refresh();
      const windowAccepted: boolean = model.onWindowNew('https://www.example.com/popup');
      TestLogger.info(TAG, `load=${loadAccepted} back=${backMoved} forward=${forwardMoved} window=${windowAccepted}`);
      expect(model.getCurrentTab()).assertNull();
      expect(loadAccepted).assertFalse();
      expect(backMoved).assertFalse();
      expect(forwardMoved).assertFalse();
      expect(windowAccepted).assertFalse();
      expect(model.tabs[0].controller.loadCount).assertEqual(0);
      expect(model.tabs[1].controller.loadCount).assertEqual(0);
      expect(model.tabs[0].controller.refreshCount).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Error_MissingController_010');
    });

    it('Browser_Error_Restore_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_Restore_011');
      TestLogger.step(TAG, 'restore the idle state after a loading status was left open');
      const harness: RecoveryHarness = new RecoveryHarness(1);
      const model: MockBrowser = harness.model;
      model.onPageBegin('https://www.example.com/interrupted');
      model.onProgressChange(70);
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      expect(model.hideProgress).assertFalse();
      harness.restoreState();
      TestLogger.info(TAG, `status=${model.loadingStatus} progress=${model.progress} restorations=${harness.ledger.stateRestorations}`);
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(model.progress).assertEqual(0);
      expect(model.hideProgress).assertTrue();
      expect(harness.isIdle()).assertTrue();
      expect(harness.ledger.stateRestorations).assertEqual(1);
      expect(model.tabs[0].controller.currentUrl).assertEqual('');
      TestLogger.pass(TAG, 'Browser_Error_Restore_011');
    });

    it('Browser_Error_Exception_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_Exception_012');
      TestLogger.step(TAG, 'guard a throwing navigation and keep the state usable');
      const harness: RecoveryHarness = new RecoveryHarness(1);
      const model: MockBrowser = harness.model;
      let thrown: string = '';
      try {
        const broken: MockBrowserTab | null = null;
        if (broken === null) {
          throw new Error('controller unavailable');
        }
      } catch (error) {
        const wrapped: Error = error instanceof Error ? error : new Error(String(error));
        thrown = wrapped.message;
        TestLogger.exception(TAG, 'guarded navigation', wrapped);
      } finally {
        harness.restoreState();
      }
      TestLogger.info(TAG, `thrown=${thrown} idle=${harness.isIdle()}`);
      expect(thrown).assertEqual('controller unavailable');
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(model.hideProgress).assertTrue();
      expect(harness.ledger.stateRestorations).assertEqual(1);
      expect(harness.attempt('www.example.com/after-exception')).assertTrue();
      expect(model.tabs[0].controller.currentUrl).assertEqual('https://www.example.com/after-exception');
      TestLogger.pass(TAG, 'Browser_Error_Exception_012');
    });

    it('Browser_Error_Retry_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_Retry_013');
      TestLogger.step(TAG, 'succeed on the third bounded retry attempt');
      const guard: RetryGuard = new RetryGuard();
      const accepted: boolean = guard.run((attempt: number) => attempt === 3);
      TestLogger.info(TAG, `attempts=${guard.attempts} failures=${guard.failures} elapsed=${guard.elapsed()}`);
      expect(accepted).assertTrue();
      expect(guard.attempts).assertEqual(MAX_RETRIES);
      expect(guard.failures).assertEqual(MAX_RETRIES - 1);
      expect(guard.successes).assertEqual(1);
      expect(guard.elapsed()).assertEqual(RETRY_BACKOFF_MS * (MAX_RETRIES - 1));
      expect(guard.exhausted()).assertFalse();
      expect(guard.attempts - guard.failures - guard.successes).assertEqual(TOLERANCE_RETRY_COUNT);
      TestLogger.pass(TAG, 'Browser_Error_Retry_013');
    });

    it('Browser_Error_RetryExhausted_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_RetryExhausted_014');
      TestLogger.step(TAG, 'exhaust the retry budget on a permanently failing action');
      const guard: RetryGuard = new RetryGuard();
      const accepted: boolean = guard.run((attempt: number) => false);
      TestLogger.info(TAG, `accepted=${accepted} attempts=${guard.attempts} exhausted=${guard.exhausted()}`);
      expect(accepted).assertFalse();
      expect(guard.attempts).assertEqual(MAX_RETRIES);
      expect(guard.failures).assertEqual(MAX_RETRIES);
      expect(guard.successes).assertEqual(0);
      expect(guard.exhausted()).assertTrue();
      expect(guard.elapsed()).assertEqual(RETRY_BACKOFF_MS * MAX_RETRIES);
      guard.reset();
      expect(guard.attempts).assertEqual(0);
      expect(guard.elapsed()).assertEqual(0);
      expect(guard.exhausted()).assertFalse();
      TestLogger.pass(TAG, 'Browser_Error_RetryExhausted_014');
    });

    it('Browser_Error_Capacity_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_Capacity_015');
      TestLogger.step(TAG, 'surface the capacity warning without corrupting the strip');
      const model: MockBrowser = new MockBrowser(1);
      while (model.tabs.length <= MAX_TAB_COUNT) {
        model.addTab();
      }
      const tabsBefore: number = model.tabs.length;
      const keysBefore: number[] = model.getTabKeys();
      const rejected: boolean = model.addTab();
      TestLogger.info(TAG, `tabs=${tabsBefore} rejected=${rejected} toasts=${model.toasts.length}`);
      expect(rejected).assertFalse();
      expect(model.tabs.length).assertEqual(tabsBefore);
      expect(model.toasts.length).assertEqual(1);
      expect(model.toasts[0]).assertEqual(TAB_LIMIT_MESSAGE);
      expect(model.getTabKeys()).assertDeepEquals(keysBefore);
      expect(model.getTabArrayIndex()).assertEqual(tabsBefore - 1);
      expect(model.tabs[tabsBefore - 1].controller !== null).assertTrue();
      TestLogger.pass(TAG, 'Browser_Error_Capacity_015');
    });

    it('Browser_Error_WindowNew_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_WindowNew_016');
      TestLogger.step(TAG, 'refuse an about:blank window request');
      const model: MockBrowser = new MockBrowser(1);
      model.loadUrl('www.example.com/parent');
      const blankAccepted: boolean = model.onWindowNew('about:blank');
      const emptyAccepted: boolean = model.onWindowNew('');
      const realAccepted: boolean = model.onWindowNew('https://www.example.com/popup');
      const controller: MockWebController = model.tabs[0].controller;
      TestLogger.info(TAG, `blank=${blankAccepted} empty=${emptyAccepted} real=${realAccepted}`);
      expect(blankAccepted).assertFalse();
      expect(emptyAccepted).assertFalse();
      expect(realAccepted).assertTrue();
      expect(controller.loadCount).assertEqual(2);
      expect(controller.currentUrl).assertEqual('https://www.example.com/popup');
      expect(controller.history.length).assertEqual(2);
      expect(model.tabs.length).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_Error_WindowNew_016');
    });

    it('Browser_Error_Summary_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_Summary_017');
      TestLogger.step(TAG, 'summarise a mixed recovery session');
      const harness: RecoveryHarness = new RecoveryHarness(1);
      harness.network.setOnline(true);
      harness.attempt('');
      harness.attempt('not a host');
      harness.attempt('www.example.com/good');
      harness.network.setOnline(false);
      harness.attempt('www.example.com/late');
      harness.network.setOnline(true);
      harness.attempt('www.example.com/late');
      const ledger: RecoveryLedger = harness.ledger;
      TestLogger.info(TAG, `size=${ledger.size()} accepted=${ledger.acceptedCount()} rejected=${ledger.rejectedCount()}`);
      expect(ledger.size()).assertEqual(5);
      expect(ledger.acceptedCount()).assertEqual(2);
      expect(ledger.rejectedCount()).assertEqual(3);
      expect(ledger.everyRejectionExplained()).assertTrue();
      expect(ledger.stateRestorations).assertEqual(1);
      expect(harness.model.tabs[0].controller.loadCount).assertEqual(2);
      expect(harness.isIdle()).assertTrue();
      ledger.reset();
      expect(ledger.size()).assertEqual(0);
      expect(ledger.last()).assertNull();
      TestLogger.pass(TAG, 'Browser_Error_Summary_017');
    });

    it('Browser_Error_UI_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_UI_018');
      TestLogger.step(TAG, 'submit an empty address on the real device');
      const ready: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_TAB_SWITCH);
      expect(ready).assertTrue();
      try {
        const submitted: boolean = await clickById(driver, ID_ACTION_SUBMIT);
        expect(submitted).assertTrue();
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const stillAlive: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_TAB_SWITCH);
        const addAlive: boolean = await waitForId(driver, ID_ACTION_ADD, TIMEOUT_TAB_SWITCH);
        TestLogger.info(TAG, `stillAlive=${stillAlive} addAlive=${addAlive}`);
        expect(stillAlive).assertTrue();
        expect(addAlive).assertTrue();
        const closeButtons: number = await countById(driver, ID_CANCEL_TAB);
        expect(closeButtons >= 0).assertTrue();
      } finally {
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        TestLogger.info(TAG, 'empty submission left the title bar usable');
      }
      TestLogger.pass(TAG, 'Browser_Error_UI_018');
    });

    it('Browser_Error_UI_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Error_UI_019');
      TestLogger.step(TAG, 'type a malformed address and submit on the real device');
      try {
        const typed: boolean = await inputById(driver, ID_INPUT_URL, 'invalid address here');
        expect(typed).assertTrue();
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const submitted: boolean = await clickById(driver, ID_ACTION_SUBMIT);
        expect(submitted).assertTrue();
        const recovered: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_PAGE_LOAD);
        TestLogger.info(TAG, `submitted=${submitted} recovered=${recovered}`);
        expect(recovered).assertTrue();
        expect(isValidAddress('invalid address here')).assertFalse();
      } finally {
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        TestLogger.info(TAG, 'malformed address probe finished');
      }
      TestLogger.pass(TAG, 'Browser_Error_UI_019');
    });
  });
}
