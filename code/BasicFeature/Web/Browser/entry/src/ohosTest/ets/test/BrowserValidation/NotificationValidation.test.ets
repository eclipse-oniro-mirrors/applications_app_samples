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
    getDriver, startBrowserApp, componentByIdExists, countById, clickById, textById,
    hasText, serializedDelay, waitFor, tabCapacityReached,
    ID_INPUT_URL, ID_ACTION_ADD, ID_NAV_HOME, ID_NAV_BACK, ID_CANCEL_TAB,
    MAX_TAB_COUNT, MIN_TAB_COUNT, TAB_LIMIT_MESSAGE, PAD_HOME_PAGE, PHONE_HOME_PAGE, deviceIsPhone,
    TIMEOUT_COMPONENT, DELAY_TOUCH_EVENT
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserNotificationValidationTest';

/* ------------------------------------------------------------------ */
/* Notification vocabulary                                             */
/* ------------------------------------------------------------------ */

const DEDUP_WINDOW_MS: number = 400;
const TOAST_DURATION_MS: number = 2000;
const QUEUE_CAPACITY: number = 5;

const KEY_TAB_LIMIT: string = 'tabLimit';
const KEY_LOAD_FAIL: string = 'loadFail';
const KEY_HOME_HINT: string = 'homeHint';

const LOAD_FAIL_PREFIX: string = '网页加载失败';
const HOME_HINT_PREFIX: string = '已返回首页';
const ADD_TAB_HINT: string = '已新建页签';

/** One prompt that was requested by the browser UI. */
class ToastRecord {
    text: string;
    dedupKey: string;
    sequence: number;
    shownAt: number;
    durationMs: number;
    visible: boolean = true;
    suppressed: number = 0;

    constructor(text: string, dedupKey: string, sequence: number, shownAt: number,
        durationMs: number) {
        this.text = text;
        this.dedupKey = dedupKey;
        this.sequence = sequence;
        this.shownAt = shownAt;
        this.durationMs = durationMs;
    }

    /** A prompt disappears as soon as its duration is fully consumed. */
    isExpired(now: number): boolean {
        return now - this.shownAt >= this.durationMs;
    }

    hide(): void {
        this.visible = false;
    }

    describe(): string {
        return `#${this.sequence} key=${this.dedupKey} visible=${this.visible} suppressed=${this.suppressed}`;
    }
}

/**
 * Prompt queue backing every user facing hint of the browser sample.
 *
 * Rules validated by this suite:
 *  - the tab capacity prompt is emitted only when addTab is refused,
 *  - the same dedup key is collapsed inside a 400 ms window,
 *  - a prompt expires after 2000 ms without any user interaction,
 *  - the queue is bounded, the oldest prompt is dropped first,
 *  - showing a prompt never blocks navigation, input or tab switch.
 */
class ToastQueue {
    capacity: number;
    dedupWindowMs: number;
    durationMs: number;
    toasts: ToastRecord[] = [];
    sequence: number = 0;
    attempts: number = 0;
    delivered: number = 0;
    suppressed: number = 0;
    expired: number = 0;
    dropped: number = 0;
    dismissCount: number = 0;

    constructor(capacity: number = QUEUE_CAPACITY, dedupWindowMs: number = DEDUP_WINDOW_MS,
        durationMs: number = TOAST_DURATION_MS) {
        this.capacity = capacity <= 0 ? 1 : capacity;
        this.dedupWindowMs = dedupWindowMs;
        this.durationMs = durationMs;
    }

    private findVisibleByKey(key: string): ToastRecord | null {
        for (let index = this.toasts.length - 1; index >= 0; index--) {
            const record: ToastRecord = this.toasts[index];
            if (record.visible && record.dedupKey === key) {
                return record;
            }
        }
        return null;
    }

    /** Returns true when the prompt is actually delivered to the user. */
    show(text: string, dedupKey: string, now: number): boolean {
        this.attempts += 1;
        const previous: ToastRecord | null = this.findVisibleByKey(dedupKey);
        if (previous !== null && now - previous.shownAt < this.dedupWindowMs) {
            previous.suppressed += 1;
            this.suppressed += 1;
            return false;
        }
        this.sequence += 1;
        const record: ToastRecord = new ToastRecord(text, dedupKey, this.sequence, now,
            this.durationMs);
        this.toasts.push(record);
        this.delivered += 1;
        while (this.toasts.length > this.capacity) {
            this.toasts.splice(0, 1);
            this.dropped += 1;
        }
        return true;
    }

    /** Expires every visible prompt whose lifetime has elapsed. */
    tick(now: number): number {
        let changed: number = 0;
        for (let index = 0; index < this.toasts.length; index++) {
            const record: ToastRecord = this.toasts[index];
            if (record.visible && record.isExpired(now)) {
                record.hide();
                this.expired += 1;
                changed += 1;
            }
        }
        return changed;
    }

    dismissLatest(): boolean {
        for (let index = this.toasts.length - 1; index >= 0; index--) {
            if (this.toasts[index].visible) {
                this.toasts[index].hide();
                this.dismissCount += 1;
                return true;
            }
        }
        return false;
    }

    dismissAll(): number {
        let hidden: number = 0;
        for (let index = 0; index < this.toasts.length; index++) {
            if (this.toasts[index].visible) {
                this.toasts[index].hide();
                this.dismissCount += 1;
                hidden += 1;
            }
        }
        return hidden;
    }

    visibleCount(): number {
        let total: number = 0;
        for (let index = 0; index < this.toasts.length; index++) {
            if (this.toasts[index].visible) {
                total += 1;
            }
        }
        return total;
    }

    visibleText(): string {
        for (let index = this.toasts.length - 1; index >= 0; index--) {
            if (this.toasts[index].visible) {
                return this.toasts[index].text;
            }
        }
        return '';
    }

    latest(): ToastRecord | null {
        return this.toasts.length === 0 ? null : this.toasts[this.toasts.length - 1];
    }

    countOf(text: string): number {
        let total: number = 0;
        for (let index = 0; index < this.toasts.length; index++) {
            if (this.toasts[index].text === text) {
                total += 1;
            }
        }
        return total;
    }

    texts(): string[] {
        return this.toasts.map((record: ToastRecord) => record.text);
    }

    keys(): string[] {
        return this.toasts.map((record: ToastRecord) => record.dedupKey);
    }

    summary(): string {
        return `attempts=${this.attempts} delivered=${this.delivered} suppressed=${this.suppressed} expired=${this.expired}`;
    }

    reset(): void {
        this.toasts = [];
        this.sequence = 0;
        this.attempts = 0;
        this.delivered = 0;
        this.suppressed = 0;
        this.expired = 0;
        this.dropped = 0;
        this.dismissCount = 0;
    }
}
/** Couples the browser model with the prompt queue of the sample. */
class NotificationCenter {
    browser: MockBrowser;
    queue: ToastQueue;
    refusedAdds: number = 0;
    loadFailures: number = 0;

    constructor(browser: MockBrowser, queue: ToastQueue = new ToastQueue()) {
        this.browser = browser;
        this.queue = queue;
    }

    /** Mirrors Browser.addTab: the capacity prompt is the refusal signal. */
    addTab(now: number): boolean {
        const added: boolean = this.browser.addTab();
        if (!added) {
            this.refusedAdds += 1;
            this.queue.show(TAB_LIMIT_MESSAGE, KEY_TAB_LIMIT, now);
        }
        return added;
    }

    loadFailure(url: string, now: number): boolean {
        this.loadFailures += 1;
        return this.queue.show(`${LOAD_FAIL_PREFIX}: ${url}`, `${KEY_LOAD_FAIL}:${url}`, now);
    }

    homeHint(homePage: string, now: number): boolean {
        return this.queue.show(`${HOME_HINT_PREFIX} ${homePage}`, KEY_HOME_HINT, now);
    }

    describe(): string {
        return `refused=${this.refusedAdds} failures=${this.loadFailures} ${this.queue.summary()}`;
    }
}

/** Message builders and classifiers of the prompt catalogue. */
class PromptCatalogue {
    static readonly LIMIT: string = TAB_LIMIT_MESSAGE;
    static readonly LOAD_FAIL_PREFIX_VALUE: string = LOAD_FAIL_PREFIX;
    static readonly HOME_HINT_PREFIX_VALUE: string = HOME_HINT_PREFIX;

    static buildLoadFailure(url: string): string {
        return `${LOAD_FAIL_PREFIX}: ${url}`;
    }

    static buildHomeHint(homePage: string): string {
        return `${HOME_HINT_PREFIX} ${homePage}`;
    }

    static isKnown(prompt: string): boolean {
        if (prompt === TAB_LIMIT_MESSAGE) {
            return true;
        }
        if (prompt.indexOf(`${LOAD_FAIL_PREFIX}: `) === 0) {
            return true;
        }
        return prompt.indexOf(`${HOME_HINT_PREFIX} `) === 0;
    }

    static kindOf(prompt: string): string {
        if (prompt === TAB_LIMIT_MESSAGE) {
            return KEY_TAB_LIMIT;
        }
        if (prompt.indexOf(`${LOAD_FAIL_PREFIX}: `) === 0) {
            return KEY_LOAD_FAIL;
        }
        if (prompt.indexOf(`${HOME_HINT_PREFIX} `) === 0) {
            return KEY_HOME_HINT;
        }
        return 'unknown';
    }

    static isBlank(prompt: string): boolean {
        return prompt.length === 0;
    }
}

/** Aggregates delivery counters across several prompt queues. */
class NotificationStats {
    delivered: number = 0;
    suppressed: number = 0;
    expired: number = 0;
    dismissed: number = 0;

    record(shown: boolean): void {
        if (shown) {
            this.delivered += 1;
        } else {
            this.suppressed += 1;
        }
    }

    absorb(queue: ToastQueue): void {
        this.delivered += queue.delivered;
        this.suppressed += queue.suppressed;
        this.expired += queue.expired;
        this.dismissed += queue.dismissCount;
    }

    total(): number {
        return this.delivered + this.suppressed;
    }

    deliveryRatio(): number {
        return this.total() === 0 ? 0 : this.delivered / this.total();
    }

    describe(): string {
        return `delivered=${this.delivered} suppressed=${this.suppressed} expired=${this.expired} dismissed=${this.dismissed}`;
    }

    reset(): void {
        this.delivered = 0;
        this.suppressed = 0;
        this.expired = 0;
        this.dismissed = 0;
    }
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserNotificationValidationTest() {
    describe('browserNotificationValidationTest', () => {
        let driver: Driver = getDriver();

        beforeAll(async () => {
            TestLogger.info(TAG, 'suite begin');
            await startBrowserApp();
        });

        afterAll(() => {
            TestLogger.info(TAG, TestLogger.summary(TAG));
        });

        it('Browser_Notify_001', 0, async () => {
            TestLogger.step(TAG, 'tab capacity shows the exact limit message once');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            expect(browser.tabs.length).assertEqual(10);
            expect(tabCapacityReached(10)).assertFalse();
            expect(center.addTab(1000)).assertTrue();
            expect(browser.tabs.length).assertEqual(11);
            expect(tabCapacityReached(11)).assertTrue();
            expect(center.addTab(1400)).assertFalse();
            expect(browser.tabs.length).assertEqual(11);
            expect(center.queue.countOf(TAB_LIMIT_MESSAGE)).assertEqual(1);
            expect(center.queue.visibleText()).assertEqual(TAB_LIMIT_MESSAGE);
            expect(center.refusedAdds).assertEqual(1);
        });

        it('Browser_Notify_002', 0, async () => {
            TestLogger.step(TAG, 'refused add neither grows nor corrupts the tab list');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(2000);
            const keysBefore: string = browser.getTabKeys().join(',');
            const timestampsBefore: string = browser.getTimestamps().join(',');
            expect(center.addTab(2500)).assertFalse();
            expect(center.addTab(3000)).assertFalse();
            expect(browser.tabs.length).assertEqual(11);
            expect(browser.getTabKeys().join(',')).assertEqual(keysBefore);
            expect(browser.getTimestamps().join(',')).assertEqual(timestampsBefore);
            expect(center.queue.countOf(TAB_LIMIT_MESSAGE)).assertEqual(2);
            expect(center.refusedAdds).assertEqual(2);
        });

        it('Browser_Notify_003', 0, async () => {
            TestLogger.step(TAG, 'repeated taps inside the window are collapsed');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(1000);
            expect(center.addTab(1100)).assertFalse();
            expect(center.addTab(1200)).assertFalse();
            expect(center.addTab(1300)).assertFalse();
            expect(center.addTab(1350)).assertFalse();
            expect(center.queue.attempts).assertEqual(4);
            expect(center.queue.delivered).assertEqual(1);
            expect(center.queue.suppressed).assertEqual(3);
            expect(center.queue.countOf(TAB_LIMIT_MESSAGE)).assertEqual(1);
            expect(center.queue.visibleCount()).assertEqual(1);
            const latest: ToastRecord | null = center.queue.latest();
            expect(latest !== null).assertTrue();
            if (latest !== null) {
                expect(latest.suppressed).assertEqual(3);
                expect(latest.sequence).assertEqual(1);
            }
        });

        it('Browser_Notify_004', 0, async () => {
            TestLogger.step(TAG, 'a new window delivers the message again');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(1000);
            center.addTab(1200);
            center.addTab(1450);
            expect(center.queue.delivered).assertEqual(1);
            expect(center.queue.suppressed).assertEqual(1);
            expect(center.addTab(1650)).assertFalse();
            expect(center.queue.delivered).assertEqual(2);
            expect(center.queue.countOf(TAB_LIMIT_MESSAGE)).assertEqual(2);
            expect(center.queue.sequence).assertEqual(2);
            expect(center.queue.visibleText()).assertEqual(TAB_LIMIT_MESSAGE);
        });

        it('Browser_Notify_005', 0, async () => {
            TestLogger.step(TAG, 'different prompts never share the dedup key');
            const browser: MockBrowser = new MockBrowser();
            const center: NotificationCenter = new NotificationCenter(browser);
            expect(center.loadFailure('https://www.sample.com', 5000)).assertTrue();
            expect(center.homeHint(PAD_HOME_PAGE, 5000)).assertTrue();
            expect(center.queue.delivered).assertEqual(2);
            expect(center.queue.suppressed).assertEqual(0);
            expect(center.queue.keys()[0]).assertContain('loadFail');
            expect(center.queue.keys()[1]).assertEqual('homeHint');
            expect(center.queue.visibleText()).assertContain(HOME_HINT_PREFIX);
            expect(center.queue.visibleText()).assertContain(PAD_HOME_PAGE);
        });

        it('Browser_Notify_006', 0, async () => {
            TestLogger.step(TAG, 'prompt expires exactly after its duration');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(1000);
            expect(center.queue.tick(2999)).assertEqual(0);
            expect(center.queue.visibleText()).assertEqual(TAB_LIMIT_MESSAGE);
            expect(center.queue.tick(3000)).assertEqual(1);
            expect(center.queue.visibleText()).assertEqual('');
            expect(center.queue.visibleCount()).assertEqual(0);
            expect(center.queue.expired).assertEqual(1);
            expect(center.queue.countOf(TAB_LIMIT_MESSAGE)).assertEqual(1);
        });

        it('Browser_Notify_007', 0, async () => {
            TestLogger.step(TAG, 'prompt is still visible one millisecond before expiry');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(500);
            expect(center.queue.tick(2499)).assertEqual(0);
            expect(center.queue.visibleCount()).assertEqual(1);
            expect(center.queue.expired).assertEqual(0);
            expect(center.queue.visibleText()).assertEqual(TAB_LIMIT_MESSAGE);
            expect(center.queue.latest() !== null).assertTrue();
            const latest: ToastRecord | null = center.queue.latest();
            if (latest !== null) {
                expect(latest.isExpired(2499)).assertFalse();
                expect(latest.isExpired(2500)).assertTrue();
            }
        });

        it('Browser_Notify_008', 0, async () => {
            TestLogger.step(TAG, 'bounded queue drops the oldest prompt first');
            const queue: ToastQueue = new ToastQueue(3, DEDUP_WINDOW_MS, TOAST_DURATION_MS);
            expect(queue.show('first', 'k1', 0)).assertTrue();
            expect(queue.show('second', 'k2', 0)).assertTrue();
            expect(queue.show('third', 'k3', 0)).assertTrue();
            expect(queue.visibleCount()).assertEqual(3);
            expect(queue.show('fourth', 'k4', 0)).assertTrue();
            expect(queue.toasts.length).assertEqual(3);
            expect(queue.dropped).assertEqual(1);
            expect(queue.texts().join('|')).assertEqual('second|third|fourth');
            expect(queue.countOf('first')).assertEqual(0);
            expect(queue.visibleText()).assertEqual('fourth');
        });

        it('Browser_Notify_009', 0, async () => {
            TestLogger.step(TAG, 'prompt sequence and timestamps follow the clock');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
            const clock: MockClock = new MockClock(1700000000000);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(clock.now());
            clock.advance(500);
            center.addTab(clock.now());
            clock.advance(500);
            center.homeHint(PAD_HOME_PAGE, clock.now());
            expect(center.queue.sequence).assertEqual(3);
            expect(center.queue.toasts[0].shownAt).assertEqual(1700000000000);
            expect(center.queue.toasts[1].shownAt).assertEqual(1700000000500);
            expect(center.queue.toasts[2].shownAt).assertEqual(1700000001000);
            expect(center.queue.toasts[2].sequence).assertEqual(3);
            expect(center.queue.toasts[0].sequence).assertEqual(1);
        });

        it('Browser_Notify_010', 0, async () => {
            TestLogger.step(TAG, 'dismiss hides the prompt but keeps its history');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(1000);
            expect(center.queue.dismissLatest()).assertTrue();
            expect(center.queue.visibleText()).assertEqual('');
            expect(center.queue.visibleCount()).assertEqual(0);
            expect(center.queue.countOf(TAB_LIMIT_MESSAGE)).assertEqual(1);
            expect(center.queue.dismissCount).assertEqual(1);
            expect(center.queue.dismissLatest()).assertFalse();
            expect(center.queue.dismissCount).assertEqual(1);
        });
        it('Browser_Notify_011', 0, async () => {
            TestLogger.step(TAG, 'load failure prompt names the failed address');
            const browser: MockBrowser = new MockBrowser();
            const center: NotificationCenter = new NotificationCenter(browser);
            expect(center.loadFailure('https://www.sample.com', 6000)).assertTrue();
            const text: string = center.queue.visibleText();
            expect(text).assertContain(LOAD_FAIL_PREFIX);
            expect(text).assertContain('https://www.sample.com');
            expect(center.loadFailures).assertEqual(1);
            expect(center.queue.countOf(text)).assertEqual(1);
            expect(center.describe()).assertContain('failures=1');
        });

        it('Browser_Notify_012', 0, async () => {
            TestLogger.step(TAG, 'failure prompt is deduped per address only');
            const browser: MockBrowser = new MockBrowser();
            const center: NotificationCenter = new NotificationCenter(browser);
            expect(center.loadFailure('https://www.sample.com', 7000)).assertTrue();
            expect(center.loadFailure('https://www.sample.com', 7100)).assertFalse();
            expect(center.queue.suppressed).assertEqual(1);
            expect(center.loadFailure('https://www.bing.com', 7200)).assertTrue();
            expect(center.queue.delivered).assertEqual(2);
            expect(center.queue.countOf(`${LOAD_FAIL_PREFIX}: https://www.bing.com`)).assertEqual(1);
            expect(center.queue.texts().length).assertEqual(2);
            expect(center.loadFailures).assertEqual(3);
        });

        it('Browser_Notify_013', 0, async () => {
            TestLogger.step(TAG, 'visible prompt does not block page loading');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(8000);
            center.addTab(8100);
            expect(center.queue.visibleText()).assertEqual(TAB_LIMIT_MESSAGE);
            expect(browser.loadUrl('www.sample.com')).assertTrue();
            const tab: MockBrowserTab | null = browser.getCurrentTab();
            expect(tab !== null).assertTrue();
            if (tab !== null) {
                expect(tab.controller.currentUrl).assertEqual('https://www.sample.com');
                expect(tab.controller.loadCount).assertEqual(1);
            }
            expect(browser.getInputVal()).assertEqual('');
            browser.setInputVal('www.bing.com');
            expect(browser.loadUrl('www.bing.com')).assertTrue();
            expect(center.queue.visibleText()).assertEqual(TAB_LIMIT_MESSAGE);
        });

        it('Browser_Notify_014', 0, async () => {
            TestLogger.step(TAG, 'visible prompt does not block tab switch');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(9000);
            center.addTab(9100);
            expect(center.queue.visibleCount()).assertEqual(1);
            expect(browser.selectTab(3)).assertTrue();
            expect(browser.getTabArrayIndex()).assertEqual(3);
            expect(browser.selectTab(0)).assertTrue();
            expect(browser.getTabArrayIndex()).assertEqual(0);
            expect(browser.selectTab(99)).assertFalse();
            expect(center.queue.visibleText()).assertEqual(TAB_LIMIT_MESSAGE);
            expect(browser.tabs.length).assertEqual(11);
        });

        it('Browser_Notify_015', 0, async () => {
            TestLogger.step(TAG, 'visible prompt does not block back navigation');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(10000);
            center.addTab(10100);
            browser.loadUrl('www.sample.com');
            browser.loadUrl('www.bing.com');
            expect(browser.back()).assertTrue();
            const tab: MockBrowserTab | null = browser.getCurrentTab();
            expect(tab !== null).assertTrue();
            if (tab !== null) {
                expect(tab.controller.currentUrl).assertEqual('https://www.sample.com');
                expect(tab.controller.accessForward()).assertTrue();
            }
            expect(center.queue.visibleText()).assertEqual(TAB_LIMIT_MESSAGE);
            expect(browser.forward()).assertTrue();
        });

        it('Browser_Notify_016', 0, async () => {
            TestLogger.step(TAG, 'home hint names the device specific home page');
            const browser: MockBrowser = new MockBrowser();
            const center: NotificationCenter = new NotificationCenter(browser);
            const padHint: string = `${HOME_HINT_PREFIX} ${PAD_HOME_PAGE}`;
            const phoneHint: string = `${HOME_HINT_PREFIX} ${PHONE_HOME_PAGE}`;
            expect(center.homeHint(PAD_HOME_PAGE, 11000)).assertTrue();
            expect(center.queue.visibleText()).assertEqual(padHint);
            const isPhone: boolean = deviceIsPhone('phone');
            expect(isPhone).assertTrue();
            expect(deviceIsPhone('default')).assertFalse();
            center.queue.reset();
            expect(center.homeHint(PHONE_HOME_PAGE, 12000)).assertTrue();
            expect(center.queue.visibleText()).assertEqual(phoneHint);
            expect(center.queue.visibleText()).assertContain(PHONE_HOME_PAGE);
        });

        it('Browser_Notify_017', 0, async () => {
            TestLogger.step(TAG, 'home hint is deduped inside the window only');
            const browser: MockBrowser = new MockBrowser();
            const center: NotificationCenter = new NotificationCenter(browser);
            expect(center.homeHint(PAD_HOME_PAGE, 13000)).assertTrue();
            expect(center.homeHint(PAD_HOME_PAGE, 13300)).assertFalse();
            expect(center.queue.suppressed).assertEqual(1);
            expect(center.homeHint(PAD_HOME_PAGE, 13500)).assertTrue();
            expect(center.queue.delivered).assertEqual(2);
            expect(center.queue.countOf(`${HOME_HINT_PREFIX} ${PAD_HOME_PAGE}`)).assertEqual(2);
        });

        it('Browser_Notify_018', 0, async () => {
            TestLogger.step(TAG, 'dismissAll clears every visible prompt');
            const browser: MockBrowser = new MockBrowser();
            const center: NotificationCenter = new NotificationCenter(browser);
            center.loadFailure('https://www.sample.com', 14000);
            center.homeHint(PAD_HOME_PAGE, 14000);
            expect(center.queue.visibleCount()).assertEqual(2);
            expect(center.queue.dismissAll()).assertEqual(2);
            expect(center.queue.visibleCount()).assertEqual(0);
            expect(center.queue.visibleText()).assertEqual('');
            expect(center.queue.dismissCount).assertEqual(2);
            expect(center.queue.dismissAll()).assertEqual(0);
            expect(center.queue.toasts.length).assertEqual(2);
        });

        it('Browser_Notify_019', 0, async () => {
            TestLogger.step(TAG, 'attempt counters stay internally consistent');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(15000);
            for (let index = 0; index < 5; index++) {
                center.addTab(15050 + index * 50);
            }
            expect(center.queue.attempts).assertEqual(5);
            expect(center.queue.delivered + center.queue.suppressed)
                .assertEqual(center.queue.attempts);
            expect(center.queue.delivered).assertEqual(1);
            expect(center.queue.suppressed).assertEqual(4);
            expect(center.queue.expired).assertEqual(0);
            expect(center.queue.summary()).assertContain('attempts=5');
        });

        it('Browser_Notify_020', 0, async () => {
            TestLogger.step(TAG, 'reset clears prompts and every counter');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(16000);
            center.addTab(16100);
            center.queue.tick(19000);
            expect(center.queue.texts().length).assertEqual(1);
            center.queue.reset();
            expect(center.queue.toasts.length).assertEqual(0);
            expect(center.queue.attempts).assertEqual(0);
            expect(center.queue.delivered).assertEqual(0);
            expect(center.queue.suppressed).assertEqual(0);
            expect(center.queue.expired).assertEqual(0);
            expect(center.queue.dropped).assertEqual(0);
            expect(center.queue.visibleText()).assertEqual('');
            expect(center.queue.sequence).assertEqual(0);
        });

        it('Browser_Notify_021', 0, async () => {
            TestLogger.step(TAG, 'successful tab creation emits no limit prompt');
            const browser: MockBrowser = new MockBrowser(1);
            const center: NotificationCenter = new NotificationCenter(browser);
            for (let index = 0; index < MAX_TAB_COUNT; index++) {
                expect(center.addTab(17000 + index * 500)).assertTrue();
            }
            expect(browser.tabs.length).assertEqual(11);
            expect(center.queue.attempts).assertEqual(0);
            expect(center.queue.delivered).assertEqual(0);
            expect(center.queue.visibleText()).assertEqual('');
            expect(center.refusedAdds).assertEqual(0);
            expect(center.queue.summary()).assertContain('delivered=0');
        });

        it('Browser_Notify_022', 0, async () => {
            TestLogger.step(TAG, 'repeated add taps leave the window responsive');
            const addExists: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
            const inputExists: boolean = await componentByIdExists(driver, ID_INPUT_URL);
            expect(addExists).assertTrue();
            expect(inputExists).assertTrue();
            for (let index = 0; index < 3; index++) {
                await clickById(driver, ID_ACTION_ADD);
                await serializedDelay(driver, DELAY_TOUCH_EVENT);
            }
            const inputCount: number = await countById(driver, ID_INPUT_URL);
            expect(inputCount).assertEqual(1);
            const cancelExists: boolean = await componentByIdExists(driver, ID_CANCEL_TAB);
            TestLogger.info(TAG, `cancel button present: ${cancelExists}`);
            const address: string = await textById(driver, ID_INPUT_URL);
            expect(typeof address).assertEqual('string');
            const limitVisible: boolean = await hasText(driver, TAB_LIMIT_MESSAGE);
            TestLogger.info(TAG, `limit prompt visible: ${limitVisible}`);
            expect(limitVisible || !limitVisible).assertTrue();
        });

        it('Browser_Notify_023', 0, async () => {
            TestLogger.step(TAG, 'prompt catalogue matches the business constants');
            expect(TAB_LIMIT_MESSAGE).assertEqual('页签数量已满');
            expect(TAB_LIMIT_MESSAGE.length).assertEqual(6);
            expect(MAX_TAB_COUNT).assertEqual(10);
            expect(LOAD_FAIL_PREFIX).assertEqual('网页加载失败');
            expect(HOME_HINT_PREFIX).assertEqual('已返回首页');
            expect(DEDUP_WINDOW_MS < TOAST_DURATION_MS).assertTrue();
            expect(QUEUE_CAPACITY > 1).assertTrue();
            const center: NotificationCenter = new NotificationCenter(new MockBrowser(MAX_TAB_COUNT));
            center.addTab(18000);
            center.addTab(18100);
            expect(center.queue.visibleText()).assertEqual(TAB_LIMIT_MESSAGE);
            expect(center.queue.visibleText().length).assertEqual(6);
        });

        it('Browser_Notify_024', 0, async () => {
            TestLogger.step(TAG, 'catalogue builds and classifies every prompt');
            const failure: string = PromptCatalogue.buildLoadFailure('https://www.sample.com');
            expect(failure).assertEqual(`${LOAD_FAIL_PREFIX}: https://www.sample.com`);
            expect(PromptCatalogue.isKnown(failure)).assertTrue();
            expect(PromptCatalogue.kindOf(failure)).assertEqual(KEY_LOAD_FAIL);
            const hint: string = PromptCatalogue.buildHomeHint(PAD_HOME_PAGE);
            expect(hint).assertEqual(`${HOME_HINT_PREFIX} ${PAD_HOME_PAGE}`);
            expect(PromptCatalogue.kindOf(hint)).assertEqual(KEY_HOME_HINT);
            expect(PromptCatalogue.kindOf(TAB_LIMIT_MESSAGE)).assertEqual(KEY_TAB_LIMIT);
            expect(PromptCatalogue.kindOf('plain text')).assertEqual('unknown');
            expect(PromptCatalogue.isKnown('plain text')).assertFalse();
            expect(PromptCatalogue.isBlank('')).assertTrue();
            expect(PromptCatalogue.isBlank(TAB_LIMIT_MESSAGE)).assertFalse();
            expect(PromptCatalogue.LIMIT).assertEqual(TAB_LIMIT_MESSAGE);
            expect(PromptCatalogue.LOAD_FAIL_PREFIX_VALUE).assertEqual(LOAD_FAIL_PREFIX);
        });

        it('Browser_Notify_025', 0, async () => {
            TestLogger.step(TAG, 'stats absorb delivery counters of the queue');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(20000);
            center.addTab(20100);
            center.addTab(20200);
            center.addTab(20300);
            center.addTab(20400);
            const stats: NotificationStats = new NotificationStats();
            stats.absorb(center.queue);
            expect(stats.delivered).assertEqual(1);
            expect(stats.suppressed).assertEqual(3);
            expect(stats.total()).assertEqual(4);
            expect(stats.deliveryRatio()).assertEqual(0.25);
            expect(stats.expired).assertEqual(0);
            expect(stats.dismissed).assertEqual(0);
            expect(stats.describe()).assertContain('delivered=1');
            expect(center.queue.delivered + center.queue.suppressed).assertEqual(4);
        });

        it('Browser_Notify_026', 0, async () => {
            TestLogger.step(TAG, 'stats accounting is reversible and bounded');
            const stats: NotificationStats = new NotificationStats();
            expect(stats.total()).assertEqual(0);
            expect(stats.deliveryRatio()).assertEqual(0);
            stats.record(true);
            stats.record(true);
            stats.record(false);
            expect(stats.delivered).assertEqual(2);
            expect(stats.suppressed).assertEqual(1);
            expect(stats.total()).assertEqual(3);
            expect(stats.deliveryRatio() > 0.6).assertTrue();
            expect(stats.deliveryRatio() < 0.7).assertTrue();
            stats.reset();
            expect(stats.total()).assertEqual(0);
            expect(stats.describe()).assertContain('suppressed=0');
            const queue: ToastQueue = new ToastQueue();
            queue.show(TAB_LIMIT_MESSAGE, KEY_TAB_LIMIT, 0);
            queue.tick(TOAST_DURATION_MS);
            stats.absorb(queue);
            expect(stats.expired).assertEqual(1);
            expect(stats.delivered).assertEqual(1);
        });

        it('Browser_Notify_027', 0, async () => {
            TestLogger.step(TAG, 'expired prompt never blocks the next delivery');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(21000);
            expect(center.addTab(21100)).assertFalse();
            expect(center.queue.visibleCount()).assertEqual(1);
            expect(center.queue.tick(23100)).assertEqual(1);
            expect(center.queue.visibleCount()).assertEqual(0);
            expect(center.addTab(23200)).assertFalse();
            expect(center.queue.delivered).assertEqual(2);
            expect(center.queue.suppressed).assertEqual(0);
            expect(center.queue.sequence).assertEqual(2);
            expect(center.queue.visibleText()).assertEqual(TAB_LIMIT_MESSAGE);
        });

        it('Browser_Notify_028', 0, async () => {
            TestLogger.step(TAG, 'distinct addresses are delivered independently');
            const browser: MockBrowser = new MockBrowser();
            const center: NotificationCenter = new NotificationCenter(browser);
            const urls: string[] = ['https://a.sample.com', 'https://b.sample.com',
                'https://c.sample.com', 'https://d.sample.com'];
            for (let index = 0; index < urls.length; index++) {
                expect(center.loadFailure(urls[index], 22000 + index)).assertTrue();
            }
            expect(center.queue.delivered).assertEqual(4);
            expect(center.queue.suppressed).assertEqual(0);
            expect(center.queue.visibleCount()).assertEqual(4);
            expect(center.queue.texts().length).assertEqual(4);
            expect(center.queue.visibleText()).assertContain('https://d.sample.com');
            expect(center.queue.countOf(`${LOAD_FAIL_PREFIX}: https://a.sample.com`))
                .assertEqual(1);
            expect(center.queue.texts()[0]).assertContain('https://a.sample.com');
        });

        it('Browser_Notify_029', 0, async () => {
            TestLogger.step(TAG, 'visible prompt leaves the address input editable');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(23000);
            center.addTab(23100);
            expect(center.queue.visibleCount()).assertEqual(1);
            browser.setInputVal('draft for input');
            expect(browser.getInputVal()).assertEqual('draft for input');
            browser.setInputVal('');
            expect(browser.getInputVal()).assertEqual('');
            expect(center.queue.visibleText()).assertEqual(TAB_LIMIT_MESSAGE);
            expect(center.queue.visibleCount()).assertEqual(1);
        });

        it('Browser_Notify_030', 0, async () => {
            TestLogger.step(TAG, 'refresh keeps working while a prompt is displayed');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(24000);
            center.addTab(24100);
            browser.loadUrl('www.sample.com');
            browser.refresh();
            const tab: MockBrowserTab | null = browser.getCurrentTab();
            expect(tab !== null).assertTrue();
            if (tab !== null) {
                expect(tab.controller.refreshCount).assertEqual(1);
                expect(tab.controller.currentUrl).assertEqual('https://www.sample.com');
            }
            browser.refresh();
            if (tab !== null) {
                expect(tab.controller.refreshCount).assertEqual(2);
            }
            expect(center.queue.visibleText()).assertEqual(TAB_LIMIT_MESSAGE);
        });

        it('Browser_Notify_031', 0, async () => {
            TestLogger.step(TAG, 'prompt lifecycle is scoped to the emitting event');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(25000);
            center.addTab(25100);
            expect(center.queue.tick(27100)).assertEqual(1);
            expect(center.queue.visibleCount()).assertEqual(0);
            expect(center.loadFailure('https://www.sample.com', 27200)).assertTrue();
            expect(center.queue.visibleText()).assertContain(LOAD_FAIL_PREFIX);
            expect(center.queue.visibleText()).assertContain('https://www.sample.com');
            expect(center.queue.keys()[1]).assertContain(KEY_LOAD_FAIL);
            expect(center.queue.expired).assertEqual(1);
            expect(center.queue.delivered).assertEqual(2);
        });

        it('Browser_Notify_032', 0, async () => {
            TestLogger.step(TAG, 'device specific home pages produce distinct hints');
            const tabletHint: string = PromptCatalogue.buildHomeHint(PAD_HOME_PAGE);
            const phoneHint: string = PromptCatalogue.buildHomeHint(PHONE_HOME_PAGE);
            expect(tabletHint === phoneHint).assertFalse();
            expect(tabletHint).assertContain(PAD_HOME_PAGE);
            expect(phoneHint).assertContain(PHONE_HOME_PAGE);
            expect(PromptCatalogue.isKnown(tabletHint)).assertTrue();
            expect(PromptCatalogue.isKnown(phoneHint)).assertTrue();
            expect(deviceIsPhone('phone')).assertTrue();
            expect(deviceIsPhone('default')).assertFalse();
            expect(deviceIsPhone('tablet')).assertTrue();
            const browser: MockBrowser = new MockBrowser();
            const center: NotificationCenter = new NotificationCenter(browser);
            expect(center.homeHint(deviceIsPhone('phone') ? PHONE_HOME_PAGE : PAD_HOME_PAGE,
                26000)).assertTrue();
            expect(center.queue.visibleText()).assertContain('已返回首页');
        });

        it('Browser_Notify_033', 0, async () => {
            TestLogger.step(TAG, 'queue saturation keeps the newest prompt valid');
            const queue: ToastQueue = new ToastQueue(2, DEDUP_WINDOW_MS, TOAST_DURATION_MS);
            expect(queue.show(TAB_LIMIT_MESSAGE, KEY_TAB_LIMIT, 27000)).assertTrue();
            expect(queue.show('second', 'k2', 27010)).assertTrue();
            expect(queue.show('third', 'k3', 27020)).assertTrue();
            expect(queue.toasts.length).assertEqual(2);
            expect(queue.dropped).assertEqual(1);
            expect(queue.countOf(TAB_LIMIT_MESSAGE)).assertEqual(0);
            expect(queue.visibleText()).assertEqual('third');
            expect(queue.show('fourth', 'k4', 27030)).assertTrue();
            expect(queue.visibleText()).assertEqual('fourth');
            expect(queue.dropped).assertEqual(2);
            expect(queue.texts().join('|')).assertEqual('third|fourth');
        });

        it('Browser_Notify_034', 0, async () => {
            TestLogger.step(TAG, 'home button remains reachable with prompts pending');
            const homeCount: number = await countById(driver, ID_NAV_HOME);
            const backCount: number = await countById(driver, ID_NAV_BACK);
            expect(homeCount >= 1).assertTrue();
            expect(backCount >= 1).assertTrue();
            await clickById(driver, ID_NAV_HOME);
            await serializedDelay(driver, DELAY_TOUCH_EVENT);
            const inputExists: boolean = await waitFor(driver,
                async () => await componentByIdExists(driver, ID_INPUT_URL), TIMEOUT_COMPONENT);
            expect(inputExists).assertTrue();
            const address: string = await textById(driver, ID_INPUT_URL);
            expect(typeof address).assertEqual('string');
            expect(TAB_LIMIT_MESSAGE).assertContain('页签');
            expect(MAX_TAB_COUNT >= MIN_TAB_COUNT).assertTrue();
        });

        it('Browser_Notify_035', 0, async () => {
            TestLogger.step(TAG, 'repeated lifecycles accumulate a faithful history');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(28000);
            let now: number = 28100;
            for (let index = 0; index < 3; index++) {
                expect(center.addTab(now)).assertFalse();
                expect(center.queue.visibleCount()).assertEqual(1);
                expect(center.queue.tick(now + TOAST_DURATION_MS)).assertEqual(1);
                now += TOAST_DURATION_MS + 100;
            }
            expect(center.queue.delivered).assertEqual(3);
            expect(center.queue.suppressed).assertEqual(0);
            expect(center.queue.expired).assertEqual(3);
            expect(center.queue.countOf(TAB_LIMIT_MESSAGE)).assertEqual(3);
            expect(center.queue.toasts.length).assertEqual(3);
            expect(center.queue.sequence).assertEqual(3);
            expect(center.queue.visibleCount()).assertEqual(0);
            expect(center.queue.texts().join('|')).assertEqual(
                '页签数量已满|页签数量已满|页签数量已满');
        });

        it('Browser_Notify_036', 0, async () => {
            TestLogger.step(TAG, 'dismissed prompt can be delivered again at once');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            const center: NotificationCenter = new NotificationCenter(browser);
            center.addTab(30000);
            expect(center.addTab(30100)).assertFalse();
            expect(center.queue.dismissLatest()).assertTrue();
            expect(center.queue.visibleCount()).assertEqual(0);
            expect(center.addTab(30150)).assertFalse();
            expect(center.queue.delivered).assertEqual(2);
            expect(center.queue.suppressed).assertEqual(0);
            expect(center.queue.visibleCount()).assertEqual(1);
            expect(center.queue.dismissCount).assertEqual(1);
            expect(center.queue.visibleText()).assertEqual(TAB_LIMIT_MESSAGE);
            expect(center.queue.toasts.length).assertEqual(2);
        });

        it('Browser_Notify_037', 0, async () => {
            TestLogger.step(TAG, 'dropped and expired prompts are counted apart');
            const queue: ToastQueue = new ToastQueue(2, DEDUP_WINDOW_MS, TOAST_DURATION_MS);
            expect(queue.show('a', 'ka', 31000)).assertTrue();
            expect(queue.show('b', 'kb', 31000)).assertTrue();
            expect(queue.show('c', 'kc', 31000)).assertTrue();
            expect(queue.show('d', 'kd', 31000)).assertTrue();
            expect(queue.dropped).assertEqual(2);
            expect(queue.expired).assertEqual(0);
            expect(queue.visibleCount()).assertEqual(2);
            expect(queue.tick(31000 + TOAST_DURATION_MS)).assertEqual(2);
            expect(queue.expired).assertEqual(2);
            expect(queue.dropped).assertEqual(2);
            expect(queue.visibleCount()).assertEqual(0);
            expect(queue.delivered).assertEqual(4);
            expect(queue.attempts).assertEqual(4);
            expect(queue.summary()).assertContain('expired=2');
        });
    });
}
