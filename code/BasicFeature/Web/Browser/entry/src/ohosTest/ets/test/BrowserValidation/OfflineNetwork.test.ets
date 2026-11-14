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
    getDriver, startBrowserApp, componentByIdExists, clickById, textById, inputById,
    serializedDelay, waitFor, waitForId, normalizeUrl, progressVisibleAfter,
    ID_INPUT_URL, ID_ACTION_SUBMIT, ID_NAV_BACK, ID_NAV_REFRESH,
    PAD_HOME_PAGE, PHONE_HOME_PAGE, TIMEOUT_PAGE_LOAD, TIMEOUT_APP_LAUNCH, DELAY_KEY_NAVIGATION
} from '../Shared/BrowserTestKit';
import {
    MockBrowser, MockBrowserTab, MockLoadingStatus, MockNetwork, MockClock
} from '../Shared/BrowserMock';

const TAG: string = 'BrowserOfflineNetworkTest';

/* ------------------------------------------------------------------ */
/* Offline vocabulary                                                  */
/* ------------------------------------------------------------------ */

const STATUS_ONLINE: string = 'online';
const STATUS_OFFLINE: string = 'offline';
const STATUS_DEGRADED: string = 'degraded';

const ERROR_OFFLINE_MISS: string = 'offlineCacheMiss';
const ERROR_EMPTY_ADDRESS: string = 'emptyAddress';
const ERROR_STALE_CACHE: string = 'staleCache';

const CACHE_CAPACITY: number = 4;
const CACHE_TTL_MS: number = 60000;
const PENDING_LIMIT: number = 10;
const HOME_BODY: string = '<html><body>pad home</body></html>';

/** One cached document served while the device is offline. */
class CacheEntry {
    url: string;
    body: string;
    storedAt: number;
    ttlMs: number;
    hits: number = 0;

    constructor(url: string, body: string, storedAt: number, ttlMs: number) {
        this.url = url;
        this.body = body;
        this.storedAt = storedAt;
        this.ttlMs = ttlMs;
    }

    isStale(now: number): boolean {
        return now - this.storedAt > this.ttlMs;
    }

    touch(): void {
        this.hits += 1;
    }

    refresh(body: string, storedAt: number, ttlMs: number): void {
        this.body = body;
        this.storedAt = storedAt;
        this.ttlMs = ttlMs;
    }

    describe(): string {
        return `url=${this.url} hits=${this.hits} age=${this.storedAt}`;
    }
}

/**
 * Bounded LRU document cache.
 *
 * Ordering rule: the first element is the least recently used one, a hit
 * moves the entry to the tail. Writes of an existing url update in place,
 * so repeated visits never duplicate a key.
 */
class OfflineCache {
    capacity: number;
    entries: CacheEntry[] = [];
    hits: number = 0;
    misses: number = 0;
    evictions: number = 0;
    writes: number = 0;

    constructor(capacity: number = CACHE_CAPACITY) {
        this.capacity = capacity <= 0 ? 1 : capacity;
    }

    find(url: string): CacheEntry | null {
        for (let index = 0; index < this.entries.length; index++) {
            if (this.entries[index].url === url) {
                return this.entries[index];
            }
        }
        return null;
    }

    has(url: string): boolean {
        return this.find(url) !== null;
    }

    private promote(url: string): void {
        const entry: CacheEntry | null = this.find(url);
        if (entry === null) {
            return;
        }
        const index: number = this.entries.indexOf(entry);
        if (index >= 0) {
            this.entries.splice(index, 1);
            this.entries.push(entry);
        }
    }

    get(url: string, now: number): CacheEntry | null {
        const entry: CacheEntry | null = this.find(url);
        if (entry === null) {
            this.misses += 1;
            return null;
        }
        this.hits += 1;
        entry.touch();
        this.promote(url);
        return entry;
    }

    /**
     * Stores a document. A write without an explicit ttl keeps the ttl of an
     * already cached entry, so refreshing a document does not silently extend
     * its freshness window.
     */
    put(url: string, body: string, now: number, ttlMs: number = -1): CacheEntry {
        this.writes += 1;
        const existing: CacheEntry | null = this.find(url);
        if (existing !== null) {
            existing.refresh(body, now, ttlMs < 0 ? existing.ttlMs : ttlMs);
            this.promote(url);
            return existing;
        }
        const entry: CacheEntry = new CacheEntry(url, body, now,
            ttlMs < 0 ? CACHE_TTL_MS : ttlMs);
        while (this.entries.length >= this.capacity) {
            this.entries.splice(0, 1);
            this.evictions += 1;
        }
        this.entries.push(entry);
        return entry;
    }

    putHome(homePage: string, now: number): CacheEntry {
        const url: string = normalizeUrl(homePage);
        return this.put(url, HOME_BODY, now);
    }

    stales(now: number): string[] {
        const result: string[] = [];
        for (let index = 0; index < this.entries.length; index++) {
            if (this.entries[index].isStale(now)) {
                result.push(this.entries[index].url);
            }
        }
        return result;
    }

    keys(): string[] {
        return this.entries.map((entry: CacheEntry) => entry.url);
    }

    size(): number {
        return this.entries.length;
    }

    reset(): void {
        this.entries = [];
        this.hits = 0;
        this.misses = 0;
        this.evictions = 0;
        this.writes = 0;
    }
}
/**
 * Navigation coordinator that survives network loss.
 *
 * Behaviour mirrored from the sample: a cached document is still rendered
 * while offline, an uncached address fails without destroying the input,
 * failures are retried explicitly and queued navigations are replayed once
 * connectivity returns.
 */
class OfflineNavigator {
    browser: MockBrowser;
    network: MockNetwork;
    cache: OfflineCache;
    status: string = STATUS_ONLINE;
    attempts: number = 0;
    failures: number = 0;
    replays: number = 0;
    lastError: string = '';
    lastAddress: string = '';
    lastUrl: string = '';
    pending: string[] = [];

    constructor(browser: MockBrowser, network: MockNetwork,
        cache: OfflineCache = new OfflineCache()) {
        this.browser = browser;
        this.network = network;
        this.cache = cache;
    }

    currentUrl(): string {
        const tab: MockBrowserTab | null = this.browser.getCurrentTab();
        return tab === null ? '' : tab.controller.currentUrl;
    }

    private loadInto(url: string, rawAddress: string): void {
        this.browser.setInputVal(rawAddress);
        this.browser.loadUrl(url);
        this.browser.onPageBegin(url);
        this.browser.onProgressChange(100);
        this.browser.onPageEnd();
    }

    open(address: string, now: number): boolean {
        this.attempts += 1;
        if (address.length === 0) {
            this.failures += 1;
            this.lastError = ERROR_EMPTY_ADDRESS;
            return false;
        }
        const normalized: string = this.browser.normalize(address);
        this.lastAddress = address;
        this.lastUrl = normalized;
        if (this.network.online) {
            const delivered: boolean = this.network.fetch(normalized);
            if (delivered) {
                this.cache.put(normalized, `<html>${normalized}</html>`, now);
                this.status = STATUS_ONLINE;
                this.lastError = '';
                this.loadInto(normalized, address);
                return true;
            }
        }
        const cached: CacheEntry | null = this.cache.get(normalized, now);
        if (cached !== null) {
            this.status = STATUS_OFFLINE;
            this.lastError = cached.isStale(now) ? ERROR_STALE_CACHE : '';
            this.loadInto(normalized, address);
            return true;
        }
        this.status = STATUS_DEGRADED;
        this.failures += 1;
        this.lastError = ERROR_OFFLINE_MISS;
        this.browser.setInputVal(address);
        return false;
    }

    goOffline(): void {
        this.network.setOnline(false);
        this.status = STATUS_OFFLINE;
    }

    goOnline(): void {
        this.network.setOnline(true);
        this.status = STATUS_ONLINE;
    }

    /** Queues an offline navigation, collapsing consecutive duplicates. */
    queueNavigation(address: string): boolean {
        if (address.length === 0) {
            return false;
        }
        const normalized: string = this.browser.normalize(address);
        if (this.pending.length > 0 &&
            this.pending[this.pending.length - 1] === normalized) {
            return false;
        }
        this.pending.push(normalized);
        while (this.pending.length > PENDING_LIMIT) {
            this.pending.splice(0, 1);
        }
        return true;
    }

    pendingCount(): number {
        return this.pending.length;
    }

    /** Replays the queued navigations in FIFO order after reconnect. */
    sync(now: number): number {
        if (!this.network.online) {
            return 0;
        }
        const queue: string[] = this.pending.slice(0);
        this.pending = [];
        let replayed: number = 0;
        for (let index = 0; index < queue.length; index++) {
            this.replays += 1;
            if (this.open(queue[index], now + index)) {
                replayed += 1;
            }
        }
        return replayed;
    }

    retry(now: number): boolean {
        const target: string = this.lastAddress.length > 0 ?
            this.lastAddress : this.browser.getInputVal();
        return this.open(target, now);
    }

    /** Home page comes from rawfile, so it never touches the network. */
    openHome(homePage: string, now: number): boolean {
        this.cache.putHome(homePage, now);
        this.browser.loadUrl(normalizeUrl(homePage));
        this.browser.setInputVal('');
        return true;
    }

    describe(): string {
        return `status=${this.status} attempts=${this.attempts} failures=${this.failures} pending=${this.pending.length}`;
    }
}
/** Records the connectivity status transitions of a browsing session. */
class StatusRecorder {
    states: string[] = [];

    record(state: string): void {
        if (this.states.length === 0 || this.states[this.states.length - 1] !== state) {
            this.states.push(state);
        }
    }

    transitions(): number {
        return this.states.length <= 1 ? 0 : this.states.length - 1;
    }

    joined(): string {
        return this.states.join('>');
    }

    reset(): void {
        this.states = [];
    }
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserOfflineNetworkTest() {
    describe('browserOfflineNetworkTest', () => {
        let driver: Driver = getDriver();

        beforeAll(async () => {
            TestLogger.info(TAG, 'suite begin');
            await startBrowserApp();
        });

        afterAll(() => {
            TestLogger.info(TAG, TestLogger.summary(TAG));
        });

        it('Browser_Offline_001', 0, async () => {
            TestLogger.step(TAG, 'offline launch serves the cached home page');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            cache.putHome(PAD_HOME_PAGE, 0);
            navigator.goOffline();
            expect(navigator.open(PAD_HOME_PAGE, 100)).assertTrue();
            expect(navigator.status).assertEqual(STATUS_OFFLINE);
            expect(navigator.currentUrl()).assertEqual('https://pad.html');
            expect(navigator.lastError).assertEqual('');
            expect(network.requestCount()).assertEqual(0);
            expect(cache.hits).assertEqual(1);
        });

        it('Browser_Offline_002', 0, async () => {
            TestLogger.step(TAG, 'offline load without cache degrades cleanly');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network);
            navigator.goOffline();
            expect(navigator.open('https://www.sample.com', 200)).assertFalse();
            expect(navigator.status).assertEqual(STATUS_DEGRADED);
            expect(navigator.lastError).assertEqual(ERROR_OFFLINE_MISS);
            expect(navigator.failures).assertEqual(1);
            expect(navigator.attempts).assertEqual(1);
            expect(navigator.currentUrl()).assertEqual('');
            expect(navigator.describe()).assertContain('failures=1');
        });

        it('Browser_Offline_003', 0, async () => {
            TestLogger.step(TAG, 'failed offline load keeps the requested address');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network);
            navigator.goOffline();
            expect(navigator.open('www.sample.com', 300)).assertFalse();
            expect(browser.getInputVal()).assertEqual('www.sample.com');
            expect(navigator.lastUrl).assertEqual('https://www.sample.com');
            expect(navigator.lastAddress).assertEqual('www.sample.com');
            expect(navigator.open('', 400)).assertFalse();
            expect(navigator.lastError).assertEqual(ERROR_EMPTY_ADDRESS);
            expect(navigator.failures).assertEqual(2);
        });

        it('Browser_Offline_004', 0, async () => {
            TestLogger.step(TAG, 'stale cache entry is served and flagged');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            cache.put('https://www.sample.com', '<html>cached</html>', 0, 1000);
            navigator.goOffline();
            expect(navigator.open('www.sample.com', 5000)).assertTrue();
            expect(navigator.status).assertEqual(STATUS_OFFLINE);
            expect(navigator.lastError).assertEqual(ERROR_STALE_CACHE);
            expect(navigator.currentUrl()).assertEqual('https://www.sample.com');
            expect(cache.stales(5000).length).assertEqual(1);
        });

        it('Browser_Offline_005', 0, async () => {
            TestLogger.step(TAG, 'online load fills the cache and reports online');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            expect(navigator.open('www.sample.com', 600)).assertTrue();
            expect(navigator.status).assertEqual(STATUS_ONLINE);
            expect(navigator.lastError).assertEqual('');
            expect(network.requestCount()).assertEqual(1);
            expect(cache.has('https://www.sample.com')).assertTrue();
            expect(cache.writes).assertEqual(1);
            expect(navigator.currentUrl()).assertEqual('https://www.sample.com');
            const entry: CacheEntry | null = cache.find('https://www.sample.com');
            expect(entry !== null).assertTrue();
            if (entry !== null) {
                expect(entry.body).assertContain('https://www.sample.com');
                expect(entry.storedAt).assertEqual(600);
            }
        });

        it('Browser_Offline_006', 0, async () => {
            TestLogger.step(TAG, 'cache entry stays fresh until its ttl elapses');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            cache.put('https://www.bing.com', '<html>bing</html>', 0, 1000);
            navigator.goOffline();
            expect(navigator.open('www.bing.com', 999)).assertTrue();
            expect(navigator.lastError).assertEqual('');
            expect(cache.stales(1000).length).assertEqual(0);
            expect(cache.stales(1001).length).assertEqual(1);
            expect(navigator.open('www.bing.com', 1001)).assertTrue();
            expect(navigator.lastError).assertEqual(ERROR_STALE_CACHE);
        });
        it('Browser_Offline_007', 0, async () => {
            TestLogger.step(TAG, 'repeated online visits update a single cache slot');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            expect(navigator.open('www.sample.com', 700)).assertTrue();
            expect(navigator.open('www.sample.com', 800)).assertTrue();
            expect(cache.size()).assertEqual(1);
            expect(cache.writes).assertEqual(2);
            expect(cache.evictions).assertEqual(0);
            expect(network.requestCount()).assertEqual(2);
            const entry: CacheEntry | null = cache.find('https://www.sample.com');
            expect(entry !== null).assertTrue();
            if (entry !== null) {
                expect(entry.storedAt).assertEqual(800);
                expect(entry.hits).assertEqual(0);
            }
        });

        it('Browser_Offline_008', 0, async () => {
            TestLogger.step(TAG, 'offline retry is attempted but stays failed');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network);
            navigator.goOffline();
            expect(navigator.open('www.sample.com', 900)).assertFalse();
            expect(navigator.retry(1000)).assertFalse();
            expect(navigator.retry(1100)).assertFalse();
            expect(navigator.attempts).assertEqual(3);
            expect(navigator.failures).assertEqual(3);
            expect(navigator.status).assertEqual(STATUS_DEGRADED);
            expect(navigator.lastError).assertEqual(ERROR_OFFLINE_MISS);
            expect(browser.getInputVal()).assertEqual('www.sample.com');
        });

        it('Browser_Offline_009', 0, async () => {
            TestLogger.step(TAG, 'retry after reconnect succeeds and caches');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            navigator.goOffline();
            expect(navigator.open('www.sample.com', 1200)).assertFalse();
            expect(navigator.lastError).assertEqual(ERROR_OFFLINE_MISS);
            navigator.goOnline();
            expect(navigator.status).assertEqual(STATUS_ONLINE);
            expect(navigator.retry(1300)).assertTrue();
            expect(navigator.lastError).assertEqual('');
            expect(navigator.currentUrl()).assertEqual('https://www.sample.com');
            expect(cache.has('https://www.sample.com')).assertTrue();
            expect(navigator.attempts).assertEqual(2);
            expect(navigator.failures).assertEqual(1);
        });

        it('Browser_Offline_010', 0, async () => {
            TestLogger.step(TAG, 'reconnect replays queued navigations in order');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            navigator.goOffline();
            expect(navigator.queueNavigation('www.sample.com')).assertTrue();
            expect(navigator.queueNavigation('www.bing.com')).assertTrue();
            expect(navigator.queueNavigation('pad.html')).assertTrue();
            expect(navigator.pendingCount()).assertEqual(3);
            expect(navigator.sync(1400)).assertEqual(0);
            expect(navigator.pendingCount()).assertEqual(3);
            navigator.goOnline();
            expect(navigator.sync(1500)).assertEqual(3);
            expect(navigator.replays).assertEqual(3);
            expect(navigator.pendingCount()).assertEqual(0);
            expect(navigator.currentUrl()).assertEqual('https://pad.html');
            expect(cache.has('https://www.sample.com')).assertTrue();
            expect(cache.has('https://www.bing.com')).assertTrue();
            expect(network.requestCount()).assertEqual(3);
        });

        it('Browser_Offline_011', 0, async () => {
            TestLogger.step(TAG, 'queued navigation collapses consecutive duplicates');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network);
            navigator.goOffline();
            expect(navigator.queueNavigation('www.sample.com')).assertTrue();
            expect(navigator.queueNavigation('www.sample.com')).assertFalse();
            expect(navigator.queueNavigation('www.bing.com')).assertTrue();
            expect(navigator.queueNavigation('www.bing.com')).assertFalse();
            expect(navigator.queueNavigation('www.sample.com')).assertTrue();
            expect(navigator.pendingCount()).assertEqual(3);
            navigator.goOnline();
            expect(navigator.sync(1600)).assertEqual(3);
            expect(navigator.currentUrl()).assertEqual('https://www.sample.com');
            expect(navigator.replays).assertEqual(3);
        });

        it('Browser_Offline_012', 0, async () => {
            TestLogger.step(TAG, 'pending queue keeps only the newest entries');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network);
            navigator.goOffline();
            for (let index = 0; index < 12; index++) {
                expect(navigator.queueNavigation(`www.sample.com/${index}`)).assertTrue();
            }
            expect(navigator.pendingCount()).assertEqual(10);
            expect(navigator.pending[0]).assertEqual('https://www.sample.com/2');
            expect(navigator.pending[9]).assertEqual('https://www.sample.com/11');
            expect(navigator.queueNavigation('')).assertFalse();
            expect(navigator.pendingCount()).assertEqual(10);
        });

        it('Browser_Offline_013', 0, async () => {
            TestLogger.step(TAG, 'each tab keeps its own offline document');
            const browser: MockBrowser = new MockBrowser();
            browser.addTab();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            cache.put('https://www.sample.com', '<html>a</html>', 0);
            cache.put('https://www.bing.com', '<html>b</html>', 0);
            navigator.goOffline();
            browser.setTabArrayIndex(0);
            expect(navigator.open('www.sample.com', 1700)).assertTrue();
            expect(browser.selectTab(1)).assertTrue();
            expect(navigator.open('www.bing.com', 1710)).assertTrue();
            expect(browser.tabs[0].controller.currentUrl).assertEqual('https://www.sample.com');
            expect(browser.tabs[1].controller.currentUrl).assertEqual('https://www.bing.com');
            expect(browser.selectTab(0)).assertTrue();
            expect(navigator.currentUrl()).assertEqual('https://www.sample.com');
            expect(browser.tabs.length).assertEqual(2);
            expect(network.requestCount()).assertEqual(0);
        });

        it('Browser_Offline_014', 0, async () => {
            TestLogger.step(TAG, 'offline typing never touches network or cache');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            navigator.goOffline();
            const writesBefore: number = cache.writes;
            for (let index = 0; index < 5; index++) {
                browser.setInputVal(`www.sample.com/${index}`);
                expect(browser.getInputVal()).assertEqual(`www.sample.com/${index}`);
            }
            expect(network.requestCount()).assertEqual(0);
            expect(cache.writes).assertEqual(writesBefore);
            expect(cache.size()).assertEqual(0);
            expect(browser.tabs[0].controller.loadCount).assertEqual(0);
        });

        it('Browser_Offline_015', 0, async () => {
            TestLogger.step(TAG, 'offline cached pages keep a usable history');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            cache.put('https://www.sample.com', '<html>a</html>', 0);
            cache.put('https://www.bing.com', '<html>b</html>', 0);
            navigator.goOffline();
            expect(navigator.open('www.sample.com', 1800)).assertTrue();
            expect(navigator.open('www.bing.com', 1810)).assertTrue();
            expect(browser.back()).assertTrue();
            expect(navigator.currentUrl()).assertEqual('https://www.sample.com');
            expect(browser.forward()).assertTrue();
            expect(navigator.currentUrl()).assertEqual('https://www.bing.com');
        });

        it('Browser_Offline_016', 0, async () => {
            TestLogger.step(TAG, 'offline load completes without a progress bar');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            cache.put('https://www.sample.com', '<html>a</html>', 0);
            navigator.goOffline();
            expect(navigator.open('www.sample.com', 1900)).assertTrue();
            expect(browser.progress).assertEqual(0);
            expect(browser.hideProgress).assertTrue();
            expect(progressVisibleAfter(0)).assertTrue();
            expect(progressVisibleAfter(100)).assertFalse();
            expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
        });
        it('Browser_Offline_017', 0, async () => {
            TestLogger.step(TAG, 'partial network failure is deterministic and bounded');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            network.setFailureRate(0.5);
            const cache: OfflineCache = new OfflineCache(20);
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            let success: number = 0;
            for (let index = 0; index < 10; index++) {
                if (navigator.open(`www.sample.com/${index}`, 2000 + index)) {
                    success += 1;
                }
            }
            expect(success > 0).assertTrue();
            expect(success < 10).assertTrue();
            expect(navigator.failures).assertEqual(10 - success);
            expect(navigator.attempts).assertEqual(10);
            expect(cache.size()).assertEqual(success);
            expect(network.requestCount()).assertEqual(10);
        });

        it('Browser_Offline_018', 0, async () => {
            TestLogger.step(TAG, 'cache evicts the least recently used document');
            const cache: OfflineCache = new OfflineCache(2);
            cache.put('https://a', '<html>a</html>', 0);
            cache.put('https://b', '<html>b</html>', 0);
            expect(cache.keys().join('|')).assertEqual('https://a|https://b');
            expect(cache.get('https://a', 10) !== null).assertTrue();
            expect(cache.keys().join('|')).assertEqual('https://b|https://a');
            cache.put('https://c', '<html>c</html>', 20);
            expect(cache.size()).assertEqual(2);
            expect(cache.evictions).assertEqual(1);
            expect(cache.has('https://b')).assertFalse();
            expect(cache.has('https://a')).assertTrue();
            expect(cache.keys().join('|')).assertEqual('https://a|https://c');
        });

        it('Browser_Offline_019', 0, async () => {
            TestLogger.step(TAG, 'cache hit and miss counters are accurate');
            const cache: OfflineCache = new OfflineCache();
            expect(cache.get('https://missing', 0)).assertNull();
            expect(cache.misses).assertEqual(1);
            expect(cache.hits).assertEqual(0);
            cache.put('https://a', '<html>a</html>', 0);
            expect(cache.get('https://a', 1) !== null).assertTrue();
            expect(cache.get('https://a', 2) !== null).assertTrue();
            expect(cache.hits).assertEqual(2);
            expect(cache.misses).assertEqual(1);
            const entry: CacheEntry | null = cache.find('https://a');
            expect(entry !== null).assertTrue();
            if (entry !== null) {
                expect(entry.hits).assertEqual(2);
                expect(entry.describe()).assertContain('hits=2');
            }
        });

        it('Browser_Offline_020', 0, async () => {
            TestLogger.step(TAG, 'rawfile home page bypasses the network');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            navigator.goOffline();
            expect(navigator.openHome(PAD_HOME_PAGE, 2100)).assertTrue();
            expect(network.requestCount()).assertEqual(0);
            expect(cache.has('https://pad.html')).assertTrue();
            expect(browser.getInputVal()).assertEqual('');
            expect(navigator.currentUrl()).assertEqual('https://pad.html');
            expect(navigator.openHome(PHONE_HOME_PAGE, 2200)).assertTrue();
            expect(cache.size()).assertEqual(2);
            expect(network.requestCount()).assertEqual(0);
        });

        it('Browser_Offline_021', 0, async () => {
            TestLogger.step(TAG, 'repeated connectivity toggles keep every tab');
            const browser: MockBrowser = new MockBrowser();
            browser.addTab();
            browser.addTab();
            const network: MockNetwork = new MockNetwork();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network);
            const keysBefore: string = browser.getTabKeys().join(',');
            for (let index = 0; index < 3; index++) {
                navigator.goOffline();
                expect(navigator.status).assertEqual(STATUS_OFFLINE);
                expect(network.online).assertFalse();
                navigator.goOnline();
                expect(navigator.status).assertEqual(STATUS_ONLINE);
                expect(network.online).assertTrue();
            }
            expect(browser.tabs.length).assertEqual(3);
            expect(browser.getTabKeys().join(',')).assertEqual(keysBefore);
            expect(browser.getTabArrayIndex()).assertEqual(2);
        });

        it('Browser_Offline_022', 0, async () => {
            TestLogger.step(TAG, 'degraded session recovers through the sync queue');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network);
            navigator.goOffline();
            expect(navigator.open('www.sample.com', 2300)).assertFalse();
            expect(navigator.status).assertEqual(STATUS_DEGRADED);
            expect(navigator.queueNavigation('www.sample.com')).assertTrue();
            navigator.goOnline();
            expect(navigator.sync(2400)).assertEqual(1);
            expect(navigator.status).assertEqual(STATUS_ONLINE);
            expect(navigator.currentUrl()).assertEqual('https://www.sample.com');
            expect(navigator.pendingCount()).assertEqual(0);
            expect(navigator.failures).assertEqual(1);
        });

        it('Browser_Offline_023', 0, async () => {
            TestLogger.step(TAG, 'cache reset returns the store to a cold state');
            const cache: OfflineCache = new OfflineCache(3);
            cache.put('https://a', '<html>a</html>', 0);
            cache.put('https://b', '<html>b</html>', 0);
            cache.get('https://a', 1);
            expect(cache.size()).assertEqual(2);
            expect(cache.hits).assertEqual(1);
            expect(cache.writes).assertEqual(2);
            cache.reset();
            expect(cache.size()).assertEqual(0);
            expect(cache.hits).assertEqual(0);
            expect(cache.misses).assertEqual(0);
            expect(cache.evictions).assertEqual(0);
            expect(cache.writes).assertEqual(0);
            expect(cache.keys().length).assertEqual(0);
        });

        it('Browser_Offline_024', 0, async () => {
            TestLogger.step(TAG, 'offline flow leaves the browser window usable');
            // The sample window may still be settling, poll before asserting.
            const inputExists: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_APP_LAUNCH);
            const submitExists: boolean = await componentByIdExists(driver, ID_ACTION_SUBMIT);
            const refreshExists: boolean = await componentByIdExists(driver, ID_NAV_REFRESH);
            const backExists: boolean = await componentByIdExists(driver, ID_NAV_BACK);
            expect(inputExists).assertTrue();
            expect(submitExists).assertTrue();
            expect(refreshExists).assertTrue();
            expect(backExists).assertTrue();
            const typed: boolean = await inputById(driver, ID_INPUT_URL, 'www.sample.com');
            TestLogger.info(TAG, `address typed: ${typed}`);
            await clickById(driver, ID_ACTION_SUBMIT);
            await serializedDelay(driver, DELAY_KEY_NAVIGATION);
            const alive: boolean = await waitFor(driver,
                async () => await componentByIdExists(driver, ID_INPUT_URL), TIMEOUT_PAGE_LOAD);
            expect(alive).assertTrue();
            const address: string = await textById(driver, ID_INPUT_URL);
            expect(typeof address).assertEqual('string');
            expect(PAD_HOME_PAGE).assertEqual('pad.html');
        });

        it('Browser_Offline_025', 0, async () => {
            TestLogger.step(TAG, 'online revisit refreshes a stale cache entry');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            cache.put('https://www.sample.com', '<html>old</html>', 0, 1000);
            expect(cache.stales(5000).length).assertEqual(1);
            expect(navigator.open('www.sample.com', 5000)).assertTrue();
            expect(cache.stales(5000).length).assertEqual(0);
            const entry: CacheEntry | null = cache.find('https://www.sample.com');
            expect(entry !== null).assertTrue();
            if (entry !== null) {
                expect(entry.storedAt).assertEqual(5000);
                expect(entry.isStale(5000)).assertFalse();
                expect(entry.isStale(6001)).assertTrue();
            }
            navigator.goOffline();
            expect(navigator.open('www.sample.com', 5100)).assertTrue();
            expect(navigator.lastError).assertEqual('');
        });

        it('Browser_Offline_026', 0, async () => {
            TestLogger.step(TAG, 'retry without a remembered address uses the input');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            browser.setInputVal('www.bing.com');
            expect(navigator.lastAddress).assertEqual('');
            expect(navigator.retry(5200)).assertTrue();
            expect(navigator.lastUrl).assertEqual('https://www.bing.com');
            expect(navigator.currentUrl()).assertEqual('https://www.bing.com');
            expect(cache.has('https://www.bing.com')).assertTrue();
        });

        it('Browser_Offline_027', 0, async () => {
            TestLogger.step(TAG, 'sync clears the queue even when every replay fails');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network);
            navigator.goOffline();
            expect(navigator.queueNavigation('www.sample.com')).assertTrue();
            expect(navigator.queueNavigation('www.bing.com')).assertTrue();
            navigator.goOnline();
            network.setFailureRate(1);
            expect(navigator.sync(5300)).assertEqual(0);
            expect(navigator.pendingCount()).assertEqual(0);
            expect(navigator.failures).assertEqual(2);
            expect(navigator.replays).assertEqual(2);
            expect(navigator.status).assertEqual(STATUS_DEGRADED);
        });

        it('Browser_Offline_028', 0, async () => {
            TestLogger.step(TAG, 'scheme is normalized once before cache lookup');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            expect(navigator.open('https://www.sample.com', 5400)).assertTrue();
            expect(navigator.open('www.sample.com', 5410)).assertTrue();
            expect(cache.size()).assertEqual(1);
            expect(cache.writes).assertEqual(2);
            expect(navigator.lastUrl).assertEqual('https://www.sample.com');
            navigator.goOffline();
            expect(cache.hits).assertEqual(0);
            expect(navigator.open('www.sample.com', 5420)).assertTrue();
            expect(cache.hits).assertEqual(1);
            expect(navigator.currentUrl()).assertEqual('https://www.sample.com');
        });

        it('Browser_Offline_029', 0, async () => {
            TestLogger.step(TAG, 'both device home pages stay available offline');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            expect(navigator.openHome(PAD_HOME_PAGE, 5500)).assertTrue();
            expect(navigator.openHome(PHONE_HOME_PAGE, 5510)).assertTrue();
            navigator.goOffline();
            expect(navigator.open(PAD_HOME_PAGE, 5520)).assertTrue();
            expect(navigator.open(PHONE_HOME_PAGE, 5530)).assertTrue();
            expect(cache.size()).assertEqual(2);
            expect(cache.hits).assertEqual(2);
            expect(network.requestCount()).assertEqual(0);
            expect(navigator.currentUrl()).assertEqual('https://phone.html');
        });

        it('Browser_Offline_030', 0, async () => {
            TestLogger.step(TAG, 'status transitions are recorded without duplicates');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            const recorder: StatusRecorder = new StatusRecorder();
            recorder.record(navigator.status);
            navigator.goOffline();
            recorder.record(navigator.status);
            navigator.open('www.sample.com', 5600);
            recorder.record(navigator.status);
            navigator.goOnline();
            recorder.record(navigator.status);
            navigator.open('www.sample.com', 5700);
            recorder.record(navigator.status);
            recorder.record(navigator.status);
            expect(recorder.states.length).assertEqual(4);
            expect(recorder.joined()).assertEqual('online>offline>degraded>online');
            expect(recorder.transitions()).assertEqual(3);
            recorder.reset();
            expect(recorder.transitions()).assertEqual(0);
            expect(recorder.joined()).assertEqual('');
        });

        it('Browser_Offline_031', 0, async () => {
            TestLogger.step(TAG, 'cache bodies stay distinguishable per address');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache(8);
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            expect(navigator.open('www.sample.com', 5800)).assertTrue();
            expect(navigator.open('www.bing.com', 5810)).assertTrue();
            const sample: CacheEntry | null = cache.find('https://www.sample.com');
            const bing: CacheEntry | null = cache.find('https://www.bing.com');
            expect(sample !== null).assertTrue();
            expect(bing !== null).assertTrue();
            if (sample !== null && bing !== null) {
                expect(sample.body).assertContain('www.sample.com');
                expect(bing.body).assertContain('www.bing.com');
                expect(sample.body === bing.body).assertFalse();
                expect(sample.describe()).assertContain('url=https://www.sample.com');
            }
            navigator.goOffline();
            expect(navigator.open('www.bing.com', 5820)).assertTrue();
            expect(navigator.currentUrl()).assertEqual('https://www.bing.com');
            expect(navigator.failures).assertEqual(0);
        });

        it('Browser_Offline_032', 0, async () => {
            TestLogger.step(TAG, 'a cache miss is never cached as an empty document');
            const browser: MockBrowser = new MockBrowser();
            const network: MockNetwork = new MockNetwork();
            const cache: OfflineCache = new OfflineCache();
            const navigator: OfflineNavigator = new OfflineNavigator(browser, network, cache);
            navigator.goOffline();
            expect(navigator.open('www.sample.com', 5900)).assertFalse();
            expect(cache.size()).assertEqual(0);
            expect(cache.misses).assertEqual(1);
            expect(cache.writes).assertEqual(0);
            expect(navigator.lastError).assertEqual(ERROR_OFFLINE_MISS);
            navigator.goOnline();
            expect(navigator.open('www.sample.com', 6000)).assertTrue();
            expect(cache.size()).assertEqual(1);
            expect(cache.misses).assertEqual(1);
            const entry: CacheEntry | null = cache.find('https://www.sample.com');
            expect(entry !== null).assertTrue();
            if (entry !== null) {
                expect(entry.body.length > 0).assertTrue();
                expect(entry.body).assertContain('<html>');
            }
            expect(navigator.failures).assertEqual(1);
            expect(navigator.lastError).assertEqual('');
        });
    });
}
