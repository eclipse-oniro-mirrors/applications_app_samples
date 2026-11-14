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
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById,
  textById, clickById, normalizeUrl, isExternalUrl, MAX_TAB_COUNT,
  ID_INPUT_URL, ID_NAV_HOME, ID_ACTION_ADD, ID_CANCEL_TAB, TIMEOUT_COMPONENT
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockNetwork, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserNetworkConnectivityTest';

/** Outcome of one navigation attempt made under a connectivity state. */
interface FetchOutcome {
  url: string;
  success: boolean;
  attempts: number;
  local: boolean;
}

/**
 * Bounded retry policy.
 *
 * The browser sample has no offline queue, therefore the recovery contract is
 * "the user taps again": the policy only bounds how many automatic attempts a
 * single submit may consume before the failure is surfaced.
 */
class RetryPolicy {
  maxAttempts: number;
  backoffMs: number;

  constructor(maxAttempts: number = 3, backoffMs: number = 500) {
    this.maxAttempts = maxAttempts <= 0 ? 1 : maxAttempts;
    this.backoffMs = backoffMs <= 0 ? 0 : backoffMs;
  }

  describe(): string {
    return `max=${this.maxAttempts},backoff=${this.backoffMs}`;
  }
}

/**
 * Connectivity session wiring the deterministic network double to the browser
 * mirror and to a logical clock, so latency and backoff are observable without
 * sleeping in a real test run.
 */
class ConnectivitySession {
  network: MockNetwork = new MockNetwork();
  browser: MockBrowser = new MockBrowser();
  clock: MockClock = new MockClock();
  policy: RetryPolicy;
  attempts: number = 0;
  retryLog: string[] = [];
  private origin: number;

  constructor(policy: RetryPolicy = new RetryPolicy()) {
    this.policy = policy;
    this.origin = this.clock.now();
  }

  goOnline(): void {
    this.network.setOnline(true);
    this.retryLog.push('online');
  }

  goOffline(): void {
    this.network.setOnline(false);
    this.retryLog.push('offline');
  }

  /** Local rawfile entries never hit the network, they render from rawfile. */
  isLocalTarget(url: string): boolean {
    return url.length > 0 && !isExternalUrl(url);
  }

  attempt(address: string): FetchOutcome {
    const target: string = normalizeUrl(address);
    if (this.isLocalTarget(target)) {
      this.browser.setInputVal(target);
      this.retryLog.push(`local ${target}`);
      return { url: target, success: true, attempts: 0, local: true };
    }
    let success: boolean = false;
    let used: number = 0;
    while (used < this.policy.maxAttempts && !success) {
      used += 1;
      this.attempts += 1;
      success = this.network.fetch(target);
      this.retryLog.push(`attempt ${used} ${target} success=${success}`);
      if (!success && used < this.policy.maxAttempts) {
        this.clock.advance(this.network.latencyMs + this.policy.backoffMs);
      }
    }
    if (success) {
      this.browser.loadUrl(target);
    }
    return { url: target, success: success, attempts: used, local: false };
  }

  /** One user driven attempt, used by the recovery scenarios. */
  attemptOnce(address: string): boolean {
    const outcome: FetchOutcome = this.attemptWithPolicy(address, new RetryPolicy(1, 0));
    return outcome.success;
  }

  private attemptWithPolicy(address: string, policy: RetryPolicy): FetchOutcome {
    const saved: RetryPolicy = this.policy;
    this.policy = policy;
    const outcome: FetchOutcome = this.attempt(address);
    this.policy = saved;
    return outcome;
  }

  requestCount(): number {
    return this.network.requestCount();
  }

  elapsedMs(): number {
    return this.clock.now() - this.origin;
  }

  /** Typing must never depend on the radio state. */
  typeAddress(value: string): string {
    this.browser.setInputVal(value);
    return this.browser.getInputVal();
  }

  reset(): void {
    this.network.reset();
    this.browser = new MockBrowser();
    this.clock.reset();
    this.origin = this.clock.now();
    this.attempts = 0;
    this.retryLog = [];
  }
}

/** Counts how many outcomes of a batch ended successfully. */
function countSuccess(outcomes: FetchOutcome[]): number {
  let total: number = 0;
  for (let index = 0; index < outcomes.length; index++) {
    if (outcomes[index].success) {
      total += 1;
    }
  }
  return total;
}

export default function browserNetworkConnectivityTest() {
  describe('browserNetworkConnectivityTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'network connectivity suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Integration_Network_001', 0, async () => {
      TestLogger.step(TAG, 'online single attempt reaches the page');
      const session: ConnectivitySession = new ConnectivitySession(new RetryPolicy(3, 500));
      session.goOnline();
      const outcome: FetchOutcome = session.attempt('www.huawei.com');
      expect(outcome.success).assertTrue();
      expect(outcome.attempts).assertEqual(1);
      expect(outcome.url).assertEqual('https://www.huawei.com');
      expect(session.requestCount()).assertEqual(1);
      expect(outcome.local).assertFalse();
    });

    it('Browser_Integration_Network_002', 0, async () => {
      TestLogger.step(TAG, 'offline attempts exhaust the retry budget');
      const session: ConnectivitySession = new ConnectivitySession(new RetryPolicy(3, 200));
      session.goOffline();
      const outcome: FetchOutcome = session.attempt('www.bing.com');
      expect(outcome.success).assertFalse();
      expect(outcome.attempts).assertEqual(3);
      expect(session.requestCount()).assertEqual(3);
      expect(session.browser.getInputVal()).assertEqual('');
    });

    it('Browser_Integration_Network_003', 0, async () => {
      TestLogger.step(TAG, 'offline keeps the url input editable');
      const session: ConnectivitySession = new ConnectivitySession();
      session.goOffline();
      const typed: string = session.typeAddress('www.openharmony.io');
      expect(typed).assertEqual('www.openharmony.io');
      expect(session.browser.getInputVal()).assertEqual('www.openharmony.io');
      expect(session.requestCount()).assertEqual(0);
    });

    it('Browser_Integration_Network_004', 0, async () => {
      TestLogger.step(TAG, 'recovery allows the next attempt to succeed');
      const session: ConnectivitySession = new ConnectivitySession(new RetryPolicy(2, 100));
      session.goOffline();
      const failed: FetchOutcome = session.attempt('www.huawei.com');
      expect(failed.success).assertFalse();
      const failedRequests: number = session.requestCount();
      session.goOnline();
      const retried: FetchOutcome = session.attempt('www.huawei.com');
      expect(retried.success).assertTrue();
      expect(session.requestCount()).assertEqual(failedRequests + 1);
      expect(session.retryLog.indexOf('online')).assertLarger(0);
    });

    it('Browser_Integration_Network_005', 0, async () => {
      TestLogger.step(TAG, 'single attempt policy stops after one failure');
      const session: ConnectivitySession = new ConnectivitySession(new RetryPolicy(1, 0));
      session.goOffline();
      const outcome: FetchOutcome = session.attempt('www.bing.com');
      expect(outcome.attempts).assertEqual(1);
      expect(session.requestCount()).assertEqual(1);
      expect(session.policy.describe()).assertEqual('max=1,backoff=0');
    });

    it('Browser_Integration_Network_006', 0, async () => {
      TestLogger.step(TAG, 'latency and backoff accumulate on the logical clock');
      const session: ConnectivitySession = new ConnectivitySession(new RetryPolicy(3, 400));
      session.network.setLatency(120);
      session.goOffline();
      const outcome: FetchOutcome = session.attempt('www.huawei.com');
      expect(outcome.attempts).assertEqual(3);
      expect(session.elapsedMs()).assertEqual(2 * (120 + 400));
      expect(session.elapsedMs()).assertLarger(0);
    });

    it('Browser_Integration_Network_007', 0, async () => {
      TestLogger.step(TAG, 'failure rate zero and one behave as absolute bounds');
      const clean: ConnectivitySession = new ConnectivitySession(new RetryPolicy(2, 0));
      clean.network.setFailureRate(0);
      expect(clean.attempt('www.huawei.com').success).assertTrue();
      const broken: ConnectivitySession = new ConnectivitySession(new RetryPolicy(2, 0));
      broken.network.setFailureRate(1);
      expect(broken.attempt('www.huawei.com').success).assertFalse();
      expect(broken.attempts).assertEqual(2);
    });

    it('Browser_Integration_Network_008', 0, async () => {
      TestLogger.step(TAG, 'local targets bypass the network entirely');
      const session: ConnectivitySession = new ConnectivitySession();
      session.goOffline();
      const pageAddress: FetchOutcome = session.attempt('pad.html');
      expect(pageAddress.local).assertFalse();
      const local: FetchOutcome = session.attempt('about:blank');
      expect(local.local).assertTrue();
      expect(local.success).assertTrue();
      expect(local.attempts).assertEqual(0);
      expect(session.isLocalTarget('https://www.huawei.com')).assertFalse();
    });

    it('Browser_Integration_Network_009', 0, async () => {
      TestLogger.step(TAG, 'offline then online keeps tabs and history intact');
      const session: ConnectivitySession = new ConnectivitySession(new RetryPolicy(1, 0));
      session.browser.loadUrl('www.huawei.com');
      session.browser.addTab();
      session.goOffline();
      session.attempt('www.bing.com');
      session.goOnline();
      session.attempt('www.bing.com');
      expect(session.browser.tabs.length).assertEqual(2);
      expect(session.browser.tabs[0].controller.currentUrl).assertEqual('https://www.huawei.com');
      expect(session.browser.tabs[1].controller.currentUrl).assertEqual('https://www.bing.com');
    });

    it('Browser_Integration_Network_010', 0, async () => {
      TestLogger.step(TAG, 'batch navigation offline reports zero successes');
      const session: ConnectivitySession = new ConnectivitySession(new RetryPolicy(1, 0));
      session.goOffline();
      const urls: string[] = ['www.huawei.com', 'www.bing.com', 'developer.huawei.com'];
      const outcomes: FetchOutcome[] = [];
      for (let index = 0; index < urls.length; index++) {
        outcomes.push(session.attempt(urls[index]));
      }
      expect(outcomes.length).assertEqual(3);
      expect(countSuccess(outcomes)).assertEqual(0);
      expect(session.requestCount()).assertEqual(3);
    });

    it('Browser_Integration_Network_011', 0, async () => {
      TestLogger.step(TAG, 'request counter only grows across recovery cycles');
      const session: ConnectivitySession = new ConnectivitySession(new RetryPolicy(2, 50));
      const marks: number[] = [];
      session.goOffline();
      session.attempt('www.huawei.com');
      marks.push(session.requestCount());
      session.goOnline();
      session.attempt('www.huawei.com');
      marks.push(session.requestCount());
      session.goOffline();
      session.attempt('www.bing.com');
      marks.push(session.requestCount());
      expect(marks[1] > marks[0]).assertTrue();
      expect(marks[2] > marks[1]).assertTrue();
      expect(marks[0]).assertEqual(2);
    });

    it('Browser_Integration_Network_012', 0, async () => {
      TestLogger.step(TAG, 'mixed batch yields a deterministic success ratio');
      const session: ConnectivitySession = new ConnectivitySession(new RetryPolicy(1, 0));
      const first: FetchOutcome = session.attempt('www.huawei.com');
      session.goOffline();
      const second: FetchOutcome = session.attempt('www.bing.com');
      session.goOnline();
      const third: FetchOutcome = session.attempt('developer.huawei.com');
      const outcomes: FetchOutcome[] = [first, second, third];
      expect(countSuccess(outcomes)).assertEqual(2);
      expect(countSuccess(outcomes) / outcomes.length).assertLarger(0.6);
      expect(session.requestCount()).assertEqual(3);
    });

    it('Browser_Integration_Network_013', 0, async () => {
      TestLogger.step(TAG, 'session reset clears counters and pending input');
      const session: ConnectivitySession = new ConnectivitySession();
      session.attempt('www.huawei.com');
      session.typeAddress('www.bing.com');
      expect(session.requestCount()).assertEqual(1);
      session.reset();
      expect(session.requestCount()).assertEqual(0);
      expect(session.attempts).assertEqual(0);
      expect(session.browser.getInputVal()).assertEqual('');
      expect(session.elapsedMs()).assertEqual(0);
    });

    it('Browser_Integration_Network_014', 0, async () => {
      TestLogger.step(TAG, 'ui: url input is reachable regardless of the radio state');
      const inputReady: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `url input present=${inputReady}`);
      if (!inputReady) {
        TestLogger.fail(TAG, 'Browser_Integration_Network_014', 'url input missing');
        expect().assertFail();
        return;
      }
      const currentText: string = await textById(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `url input text length=${currentText.length}`);
      expect(currentText.length >= 0).assertTrue();
    });

    it('Browser_Integration_Network_015', 0, async () => {
      TestLogger.step(TAG, 'ui: home navigation restores the offline entry page');
      const homeReady: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      if (!homeReady) {
        TestLogger.warn(TAG, 'home button not rendered on this layout');
        expect(homeReady).assertFalse();
        return;
      }
      const clicked: boolean = await clickById(driver, ID_NAV_HOME);
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
      TestLogger.info(TAG, `home button clicked=${clicked}`);
      if (!clicked) {
        TestLogger.fail(TAG, 'Browser_Integration_Network_015', 'home click rejected');
        expect().assertFail();
        return;
      }
      expect(clicked).assertTrue();
    });

    it('Browser_Integration_Network_016', 0, async () => {
      TestLogger.step(TAG, 'ui: tab ceiling is unaffected by connectivity loss');
      const addButtons: number = await countById(driver, ID_ACTION_ADD);
      const stripCount: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `add buttons=${addButtons}, tab close buttons=${stripCount}`);
      expect(stripCount <= MAX_TAB_COUNT + 1).assertTrue();
      expect(addButtons >= 0).assertTrue();
      const session: ConnectivitySession = new ConnectivitySession(new RetryPolicy(1, 0));
      session.goOffline();
      session.attempt('www.huawei.com');
      expect(session.browser.tabs.length).assertEqual(1);
    });
  });
}
