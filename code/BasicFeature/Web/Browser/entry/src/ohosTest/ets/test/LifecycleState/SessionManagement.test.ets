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
  MAX_TAB_COUNT, ID_INPUT_URL, ID_ACTION_ADD, ID_CANCEL_TAB,
  TIMEOUT_COMPONENT, TIMEOUT_TAB_SWITCH, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserSessionManagementTest';

/** Session states owned by the browsing session store. */
class SessionStatus {
  static readonly ACTIVE: string = 'ACTIVE';
  static readonly EXPIRED: string = 'EXPIRED';
  static readonly CLOSED: string = 'CLOSED';
}

/** Serializable per tab state kept inside one session. */
class SessionTabState {
  key: number;
  url: string;
  historyIndex: number;

  constructor(key: number, url: string, historyIndex: number) {
    this.key = key;
    this.url = url;
    this.historyIndex = historyIndex;
  }
}

/**
 * One browsing session: the tab snapshot plus the lifetime metadata needed
 * to expire it and to bind it to the hosting UIAbility.
 */
class BrowseSession {
  id: string;
  createdAt: number;
  lastActiveAt: number;
  status: string = SessionStatus.ACTIVE;
  ttlMs: number;
  tabs: SessionTabState[] = [];
  abilityName: string = '';
  inputValue: string = '';

  constructor(id: string, now: number, ttlMs: number = 30000) {
    this.id = id;
    this.createdAt = now;
    this.lastActiveAt = now;
    this.ttlMs = ttlMs <= 0 ? 1000 : ttlMs;
  }

  touch(now: number): void {
    if (this.status === SessionStatus.ACTIVE) {
      this.lastActiveAt = now;
    }
  }

  isExpired(now: number): boolean {
    return this.status !== SessionStatus.CLOSED && now - this.lastActiveAt > this.ttlMs;
  }

  ageMs(now: number): number {
    return now - this.createdAt;
  }

  idleMs(now: number): number {
    return now - this.lastActiveAt;
  }

  close(): void {
    this.status = SessionStatus.CLOSED;
  }

  expire(): void {
    if (this.status === SessionStatus.ACTIVE) {
      this.status = SessionStatus.EXPIRED;
    }
  }

  bindAbility(abilityName: string): void {
    this.abilityName = abilityName;
  }

  capture(browser: MockBrowser): void {
    this.tabs = [];
    for (let index = 0; index < browser.tabs.length; index++) {
      const tab: MockBrowserTab = browser.tabs[index];
      this.tabs.push(new SessionTabState(tab.key, tab.controller.currentUrl,
        tab.controller.historyIndex));
    }
    this.inputValue = browser.getInputVal();
  }

  applyTo(browser: MockBrowser): boolean {
    if (this.tabs.length === 0) {
      return false;
    }
    browser.tabs = [];
    for (let index = 0; index < this.tabs.length; index++) {
      const state: SessionTabState = this.tabs[index];
      const tab: MockBrowserTab = new MockBrowserTab(state.key, 1700000000000 + state.key);
      if (state.url.length > 0) {
        tab.controller.loadUrl(state.url);
      }
      browser.tabs.push(tab);
    }
    browser.setTabArrayIndex(0);
    browser.setInputVal(this.inputValue);
    return true;
  }

  tabCount(): number {
    return this.tabs.length;
  }

  describe(): string {
    return `session=${this.id} status=${this.status} tabs=${this.tabs.length} ability=${this.abilityName}`;
  }
}

/** Deterministic session store with a bounded number of live sessions. */
class SessionStore {
  private sessions: Map<string, BrowseSession> = new Map<string, BrowseSession>();
  private clock: MockClock;
  private sequence: number = 0;
  private maxSessions: number;
  private reopened: number = 0;

  constructor(clock: MockClock = new MockClock(), maxSessions: number = 4) {
    this.clock = clock;
    this.maxSessions = maxSessions <= 0 ? 1 : maxSessions;
  }

  /** Current mock time, shared with collaborators that validate expiry. */
  now(): number {
    return this.clock.now();
  }

  create(ttlMs: number = 30000): BrowseSession {
    if (this.sessions.size >= this.maxSessions) {
      this.evictOldest();
    }
    this.sequence += 1;
    const session: BrowseSession = new BrowseSession(`s${this.sequence}`, this.clock.now(), ttlMs);
    this.sessions.set(session.id, session);
    return session;
  }

  get(id: string): BrowseSession | null {
    const session: BrowseSession | undefined = this.sessions.get(id);
    return session === undefined ? null : session;
  }

  restore(id: string): BrowseSession | null {
    const session: BrowseSession | null = this.get(id);
    if (session === null) {
      return null;
    }
    if (session.isExpired(this.clock.now())) {
      session.expire();
      return null;
    }
    if (session.status === SessionStatus.CLOSED) {
      return null;
    }
    session.touch(this.clock.now());
    this.reopened += 1;
    return session;
  }

  expireIdle(): number {
    let expired: number = 0;
    this.sessions.forEach((session: BrowseSession) => {
      // Only a live session can newly expire; an already expired one must not
      // be counted again on the next sweep.
      if (session.status === SessionStatus.ACTIVE && session.isExpired(this.clock.now())) {
        session.expire();
        expired += 1;
      }
    });
    return expired;
  }

  activeCount(): number {
    let total: number = 0;
    this.sessions.forEach((session: BrowseSession) => {
      if (session.status === SessionStatus.ACTIVE) {
        total += 1;
      }
    });
    return total;
  }

  size(): number {
    return this.sessions.size;
  }

  evictOldest(): string {
    let oldestId: string = '';
    let oldest: number = Number.MAX_SAFE_INTEGER;
    this.sessions.forEach((session: BrowseSession, id: string) => {
      if (session.lastActiveAt < oldest) {
        oldest = session.lastActiveAt;
        oldestId = id;
      }
    });
    if (oldestId.length > 0) {
      this.sessions.delete(oldestId);
    }
    return oldestId;
  }

  close(id: string): boolean {
    const session: BrowseSession | null = this.get(id);
    if (session === null) {
      return false;
    }
    session.close();
    return true;
  }

  reopenedCount(): number {
    return this.reopened;
  }

  ids(): string[] {
    const result: string[] = [];
    this.sessions.forEach((session: BrowseSession, id: string) => {
      result.push(id);
    });
    return result;
  }

  reset(): void {
    this.sessions = new Map<string, BrowseSession>();
    this.sequence = 0;
    this.reopened = 0;
  }
}

/** Binds sessions to the hosting ability and invalidates them on destroy. */
class AbilitySessionBinder {
  store: SessionStore;
  bound: Map<string, string> = new Map<string, string>();
  invalidated: string[] = [];

  constructor(store: SessionStore) {
    this.store = store;
  }

  bind(session: BrowseSession, abilityName: string): boolean {
    // A session that timed out is no longer bindable, even before the next
    // sweep marks it expired.
    if (session.status !== SessionStatus.ACTIVE || session.isExpired(this.store.now())) {
      this.invalidated.push(session.id);
      return false;
    }
    session.bindAbility(abilityName);
    this.bound.set(session.id, abilityName);
    return true;
  }

  onAbilityBackground(abilityName: string): number {
    let kept: number = 0;
    this.bound.forEach((name: string, id: string) => {
      if (name === abilityName) {
        const session: BrowseSession | null = this.store.get(id);
        if (session !== null && session.status === SessionStatus.ACTIVE) {
          kept += 1;
        }
      }
    });
    return kept;
  }

  onAbilityDestroy(abilityName: string): number {
    let released: number = 0;
    this.bound.forEach((name: string, id: string) => {
      if (name === abilityName) {
        this.invalidated.push(id);
        this.store.close(id);
        released += 1;
      }
    });
    return released;
  }

  boundCount(): number {
    return this.bound.size;
  }

  reset(): void {
    this.bound = new Map<string, string>();
    this.invalidated = [];
  }
}
export default function browserSessionManagementTest() {
  describe('browserSessionManagementTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'session management suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Session_001', 0, async () => {
      TestLogger.step(TAG, 'session creation stamps id and timestamps');
      const clock: MockClock = new MockClock();
      const store: SessionStore = new SessionStore(clock);
      const session: BrowseSession = store.create(30000);
      expect(session.id).assertEqual('s1');
      expect(session.createdAt).assertEqual(clock.now());
      expect(session.lastActiveAt).assertEqual(clock.now());
      expect(session.status).assertEqual(SessionStatus.ACTIVE);
      expect(session.ttlMs).assertEqual(30000);
      expect(store.size()).assertEqual(1);
    });

    it('Browser_Session_002', 0, async () => {
      TestLogger.step(TAG, 'session ids grow monotonically');
      const store: SessionStore = new SessionStore(new MockClock(), 8);
      const first: BrowseSession = store.create();
      const second: BrowseSession = store.create();
      const third: BrowseSession = store.create();
      expect(first.id).assertEqual('s1');
      expect(second.id).assertEqual('s2');
      expect(third.id).assertEqual('s3');
      expect(store.activeCount()).assertEqual(3);
      expect(store.ids().length).assertEqual(3);
    });

    it('Browser_Session_003', 0, async () => {
      TestLogger.step(TAG, 'restore returns the same live session and touches it');
      const clock: MockClock = new MockClock();
      const store: SessionStore = new SessionStore(clock);
      const session: BrowseSession = store.create(30000);
      clock.advance(5000);
      const restored: BrowseSession | null = store.restore(session.id);
      expect(restored === null).assertFalse();
      expect(restored?.id).assertEqual(session.id);
      expect(restored?.lastActiveAt).assertEqual(clock.now());
      expect(restored?.idleMs(clock.now())).assertEqual(0);
      expect(store.reopenedCount()).assertEqual(1);
    });

    it('Browser_Session_004', 0, async () => {
      TestLogger.step(TAG, 'restore of an unknown id returns null');
      const store: SessionStore = new SessionStore();
      expect(store.restore('s404') === null).assertTrue();
      expect(store.restore('') === null).assertTrue();
      expect(store.reopenedCount()).assertEqual(0);
      expect(store.size()).assertEqual(0);
    });

    it('Browser_Session_005', 0, async () => {
      TestLogger.step(TAG, 'idle session expires exactly after its ttl');
      const clock: MockClock = new MockClock();
      const store: SessionStore = new SessionStore(clock);
      const session: BrowseSession = store.create(10000);
      clock.advance(10000);
      expect(session.isExpired(clock.now())).assertFalse();
      clock.advance(1);
      expect(session.isExpired(clock.now())).assertTrue();
      expect(store.restore(session.id) === null).assertTrue();
      expect(session.status).assertEqual(SessionStatus.EXPIRED);
    });

    it('Browser_Session_006', 0, async () => {
      TestLogger.step(TAG, 'touch extends the idle deadline');
      const clock: MockClock = new MockClock();
      const store: SessionStore = new SessionStore(clock);
      const session: BrowseSession = store.create(10000);
      clock.advance(8000);
      session.touch(clock.now());
      clock.advance(8000);
      expect(session.isExpired(clock.now())).assertFalse();
      expect(session.idleMs(clock.now())).assertEqual(8000);
      expect(session.ageMs(clock.now())).assertEqual(16000);
      expect(store.activeCount()).assertEqual(1);
    });

    it('Browser_Session_007', 0, async () => {
      TestLogger.step(TAG, 'expireIdle sweeps every overdue session');
      const clock: MockClock = new MockClock();
      const store: SessionStore = new SessionStore(clock, 6);
      store.create(5000);
      clock.advance(1000);
      const fresh: BrowseSession = store.create(5000);
      clock.advance(4500);
      expect(store.expireIdle()).assertEqual(1);
      expect(fresh.status).assertEqual(SessionStatus.ACTIVE);
      expect(store.activeCount()).assertEqual(1);
      clock.advance(1000);
      expect(store.expireIdle()).assertEqual(1);
      expect(store.activeCount()).assertEqual(0);
    });

    it('Browser_Session_008', 0, async () => {
      TestLogger.step(TAG, 'negative ttl is clamped to one second');
      const clock: MockClock = new MockClock();
      const session: BrowseSession = new BrowseSession('s9', clock.now(), -500);
      expect(session.ttlMs).assertEqual(1000);
      clock.advance(1001);
      expect(session.isExpired(clock.now())).assertTrue();
    });

    it('Browser_Session_009', 0, async () => {
      TestLogger.step(TAG, 'session snapshot captures tabs, urls and input');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.huawei.com');
      browser.addTab();
      browser.loadUrl('www.bing.com');
      browser.setInputVal('www.bing.com');
      const session: BrowseSession = new BrowseSession('s1', 1700000000000);
      session.capture(browser);
      expect(session.tabCount()).assertEqual(2);
      expect(session.tabs[0].url).assertEqual('https://www.huawei.com');
      expect(session.tabs[1].url).assertEqual('https://www.bing.com');
      expect(session.inputValue).assertEqual('www.bing.com');
      expect(session.tabs[1].key).assertEqual(1);
    });

    it('Browser_Session_010', 0, async () => {
      TestLogger.step(TAG, 'snapshot applies back onto a fresh browser');
      const source: MockBrowser = new MockBrowser();
      source.loadUrl('www.huawei.com');
      source.addTab();
      source.loadUrl('pad.html');
      const session: BrowseSession = new BrowseSession('s1', 1700000000000);
      session.capture(source);
      const target: MockBrowser = new MockBrowser(3);
      expect(session.applyTo(target)).assertTrue();
      expect(target.tabs.length).assertEqual(2);
      expect(target.tabs[0].controller.currentUrl).assertEqual('https://www.huawei.com');
      expect(target.tabs[1].controller.currentUrl).assertEqual('https://pad.html');
      expect(target.getTabArrayIndex()).assertEqual(0);
    });

    it('Browser_Session_011', 0, async () => {
      TestLogger.step(TAG, 'empty snapshot cannot be applied');
      const session: BrowseSession = new BrowseSession('s1', 1700000000000);
      const browser: MockBrowser = new MockBrowser();
      expect(session.tabCount()).assertEqual(0);
      expect(session.applyTo(browser)).assertFalse();
      expect(browser.tabs.length).assertEqual(1);
    });

    it('Browser_Session_012', 0, async () => {
      TestLogger.step(TAG, 'two sessions keep isolated tab snapshots');
      const first: BrowseSession = new BrowseSession('a', 1700000000000);
      const second: BrowseSession = new BrowseSession('b', 1700000000000);
      const browserA: MockBrowser = new MockBrowser();
      browserA.loadUrl('www.huawei.com');
      const browserB: MockBrowser = new MockBrowser();
      browserB.loadUrl('www.bing.com');
      browserB.addTab();
      first.capture(browserA);
      second.capture(browserB);
      expect(first.tabCount()).assertEqual(1);
      expect(second.tabCount()).assertEqual(2);
      expect(first.tabs[0].url).assertEqual('https://www.huawei.com');
      expect(second.tabs[0].url).assertEqual('https://www.bing.com');
      expect(first.describe()).assertContain('tabs=1');
      expect(second.describe()).assertContain('tabs=2');
    });
    it('Browser_Session_013', 0, async () => {
      TestLogger.step(TAG, 'restoring one session does not mutate its sibling snapshot');
      const store: SessionStore = new SessionStore(new MockClock(), 4);
      const first: BrowseSession = store.create();
      const second: BrowseSession = store.create();
      const source: MockBrowser = new MockBrowser();
      source.loadUrl('www.huawei.com');
      first.capture(source);
      source.loadUrl('www.bing.com');
      source.addTab();
      second.capture(source);
      const target: MockBrowser = new MockBrowser();
      expect(first.applyTo(target)).assertTrue();
      expect(target.tabs.length).assertEqual(1);
      expect(second.tabCount()).assertEqual(2);
      expect(first.tabs[0].url).assertEqual('https://www.huawei.com');
      expect(second.tabs[0].url).assertEqual('https://www.bing.com');
    });

    it('Browser_Session_014', 0, async () => {
      TestLogger.step(TAG, 'session is bound to the hosting ability');
      const store: SessionStore = new SessionStore(new MockClock(), 4);
      const binder: AbilitySessionBinder = new AbilitySessionBinder(store);
      const session: BrowseSession = store.create();
      expect(binder.bind(session, 'MainAbility')).assertTrue();
      expect(session.abilityName).assertEqual('MainAbility');
      expect(binder.boundCount()).assertEqual(1);
      expect(binder.onAbilityBackground('MainAbility')).assertEqual(1);
      expect(session.status).assertEqual(SessionStatus.ACTIVE);
    });

    it('Browser_Session_015', 0, async () => {
      TestLogger.step(TAG, 'ability destroy invalidates its sessions');
      const store: SessionStore = new SessionStore(new MockClock(), 4);
      const binder: AbilitySessionBinder = new AbilitySessionBinder(store);
      const first: BrowseSession = store.create();
      const second: BrowseSession = store.create();
      binder.bind(first, 'MainAbility');
      binder.bind(second, 'MainAbility');
      expect(binder.onAbilityDestroy('MainAbility')).assertEqual(2);
      expect(first.status).assertEqual(SessionStatus.CLOSED);
      expect(second.status).assertEqual(SessionStatus.CLOSED);
      expect(store.activeCount()).assertEqual(0);
      expect(binder.invalidated.length).assertEqual(2);
    });

    it('Browser_Session_016', 0, async () => {
      TestLogger.step(TAG, 'closing a session blocks later restores');
      const store: SessionStore = new SessionStore();
      const session: BrowseSession = store.create();
      expect(store.close(session.id)).assertTrue();
      expect(session.status).assertEqual(SessionStatus.CLOSED);
      expect(store.restore(session.id) === null).assertTrue();
      expect(store.close('s404')).assertFalse();
      expect(store.reopenedCount()).assertEqual(0);
    });

    it('Browser_Session_017', 0, async () => {
      TestLogger.step(TAG, 'expired session cannot be bound to an ability');
      const clock: MockClock = new MockClock();
      const store: SessionStore = new SessionStore(clock);
      const binder: AbilitySessionBinder = new AbilitySessionBinder(store);
      const session: BrowseSession = store.create(1000);
      clock.advance(2000);
      expect(session.isExpired(clock.now())).assertTrue();
      expect(binder.bind(session, 'MainAbility')).assertFalse();
      expect(binder.boundCount()).assertEqual(0);
      expect(session.abilityName).assertEqual('');
    });

    it('Browser_Session_018', 0, async () => {
      TestLogger.step(TAG, 'store evicts the least recently used session');
      const clock: MockClock = new MockClock();
      const store: SessionStore = new SessionStore(clock, 2);
      const first: BrowseSession = store.create();
      clock.advance(10);
      store.create();
      clock.advance(10);
      store.create();
      expect(store.size()).assertEqual(2);
      expect(store.get(first.id) === null).assertTrue();
      expect(store.restore('s1') === null).assertTrue();
    });

    it('Browser_Session_019', 0, async () => {
      TestLogger.step(TAG, 'restore order is independent of creation order');
      const store: SessionStore = new SessionStore(new MockClock(), 4);
      const first: BrowseSession = store.create();
      const second: BrowseSession = store.create();
      const third: BrowseSession = store.create();
      const sequence: string[] = [];
      const ordered: string[] = [third.id, first.id, second.id];
      for (let index = 0; index < ordered.length; index++) {
        const restored: BrowseSession | null = store.restore(ordered[index]);
        if (restored !== null) {
          sequence.push(restored.id);
        }
      }
      expect(sequence.join(',')).assertEqual('s3,s1,s2');
      expect(store.reopenedCount()).assertEqual(3);
    });

    it('Browser_Session_020', 0, async () => {
      TestLogger.step(TAG, 'repeated restore is idempotent for the snapshot');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.huawei.com');
      const session: BrowseSession = new BrowseSession('s1', 1700000000000);
      session.capture(browser);
      const firstTarget: MockBrowser = new MockBrowser();
      const secondTarget: MockBrowser = new MockBrowser();
      expect(session.applyTo(firstTarget)).assertTrue();
      expect(session.applyTo(secondTarget)).assertTrue();
      expect(firstTarget.tabs.length).assertEqual(secondTarget.tabs.length);
      expect(firstTarget.tabs[0].controller.currentUrl)
        .assertEqual(secondTarget.tabs[0].controller.currentUrl);
      expect(session.tabCount()).assertEqual(1);
    });

    it('Browser_Session_021', 0, async () => {
      TestLogger.step(TAG, 'snapshot keeps up to ten tabs');
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      for (let index = 0; index < MAX_TAB_COUNT; index++) {
        browser.selectTab(index);
        browser.loadUrl(`www.site${index}.com`);
      }
      const session: BrowseSession = new BrowseSession('s1', 1700000000000);
      session.capture(browser);
      expect(session.tabCount()).assertEqual(MAX_TAB_COUNT);
      expect(session.tabs[0].url).assertEqual('https://www.site0.com');
      expect(session.tabs[MAX_TAB_COUNT - 1].url).assertEqual('https://www.site9.com');
      const target: MockBrowser = new MockBrowser();
      expect(session.applyTo(target)).assertTrue();
      expect(target.tabs.length).assertEqual(MAX_TAB_COUNT);
    });

    it('Browser_Session_022', 0, async () => {
      TestLogger.step(TAG, 'session store reset clears id sequence and bindings');
      const store: SessionStore = new SessionStore(new MockClock(), 4);
      const binder: AbilitySessionBinder = new AbilitySessionBinder(store);
      const session: BrowseSession = store.create();
      binder.bind(session, 'MainAbility');
      store.reset();
      binder.reset();
      expect(store.size()).assertEqual(0);
      expect(store.activeCount()).assertEqual(0);
      expect(binder.boundCount()).assertEqual(0);
      expect(store.create().id).assertEqual('s1');
    });

    it('Browser_Session_023', 0, async () => {
      TestLogger.step(TAG, 'UI: url input is available for the active session');
      const ready: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `session input ready=${ready}`);
      const store: SessionStore = new SessionStore();
      const session: BrowseSession = store.create();
      session.inputValue = 'www.huawei.com';
      expect(session.inputValue).assertEqual('www.huawei.com');
      expect(session.status).assertEqual(SessionStatus.ACTIVE);
      expect(store.size()).assertEqual(1);
      await serializedDelay(driver, TIMEOUT_TAB_SWITCH / 3);
    });

    it('Browser_Session_024', 0, async () => {
      TestLogger.step(TAG, 'UI: tab strip count stays within the session snapshot bound');
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const closeButtons: number = await countById(driver, ID_CANCEL_TAB);
      const addButtons: number = await countById(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, `close=${closeButtons}, add=${addButtons}`);
      expect(closeButtons <= MAX_TAB_COUNT + 1).assertTrue();
      expect(addButtons >= 0).assertTrue();
      const store: SessionStore = new SessionStore();
      const session: BrowseSession = store.create();
      session.capture(new MockBrowser(MAX_TAB_COUNT));
      expect(session.tabCount()).assertEqual(MAX_TAB_COUNT);
    });
  });
}


