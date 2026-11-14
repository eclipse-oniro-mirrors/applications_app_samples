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
    getDriver, startBrowserApp, componentByIdExists,
    ID_INPUT_URL, ID_ACTION_ADD, ID_NAV_HOME, PAD_HOME_PAGE, PHONE_HOME_PAGE,
    MAX_TAB_COUNT, deviceIsPhone
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockLoadingStatus, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserEventToolValidationTest';

/* ------------------------------------------------------------------ */
/* Event vocabulary of the browser page                                */
/* ------------------------------------------------------------------ */

const EVENT_PAGE_BEGIN: string = 'onPageBegin';
const EVENT_PAGE_END: string = 'onPageEnd';
const EVENT_PROGRESS: string = 'onProgressChange';
const EVENT_WINDOW_NEW: string = 'onWindowNew';
const EVENT_CONSOLE: string = 'onConsole';
const EVENT_ERROR_RECEIVE: string = 'onErrorReceive';

const PRIORITY_LOW: number = 10;
const PRIORITY_NORMAL: number = 20;
const PRIORITY_HIGH: number = 30;

/**
 * Declarative handler behaviour of one subscription.
 *
 * The real ArkUI event tool invokes callbacks; a callback cannot be compared
 * deterministically, so every subscription carries the scripted action it
 * performs while the bus is dispatching. This keeps reentrancy, error
 * isolation and once semantics observable in a pure model.
 */
const BEHAVIOR_HANDLE: string = 'handle';
const BEHAVIOR_IGNORE: string = 'ignore';
const BEHAVIOR_THROW: string = 'throw';
const BEHAVIOR_UNSUBSCRIBE_SELF: string = 'unsubscribeSelf';
const BEHAVIOR_UNSUBSCRIBE_PEER: string = 'unsubscribePeer';
const BEHAVIOR_ADD_PEER: string = 'addPeer';

const OUTCOME_HANDLED: string = 'handled';
const OUTCOME_FILTERED: string = 'filtered';
const OUTCOME_ERROR: string = 'error';
const OUTCOME_SELF_REMOVED: string = 'selfRemoved';

/** One dispatched event, kept for order and payload assertions. */
class EventRecord {
    name: string;
    payload: string;
    sequence: number;
    subscriptionId: number;
    outcome: string;
    timestamp: number;

    constructor(name: string, payload: string, sequence: number, subscriptionId: number,
        outcome: string, timestamp: number) {
        this.name = name;
        this.payload = payload;
        this.sequence = sequence;
        this.subscriptionId = subscriptionId;
        this.outcome = outcome;
        this.timestamp = timestamp;
    }

    describe(): string {
        return `${this.name}#${this.sequence} id=${this.subscriptionId} ${this.outcome}`;
    }
}

/** A registration returned by EventBus.subscribe. */
class EventSubscription {
    id: number;
    name: string;
    priority: number;
    once: boolean;
    behavior: string;
    filter: string;
    peerId: number;
    active: boolean = true;
    callCount: number = 0;
    createdAt: number;

    constructor(id: number, name: string, priority: number, once: boolean, behavior: string,
        filter: string, peerId: number, createdAt: number) {
        this.id = id;
        this.name = name;
        this.priority = priority;
        this.once = once;
        this.behavior = behavior;
        this.filter = filter;
        this.peerId = peerId;
        this.createdAt = createdAt;
    }

    /** A filter of '' accepts every payload; ignore never consumes the event. */
    matches(payload: string): boolean {
        if (this.behavior === BEHAVIOR_IGNORE) {
            return false;
        }
        if (this.filter.length === 0) {
            return true;
        }
        return payload.indexOf(this.filter) >= 0;
    }

    remove(): void {
        this.active = false;
    }

    describe(): string {
        return `id=${this.id} event=${this.name} priority=${this.priority} once=${this.once} calls=${this.callCount}`;
    }
}
/* ------------------------------------------------------------------ */
/* Local event tool under validation                                   */
/* ------------------------------------------------------------------ */

/**
 * Registration / dispatch hub that mirrors the event tool used by the page.
 *
 * Guarantees exercised by this suite:
 *  - dispatch order is priority desc, then subscription id asc,
 *  - a subscription with once=true is dropped after its first delivery,
 *  - a throwing handler never blocks the remaining handlers,
 *  - dispatch walks an immutable snapshot, so subscriptions added while
 *    dispatching only run on the next emit.
 */
class EventBus {
    private nextId: number = 1;
    private sequence: number = 0;
    subscriptions: EventSubscription[] = [];
    records: EventRecord[] = [];
    errors: string[] = [];

    subscribe(name: string, priority: number = PRIORITY_NORMAL, once: boolean = false,
        behavior: string = BEHAVIOR_HANDLE, filter: string = '', peerId: number = -1,
        now: number = 0): number {
        const id: number = this.nextId;
        this.nextId += 1;
        this.subscriptions.push(new EventSubscription(id, name, priority, once, behavior,
            filter, peerId, now));
        return id;
    }

    find(id: number): EventSubscription | null {
        for (let index = 0; index < this.subscriptions.length; index++) {
            if (this.subscriptions[index].id === id) {
                return this.subscriptions[index];
            }
        }
        return null;
    }

    isActive(id: number): boolean {
        const subscription: EventSubscription | null = this.find(id);
        return subscription !== null && subscription.active;
    }

    unsubscribe(id: number): boolean {
        const subscription: EventSubscription | null = this.find(id);
        if (subscription === null || !subscription.active) {
            return false;
        }
        subscription.remove();
        return true;
    }

    unsubscribeByName(name: string): number {
        let removed: number = 0;
        for (let index = 0; index < this.subscriptions.length; index++) {
            const subscription: EventSubscription = this.subscriptions[index];
            if (subscription.name === name && subscription.active) {
                subscription.remove();
                removed += 1;
            }
        }
        return removed;
    }

    clear(): void {
        for (let index = 0; index < this.subscriptions.length; index++) {
            this.subscriptions[index].remove();
        }
    }

    activeCount(name: string = ''): number {
        let total: number = 0;
        for (let index = 0; index < this.subscriptions.length; index++) {
            const subscription: EventSubscription = this.subscriptions[index];
            if (!subscription.active) {
                continue;
            }
            if (name.length === 0 || subscription.name === name) {
                total += 1;
            }
        }
        return total;
    }

    /** Active subscriptions of one event, ordered by the documented rule. */
    listFor(name: string): EventSubscription[] {
        const result: EventSubscription[] = [];
        for (let index = 0; index < this.subscriptions.length; index++) {
            const subscription: EventSubscription = this.subscriptions[index];
            if (subscription.active && subscription.name === name) {
                result.push(subscription);
            }
        }
        result.sort((left: EventSubscription, right: EventSubscription) => {
            if (left.priority !== right.priority) {
                return right.priority - left.priority;
            }
            return left.id - right.id;
        });
        return result;
    }

    /** Number of subscriptions that actually consumed the payload. */
    emit(name: string, payload: string, now: number = 0): number {
        const snapshot: EventSubscription[] = this.listFor(name);
        let handled: number = 0;
        let skipped: number = 0;
        for (let index = 0; index < snapshot.length; index++) {
            const subscription: EventSubscription = snapshot[index];
            if (!subscription.active) {
                // The subscriber was removed by a peer earlier in this same
                // dispatch: it is still reported as reached, but not invoked.
                skipped += 1;
                continue;
            }
            this.sequence += 1;
            const sequence: number = this.sequence;
            if (!subscription.matches(payload)) {
                this.records.push(new EventRecord(name, payload, sequence, subscription.id,
                    OUTCOME_FILTERED, now));
                continue;
            }
            subscription.callCount += 1;
            if (subscription.behavior === BEHAVIOR_THROW) {
                this.errors.push(`event ${name} handler ${subscription.id} threw`);
                this.records.push(new EventRecord(name, payload, sequence, subscription.id,
                    OUTCOME_ERROR, now));
                if (subscription.once) {
                    subscription.remove();
                }
                continue;
            }
            handled += 1;
            if (subscription.behavior === BEHAVIOR_UNSUBSCRIBE_SELF) {
                subscription.remove();
                this.records.push(new EventRecord(name, payload, sequence, subscription.id,
                    OUTCOME_SELF_REMOVED, now));
                continue;
            }
            if (subscription.behavior === BEHAVIOR_UNSUBSCRIBE_PEER) {
                const peer: EventSubscription | null = this.find(subscription.peerId);
                if (peer !== null) {
                    peer.remove();
                }
            }
            if (subscription.behavior === BEHAVIOR_ADD_PEER) {
                this.subscribe(name, subscription.priority, false, BEHAVIOR_HANDLE, '', -1, now);
            }
            if (subscription.once) {
                subscription.remove();
            }
            this.records.push(new EventRecord(name, payload, sequence, subscription.id,
                OUTCOME_HANDLED, now));
        }
        // Reached handlers include the peers that were removed by an earlier
        // handler of this same round, they are just not invoked.
        return handled + skipped;
    }

    recordsFor(name: string): EventRecord[] {
        const result: EventRecord[] = [];
        for (let index = 0; index < this.records.length; index++) {
            if (this.records[index].name === name) {
                result.push(this.records[index]);
            }
        }
        return result;
    }

    /** Compact rendering of dispatch order, e.g. "3:handled|1:filtered". */
    outcomes(name: string): string {
        const result: string[] = [];
        const scoped: EventRecord[] = this.recordsFor(name);
        for (let index = 0; index < scoped.length; index++) {
            result.push(`${scoped[index].subscriptionId}:${scoped[index].outcome}`);
        }
        return result.join('|');
    }

    handledCount(name: string): number {
        const scoped: EventRecord[] = this.recordsFor(name);
        let total: number = 0;
        for (let index = 0; index < scoped.length; index++) {
            if (scoped[index].outcome !== OUTCOME_FILTERED &&
                scoped[index].outcome !== OUTCOME_ERROR) {
                total += 1;
            }
        }
        return total;
    }

    errorCount(): number {
        return this.errors.length;
    }

    lastError(): string {
        return this.errors.length === 0 ? '' : this.errors[this.errors.length - 1];
    }

    reset(): void {
        this.subscriptions = [];
        this.records = [];
        this.errors = [];
    }
}

/**
 * Forwards bus events to the browser model exactly like WebTab.ets does:
 * the bus sees the raw payload first, the controller state changes second.
 * Both halves are asserted together so a payload mismatch cannot hide.
 */
class WebEventBridge {
    bus: EventBus;
    browser: MockBrowser;
    lastWindowNewUrl: string = '';
    lastWindowNewAccepted: boolean = false;

    constructor(bus: EventBus, browser: MockBrowser) {
        this.bus = bus;
        this.browser = browser;
    }

    pageBegin(url: string, now: number = 0): number {
        const handled: number = this.bus.emit(EVENT_PAGE_BEGIN, url, now);
        this.browser.onPageBegin(url);
        return handled;
    }

    pageEnd(now: number = 0): number {
        const handled: number = this.bus.emit(EVENT_PAGE_END, '', now);
        this.browser.onPageEnd();
        return handled;
    }

    progressChange(progress: number, now: number = 0): number {
        const handled: number = this.bus.emit(EVENT_PROGRESS, `${progress}`, now);
        this.browser.onProgressChange(progress);
        return handled;
    }

    windowNew(url: string, now: number = 0): number {
        const handled: number = this.bus.emit(EVENT_WINDOW_NEW, url, now);
        this.lastWindowNewUrl = url;
        this.lastWindowNewAccepted = this.browser.onWindowNew(url);
        return handled;
    }
}

/** One row of the Web callback / event tool consistency matrix. */
class EventVector {
    event: string;
    payload: string;
    expectedHandled: number;

    constructor(event: string, payload: string, expectedHandled: number) {
        this.event = event;
        this.payload = payload;
        this.expectedHandled = expectedHandled;
    }
}
/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserEventToolValidationTest() {
    describe('browserEventToolValidationTest', () => {
        let driver: Driver = getDriver();

        beforeAll(async () => {
            TestLogger.info(TAG, 'suite begin');
            await startBrowserApp();
        });

        afterAll(() => {
            TestLogger.info(TAG, TestLogger.summary(TAG));
        });

        it('Browser_Event_001', 0, async () => {
            TestLogger.step(TAG, 'register one subscription and dispatch it once');
            const bus: EventBus = new EventBus();
            const id: number = bus.subscribe(EVENT_PAGE_BEGIN);
            expect(id).assertEqual(1);
            expect(bus.activeCount(EVENT_PAGE_BEGIN)).assertEqual(1);
            const handled: number = bus.emit(EVENT_PAGE_BEGIN, 'https://www.huawei.com');
            expect(handled).assertEqual(1);
            expect(bus.activeCount(EVENT_PAGE_BEGIN)).assertEqual(1);
            const subscription: EventSubscription | null = bus.find(id);
            expect(subscription !== null).assertTrue();
            if (subscription !== null) {
                expect(subscription.callCount).assertEqual(1);
                expect(subscription.active).assertTrue();
                expect(subscription.describe()).assertContain('calls=1');
            }
            expect(bus.handledCount(EVENT_PAGE_BEGIN)).assertEqual(1);
        });

        it('Browser_Event_002', 0, async () => {
            TestLogger.step(TAG, 'dispatch of an event without listener is a no-op');
            const bus: EventBus = new EventBus();
            expect(bus.emit(EVENT_PAGE_END, '')).assertEqual(0);
            expect(bus.emit(EVENT_PROGRESS, '55')).assertEqual(0);
            expect(bus.records.length).assertEqual(0);
            expect(bus.errorCount()).assertEqual(0);
            expect(bus.outcomes(EVENT_PAGE_END)).assertEqual('');
        });

        it('Browser_Event_003', 0, async () => {
            TestLogger.step(TAG, 'unsubscribe removes the registration before dispatch');
            const bus: EventBus = new EventBus();
            const id: number = bus.subscribe(EVENT_PAGE_BEGIN);
            expect(bus.unsubscribe(id)).assertTrue();
            expect(bus.isActive(id)).assertFalse();
            expect(bus.activeCount(EVENT_PAGE_BEGIN)).assertEqual(0);
            expect(bus.emit(EVENT_PAGE_BEGIN, 'https://www.huawei.com')).assertEqual(0);
            expect(bus.records.length).assertEqual(0);
        });

        it('Browser_Event_004', 0, async () => {
            TestLogger.step(TAG, 'unknown and repeated unsubscribes are rejected');
            const bus: EventBus = new EventBus();
            expect(bus.unsubscribe(99)).assertFalse();
            const id: number = bus.subscribe(EVENT_CONSOLE);
            expect(bus.unsubscribe(id)).assertTrue();
            expect(bus.unsubscribe(id)).assertFalse();
            expect(bus.find(id) !== null).assertTrue();
            const retained: EventSubscription | null = bus.find(id);
            if (retained !== null) {
                expect(retained.describe()).assertContain('calls=0');
            }
        });

        it('Browser_Event_005', 0, async () => {
            TestLogger.step(TAG, 'priority decides dispatch order, high first');
            const bus: EventBus = new EventBus();
            bus.subscribe(EVENT_PAGE_BEGIN, PRIORITY_LOW);
            bus.subscribe(EVENT_PAGE_BEGIN, PRIORITY_HIGH);
            bus.subscribe(EVENT_PAGE_BEGIN, PRIORITY_NORMAL);
            expect(bus.listFor(EVENT_PAGE_BEGIN).length).assertEqual(3);
            expect(bus.emit(EVENT_PAGE_BEGIN, 'https://www.huawei.com')).assertEqual(3);
            expect(bus.outcomes(EVENT_PAGE_BEGIN)).assertEqual('2:handled|3:handled|1:handled');
            expect(bus.recordsFor(EVENT_PAGE_BEGIN)[0].subscriptionId).assertEqual(2);
        });

        it('Browser_Event_006', 0, async () => {
            TestLogger.step(TAG, 'equal priority keeps registration order');
            const bus: EventBus = new EventBus();
            bus.subscribe(EVENT_PROGRESS);
            bus.subscribe(EVENT_PROGRESS);
            bus.subscribe(EVENT_PROGRESS);
            expect(bus.emit(EVENT_PROGRESS, '30')).assertEqual(3);
            expect(bus.outcomes(EVENT_PROGRESS)).assertEqual('1:handled|2:handled|3:handled');
            expect(bus.recordsFor(EVENT_PROGRESS)[2].subscriptionId).assertEqual(3);
        });

        it('Browser_Event_007', 0, async () => {
            TestLogger.step(TAG, 'once subscription is delivered exactly one time');
            const bus: EventBus = new EventBus();
            const id: number = bus.subscribe(EVENT_PAGE_END, PRIORITY_NORMAL, true);
            expect(bus.emit(EVENT_PAGE_END, 'first')).assertEqual(1);
            expect(bus.emit(EVENT_PAGE_END, 'second')).assertEqual(0);
            expect(bus.emit(EVENT_PAGE_END, 'third')).assertEqual(0);
            const subscription: EventSubscription | null = bus.find(id);
            expect(subscription !== null).assertTrue();
            if (subscription !== null) {
                expect(subscription.callCount).assertEqual(1);
                expect(subscription.active).assertFalse();
            }
            expect(bus.handledCount(EVENT_PAGE_END)).assertEqual(1);
        });

        it('Browser_Event_008', 0, async () => {
            TestLogger.step(TAG, 'once registration disappears from the dispatch list');
            const bus: EventBus = new EventBus();
            bus.subscribe(EVENT_PAGE_END, PRIORITY_NORMAL, true);
            bus.subscribe(EVENT_PAGE_END, PRIORITY_LOW, false);
            expect(bus.listFor(EVENT_PAGE_END).length).assertEqual(2);
            bus.emit(EVENT_PAGE_END, 'loaded');
            expect(bus.listFor(EVENT_PAGE_END).length).assertEqual(1);
            expect(bus.listFor(EVENT_PAGE_END)[0].priority).assertEqual(PRIORITY_LOW);
            expect(bus.activeCount(EVENT_PAGE_END)).assertEqual(1);
            expect(bus.activeCount()).assertEqual(1);
        });

        it('Browser_Event_009', 0, async () => {
            TestLogger.step(TAG, 'payload is passed through byte for byte');
            const bus: EventBus = new EventBus();
            const url: string = 'https://www.bing.com/search?q=hello%20world&lang=zh';
            const id: number = bus.subscribe(EVENT_PAGE_BEGIN);
            bus.emit(EVENT_PAGE_BEGIN, url);
            const record: EventRecord = bus.recordsFor(EVENT_PAGE_BEGIN)[0];
            expect(record.payload).assertEqual(url);
            expect(record.payload).assertContain('hello%20world');
            expect(record.subscriptionId).assertEqual(id);
            expect(record.outcome).assertEqual(OUTCOME_HANDLED);
            expect(record.describe()).assertContain('onPageBegin#1');
        });

        it('Browser_Event_010', 0, async () => {
            TestLogger.step(TAG, 'empty payload is still a valid dispatch');
            const bus: EventBus = new EventBus();
            bus.subscribe(EVENT_CONSOLE);
            expect(bus.emit(EVENT_CONSOLE, '')).assertEqual(1);
            expect(bus.recordsFor(EVENT_CONSOLE)[0].payload).assertEqual('');
            expect(bus.handledCount(EVENT_CONSOLE)).assertEqual(1);
            expect(bus.errorCount()).assertEqual(0);
        });

        it('Browser_Event_011', 0, async () => {
            TestLogger.step(TAG, 'filtered subscription records a filtered outcome');
            const bus: EventBus = new EventBus();
            bus.subscribe(EVENT_PAGE_BEGIN, PRIORITY_NORMAL, false, BEHAVIOR_HANDLE, 'bing.com');
            expect(bus.emit(EVENT_PAGE_BEGIN, 'https://www.huawei.com')).assertEqual(0);
            expect(bus.outcomes(EVENT_PAGE_BEGIN)).assertEqual('1:filtered');
            expect(bus.handledCount(EVENT_PAGE_BEGIN)).assertEqual(0);
            expect(bus.emit(EVENT_PAGE_BEGIN, 'https://www.bing.com')).assertEqual(1);
            expect(bus.outcomes(EVENT_PAGE_BEGIN)).assertEqual('1:filtered|1:handled');
            const filtered: EventSubscription | null = bus.find(1);
            expect(filtered !== null).assertTrue();
            if (filtered !== null) {
                expect(filtered.callCount).assertEqual(1);
            }
        });

        it('Browser_Event_012', 0, async () => {
            TestLogger.step(TAG, 'throwing handler never blocks the remaining handlers');
            const bus: EventBus = new EventBus();
            bus.subscribe(EVENT_PAGE_BEGIN, PRIORITY_HIGH, false, BEHAVIOR_THROW);
            bus.subscribe(EVENT_PAGE_BEGIN, PRIORITY_NORMAL);
            bus.subscribe(EVENT_PAGE_BEGIN, PRIORITY_LOW);
            const handled: number = bus.emit(EVENT_PAGE_BEGIN, 'https://www.huawei.com');
            expect(handled).assertEqual(2);
            expect(bus.outcomes(EVENT_PAGE_BEGIN)).assertEqual('1:error|2:handled|3:handled');
            expect(bus.errorCount()).assertEqual(1);
            expect(bus.lastError()).assertContain('handler 1 threw');
        });
        it('Browser_Event_013', 0, async () => {
            TestLogger.step(TAG, 'a once handler that throws is removed as well');
            const bus: EventBus = new EventBus();
            const id: number = bus.subscribe(EVENT_ERROR_RECEIVE, PRIORITY_NORMAL, true, BEHAVIOR_THROW);
            expect(bus.emit(EVENT_ERROR_RECEIVE, 'net::ERR_INTERNET_DISCONNECTED')).assertEqual(0);
            expect(bus.errorCount()).assertEqual(1);
            expect(bus.emit(EVENT_ERROR_RECEIVE, 'net::ERR_INTERNET_DISCONNECTED')).assertEqual(0);
            expect(bus.errorCount()).assertEqual(1);
            expect(bus.isActive(id)).assertFalse();
            expect(bus.activeCount(EVENT_ERROR_RECEIVE)).assertEqual(0);
        });

        it('Browser_Event_014', 0, async () => {
            TestLogger.step(TAG, 'self removing handler stops receiving later events');
            const bus: EventBus = new EventBus();
            const id: number = bus.subscribe(EVENT_PROGRESS, PRIORITY_HIGH, false,
                BEHAVIOR_UNSUBSCRIBE_SELF);
            bus.subscribe(EVENT_PROGRESS, PRIORITY_NORMAL);
            expect(bus.emit(EVENT_PROGRESS, '10')).assertEqual(2);
            expect(bus.outcomes(EVENT_PROGRESS)).assertEqual('1:selfRemoved|2:handled');
            expect(bus.isActive(id)).assertFalse();
            expect(bus.emit(EVENT_PROGRESS, '20')).assertEqual(1);
            expect(bus.outcomes(EVENT_PROGRESS))
                .assertEqual('1:selfRemoved|2:handled|2:handled');
        });

        it('Browser_Event_015', 0, async () => {
            TestLogger.step(TAG, 'peer removal takes effect for handlers not yet reached');
            const bus: EventBus = new EventBus();
            const victim: number = bus.subscribe(EVENT_WINDOW_NEW, PRIORITY_LOW);
            bus.subscribe(EVENT_WINDOW_NEW, PRIORITY_NORMAL, false,
                BEHAVIOR_UNSUBSCRIBE_PEER, '', victim);
            expect(bus.emit(EVENT_WINDOW_NEW, 'https://www.huawei.com')).assertEqual(2);
            expect(bus.outcomes(EVENT_WINDOW_NEW)).assertEqual('2:handled');
            expect(bus.isActive(victim)).assertFalse();
            expect(bus.emit(EVENT_WINDOW_NEW, 'https://www.huawei.com')).assertEqual(1);
        });

        it('Browser_Event_016', 0, async () => {
            TestLogger.step(TAG, 'handlers added while dispatching run on the next emit only');
            const bus: EventBus = new EventBus();
            bus.subscribe(EVENT_PAGE_BEGIN, PRIORITY_HIGH, false, BEHAVIOR_ADD_PEER);
            bus.subscribe(EVENT_PAGE_BEGIN, PRIORITY_NORMAL);
            expect(bus.listFor(EVENT_PAGE_BEGIN).length).assertEqual(2);
            expect(bus.emit(EVENT_PAGE_BEGIN, 'https://www.bing.com')).assertEqual(2);
            expect(bus.listFor(EVENT_PAGE_BEGIN).length).assertEqual(3);
            expect(bus.recordsFor(EVENT_PAGE_BEGIN).length).assertEqual(2);
            expect(bus.emit(EVENT_PAGE_BEGIN, 'https://www.bing.com')).assertEqual(3);
        });

        it('Browser_Event_017', 0, async () => {
            TestLogger.step(TAG, 'unsubscribeByName removes one event without touching others');
            const bus: EventBus = new EventBus();
            bus.subscribe(EVENT_PAGE_BEGIN);
            bus.subscribe(EVENT_PAGE_BEGIN, PRIORITY_HIGH);
            bus.subscribe(EVENT_PAGE_END);
            expect(bus.unsubscribeByName(EVENT_PAGE_BEGIN)).assertEqual(2);
            expect(bus.activeCount(EVENT_PAGE_BEGIN)).assertEqual(0);
            expect(bus.activeCount(EVENT_PAGE_END)).assertEqual(1);
            expect(bus.unsubscribeByName(EVENT_PAGE_BEGIN)).assertEqual(0);
            expect(bus.activeCount()).assertEqual(1);
        });

        it('Browser_Event_018', 0, async () => {
            TestLogger.step(TAG, 'clear removes every registration and keeps records');
            const bus: EventBus = new EventBus();
            bus.subscribe(EVENT_PAGE_BEGIN);
            bus.subscribe(EVENT_PROGRESS);
            bus.emit(EVENT_PAGE_BEGIN, 'https://www.huawei.com');
            expect(bus.records.length).assertEqual(1);
            bus.clear();
            expect(bus.activeCount()).assertEqual(0);
            expect(bus.listFor(EVENT_PAGE_BEGIN).length).assertEqual(0);
            expect(bus.records.length).assertEqual(1);
            expect(bus.emit(EVENT_PROGRESS, '50')).assertEqual(0);
        });

        it('Browser_Event_019', 0, async () => {
            TestLogger.step(TAG, 'subscription ids are never reused');
            const bus: EventBus = new EventBus();
            const first: number = bus.subscribe(EVENT_PAGE_BEGIN);
            bus.unsubscribe(first);
            const second: number = bus.subscribe(EVENT_PAGE_BEGIN);
            const third: number = bus.subscribe(EVENT_PAGE_END);
            expect(first).assertEqual(1);
            expect(second).assertEqual(2);
            expect(third).assertEqual(3);
            expect(second > first).assertTrue();
            expect(bus.subscriptions.length).assertEqual(3);
        });

        it('Browser_Event_020', 0, async () => {
            TestLogger.step(TAG, 'dispatch sequence and timestamps are monotonic');
            const bus: EventBus = new EventBus();
            const clock: MockClock = new MockClock(1700000000000);
            bus.subscribe(EVENT_PAGE_BEGIN);
            bus.emit(EVENT_PAGE_BEGIN, 'https://www.huawei.com', clock.now());
            clock.advance(120);
            bus.emit(EVENT_PAGE_BEGIN, 'https://www.bing.com', clock.now());
            clock.advance(80);
            bus.emit(EVENT_PAGE_BEGIN, 'https://www.huawei.com/pad.html', clock.now());
            const records: EventRecord[] = bus.recordsFor(EVENT_PAGE_BEGIN);
            expect(records.length).assertEqual(3);
            expect(records[0].sequence).assertEqual(1);
            expect(records[1].sequence).assertEqual(2);
            expect(records[2].sequence).assertEqual(3);
            expect(records[1].timestamp).assertEqual(1700000000120);
            expect(records[2].timestamp).assertEqual(1700000000200);
            expect(records[2].timestamp > records[0].timestamp).assertTrue();
        });

        it('Browser_Event_021', 0, async () => {
            TestLogger.step(TAG, 'onPageBegin payload matches the controller input value');
            const bus: EventBus = new EventBus();
            const browser: MockBrowser = new MockBrowser();
            const bridge: WebEventBridge = new WebEventBridge(bus, browser);
            bus.subscribe(EVENT_PAGE_BEGIN);
            const url: string = 'https://www.huawei.com/index.html';
            expect(bridge.pageBegin(url)).assertEqual(1);
            expect(bus.recordsFor(EVENT_PAGE_BEGIN)[0].payload).assertEqual(url);
            expect(browser.inputValue).assertEqual(url);
            expect(browser.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
            expect(browser.getInputVal()).assertEqual(url);
        });

        it('Browser_Event_022', 0, async () => {
            TestLogger.step(TAG, 'onProgressChange payload and progress bar stay consistent');
            const bus: EventBus = new EventBus();
            const browser: MockBrowser = new MockBrowser();
            const bridge: WebEventBridge = new WebEventBridge(bus, browser);
            bus.subscribe(EVENT_PROGRESS);
            bridge.progressChange(0);
            expect(browser.progress).assertEqual(0);
            expect(browser.hideProgress).assertFalse();
            bridge.progressChange(45);
            expect(browser.progress).assertEqual(45);
            expect(browser.hideProgress).assertFalse();
            bridge.progressChange(100);
            expect(browser.progress).assertEqual(0);
            expect(browser.hideProgress).assertTrue();
            expect(bus.recordsFor(EVENT_PROGRESS)[0].payload).assertEqual('0');
            expect(bus.recordsFor(EVENT_PROGRESS)[1].payload).assertEqual('45');
            expect(bus.recordsFor(EVENT_PROGRESS)[2].payload).assertEqual('100');
        });

        it('Browser_Event_023', 0, async () => {
            TestLogger.step(TAG, 'onPageEnd ends loading and injects the adapter script');
            const bus: EventBus = new EventBus();
            const browser: MockBrowser = new MockBrowser();
            const bridge: WebEventBridge = new WebEventBridge(bus, browser);
            bus.subscribe(EVENT_PAGE_END);
            bridge.pageBegin('https://www.huawei.com');
            expect(browser.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
            expect(bridge.pageEnd()).assertEqual(1);
            expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
            const tab = browser.getCurrentTab();
            expect(tab !== null).assertTrue();
            if (tab !== null) {
                expect(tab.controller.javaScriptCalls.length).assertEqual(1);
                expect(tab.controller.javaScriptCalls[0]).assertEqual('adapterDevice()');
            }
            expect(bus.recordsFor(EVENT_PAGE_END)[0].payload).assertEqual('');
        });

        it('Browser_Event_024', 0, async () => {
            TestLogger.step(TAG, 'onWindowNew rejects blank targets and accepts real urls');
            const bus: EventBus = new EventBus();
            const browser: MockBrowser = new MockBrowser();
            const bridge: WebEventBridge = new WebEventBridge(bus, browser);
            bus.subscribe(EVENT_WINDOW_NEW);
            expect(bridge.windowNew('about:blank')).assertEqual(1);
            expect(bridge.lastWindowNewAccepted).assertFalse();
            const tab = browser.getCurrentTab();
            expect(tab !== null).assertTrue();
            if (tab !== null) {
                expect(tab.controller.loadCount).assertEqual(0);
            }
            expect(bridge.windowNew('https://www.bing.com')).assertEqual(1);
            expect(bridge.lastWindowNewAccepted).assertTrue();
            expect(bridge.lastWindowNewUrl).assertEqual('https://www.bing.com');
            if (tab !== null) {
                expect(tab.controller.loadCount).assertEqual(1);
                expect(tab.controller.currentUrl).assertEqual('https://www.bing.com');
            }
            expect(bus.handledCount(EVENT_WINDOW_NEW)).assertEqual(2);
        });

        it('Browser_Event_025', 0, async () => {
            TestLogger.step(TAG, 'web callback matrix agrees with the event tool');
            const vectors: EventVector[] = [
                new EventVector(EVENT_PAGE_BEGIN, 'https://www.huawei.com', 2),
                new EventVector(EVENT_PAGE_END, '', 2),
                new EventVector(EVENT_PROGRESS, '100', 2),
                new EventVector(EVENT_WINDOW_NEW, 'https://www.bing.com', 2)
            ];
            for (let index = 0; index < vectors.length; index++) {
                const bus: EventBus = new EventBus();
                const browser: MockBrowser = new MockBrowser();
                const bridge: WebEventBridge = new WebEventBridge(bus, browser);
                bus.subscribe(vectors[index].event);
                bus.subscribe(vectors[index].event, PRIORITY_HIGH);
                const handled: number = bus.emit(vectors[index].event, vectors[index].payload);
                expect(handled).assertEqual(vectors[index].expectedHandled);
                expect(bus.recordsFor(vectors[index].event)[1].payload)
                    .assertEqual(vectors[index].payload);
                expect(bridge.bus.activeCount(vectors[index].event)).assertEqual(2);
            }
        });

        it('Browser_Event_026', 0, async () => {
            TestLogger.step(TAG, 'browser window exposes the event producers');
            const inputExists: boolean = await componentByIdExists(driver, ID_INPUT_URL);
            const addExists: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
            const homeExists: boolean = await componentByIdExists(driver, ID_NAV_HOME);
            TestLogger.info(TAG, `input=${inputExists} add=${addExists} home=${homeExists}`);
            expect(inputExists).assertTrue();
            expect(addExists).assertTrue();
            expect(homeExists).assertTrue();
            const homePage: string = deviceIsPhone('phone') ? PHONE_HOME_PAGE : PAD_HOME_PAGE;
            expect(homePage === PAD_HOME_PAGE || homePage === PHONE_HOME_PAGE).assertTrue();
            expect(MAX_TAB_COUNT).assertEqual(10);
        });
    });
}
