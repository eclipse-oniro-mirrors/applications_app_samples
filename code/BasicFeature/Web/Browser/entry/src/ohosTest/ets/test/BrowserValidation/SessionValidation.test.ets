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
    getDriver, startBrowserApp, componentByIdExists, clickById, textById, serializedDelay,
    ID_INPUT_URL, ID_NAV_BACK, ID_ACTION_ADD, ID_CANCEL_TAB,
    MAX_TAB_COUNT, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserSessionValidationTest';

/* ------------------------------------------------------------------ */
/* Session vocabulary                                                  */
/* ------------------------------------------------------------------ */

const STATE_ACTIVE: string = 'ACTIVE';
const STATE_EXPIRED: string = 'EXPIRED';
const STATE_DESTROYED: string = 'DESTROYED';

const ERROR_NONE: string = '';
const ERROR_ID: string = 'sessionId';
const ERROR_EXPIRED: string = 'sessionExpired';
const ERROR_DESTROYED: string = 'sessionDestroyed';
const ERROR_EMPTY: string = 'emptyTabList';
const ERROR_TOO_MANY: string = 'tabLimit';
const ERROR_DUPLICATE_KEY: string = 'duplicateKey';
const ERROR_SCHEME: string = 'invalidScheme';
const ERROR_CHECKSUM: string = 'checksumMismatch';

const DEFAULT_TTL_MS: number = 30000;
const MAX_SESSION_TABS: number = MAX_TAB_COUNT + 1;
const REGISTRY_CAPACITY: number = 4;
const URL_PREFIX: string = 'https://';

/** Per tab state that a session has to reproduce exactly. */
class SessionTabSnapshot {
    key: number;
    url: string;
    historyIndex: number;
    history: string[] = [];

    constructor(key: number, url: string, historyIndex: number) {
        this.key = key;
        this.url = url;
        this.historyIndex = historyIndex;
    }

    isHistoryConsistent(): boolean {
        if (this.history.length === 0) {
            return false;
        }
        if (this.historyIndex < 0 || this.historyIndex >= this.history.length) {
            return false;
        }
        return this.history[this.historyIndex] === this.url;
    }

    describe(): string {
        return `key=${this.key} url=${this.url} index=${this.historyIndex}`;
    }
}

/** Immutable-enough browsing session captured from the live tab list. */
class SessionSnapshot {
    id: string;
    revision: number;
    createdAt: number;
    lastActiveAt: number;
    ttlMs: number;
    state: string = STATE_ACTIVE;
    tabs: SessionTabSnapshot[] = [];
    inputValue: string = '';
    activeIndex: number = 0;
    checksum: string = '';

    constructor(id: string, revision: number, createdAt: number, ttlMs: number = DEFAULT_TTL_MS) {
        this.id = id;
        this.revision = revision;
        this.createdAt = createdAt;
        this.lastActiveAt = createdAt;
        this.ttlMs = ttlMs <= 0 ? 1000 : ttlMs;
    }

    tabCount(): number {
        return this.tabs.length;
    }

    isExpired(now: number): boolean {
        return now - this.lastActiveAt > this.ttlMs;
    }

    idleMs(now: number): number {
        return now - this.lastActiveAt;
    }

    touch(now: number): void {
        if (this.state === STATE_ACTIVE) {
            this.lastActiveAt = now;
        }
    }

    expire(): void {
        if (this.state === STATE_ACTIVE) {
            this.state = STATE_EXPIRED;
        }
    }

    destroy(): void {
        this.state = STATE_DESTROYED;
    }

    keys(): number[] {
        return this.tabs.map((tab: SessionTabSnapshot) => tab.key);
    }

    urls(): string[] {
        return this.tabs.map((tab: SessionTabSnapshot) => tab.url);
    }

    /** djb2 hash over the replayable content of the session. */
    computeChecksum(): string {
        let source: string = `${this.id}|${this.revision}|${this.inputValue}|${this.activeIndex}`;
        for (let index = 0; index < this.tabs.length; index++) {
            const tab: SessionTabSnapshot = this.tabs[index];
            source += `|${tab.key}:${tab.url}:${tab.historyIndex}:${tab.history.join('>')}`;
        }
        let hash: number = 5381;
        for (let index = 0; index < source.length; index++) {
            hash = (hash * 33 + source.charCodeAt(index)) % 2147483647;
        }
        return `chk_${hash}`;
    }

    seal(): string {
        this.checksum = this.computeChecksum();
        return this.checksum;
    }

    describe(): string {
        return `session=${this.id} rev=${this.revision} state=${this.state} tabs=${this.tabCount()}`;
    }
}

/**
 * Ordered validation rules of a restored session.
 *
 * The order is part of the contract: a destroyed session is reported before
 * the checksum is inspected, so the caller never sees a misleading mismatch.
 */
class SessionValidator {
    validate(snapshot: SessionSnapshot | null, now: number): string {
        if (snapshot === null) {
            return ERROR_ID;
        }
        if (snapshot.id.length === 0) {
            return ERROR_ID;
        }
        if (snapshot.state === STATE_DESTROYED) {
            return ERROR_DESTROYED;
        }
        if (snapshot.state === STATE_EXPIRED || snapshot.isExpired(now)) {
            return ERROR_EXPIRED;
        }
        if (snapshot.tabCount() === 0) {
            return ERROR_EMPTY;
        }
        if (snapshot.tabCount() > MAX_SESSION_TABS) {
            return ERROR_TOO_MANY;
        }
        const seen: number[] = [];
        for (let index = 0; index < snapshot.tabs.length; index++) {
            const tab: SessionTabSnapshot = snapshot.tabs[index];
            if (seen.indexOf(tab.key) >= 0) {
                return ERROR_DUPLICATE_KEY;
            }
            seen.push(tab.key);
            if (tab.url.length > 0 && tab.url.indexOf(URL_PREFIX) !== 0) {
                return ERROR_SCHEME;
            }
        }
        if (snapshot.computeChecksum() !== snapshot.checksum) {
            return ERROR_CHECKSUM;
        }
        return ERROR_NONE;
    }

    isAccepted(snapshot: SessionSnapshot | null, now: number): boolean {
        return this.validate(snapshot, now) === ERROR_NONE;
    }
}
/** Bounded session store with validation, expiry and atomic restore. */
class SessionRegistry {
    snapshots: SessionSnapshot[] = [];
    capacity: number;
    nextRevision: number = 1;
    restored: number = 0;
    rejected: number = 0;
    evicted: number = 0;
    rejectionReasons: string[] = [];
    validator: SessionValidator = new SessionValidator();

    constructor(capacity: number = REGISTRY_CAPACITY) {
        this.capacity = capacity <= 0 ? 1 : capacity;
    }

    size(): number {
        return this.snapshots.length;
    }

    activeCount(): number {
        let total: number = 0;
        for (let index = 0; index < this.snapshots.length; index++) {
            if (this.snapshots[index].state === STATE_ACTIVE) {
                total += 1;
            }
        }
        return total;
    }

    get(id: string): SessionSnapshot | null {
        for (let index = 0; index < this.snapshots.length; index++) {
            if (this.snapshots[index].id === id) {
                return this.snapshots[index];
            }
        }
        return null;
    }

    captureInto(snapshot: SessionSnapshot, browser: MockBrowser): void {
        snapshot.tabs = [];
        snapshot.inputValue = browser.getInputVal();
        snapshot.activeIndex = browser.getTabArrayIndex();
        for (let index = 0; index < browser.tabs.length; index++) {
            const tab: MockBrowserTab = browser.tabs[index];
            const captured: SessionTabSnapshot = new SessionTabSnapshot(tab.key,
                tab.controller.currentUrl, tab.controller.historyIndex);
            captured.history = tab.controller.history.slice(0);
            snapshot.tabs.push(captured);
        }
        snapshot.seal();
    }

    create(browser: MockBrowser, now: number, ttlMs: number = DEFAULT_TTL_MS): SessionSnapshot {
        const snapshot: SessionSnapshot = new SessionSnapshot(`s${this.nextRevision}`,
            this.nextRevision, now, ttlMs);
        this.nextRevision += 1;
        this.captureInto(snapshot, browser);
        this.snapshots.push(snapshot);
        while (this.snapshots.length > this.capacity) {
            this.snapshots.splice(0, 1);
            this.evicted += 1;
        }
        return snapshot;
    }

    /** Rebuilds the tab list off to the side, then swaps it in one step. */
    private apply(snapshot: SessionSnapshot, browser: MockBrowser): void {
        const rebuilt: MockBrowserTab[] = [];
        for (let index = 0; index < snapshot.tabs.length; index++) {
            const state: SessionTabSnapshot = snapshot.tabs[index];
            const tab: MockBrowserTab = new MockBrowserTab(state.key, 1700000000000 + state.key);
            if (state.url.length > 0) {
                tab.controller.loadUrl(state.url);
            }
            tab.controller.history = state.history.slice(0);
            tab.controller.historyIndex = state.historyIndex;
            tab.controller.currentUrl = state.url;
            rebuilt.push(tab);
        }
        browser.tabs = rebuilt;
        const target: number = snapshot.activeIndex < rebuilt.length ?
            snapshot.activeIndex : rebuilt.length - 1;
        browser.setTabArrayIndex(target < 0 ? 0 : target);
        browser.setInputVal(snapshot.inputValue);
    }

    restore(id: string, browser: MockBrowser, now: number): boolean {
        const snapshot: SessionSnapshot | null = this.get(id);
        const reason: string = this.validator.validate(snapshot, now);
        if (reason !== ERROR_NONE) {
            this.rejected += 1;
            this.rejectionReasons.push(reason);
            return false;
        }
        if (snapshot === null) {
            return false;
        }
        this.apply(snapshot, browser);
        snapshot.touch(now);
        this.restored += 1;
        return true;
    }

    destroy(id: string): boolean {
        const snapshot: SessionSnapshot | null = this.get(id);
        if (snapshot === null) {
            return false;
        }
        snapshot.destroy();
        return true;
    }

    expireIdle(now: number): number {
        let expired: number = 0;
        for (let index = 0; index < this.snapshots.length; index++) {
            const snapshot: SessionSnapshot = this.snapshots[index];
            if (snapshot.state === STATE_ACTIVE && snapshot.isExpired(now)) {
                snapshot.expire();
                expired += 1;
            }
        }
        return expired;
    }

    reasonsJoined(): string {
        return this.rejectionReasons.join('|');
    }

    describe(): string {
        return `sessions=${this.size()} restored=${this.restored} rejected=${this.rejected} evicted=${this.evicted}`;
    }
}
/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserSessionValidationTest() {
    describe('browserSessionValidationTest', () => {
        let driver: Driver = getDriver();

        beforeAll(async () => {
            TestLogger.info(TAG, 'suite begin');
            await startBrowserApp();
        });

        afterAll(() => {
            TestLogger.info(TAG, TestLogger.summary(TAG));
        });

        it('Browser_SessionV_001', 0, async () => {
            TestLogger.step(TAG, 'create captures two tabs and seals a checksum');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            browser.addTab();
            browser.loadUrl('www.bing.com');
            browser.setInputVal('www.bing.com');
            const registry: SessionRegistry = new SessionRegistry();
            const snapshot: SessionSnapshot = registry.create(browser, 1000);
            expect(snapshot.id).assertEqual('s1');
            expect(snapshot.revision).assertEqual(1);
            expect(snapshot.tabCount()).assertEqual(2);
            expect(snapshot.state).assertEqual(STATE_ACTIVE);
            expect(snapshot.tabs[0].url).assertEqual('https://www.sample.com');
            expect(snapshot.tabs[1].url).assertEqual('https://www.bing.com');
            expect(snapshot.inputValue).assertEqual('www.bing.com');
            expect(snapshot.checksum.indexOf('chk_')).assertEqual(0);
            expect(snapshot.checksum).assertEqual(snapshot.computeChecksum());
            expect(snapshot.keys().join(',')).assertEqual('0,1');
            expect(registry.size()).assertEqual(1);
            expect(registry.activeCount()).assertEqual(1);
        });

        it('Browser_SessionV_002', 0, async () => {
            TestLogger.step(TAG, 'checksum is stable for identical content');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            const registry: SessionRegistry = new SessionRegistry();
            const snapshot: SessionSnapshot = registry.create(browser, 1100);
            const sealed: string = snapshot.checksum;
            expect(snapshot.computeChecksum()).assertEqual(sealed);
            registry.captureInto(snapshot, browser);
            expect(snapshot.checksum).assertEqual(sealed);
            expect(snapshot.computeChecksum()).assertEqual(sealed);
            expect(snapshot.tabCount()).assertEqual(1);
            expect(snapshot.tabs[0].historyIndex).assertEqual(0);
            expect(snapshot.tabs[0].history.length).assertEqual(1);
        });

        it('Browser_SessionV_003', 0, async () => {
            TestLogger.step(TAG, 'checksum changes as soon as a tab url changes');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            const registry: SessionRegistry = new SessionRegistry();
            const snapshot: SessionSnapshot = registry.create(browser, 1200);
            const before: string = snapshot.checksum;
            snapshot.tabs[0].url = 'https://www.bing.com';
            expect(snapshot.computeChecksum() === before).assertFalse();
            snapshot.tabs[0].url = 'https://www.sample.com';
            expect(snapshot.computeChecksum()).assertEqual(before);
            snapshot.activeIndex = 0;
            snapshot.inputValue = 'changed';
            expect(snapshot.computeChecksum() === before).assertFalse();
        });

        it('Browser_SessionV_004', 0, async () => {
            TestLogger.step(TAG, 'valid session restores into a fresh browser');
            const source: MockBrowser = new MockBrowser();
            source.loadUrl('www.sample.com');
            source.addTab();
            source.loadUrl('www.bing.com');
            source.setInputVal('www.bing.com');
            const registry: SessionRegistry = new SessionRegistry();
            const snapshot: SessionSnapshot = registry.create(source, 1300);
            const target: MockBrowser = new MockBrowser(1);
            expect(target.tabs.length).assertEqual(1);
            expect(registry.restore(snapshot.id, target, 1400)).assertTrue();
            expect(target.tabs.length).assertEqual(2);
            expect(target.tabs[0].controller.currentUrl).assertEqual('https://www.sample.com');
            expect(target.tabs[1].controller.currentUrl).assertEqual('https://www.bing.com');
            expect(target.getInputVal()).assertEqual('www.bing.com');
            expect(registry.restored).assertEqual(1);
            expect(registry.rejected).assertEqual(0);
        });

        it('Browser_SessionV_005', 0, async () => {
            TestLogger.step(TAG, 'restore keeps the active tab index and history');
            const source: MockBrowser = new MockBrowser();
            source.loadUrl('www.sample.com');
            source.addTab();
            source.loadUrl('www.bing.com');
            source.loadUrl('www.sample.com');
            source.back();
            source.setTabArrayIndex(1);
            const registry: SessionRegistry = new SessionRegistry();
            const snapshot: SessionSnapshot = registry.create(source, 1500);
            expect(snapshot.activeIndex).assertEqual(1);
            expect(snapshot.tabs[1].history.length).assertEqual(2);
            expect(snapshot.tabs[1].historyIndex).assertEqual(0);
            const target: MockBrowser = new MockBrowser();
            expect(registry.restore(snapshot.id, target, 1600)).assertTrue();
            expect(target.getTabArrayIndex()).assertEqual(1);
            expect(target.tabs[1].controller.currentUrl).assertEqual('https://www.bing.com');
            expect(target.tabs[1].controller.historyIndex).assertEqual(0);
            expect(target.tabs[1].controller.accessForward()).assertTrue();
        });

        it('Browser_SessionV_006', 0, async () => {
            TestLogger.step(TAG, 'expired session is rejected and mutates nothing');
            const clock: MockClock = new MockClock(1700000000000);
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            const registry: SessionRegistry = new SessionRegistry();
            const snapshot: SessionSnapshot = registry.create(browser, clock.now(), 1000);
            clock.advance(1500);
            expect(snapshot.isExpired(clock.now())).assertTrue();
            expect(registry.validator.validate(snapshot, clock.now())).assertEqual(ERROR_EXPIRED);
            const target: MockBrowser = new MockBrowser();
            expect(registry.restore(snapshot.id, target, clock.now())).assertFalse();
            expect(target.tabs.length).assertEqual(1);
            expect(target.tabs[0].controller.currentUrl).assertEqual('');
            expect(registry.rejected).assertEqual(1);
            expect(registry.reasonsJoined()).assertEqual(ERROR_EXPIRED);
        });

        it('Browser_SessionV_007', 0, async () => {
            TestLogger.step(TAG, 'destroyed session is rejected before the checksum check');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            const registry: SessionRegistry = new SessionRegistry();
            const snapshot: SessionSnapshot = registry.create(browser, 1700);
            registry.destroy(snapshot.id);
            snapshot.checksum = 'tampered';
            expect(snapshot.state).assertEqual(STATE_DESTROYED);
            expect(registry.validator.validate(snapshot, 1800)).assertEqual(ERROR_DESTROYED);
            expect(registry.restore(snapshot.id, browser, 1800)).assertFalse();
            expect(snapshot.state).assertEqual(STATE_DESTROYED);
            expect(registry.destroy('s404')).assertFalse();
            expect(registry.rejected).assertEqual(1);
        });

        it('Browser_SessionV_008', 0, async () => {
            TestLogger.step(TAG, 'session without tabs is not restorable');
            const snapshot: SessionSnapshot = new SessionSnapshot('empty', 9, 1900);
            snapshot.seal();
            const validator: SessionValidator = new SessionValidator();
            expect(snapshot.tabCount()).assertEqual(0);
            expect(validator.validate(snapshot, 2000)).assertEqual(ERROR_EMPTY);
            expect(validator.isAccepted(snapshot, 2000)).assertFalse();
            const registry: SessionRegistry = new SessionRegistry();
            registry.snapshots.push(snapshot);
            const browser: MockBrowser = new MockBrowser();
            expect(registry.restore('empty', browser, 2000)).assertFalse();
            expect(browser.tabs.length).assertEqual(1);
        });

        it('Browser_SessionV_009', 0, async () => {
            TestLogger.step(TAG, 'duplicate tab keys are rejected');
            const snapshot: SessionSnapshot = new SessionSnapshot('dup', 10, 2100);
            const first: SessionTabSnapshot = new SessionTabSnapshot(0, 'https://a', 0);
            first.history = ['https://a'];
            const second: SessionTabSnapshot = new SessionTabSnapshot(0, 'https://b', 0);
            second.history = ['https://b'];
            snapshot.tabs.push(first);
            snapshot.tabs.push(second);
            snapshot.seal();
            const validator: SessionValidator = new SessionValidator();
            expect(validator.validate(snapshot, 2200)).assertEqual(ERROR_DUPLICATE_KEY);
            snapshot.tabs[1].key = 1;
            snapshot.seal();
            expect(validator.validate(snapshot, 2200)).assertEqual(ERROR_NONE);
        });

        it('Browser_SessionV_010', 0, async () => {
            TestLogger.step(TAG, 'session above the tab limit is rejected');
            const snapshot: SessionSnapshot = new SessionSnapshot('big', 11, 2300);
            for (let index = 0; index < MAX_SESSION_TABS + 1; index++) {
                const tab: SessionTabSnapshot = new SessionTabSnapshot(index,
                    `https://www.sample.com/${index}`, 0);
                tab.history = [`https://www.sample.com/${index}`];
                snapshot.tabs.push(tab);
            }
            snapshot.seal();
            expect(snapshot.tabCount()).assertEqual(12);
            expect(MAX_SESSION_TABS).assertEqual(11);
            const validator: SessionValidator = new SessionValidator();
            expect(validator.validate(snapshot, 2400)).assertEqual(ERROR_TOO_MANY);
            expect(validator.isAccepted(snapshot, 2400)).assertFalse();
        });

        it('Browser_SessionV_011', 0, async () => {
            TestLogger.step(TAG, 'plain http url makes the session invalid');
            const snapshot: SessionSnapshot = new SessionSnapshot('scheme', 12, 2500);
            const tab: SessionTabSnapshot = new SessionTabSnapshot(0, 'http://www.sample.com', 0);
            tab.history = ['http://www.sample.com'];
            snapshot.tabs.push(tab);
            snapshot.seal();
            const validator: SessionValidator = new SessionValidator();
            expect(validator.validate(snapshot, 2600)).assertEqual(ERROR_SCHEME);
            snapshot.tabs[0].url = 'https://www.sample.com';
            snapshot.tabs[0].history = ['https://www.sample.com'];
            snapshot.seal();
            expect(validator.validate(snapshot, 2600)).assertEqual(ERROR_NONE);
        });

        it('Browser_SessionV_012', 0, async () => {
            TestLogger.step(TAG, 'tampered snapshot fails the checksum rule');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            browser.setInputVal('www.sample.com');
            const registry: SessionRegistry = new SessionRegistry();
            const snapshot: SessionSnapshot = registry.create(browser, 2700);
            expect(registry.validator.validate(snapshot, 2800)).assertEqual(ERROR_NONE);
            snapshot.inputValue = 'www.bing.com';
            expect(registry.validator.validate(snapshot, 2800)).assertEqual(ERROR_CHECKSUM);
            expect(registry.restore(snapshot.id, browser, 2800)).assertFalse();
            expect(browser.getInputVal()).assertEqual('www.sample.com');
            expect(registry.rejectionReasons[0]).assertEqual(ERROR_CHECKSUM);
        });
        it('Browser_SessionV_013', 0, async () => {
            TestLogger.step(TAG, 'rejected restore is atomic for the live browser');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            browser.addTab();
            browser.loadUrl('www.bing.com');
            browser.setTabArrayIndex(1);
            browser.setInputVal('live input');
            const registry: SessionRegistry = new SessionRegistry();
            const snapshot: SessionSnapshot = registry.create(browser, 2900);
            snapshot.tabs[0].url = 'https://tampered.example';
            const urlsBefore: string = browser.tabs.map(
                (tab: MockBrowserTab) => tab.controller.currentUrl).join('|');
            expect(registry.restore(snapshot.id, browser, 3000)).assertFalse();
            expect(registry.restored).assertEqual(0);
            expect(registry.rejected).assertEqual(1);
            expect(browser.tabs.length).assertEqual(2);
            expect(browser.tabs.map(
                (tab: MockBrowserTab) => tab.controller.currentUrl).join('|')).assertEqual(urlsBefore);
            expect(browser.getTabArrayIndex()).assertEqual(1);
            expect(browser.getInputVal()).assertEqual('live input');
            expect(registry.rejectionReasons[0]).assertEqual(ERROR_CHECKSUM);
        });

        it('Browser_SessionV_014', 0, async () => {
            TestLogger.step(TAG, 'two sessions keep fully isolated tab lists');
            const first: MockBrowser = new MockBrowser();
            first.loadUrl('www.sample.com');
            const second: MockBrowser = new MockBrowser();
            second.loadUrl('www.bing.com');
            second.addTab();
            second.loadUrl('www.sample.com');
            const registry: SessionRegistry = new SessionRegistry();
            const sessionA: SessionSnapshot = registry.create(first, 3100);
            const sessionB: SessionSnapshot = registry.create(second, 3110);
            expect(sessionA.tabCount()).assertEqual(1);
            expect(sessionB.tabCount()).assertEqual(2);
            const targetA: MockBrowser = new MockBrowser();
            const targetB: MockBrowser = new MockBrowser();
            expect(registry.restore(sessionA.id, targetA, 3200)).assertTrue();
            expect(registry.restore(sessionB.id, targetB, 3210)).assertTrue();
            expect(targetA.tabs.length).assertEqual(1);
            expect(targetB.tabs.length).assertEqual(2);
            expect(targetA.tabs[0].controller.currentUrl).assertEqual('https://www.sample.com');
            expect(targetB.tabs[0].controller.currentUrl).assertEqual('https://www.bing.com');
            expect(sessionA.urls().join('|')).assertEqual('https://www.sample.com');
            expect(sessionB.urls().join('|')).assertEqual(
                'https://www.bing.com|https://www.sample.com');
        });

        it('Browser_SessionV_015', 0, async () => {
            TestLogger.step(TAG, 'restore order is independent of creation order');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            const registry: SessionRegistry = new SessionRegistry();
            const s1: SessionSnapshot = registry.create(browser, 3300);
            const s2: SessionSnapshot = registry.create(browser, 3310);
            const s3: SessionSnapshot = registry.create(browser, 3320);
            const order: string[] = [s3.id, s1.id, s2.id];
            const visited: string[] = [];
            const target: MockBrowser = new MockBrowser();
            for (let index = 0; index < order.length; index++) {
                const current: SessionSnapshot | null = registry.get(order[index]);
                expect(current !== null).assertTrue();
                if (registry.restore(order[index], target, 3400 + index)) {
                    visited.push(order[index]);
                }
            }
            expect(visited.join(',')).assertEqual('s3,s1,s2');
            expect(registry.restored).assertEqual(3);
            expect(target.tabs.length).assertEqual(1);
        });

        it('Browser_SessionV_016', 0, async () => {
            TestLogger.step(TAG, 'restoring the same session twice is idempotent');
            const source: MockBrowser = new MockBrowser();
            source.loadUrl('www.sample.com');
            source.addTab();
            source.loadUrl('www.bing.com');
            const registry: SessionRegistry = new SessionRegistry();
            const snapshot: SessionSnapshot = registry.create(source, 3500);
            const sealed: string = snapshot.checksum;
            const target: MockBrowser = new MockBrowser();
            expect(registry.restore(snapshot.id, target, 3600)).assertTrue();
            const firstRun: string = target.tabs.map(
                (tab: MockBrowserTab) => tab.controller.currentUrl).join('|');
            expect(registry.restore(snapshot.id, target, 3700)).assertTrue();
            const secondRun: string = target.tabs.map(
                (tab: MockBrowserTab) => tab.controller.currentUrl).join('|');
            expect(secondRun).assertEqual(firstRun);
            expect(snapshot.checksum).assertEqual(sealed);
            expect(snapshot.tabCount()).assertEqual(2);
            expect(registry.restored).assertEqual(2);
            expect(registry.rejected).assertEqual(0);
        });

        it('Browser_SessionV_017', 0, async () => {
            TestLogger.step(TAG, 'registry evicts the oldest snapshot at capacity');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            const registry: SessionRegistry = new SessionRegistry(2);
            const first: SessionSnapshot = registry.create(browser, 3800);
            const second: SessionSnapshot = registry.create(browser, 3810);
            const third: SessionSnapshot = registry.create(browser, 3820);
            expect(registry.size()).assertEqual(2);
            expect(registry.evicted).assertEqual(1);
            expect(registry.get(first.id) === null).assertTrue();
            expect(registry.get(second.id) !== null).assertTrue();
            expect(registry.get(third.id) !== null).assertTrue();
            const target: MockBrowser = new MockBrowser();
            expect(registry.restore(first.id, target, 3900)).assertFalse();
            expect(registry.restore(third.id, target, 3910)).assertTrue();
            expect(registry.describe()).assertContain('evicted=1');
        });

        it('Browser_SessionV_018', 0, async () => {
            TestLogger.step(TAG, 'destroy removes the session from the active set');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            const registry: SessionRegistry = new SessionRegistry();
            const first: SessionSnapshot = registry.create(browser, 4000);
            const second: SessionSnapshot = registry.create(browser, 4010);
            expect(registry.activeCount()).assertEqual(2);
            expect(registry.destroy(first.id)).assertTrue();
            expect(first.state).assertEqual(STATE_DESTROYED);
            expect(registry.activeCount()).assertEqual(1);
            expect(registry.size()).assertEqual(2);
            expect(registry.restore(first.id, browser, 4100)).assertFalse();
            expect(registry.restore(second.id, browser, 4110)).assertTrue();
            expect(registry.destroy(first.id)).assertTrue();
            expect(registry.activeCount()).assertEqual(1);
        });

        it('Browser_SessionV_019', 0, async () => {
            TestLogger.step(TAG, 'expireIdle sweeps only the overdue sessions');
            const clock: MockClock = new MockClock(1700000000000);
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            const registry: SessionRegistry = new SessionRegistry(4);
            const stale: SessionSnapshot = registry.create(browser, clock.now(), 1000);
            clock.advance(900);
            const fresh: SessionSnapshot = registry.create(browser, clock.now(), 5000);
            clock.advance(200);
            expect(stale.isExpired(clock.now())).assertTrue();
            expect(fresh.isExpired(clock.now())).assertFalse();
            expect(registry.expireIdle(clock.now())).assertEqual(1);
            expect(stale.state).assertEqual(STATE_EXPIRED);
            expect(fresh.state).assertEqual(STATE_ACTIVE);
            expect(registry.activeCount()).assertEqual(1);
            clock.advance(5000);
            expect(registry.expireIdle(clock.now())).assertEqual(1);
            expect(registry.activeCount()).assertEqual(0);
        });

        it('Browser_SessionV_020', 0, async () => {
            TestLogger.step(TAG, 'history pointer must match the recorded url');
            const tab: SessionTabSnapshot = new SessionTabSnapshot(0, 'https://www.sample.com', 1);
            tab.history = ['https://www.sample.com', 'https://www.bing.com'];
            expect(tab.isHistoryConsistent()).assertFalse();
            tab.historyIndex = 0;
            expect(tab.isHistoryConsistent()).assertTrue();
            tab.historyIndex = 2;
            expect(tab.isHistoryConsistent()).assertFalse();
            tab.history = [];
            expect(tab.isHistoryConsistent()).assertFalse();
            expect(tab.describe()).assertContain('key=0');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            browser.loadUrl('www.bing.com');
            const registry: SessionRegistry = new SessionRegistry();
            const snapshot: SessionSnapshot = registry.create(browser, 4200);
            expect(snapshot.tabs[0].isHistoryConsistent()).assertTrue();
            expect(snapshot.tabs[0].history.length).assertEqual(2);
            expect(snapshot.tabs[0].historyIndex).assertEqual(1);
        });

        it('Browser_SessionV_021', 0, async () => {
            TestLogger.step(TAG, 'audit counters aggregate every rejection reason');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            const registry: SessionRegistry = new SessionRegistry();
            const expired: SessionSnapshot = registry.create(browser, 4300, 1000);
            const tampered: SessionSnapshot = registry.create(browser, 4310);
            const destroyed: SessionSnapshot = registry.create(browser, 4320);
            tampered.inputValue = 'tampered';
            registry.destroy(destroyed.id);
            expect(registry.restore(expired.id, browser, 9000)).assertFalse();
            expect(registry.restore(tampered.id, browser, 4400)).assertFalse();
            expect(registry.restore(destroyed.id, browser, 4410)).assertFalse();
            expect(registry.rejected).assertEqual(3);
            expect(registry.rejectionReasons.length).assertEqual(3);
            expect(registry.reasonsJoined()).assertEqual(
                'sessionExpired|checksumMismatch|sessionDestroyed');
            expect(registry.restored).assertEqual(0);
            expect(registry.describe()).assertContain('rejected=3');
        });

        it('Browser_SessionV_022', 0, async () => {
            TestLogger.step(TAG, 'window is usable after a rejected restore');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            const registry: SessionRegistry = new SessionRegistry();
            const snapshot: SessionSnapshot = registry.create(browser, 4500);
            snapshot.tabCount();
            snapshot.tabs[0].url = 'https://www.bing.com';
            expect(registry.restore(snapshot.id, browser, 4600)).assertFalse();
            expect(browser.loadUrl('www.bing.com')).assertTrue();
            expect(browser.tabs[0].controller.currentUrl).assertEqual('https://www.bing.com');
            const inputExists: boolean = await componentByIdExists(driver, ID_INPUT_URL);
            const backExists: boolean = await componentByIdExists(driver, ID_NAV_BACK);
            const addExists: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
            expect(inputExists).assertTrue();
            expect(backExists).assertTrue();
            expect(addExists).assertTrue();
            await clickById(driver, ID_ACTION_ADD);
            await serializedDelay(driver, DELAY_TAB_OPERATION);
            const cancelExists: boolean = await componentByIdExists(driver, ID_CANCEL_TAB);
            TestLogger.info(TAG, `cancel button present: ${cancelExists}`);
            const address: string = await textById(driver, ID_INPUT_URL);
            expect(typeof address).assertEqual('string');
        });

        it('Browser_SessionV_023', 0, async () => {
            TestLogger.step(TAG, 'non positive ttl is clamped to one second');
            const clock: MockClock = new MockClock(1700000000000);
            const snapshot: SessionSnapshot = new SessionSnapshot('clamped', 30, clock.now(), -500);
            expect(snapshot.ttlMs).assertEqual(1000);
            expect(snapshot.isExpired(clock.now())).assertFalse();
            clock.advance(999);
            expect(snapshot.isExpired(clock.now())).assertFalse();
            clock.advance(2);
            expect(snapshot.isExpired(clock.now())).assertTrue();
            expect(snapshot.idleMs(clock.now())).assertEqual(1001);
            const zero: SessionSnapshot = new SessionSnapshot('zero', 31, clock.now(), 0);
            expect(zero.ttlMs).assertEqual(1000);
        });

        it('Browser_SessionV_024', 0, async () => {
            TestLogger.step(TAG, 'revision and id increase for every new session');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.sample.com');
            const registry: SessionRegistry = new SessionRegistry(8);
            const first: SessionSnapshot = registry.create(browser, 4700);
            const second: SessionSnapshot = registry.create(browser, 4710);
            const third: SessionSnapshot = registry.create(browser, 4720);
            expect(first.id).assertEqual('s1');
            expect(second.id).assertEqual('s2');
            expect(third.id).assertEqual('s3');
            expect(first.revision).assertEqual(1);
            expect(second.revision).assertEqual(2);
            expect(third.revision).assertEqual(3);
            expect(second.revision > first.revision).assertTrue();
            expect(third.createdAt).assertEqual(4720);
            expect(registry.describe()).assertContain('sessions=3');
            expect(third.describe()).assertContain('rev=3');
        });
    });
}
