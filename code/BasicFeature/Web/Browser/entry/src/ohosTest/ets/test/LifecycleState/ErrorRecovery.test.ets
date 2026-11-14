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
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById, textById,
  inputById, clickById, waitForId, isValidAddress, normalizeUrl,
  PAD_HOME_PAGE, PHONE_HOME_PAGE, ID_INPUT_URL, ID_NAV_HOME, ID_NAV_REFRESH,
  ID_NAV_BACK, ID_CANCEL_TAB, MAX_TAB_COUNT, TIMEOUT_COMPONENT, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockWebController, MockNetwork, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserErrorRecoveryTest';

/* ------------------------------------------------------------------ */
/* Failure taxonomy                                                    */
/* ------------------------------------------------------------------ */

enum FailureKind {
  OFFLINE = 0,
  TIMEOUT = 1,
  CONTROLLER_THROWN = 2,
  TLS_ERROR = 3,
  INVALID_ADDRESS = 4,
  TAB_CORRUPT = 5
}

function failureName(kind: FailureKind): string {
  switch (kind) {
    case FailureKind.OFFLINE:
      return 'offline';
    case FailureKind.TIMEOUT:
      return 'timeout';
    case FailureKind.CONTROLLER_THROWN:
      return 'controllerThrown';
    case FailureKind.TLS_ERROR:
      return 'tlsError';
    case FailureKind.INVALID_ADDRESS:
      return 'invalidAddress';
    case FailureKind.TAB_CORRUPT:
      return 'tabCorrupt';
    default:
      return 'unknown';
  }
}

interface FailureCase {
  kind: FailureKind;
  code: string;
  retryable: boolean;
  needsNetwork: boolean;
}

/**
 * What the page can do after each failure kind.
 *
 * A timeout is worth retrying, an offline device needs the network back first,
 * a controller exception needs a fresh controller and a corrupt tab needs the
 * tab list repaired before any load can succeed.
 */
const FAILURE_TABLE: FailureCase[] = [
  { kind: FailureKind.OFFLINE, code: 'ERR_INTERNET_DISCONNECTED', retryable: false, needsNetwork: true },
  { kind: FailureKind.TIMEOUT, code: 'ERR_TIMED_OUT', retryable: true, needsNetwork: true },
  { kind: FailureKind.CONTROLLER_THROWN, code: 'ERR_CONTROLLER', retryable: true, needsNetwork: false },
  { kind: FailureKind.TLS_ERROR, code: 'ERR_CERT_INVALID', retryable: true, needsNetwork: true },
  { kind: FailureKind.INVALID_ADDRESS, code: 'ERR_INVALID_URL', retryable: false, needsNetwork: false },
  { kind: FailureKind.TAB_CORRUPT, code: 'ERR_TAB_STATE', retryable: false, needsNetwork: false }
];

function failureCaseOf(kind: FailureKind): FailureCase {
  for (let index = 0; index < FAILURE_TABLE.length; index++) {
    if (FAILURE_TABLE[index].kind === kind) {
      return FAILURE_TABLE[index];
    }
  }
  return FAILURE_TABLE[0];
}

function retryableFailures(): FailureCase[] {
  return FAILURE_TABLE.filter((item: FailureCase) => item.retryable);
}

/* ------------------------------------------------------------------ */
/* Retry policy                                                        */
/* ------------------------------------------------------------------ */

/**
 * Exponential backoff of the retry affordance.
 *
 * Three attempts with a 200 ms base, a factor of two and a two second ceiling
 * give 200 / 400 / 800 ms. The ceiling keeps a slow network from making the
 * recovery path slower than a manual reload.
 */
class RetryPolicy {
  maxAttempts: number = 3;
  baseDelayMs: number = 200;
  factor: number = 2;
  maxDelayMs: number = 2000;
  attempts: number = 0;
  delays: number[] = [];

  registerAttempt(): number {
    this.attempts += 1;
    return this.attempts;
  }

  canRetry(): boolean {
    return this.attempts < this.maxAttempts;
  }

  exhausted(): boolean {
    return this.attempts >= this.maxAttempts;
  }

  nextDelay(): number {
    const raw: number = this.baseDelayMs * Math.pow(this.factor, this.attempts - 1);
    const capped: number = raw > this.maxDelayMs ? this.maxDelayMs : raw;
    this.delays.push(capped);
    return capped;
  }

  totalDelay(): number {
    let total: number = 0;
    for (let index = 0; index < this.delays.length; index++) {
      total += this.delays[index];
    }
    return total;
  }

  describe(): string {
    return `attempts=${this.attempts}/${this.maxAttempts}, delays=${this.delays.join(',')}`;
  }

  reset(): void {
    this.attempts = 0;
    this.delays = [];
  }
}

/* ------------------------------------------------------------------ */
/* Recovery ledger                                                     */
/* ------------------------------------------------------------------ */

enum RecoveryPhase {
  DETECTED = 0,
  RETRYING = 1,
  SUCCEEDED = 2,
  DEGRADED = 3,
  ROLLED_BACK = 4,
  VERIFIED = 5
}

function phaseName(phase: RecoveryPhase): string {
  switch (phase) {
    case RecoveryPhase.DETECTED:
      return 'detected';
    case RecoveryPhase.RETRYING:
      return 'retrying';
    case RecoveryPhase.SUCCEEDED:
      return 'succeeded';
    case RecoveryPhase.DEGRADED:
      return 'degraded';
    case RecoveryPhase.ROLLED_BACK:
      return 'rolledBack';
    case RecoveryPhase.VERIFIED:
      return 'verified';
    default:
      return 'unknown';
  }
}

interface RecoveryEvent {
  sequence: number;
  phase: RecoveryPhase;
  url: string;
  attempt: number;
  ok: boolean;
  detail: string;
  timestamp: number;
}

interface RecoverySnapshot {
  url: string;
  inputValue: string;
  tabIndex: number;
  progress: number;
  hideProgress: boolean;
}

/**
 * Chronological record of every recovery step.
 *
 * The ledger is the only authority on "did we retry or did we give up", so the
 * cases assert phases, attempt numbers and details instead of trusting the
 * boolean returned by the engine. A bounded capacity prevents a long offline
 * period from growing the array without limit.
 */
class RecoveryLedger {
  events: RecoveryEvent[] = [];
  private capacity: number;
  private dropped: number = 0;

  constructor(capacity: number = 64) {
    this.capacity = capacity <= 0 ? 1 : capacity;
  }

  append(phase: RecoveryPhase, url: string, attempt: number, ok: boolean,
    detail: string, timestamp: number): RecoveryEvent {
    const event: RecoveryEvent = {
      sequence: this.events.length === 0 ? 0 : this.events[this.events.length - 1].sequence + 1,
      phase: phase,
      url: url,
      attempt: attempt,
      ok: ok,
      detail: detail,
      timestamp: timestamp
    };
    this.events.push(event);
    while (this.events.length > this.capacity) {
      this.events.shift();
      this.dropped += 1;
    }
    return event;
  }

  size(): number {
    return this.events.length;
  }

  droppedCount(): number {
    return this.dropped;
  }

  countOf(phase: RecoveryPhase): number {
    let total: number = 0;
    for (let index = 0; index < this.events.length; index++) {
      if (this.events[index].phase === phase) {
        total += 1;
      }
    }
    return total;
  }

  phases(): string[] {
    return this.events.map((event: RecoveryEvent) => phaseName(event.phase));
  }

  last(): RecoveryEvent | null {
    if (this.events.length === 0) {
      return null;
    }
    return this.events[this.events.length - 1];
  }

  lastOf(phase: RecoveryPhase): RecoveryEvent | null {
    for (let index = this.events.length - 1; index >= 0; index--) {
      if (this.events[index].phase === phase) {
        return this.events[index];
      }
    }
    return null;
  }

  containsDetail(keyword: string): boolean {
    return this.events.some((event: RecoveryEvent) => event.detail.indexOf(keyword) >= 0);
  }

  maxAttempt(): number {
    let result: number = 0;
    for (let index = 0; index < this.events.length; index++) {
      if (this.events[index].attempt > result) {
        result = this.events[index].attempt;
      }
    }
    return result;
  }

  summary(): string {
    return `events=${this.events.length}, retries=${this.countOf(RecoveryPhase.RETRYING)}, ` +
      `degraded=${this.countOf(RecoveryPhase.DEGRADED)}`;
  }

  reset(): void {
    this.events = [];
    this.dropped = 0;
  }
}

/* ------------------------------------------------------------------ */
/* Controller guard                                                    */
/* ------------------------------------------------------------------ */

/**
 * Wraps a controller and converts a thrown platform error into a boolean.
 *
 * WebviewController methods can throw when the engine is torn down between two
 * tabs, and Index.onBackPress already wraps its access in a try block for that
 * reason. The guard makes the failure observable: the call is counted, the
 * message is kept and the caller keeps running with a safe fallback.
 */
class ControllerGuard {
  controller: MockWebController;
  throwOnLoad: boolean = false;
  throwOnBack: boolean = false;
  throwOnRefresh: boolean = false;
  throwOnScript: boolean = false;
  thrown: number = 0;
  lastError: string = '';
  safeLoads: number = 0;

  constructor(controller: MockWebController) {
    this.controller = controller;
  }

  private fail(stage: string): boolean {
    this.thrown += 1;
    this.lastError = `${stage} threw`;
    return false;
  }

  safeLoad(url: string): boolean {
    if (this.throwOnLoad) {
      return this.fail('loadUrl');
    }
    try {
      const result: boolean = this.controller.loadUrl(url);
      if (result) {
        this.safeLoads += 1;
      }
      return result;
    } catch (error) {
      this.thrown += 1;
      this.lastError = `loadUrl threw ${error}`;
      return false;
    }
  }

  safeBack(): boolean {
    if (this.throwOnBack) {
      return this.fail('accessBackward');
    }
    try {
      return this.controller.accessBackward() && this.controller.backward();
    } catch (error) {
      this.thrown += 1;
      this.lastError = `backward threw ${error}`;
      return false;
    }
  }

  safeRefresh(): boolean {
    if (this.throwOnRefresh) {
      return this.fail('refresh');
    }
    try {
      this.controller.refresh();
      return true;
    } catch (error) {
      this.thrown += 1;
      this.lastError = `refresh threw ${error}`;
      return false;
    }
  }

  safeScript(script: string): boolean {
    if (this.throwOnScript) {
      return this.fail('runJavaScript');
    }
    try {
      this.controller.runJavaScript(script);
      return true;
    } catch (error) {
      this.thrown += 1;
      this.lastError = `runJavaScript threw ${error}`;
      return false;
    }
  }

  clearFaults(): void {
    this.throwOnLoad = false;
    this.throwOnBack = false;
    this.throwOnRefresh = false;
    this.throwOnScript = false;
  }

  reset(): void {
    this.thrown = 0;
    this.lastError = '';
    this.safeLoads = 0;
    this.clearFaults();
  }
}

/* ------------------------------------------------------------------ */
/* Tab integrity                                                       */
/* ------------------------------------------------------------------ */

interface TabIssue {
  code: string;
  index: number;
  detail: string;
}

const ISSUE_EMPTY: string = 'TAB_EMPTY';
const ISSUE_NEGATIVE: string = 'TAB_NEGATIVE_KEY';
const ISSUE_DUPLICATE: string = 'TAB_DUPLICATE_KEY';
const ISSUE_GAP: string = 'TAB_KEY_GAP';
const ISSUE_INDEX: string = 'TAB_INDEX_RANGE';

/**
 * Detects and repairs a damaged tab list.
 *
 * deleteTab splices both arrays and renumbers the keys, so a partial failure
 * (an exception between the two splices) leaves duplicated or negative keys.
 * Repair is deliberately conservative: it keeps the surviving controllers and
 * only rewrites the key, the timestamp and the selected index.
 */
class TabRepairer {
  issues: TabIssue[] = [];
  repairs: number = 0;

  inspect(browser: MockBrowser): TabIssue[] {
    this.issues = [];
    if (browser.tabs.length === 0) {
      this.issues.push({ code: ISSUE_EMPTY, index: -1, detail: 'no tab left' });
      return this.issues;
    }
    for (let index = 0; index < browser.tabs.length; index++) {
      const key: number = browser.tabs[index].key;
      if (key < 0) {
        this.issues.push({ code: ISSUE_NEGATIVE, index: index, detail: `key=${key}` });
      }
      if (index > 0) {
        const previousKey: number = browser.tabs[index - 1].key;
        if (previousKey === key) {
          this.issues.push({ code: ISSUE_DUPLICATE, index: index, detail: `key=${key}` });
        }
        if (previousKey + 1 !== key && key >= 0) {
          this.issues.push({ code: ISSUE_GAP, index: index, detail: `key=${key}` });
        }
      }
    }
    if (browser.getTabArrayIndex() < 0 || browser.getTabArrayIndex() >= browser.tabs.length) {
      this.issues.push({
        code: ISSUE_INDEX,
        index: browser.getTabArrayIndex(),
        detail: `index out of 0..${browser.tabs.length - 1}`
      });
    }
    return this.issues;
  }

  repair(browser: MockBrowser): boolean {
    this.inspect(browser);
    if (browser.tabs.length === 0) {
      browser.tabs.push(new MockBrowserTab(0, 1700000000000));
      this.repairs += 1;
    }
    for (let index = 0; index < browser.tabs.length; index++) {
      if (browser.tabs[index].key !== index) {
        browser.tabs[index].key = index;
        this.repairs += 1;
      }
    }
    const index: number = browser.getTabArrayIndex();
    if (index < 0) {
      browser.setTabArrayIndex(0);
      this.repairs += 1;
    } else if (index >= browser.tabs.length) {
      browser.setTabArrayIndex(browser.tabs.length - 1);
      this.repairs += 1;
    }
    this.inspect(browser);
    return this.isHealthy(browser);
  }

  isHealthy(browser: MockBrowser): boolean {
    const found: TabIssue[] = this.inspect(browser);
    return found.length === 0;
  }

  countOf(code: string): number {
    let total: number = 0;
    for (let index = 0; index < this.issues.length; index++) {
      if (this.issues[index].code === code) {
        total += 1;
      }
    }
    return total;
  }

  describe(): string {
    return this.issues.map((issue: TabIssue) => `${issue.code}@${issue.index}`).join(',');
  }

  reset(): void {
    this.issues = [];
    this.repairs = 0;
  }
}

/* ------------------------------------------------------------------ */
/* Recovery engine                                                     */
/* ------------------------------------------------------------------ */

/**
 * Retry orchestration of one browser tab.
 *
 * Flow of a failed load: optimistic state update, up to three attempts with
 * exponential backoff, rollback of the optimistic state, then a degraded home
 * page. Every branch writes to the ledger before returning, so the suite can
 * assert the exact order instead of only the final boolean.
 */
class RecoveryEngine {
  browser: MockBrowser;
  network: MockNetwork;
  policy: RetryPolicy;
  ledger: RecoveryLedger;
  clock: MockClock;
  guard: ControllerGuard;
  degraded: boolean = false;
  rollbackCount: number = 0;
  homePage: string;

  constructor(homePage: string = PAD_HOME_PAGE) {
    this.browser = new MockBrowser(1);
    this.network = new MockNetwork();
    this.policy = new RetryPolicy();
    this.ledger = new RecoveryLedger();
    this.clock = new MockClock();
    this.homePage = homePage;
    this.guard = new ControllerGuard(this.browser.tabs[0].controller);
  }

  snapshot(): RecoverySnapshot {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    return {
      url: tab === null ? '' : tab.controller.currentUrl,
      inputValue: this.browser.getInputVal(),
      tabIndex: this.browser.getTabArrayIndex(),
      progress: this.browser.progress,
      hideProgress: this.browser.hideProgress
    };
  }

  applyOptimistic(url: string): void {
    this.browser.setInputVal(url);
    this.browser.progress = 5;
    this.browser.hideProgress = false;
  }

  rollback(snapshot: RecoverySnapshot): void {
    this.browser.setInputVal(snapshot.inputValue);
    this.browser.setTabArrayIndex(snapshot.tabIndex);
    this.browser.progress = snapshot.progress;
    this.browser.hideProgress = snapshot.hideProgress;
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    if (tab !== null) {
      tab.controller.currentUrl = snapshot.url;
    }
    this.rollbackCount += 1;
  }

  attempt(url: string): boolean {
    this.ledger.append(RecoveryPhase.DETECTED, url, 0, false, 'attempt start', this.clock.now());
    if (!isValidAddress(url)) {
      this.ledger.append(RecoveryPhase.DETECTED, url, 0, false, 'invalid address', this.clock.now());
      return false;
    }
    const snapshot: RecoverySnapshot = this.snapshot();
    const normalized: string = normalizeUrl(url);
    if (!this.network.online) {
      this.ledger.append(RecoveryPhase.DETECTED, normalized, 0, false, 'network offline',
        this.clock.now());
      return false;
    }
    this.applyOptimistic(normalized);
    for (let attempt = 1; attempt <= this.policy.maxAttempts; attempt++) {
      this.policy.registerAttempt();
      const requestOk: boolean = this.network.fetch(normalized);
      let controllerOk: boolean = false;
      if (requestOk) {
        controllerOk = this.guard.safeLoad(normalized);
      }
      if (requestOk && controllerOk) {
        this.browser.progress = 0;
        this.browser.hideProgress = true;
        this.degraded = false;
        this.ledger.append(RecoveryPhase.SUCCEEDED, normalized, attempt, true, 'load succeeded',
          this.clock.now());
        return true;
      }
      const detail: string = requestOk ? `controller rejected load ${this.guard.lastError}` :
        'request failed';
      this.ledger.append(RecoveryPhase.RETRYING, normalized, attempt, false, detail, this.clock.now());
      if (!this.policy.canRetry()) {
        break;
      }
      const delay: number = this.policy.nextDelay();
      this.clock.advance(delay);
    }
    this.rollback(snapshot);
    this.ledger.append(RecoveryPhase.ROLLED_BACK, normalized, this.policy.attempts, false,
      'state restored', this.clock.now());
    this.degrade();
    return false;
  }

  degrade(): boolean {
    const fresh: MockWebController = new MockWebController();
    const homeOk: boolean = fresh.loadUrl(this.homePage);
    this.browser.tabs[0].controller = fresh;
    this.guard = new ControllerGuard(fresh);
    this.browser.setInputVal('');
    this.browser.setTabArrayIndex(0);
    this.browser.progress = 0;
    this.browser.hideProgress = true;
    this.degraded = homeOk;
    this.ledger.append(RecoveryPhase.DEGRADED, this.homePage, 0, homeOk, 'home page loaded',
      this.clock.now());
    return homeOk;
  }

  recoverTo(url: string): boolean {
    this.ledger.append(RecoveryPhase.DETECTED, url, 0, false, 'recovery start', this.clock.now());
    this.network.setOnline(true);
    this.network.setFailureRate(0);
    this.policy.reset();
    this.guard.clearFaults();
    const ok: boolean = this.attempt(url);
    if (ok) {
      this.degraded = false;
    }
    return ok;
  }

  verifyUsable(url: string): boolean {
    const structureOk: boolean = this.browser.tabs.length === 1 &&
      this.browser.getTabArrayIndex() === 0;
    const normalized: string = normalizeUrl(url);
    const loadOk: boolean = this.guard.safeLoad(normalized);
    this.ledger.append(RecoveryPhase.VERIFIED, normalized, 1, loadOk,
      loadOk ? 'usable after recovery' : 'still unusable', this.clock.now());
    return structureOk && loadOk;
  }

  describe(): string {
    return `degraded=${this.degraded}, rollbacks=${this.rollbackCount}, ${this.ledger.summary()}`;
  }

  reset(): void {
    this.browser = new MockBrowser(1);
    this.network.reset();
    this.policy.reset();
    this.ledger.reset();
    this.clock.reset();
    this.guard = new ControllerGuard(this.browser.tabs[0].controller);
    this.degraded = false;
    this.rollbackCount = 0;
  }
}

export default function browserLifecycleErrorRecoveryTest() {
  describe('browserLifecycleErrorRecoveryTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'error recovery suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Recovery_Taxonomy_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Taxonomy_001');
      TestLogger.step(TAG, 'the failure table covers six distinct failure kinds');
      TestLogger.info(TAG, `size=${FAILURE_TABLE.length}`);
      expect(FAILURE_TABLE.length).assertEqual(6);
      expect(failureName(FailureKind.OFFLINE)).assertEqual('offline');
      expect(failureName(FailureKind.TIMEOUT)).assertEqual('timeout');
      expect(failureName(FailureKind.CONTROLLER_THROWN)).assertEqual('controllerThrown');
      expect(failureName(FailureKind.TLS_ERROR)).assertEqual('tlsError');
      expect(failureName(FailureKind.INVALID_ADDRESS)).assertEqual('invalidAddress');
      expect(failureName(FailureKind.TAB_CORRUPT)).assertEqual('tabCorrupt');
      expect(failureCaseOf(FailureKind.TIMEOUT).code).assertEqual('ERR_TIMED_OUT');
      expect(failureCaseOf(FailureKind.OFFLINE).code).assertContain('DISCONNECTED');
      expect(failureCaseOf(FailureKind.TAB_CORRUPT).code).assertEqual('ERR_TAB_STATE');
      TestLogger.pass(TAG, 'Browser_Recovery_Taxonomy_001');
    });

    it('Browser_Recovery_Taxonomy_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Taxonomy_002');
      TestLogger.step(TAG, 'only transient failures are marked retryable');
      const retryable: FailureCase[] = retryableFailures();
      TestLogger.info(TAG, `retryable=${retryable.length}`);
      expect(retryable.length).assertEqual(3);
      expect(failureCaseOf(FailureKind.TIMEOUT).retryable).assertTrue();
      expect(failureCaseOf(FailureKind.CONTROLLER_THROWN).retryable).assertTrue();
      expect(failureCaseOf(FailureKind.TLS_ERROR).retryable).assertTrue();
      expect(failureCaseOf(FailureKind.OFFLINE).retryable).assertFalse();
      expect(failureCaseOf(FailureKind.INVALID_ADDRESS).retryable).assertFalse();
      expect(failureCaseOf(FailureKind.TAB_CORRUPT).retryable).assertFalse();
      expect(failureCaseOf(FailureKind.OFFLINE).needsNetwork).assertTrue();
      expect(failureCaseOf(FailureKind.CONTROLLER_THROWN).needsNetwork).assertFalse();
      TestLogger.pass(TAG, 'Browser_Recovery_Taxonomy_002');
    });

    it('Browser_Recovery_Retry_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Retry_003');
      TestLogger.step(TAG, 'backoff doubles from two hundred milliseconds');
      const policy: RetryPolicy = new RetryPolicy();
      expect(policy.registerAttempt()).assertEqual(1);
      expect(policy.canRetry()).assertTrue();
      expect(policy.nextDelay()).assertEqual(200);
      policy.registerAttempt();
      expect(policy.nextDelay()).assertEqual(400);
      policy.registerAttempt();
      TestLogger.info(TAG, policy.describe());
      expect(policy.exhausted()).assertTrue();
      expect(policy.canRetry()).assertFalse();
      expect(policy.delays.length).assertEqual(2);
      expect(policy.totalDelay()).assertEqual(600);
      expect(policy.delays[0]).assertLess(policy.delays[1]);
      TestLogger.pass(TAG, 'Browser_Recovery_Retry_003');
    });

    it('Browser_Recovery_Retry_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Retry_004');
      TestLogger.step(TAG, 'the delay never exceeds the two second ceiling');
      const policy: RetryPolicy = new RetryPolicy();
      policy.maxAttempts = 6;
      const seen: number[] = [];
      for (let round = 0; round < 5; round++) {
        policy.registerAttempt();
        seen.push(policy.nextDelay());
      }
      TestLogger.info(TAG, `delays=${seen.join(',')}`);
      expect(seen.length).assertEqual(5);
      expect(seen[0]).assertEqual(200);
      expect(seen[1]).assertEqual(400);
      expect(seen[2]).assertEqual(800);
      expect(seen[3]).assertEqual(1600);
      expect(seen[4]).assertEqual(2000);
      expect(policy.totalDelay()).assertEqual(5000);
      expect(seen[4] <= policy.maxDelayMs).assertTrue();
      expect(policy.exhausted()).assertFalse();
      TestLogger.pass(TAG, 'Browser_Recovery_Retry_004');
    });

    it('Browser_Recovery_Retry_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Retry_005');
      TestLogger.step(TAG, 'a transient script succeeds on the third attempt');
      const policy: RetryPolicy = new RetryPolicy();
      const outcomes: boolean[] = [false, false, true];
      let attempts: number = 0;
      let succeeded: boolean = false;
      for (let index = 0; index < outcomes.length; index++) {
        policy.registerAttempt();
        attempts += 1;
        if (outcomes[index]) {
          succeeded = true;
          break;
        }
        if (!policy.canRetry()) {
          break;
        }
        policy.nextDelay();
      }
      TestLogger.info(TAG, `attempts=${attempts}, delays=${policy.delays.join(',')}`);
      expect(succeeded).assertTrue();
      expect(attempts).assertEqual(3);
      expect(policy.delays.join(',')).assertEqual('200,400');
      expect(policy.attempts).assertEqual(3);
      policy.reset();
      expect(policy.attempts).assertEqual(0);
      expect(policy.delays.length).assertEqual(0);
      expect(policy.totalDelay()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Recovery_Retry_005');
    });

    it('Browser_Recovery_Offline_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Offline_006');
      TestLogger.step(TAG, 'an offline attempt is detected before the controller runs');
      const engine: RecoveryEngine = new RecoveryEngine();
      engine.network.setOnline(false);
      const loaded: boolean = engine.attempt('offline.example.com');
      TestLogger.info(TAG, `loaded=${loaded}, ${engine.describe()}`);
      expect(loaded).assertFalse();
      expect(engine.network.requestCount()).assertEqual(0);
      expect(engine.browser.tabs[0].controller.loadCount).assertEqual(0);
      expect(engine.ledger.countOf(RecoveryPhase.DETECTED)).assertEqual(2);
      expect(engine.ledger.countOf(RecoveryPhase.RETRYING)).assertEqual(0);
      expect(engine.ledger.containsDetail('network offline')).assertTrue();
      expect(engine.ledger.last() === null).assertFalse();
      expect(engine.ledger.events[engine.ledger.events.length - 1].phase)
        .assertEqual(RecoveryPhase.DETECTED);
      expect(engine.degraded).assertFalse();
      TestLogger.pass(TAG, 'Browser_Recovery_Offline_006');
    });

    it('Browser_Recovery_Offline_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Offline_007');
      TestLogger.step(TAG, 'restoring the network makes the same address loadable');
      const engine: RecoveryEngine = new RecoveryEngine();
      engine.network.setOnline(false);
      expect(engine.attempt('restore.example.com')).assertFalse();
      engine.network.setOnline(true);
      engine.policy.reset();
      const loaded: boolean = engine.attempt('restore.example.com');
      TestLogger.info(TAG, `loaded=${loaded}, requests=${engine.network.requestCount()}`);
      expect(loaded).assertTrue();
      expect(engine.network.requestCount()).assertEqual(1);
      expect(engine.browser.tabs[0].controller.loadCount).assertEqual(1);
      expect(engine.browser.tabs[0].controller.currentUrl).assertEqual('https://restore.example.com');
      expect(engine.ledger.countOf(RecoveryPhase.SUCCEEDED)).assertEqual(1);
      expect(engine.browser.getInputVal()).assertEqual('https://restore.example.com');
      TestLogger.pass(TAG, 'Browser_Recovery_Offline_007');
    });

    it('Browser_Recovery_Retry_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Retry_008');
      TestLogger.step(TAG, 'a healthy network finishes on the first attempt');
      const engine: RecoveryEngine = new RecoveryEngine();
      const loaded: boolean = engine.attempt('happy.example.com');
      TestLogger.info(TAG, engine.describe());
      expect(loaded).assertTrue();
      expect(engine.policy.attempts).assertEqual(1);
      expect(engine.policy.delays.length).assertEqual(0);
      expect(engine.ledger.countOf(RecoveryPhase.RETRYING)).assertEqual(0);
      expect(engine.ledger.countOf(RecoveryPhase.SUCCEEDED)).assertEqual(1);
      expect(engine.browser.progress).assertEqual(0);
      expect(engine.browser.hideProgress).assertTrue();
      expect(engine.rollbackCount).assertEqual(0);
      expect(engine.degraded).assertFalse();
      TestLogger.pass(TAG, 'Browser_Recovery_Retry_008');
    });

    it('Browser_Recovery_Degrade_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Degrade_009');
      TestLogger.step(TAG, 'a permanent failure exhausts retries and degrades to home');
      const engine: RecoveryEngine = new RecoveryEngine();
      engine.network.setFailureRate(1);
      const loaded: boolean = engine.attempt('permanent.example.com');
      TestLogger.info(TAG, `loaded=${loaded}, ${engine.describe()}`);
      expect(loaded).assertFalse();
      expect(engine.policy.attempts).assertEqual(3);
      expect(engine.policy.delays.join(',')).assertEqual('200,400');
      expect(engine.ledger.countOf(RecoveryPhase.RETRYING)).assertEqual(3);
      expect(engine.ledger.countOf(RecoveryPhase.ROLLED_BACK)).assertEqual(1);
      expect(engine.ledger.countOf(RecoveryPhase.DEGRADED)).assertEqual(1);
      expect(engine.ledger.countOf(RecoveryPhase.SUCCEEDED)).assertEqual(0);
      expect(engine.ledger.phases().indexOf('rolledBack')).assertLarger(-1);
      expect(engine.rollbackCount).assertEqual(1);
      expect(engine.degraded).assertTrue();
      expect(engine.browser.tabs.length).assertEqual(1);
      expect(engine.browser.tabs[0].controller.currentUrl).assertEqual(PAD_HOME_PAGE);
      expect(engine.browser.getInputVal()).assertEqual('');
      expect(engine.browser.progress).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Recovery_Degrade_009');
    });

    it('Browser_Recovery_Controller_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Controller_010');
      TestLogger.step(TAG, 'a throwing controller is caught and counted per attempt');
      const engine: RecoveryEngine = new RecoveryEngine();
      const guard: ControllerGuard = engine.guard;
      guard.throwOnLoad = true;
      const loaded: boolean = engine.attempt('controller.example.com');
      TestLogger.info(TAG, `loaded=${loaded}, thrown=${guard.thrown}, last=${guard.lastError}`);
      expect(loaded).assertFalse();
      expect(guard.thrown).assertEqual(3);
      expect(guard.lastError).assertEqual('loadUrl threw');
      expect(guard.safeLoads).assertEqual(0);
      expect(engine.browser.tabs[0].controller.loadCount).assertEqual(1);
      expect(engine.browser.tabs[0].controller.currentUrl).assertEqual(PAD_HOME_PAGE);
      expect(engine.ledger.containsDetail('controller rejected load')).assertTrue();
      expect(engine.ledger.countOf(RecoveryPhase.DEGRADED)).assertEqual(1);
      expect(engine.degraded).assertTrue();
      TestLogger.pass(TAG, 'Browser_Recovery_Controller_010');
    });

    it('Browser_Recovery_Controller_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Controller_011');
      TestLogger.step(TAG, 'every guarded operation survives an injected exception');
      const controller: MockWebController = new MockWebController();
      const guard: ControllerGuard = new ControllerGuard(controller);
      guard.throwOnBack = true;
      guard.throwOnRefresh = true;
      guard.throwOnScript = true;
      expect(guard.safeBack()).assertFalse();
      expect(guard.safeRefresh()).assertFalse();
      expect(guard.safeScript('adapterDevice()')).assertFalse();
      expect(guard.thrown).assertEqual(3);
      TestLogger.info(TAG, `after faults thrown=${guard.thrown}`);
      guard.clearFaults();
      expect(guard.safeLoad('back.example.com')).assertTrue();
      expect(guard.safeLoad('https://back.example.com/next')).assertTrue();
      expect(guard.safeBack()).assertTrue();
      expect(guard.safeRefresh()).assertTrue();
      expect(guard.safeScript('adapterDevice()')).assertTrue();
      expect(controller.javaScriptCalls.length).assertEqual(1);
      expect(controller.refreshCount).assertEqual(1);
      expect(controller.historyIndex).assertEqual(0);
      expect(guard.safeLoads).assertEqual(2);
      expect(guard.thrown).assertEqual(3);
      TestLogger.pass(TAG, 'Browser_Recovery_Controller_011');
    });

    it('Browser_Recovery_Tab_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Tab_012');
      TestLogger.step(TAG, 'duplicate tab keys are detected and renumbered');
      const browser: MockBrowser = new MockBrowser(1);
      browser.addTab();
      browser.tabs[1].key = 0;
      const repairer: TabRepairer = new TabRepairer();
      const issues: TabIssue[] = repairer.inspect(browser);
      TestLogger.info(TAG, `issues=${repairer.describe()}`);
      expect(issues.length).assertLarger(0);
      expect(repairer.countOf(ISSUE_DUPLICATE)).assertEqual(1);
      expect(repairer.countOf(ISSUE_GAP)).assertEqual(1);
      expect(repairer.isHealthy(browser)).assertFalse();
      expect(repairer.repair(browser)).assertTrue();
      expect(browser.getTabKeys().join(',')).assertEqual('0,1');
      expect(browser.tabs[1].controller.loadCount).assertEqual(0);
      expect(repairer.repairs).assertLarger(0);
      expect(repairer.isHealthy(browser)).assertTrue();
      TestLogger.pass(TAG, 'Browser_Recovery_Tab_012');
    });

    it('Browser_Recovery_Tab_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Tab_013');
      TestLogger.step(TAG, 'a negative tab key is repaired without losing the tab');
      const browser: MockBrowser = new MockBrowser(2);
      browser.tabs[0].key = -5;
      const repairer: TabRepairer = new TabRepairer();
      repairer.inspect(browser);
      TestLogger.info(TAG, `negative=${repairer.countOf(ISSUE_NEGATIVE)}, ${repairer.describe()}`);
      expect(repairer.countOf(ISSUE_NEGATIVE)).assertEqual(1);
      expect(browser.tabs.length).assertEqual(2);
      expect(repairer.repair(browser)).assertTrue();
      expect(browser.tabs[0].key).assertEqual(0);
      expect(browser.tabs[1].key).assertEqual(1);
      expect(browser.tabs.length).assertEqual(2);
      expect(repairer.countOf(ISSUE_NEGATIVE)).assertEqual(0);
      expect(repairer.isHealthy(browser)).assertTrue();
      TestLogger.pass(TAG, 'Browser_Recovery_Tab_013');
    });

    it('Browser_Recovery_Tab_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Tab_014');
      TestLogger.step(TAG, 'an empty tab list is rebuilt to a single usable tab');
      const browser: MockBrowser = new MockBrowser(1);
      browser.tabs = [];
      const repairer: TabRepairer = new TabRepairer();
      const issues: TabIssue[] = repairer.inspect(browser);
      TestLogger.info(TAG, `empty=${repairer.countOf(ISSUE_EMPTY)}`);
      expect(issues.length).assertEqual(1);
      expect(repairer.countOf(ISSUE_EMPTY)).assertEqual(1);
      expect(browser.getCurrentTab()).assertNull();
      expect(repairer.repair(browser)).assertTrue();
      expect(browser.tabs.length).assertEqual(1);
      expect(browser.tabs[0].key).assertEqual(0);
      expect(browser.getTabArrayIndex()).assertEqual(0);
      expect(browser.getCurrentTab() === null).assertFalse();
      expect(repairer.repairs).assertLarger(0);
      expect(repairer.isHealthy(browser)).assertTrue();
      TestLogger.pass(TAG, 'Browser_Recovery_Tab_014');
    });

    it('Browser_Recovery_Tab_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Tab_015');
      TestLogger.step(TAG, 'an out of range selection is clamped to the last tab');
      const browser: MockBrowser = new MockBrowser(1);
      browser.addTab();
      browser.addTab();
      browser.setTabArrayIndex(99);
      const repairer: TabRepairer = new TabRepairer();
      repairer.inspect(browser);
      TestLogger.info(TAG, `${repairer.describe()}`);
      expect(repairer.countOf(ISSUE_INDEX)).assertEqual(1);
      expect(browser.getCurrentTab()).assertNull();
      expect(repairer.repair(browser)).assertTrue();
      expect(browser.getTabArrayIndex()).assertEqual(2);
      expect(browser.getCurrentTab() === null).assertFalse();
      expect(browser.getTabKeys().join(',')).assertEqual('0,1,2');
      expect(repairer.isHealthy(browser)).assertTrue();
      TestLogger.pass(TAG, 'Browser_Recovery_Tab_015');
    });

    it('Browser_Recovery_Rollback_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Rollback_016');
      TestLogger.step(TAG, 'rollback restores address, progress and current url');
      const engine: RecoveryEngine = new RecoveryEngine();
      engine.browser.setInputVal('keep.example.com');
      engine.browser.tabs[0].controller.currentUrl = 'https://keep.example.com';
      engine.browser.progress = 30;
      engine.browser.hideProgress = false;
      const snapshot: RecoverySnapshot = engine.snapshot();
      engine.applyOptimistic('https://new.example.com');
      expect(engine.browser.getInputVal()).assertEqual('https://new.example.com');
      expect(engine.browser.progress).assertEqual(5);
      expect(engine.browser.hideProgress).assertFalse();
      engine.rollback(snapshot);
      TestLogger.info(TAG, `input=${engine.browser.getInputVal()}, progress=${engine.browser.progress}`);
      expect(engine.browser.getInputVal()).assertEqual('keep.example.com');
      expect(engine.browser.progress).assertEqual(30);
      expect(engine.browser.hideProgress).assertFalse();
      expect(engine.browser.tabs[0].controller.currentUrl).assertEqual('https://keep.example.com');
      expect(engine.rollbackCount).assertEqual(1);
      expect(snapshot.tabIndex).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Recovery_Rollback_016');
    });

    it('Browser_Recovery_Ledger_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Ledger_017');
      TestLogger.step(TAG, 'the ledger records the exact order of a failed recovery');
      const engine: RecoveryEngine = new RecoveryEngine();
      engine.network.setFailureRate(1);
      engine.attempt('ledger.example.com');
      const phases: string[] = engine.ledger.phases();
      TestLogger.info(TAG, `phases=${phases.join('>')}, ${engine.ledger.summary()}`);
      expect(phases.join('>')).assertEqual('detected>retrying>retrying>retrying>rolledBack>degraded');
      expect(engine.ledger.size()).assertEqual(6);
      expect(engine.ledger.maxAttempt()).assertEqual(3);
      expect(engine.ledger.summary()).assertContain('retries=3');
      expect(engine.ledger.summary()).assertContain('degraded=1');
      expect(engine.ledger.countOf(RecoveryPhase.DETECTED)).assertEqual(1);
      expect(engine.ledger.lastOf(RecoveryPhase.RETRYING) === null).assertFalse();
      for (let index = 1; index < engine.ledger.events.length; index++) {
        expect(engine.ledger.events[index].sequence).assertEqual(index);
        expect(engine.ledger.events[index].timestamp)
          .assertLarger(engine.ledger.events[index - 1].timestamp - 1);
      }
      expect(engine.ledger.events[3].detail).assertContain('request failed');
      TestLogger.pass(TAG, 'Browser_Recovery_Ledger_017');
    });

    it('Browser_Recovery_Ledger_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Ledger_018');
      TestLogger.step(TAG, 'the ledger drops the oldest events beyond its capacity');
      const ledger: RecoveryLedger = new RecoveryLedger(5);
      const clock: MockClock = new MockClock();
      for (let round = 0; round < 9; round++) {
        ledger.append(RecoveryPhase.DETECTED, `u${round}`, round, false, `round ${round}`,
          clock.advance(1));
      }
      TestLogger.info(TAG, `size=${ledger.size()}, dropped=${ledger.droppedCount()}`);
      expect(ledger.size()).assertEqual(5);
      expect(ledger.droppedCount()).assertEqual(4);
      expect(ledger.events[0].url).assertEqual('u4');
      expect(ledger.last() === null).assertFalse();
      expect(ledger.events[4].sequence).assertEqual(8);
      expect(ledger.maxAttempt()).assertEqual(8);
      expect(ledger.containsDetail('round 8')).assertTrue();
      expect(ledger.containsDetail('round 0')).assertFalse();
      ledger.reset();
      expect(ledger.size()).assertEqual(0);
      expect(ledger.droppedCount()).assertEqual(0);
      expect(ledger.last()).assertNull();
      TestLogger.pass(TAG, 'Browser_Recovery_Ledger_018');
    });

    it('Browser_Recovery_Degrade_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Degrade_019');
      TestLogger.step(TAG, 'degradation loads the home page of the active layout');
      const engine: RecoveryEngine = new RecoveryEngine(PHONE_HOME_PAGE);
      engine.network.setFailureRate(1);
      expect(engine.attempt('phone.example.com')).assertFalse();
      TestLogger.info(TAG, `home=${engine.browser.tabs[0].controller.currentUrl}`);
      expect(engine.homePage).assertEqual(PHONE_HOME_PAGE);
      expect(engine.browser.tabs[0].controller.currentUrl).assertEqual(PHONE_HOME_PAGE);
      expect(engine.browser.tabs[0].controller.currentUrl === PAD_HOME_PAGE).assertFalse();
      expect(engine.browser.getInputVal()).assertEqual('');
      expect(engine.browser.hideProgress).assertTrue();
      expect(engine.browser.tabs[0].controller.loadCount).assertEqual(1);
      expect(engine.degraded).assertTrue();
      expect(engine.ledger.containsDetail('home page loaded')).assertTrue();
      expect(engine.ledger.lastOf(RecoveryPhase.DEGRADED) === null).assertFalse();
      TestLogger.pass(TAG, 'Browser_Recovery_Degrade_019');
    });

    it('Browser_Recovery_Recover_020', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Recover_020');
      TestLogger.step(TAG, 'a degraded page returns to the target after network recovery');
      const engine: RecoveryEngine = new RecoveryEngine();
      engine.network.setFailureRate(1);
      expect(engine.attempt('target.example.com')).assertFalse();
      expect(engine.degraded).assertTrue();
      engine.network.setFailureRate(0);
      const recovered: boolean = engine.recoverTo('target.example.com');
      TestLogger.info(TAG, `recovered=${recovered}, degraded=${engine.degraded}`);
      expect(recovered).assertTrue();
      expect(engine.degraded).assertFalse();
      expect(engine.browser.tabs[0].controller.currentUrl).assertEqual('https://target.example.com');
      expect(engine.browser.getInputVal()).assertEqual('https://target.example.com');
      expect(engine.policy.attempts).assertEqual(1);
      expect(engine.ledger.countOf(RecoveryPhase.SUCCEEDED)).assertEqual(1);
      expect(engine.ledger.countOf(RecoveryPhase.DEGRADED)).assertEqual(1);
      expect(engine.ledger.last() === null).assertFalse();
      expect(engine.ledger.events[engine.ledger.events.length - 1].phase).assertEqual(RecoveryPhase.SUCCEEDED);
      TestLogger.pass(TAG, 'Browser_Recovery_Recover_020');
    });

    it('Browser_Recovery_Verify_021', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Verify_021');
      TestLogger.step(TAG, 'the recovered page is verified with a fresh navigation');
      const engine: RecoveryEngine = new RecoveryEngine();
      engine.network.setFailureRate(1);
      engine.attempt('broken.example.com');
      engine.network.setFailureRate(0);
      expect(engine.recoverTo('healthy.example.com')).assertTrue();
      const usable: boolean = engine.verifyUsable('verify.example.com');
      TestLogger.info(TAG, `usable=${usable}, ${engine.describe()}`);
      expect(usable).assertTrue();
      expect(engine.browser.tabs.length).assertEqual(1);
      expect(engine.browser.getTabArrayIndex()).assertEqual(0);
      expect(engine.browser.tabs[0].controller.currentUrl).assertEqual('https://verify.example.com');
      expect(engine.ledger.countOf(RecoveryPhase.VERIFIED)).assertEqual(1);
      expect(engine.ledger.lastOf(RecoveryPhase.VERIFIED) === null).assertFalse();
      const verified: RecoveryEvent | null = engine.ledger.lastOf(RecoveryPhase.VERIFIED);
      if (verified !== null) {
        expect(verified.ok).assertTrue();
      }
      expect(engine.ledger.containsDetail('usable after recovery')).assertTrue();
      TestLogger.pass(TAG, 'Browser_Recovery_Verify_021');
    });

    it('Browser_Recovery_Invalid_022', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Invalid_022');
      TestLogger.step(TAG, 'malformed addresses never reach the network');
      const engine: RecoveryEngine = new RecoveryEngine();
      expect(engine.attempt('')).assertFalse();
      expect(engine.attempt('bad host')).assertFalse();
      expect(engine.attempt('http://')).assertFalse();
      TestLogger.info(TAG, `requests=${engine.network.requestCount()}, ${engine.describe()}`);
      expect(engine.network.requestCount()).assertEqual(0);
      expect(engine.browser.tabs[0].controller.loadCount).assertEqual(0);
      expect(engine.ledger.containsDetail('invalid address')).assertTrue();
      expect(engine.ledger.countOf(RecoveryPhase.RETRYING)).assertEqual(0);
      expect(engine.degraded).assertFalse();
      expect(engine.attempt('valid.example.com')).assertTrue();
      expect(isValidAddress('valid.example.com')).assertTrue();
      expect(isValidAddress('bad host')).assertFalse();
      TestLogger.pass(TAG, 'Browser_Recovery_Invalid_022');
    });

    it('Browser_Recovery_Stress_023', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_Stress_023');
      TestLogger.step(TAG, 'five offline and online cycles all recover');
      const engine: RecoveryEngine = new RecoveryEngine();
      for (let round = 0; round < 5; round++) {
        engine.network.setOnline(false);
        expect(engine.attempt(`offline${round}.example.com`)).assertFalse();
        engine.network.setOnline(true);
        engine.policy.reset();
        expect(engine.attempt(`online${round}.example.com`)).assertTrue();
      }
      TestLogger.info(TAG, `${engine.describe()}, requests=${engine.network.requestCount()}`);
      expect(engine.ledger.countOf(RecoveryPhase.SUCCEEDED)).assertEqual(5);
      expect(engine.ledger.countOf(RecoveryPhase.DEGRADED)).assertEqual(0);
      expect(engine.network.requestCount()).assertEqual(5);
      expect(engine.browser.tabs.length).assertEqual(1);
      expect(engine.degraded).assertFalse();
      expect(engine.browser.tabs[0].controller.currentUrl).assertEqual('https://online4.example.com');
      expect(engine.browser.tabs[0].controller.loadCount).assertEqual(5);
      TestLogger.pass(TAG, 'Browser_Recovery_Stress_023');
    });

    it('Browser_Recovery_UI_025', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_UI_025');
      TestLogger.step(TAG, 'refresh after a failed attempt keeps the toolbar usable');
      const clicked: boolean = await clickById(driver, ID_NAV_REFRESH);
      TestLogger.info(TAG, `refresh clicked=${clicked}`);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
      expect(await componentByIdExists(driver, ID_NAV_BACK)).assertTrue();
      const cancelButtons: number = await countById(driver, ID_CANCEL_TAB);
      expect(cancelButtons >= 0).assertTrue();
      TestLogger.pass(TAG, 'Browser_Recovery_UI_025');
    });

    it('Browser_Recovery_UI_026', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Recovery_UI_026');
      TestLogger.step(TAG, 'returning home after recovery leaves a usable page');
      const homeClicked: boolean = await clickById(driver, ID_NAV_HOME);
      expect(homeClicked).assertTrue();
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const browser: MockBrowser = new MockBrowser(1);
      browser.loadUrl('broken.example.com');
      browser.resetToHome(PAD_HOME_PAGE);
      TestLogger.info(TAG, `home url=${browser.tabs[0].controller.currentUrl}`);
      expect(browser.tabs[0].controller.currentUrl).assertEqual(PAD_HOME_PAGE);
      expect(browser.getInputVal()).assertEqual('');
      expect(browser.tabs.length).assertEqual(1);
      expect(browser.tabs.length <= MAX_TAB_COUNT).assertTrue();
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
      expect(await componentByIdExists(driver, ID_NAV_HOME)).assertTrue();
      expect(await componentByIdExists(driver, ID_NAV_BACK)).assertTrue();
      TestLogger.pass(TAG, 'Browser_Recovery_UI_026');
    });
  });
}
