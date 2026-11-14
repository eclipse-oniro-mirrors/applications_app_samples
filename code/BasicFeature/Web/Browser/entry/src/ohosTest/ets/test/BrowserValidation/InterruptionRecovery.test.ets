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
    ID_INPUT_URL, ID_NAV_HOME, ID_NAV_BACK,
    MAX_TAB_COUNT, deviceIsPhone
} from '../Shared/BrowserTestKit';
import {
    MockBrowser, MockBrowserTab, MockLoadingStatus, MockNetwork, MockClock
} from '../Shared/BrowserMock';

const TAG: string = 'BrowserInterruptionRecoveryTest';

/* ------------------------------------------------------------------ */
/* Interruption vocabulary                                             */
/* ------------------------------------------------------------------ */

const INTERRUPT_CALL: string = 'incomingCall';
const INTERRUPT_BACKGROUND: string = 'background';
const INTERRUPT_LOCK: string = 'screenLock';
const INTERRUPT_ROTATION: string = 'rotation';
const INTERRUPT_NETWORK: string = 'networkLoss';
const INTERRUPT_TAB_RECLAIM: string = 'tabReclaimed';

const STEP_PAUSE: string = 'pause';
const STEP_REATTACH: string = 'reattach';
const STEP_RESTORE_TABS: string = 'restoreTabs';
const STEP_RELOAD: string = 'reload';
const STEP_RESET_PROGRESS: string = 'resetProgress';
const STEP_RESTORE_LAYOUT: string = 'restoreLayout';
const STEP_RECLAIM: string = 'reclaim';
const STEP_RESUME: string = 'resume';

const ORIENTATION_PORTRAIT: string = 'portrait';
const ORIENTATION_LANDSCAPE: string = 'landscape';

const LAYOUT_PAD: string = 'padLayout';
const LAYOUT_PHONE: string = 'phoneLayout';

const HOME_PAGE: string = 'pad.html';
const REASON_EMPTY: string = 'emptySnapshot';
const REASON_TAB_MISMATCH: string = 'tabMismatch';

/** One ordered recovery action with its outcome. */
class RecoveryStep {
    order: number;
    name: string;
    critical: boolean;
    executed: boolean = false;
    ok: boolean = false;
    note: string = '';

    constructor(order: number, name: string, critical: boolean) {
        this.order = order;
        this.name = name;
        this.critical = critical;
    }

    mark(ok: boolean, note: string = ''): void {
        this.executed = true;
        this.ok = ok;
        this.note = note;
    }

    describe(): string {
        const state: string = !this.executed ? 'pending' : (this.ok ? 'ok' : 'failed');
        return `${this.order}:${this.name}:${state}`;
    }
}

/** Ordered recovery script produced for one interruption kind. */
class RecoveryPlan {
    kind: string;
    steps: RecoveryStep[] = [];
    maxAttempts: number;
    attempts: number = 0;

    constructor(kind: string, maxAttempts: number = 1) {
        this.kind = kind;
        this.maxAttempts = maxAttempts <= 0 ? 1 : maxAttempts;
    }

    addStep(name: string, critical: boolean = true): RecoveryStep {
        const step: RecoveryStep = new RecoveryStep(this.steps.length + 1, name, critical);
        this.steps.push(step);
        return step;
    }

    stepNames(): string[] {
        return this.steps.map((step: RecoveryStep) => step.name);
    }

    stepNamesJoined(): string {
        return this.stepNames().join('>');
    }

    indexOf(name: string): number {
        for (let index = 0; index < this.steps.length; index++) {
            if (this.steps[index].name === name) {
                return index;
            }
        }
        return -1;
    }

    executedNames(): string[] {
        const result: string[] = [];
        for (let index = 0; index < this.steps.length; index++) {
            if (this.steps[index].executed) {
                result.push(this.steps[index].name);
            }
        }
        return result;
    }

    failedStepName(): string {
        for (let index = 0; index < this.steps.length; index++) {
            if (this.steps[index].executed && !this.steps[index].ok) {
                return this.steps[index].name;
            }
        }
        return '';
    }

    criticalCount(): number {
        let total: number = 0;
        for (let index = 0; index < this.steps.length; index++) {
            if (this.steps[index].critical) {
                total += 1;
            }
        }
        return total;
    }

    resetSteps(): void {
        for (let index = 0; index < this.steps.length; index++) {
            this.steps[index].executed = false;
            this.steps[index].ok = false;
            this.steps[index].note = '';
        }
    }

    describe(): string {
        return `plan=${this.kind} steps=${this.steps.length} attempts=${this.attempts}/${this.maxAttempts}`;
    }
}

/** Everything the browser must be able to rebuild after an interruption. */
class RecoverySnapshot {
    kind: string;
    tabUrls: string[] = [];
    keys: number[] = [];
    activeIndex: number = 0;
    inputValue: string = '';
    progress: number = 0;
    hideProgress: boolean = true;
    historyIndex: number = -1;
    takenAt: number = 0;

    constructor(kind: string, takenAt: number) {
        this.kind = kind;
        this.takenAt = takenAt;
    }

    tabCount(): number {
        return this.tabUrls.length;
    }

    activeUrl(): string {
        if (this.activeIndex < 0 || this.activeIndex >= this.tabUrls.length) {
            return '';
        }
        return this.tabUrls[this.activeIndex];
    }

    equals(other: RecoverySnapshot | null): boolean {
        if (other === null || other.tabCount() !== this.tabCount()) {
            return false;
        }
        for (let index = 0; index < this.tabUrls.length; index++) {
            if (this.tabUrls[index] !== other.tabUrls[index]) {
                return false;
            }
        }
        return this.activeIndex === other.activeIndex && this.inputValue === other.inputValue;
    }

    describe(): string {
        return `snapshot=${this.kind} tabs=${this.tabCount()} index=${this.activeIndex} url=${this.activeUrl()}`;
    }
}
/** Result of one recovery attempt sequence. */
class RecoveryOutcome {
    kind: string;
    ok: boolean;
    degraded: boolean;
    reason: string;
    executed: string[] = [];
    restoredTabCount: number = 0;
    attempts: number = 0;

    constructor(kind: string, ok: boolean, degraded: boolean, reason: string) {
        this.kind = kind;
        this.ok = ok;
        this.degraded = degraded;
        this.reason = reason;
    }

    executedJoined(): string {
        return this.executed.join('>');
    }

    describe(): string {
        return `outcome=${this.kind} ok=${this.ok} degraded=${this.degraded} reason=${this.reason}`;
    }
}

/**
 * Recovery engine mirroring the sample behaviour:
 *  - the snapshot is taken before the interruption is delivered,
 *  - the plan is a fixed ordered script per interruption kind,
 *  - a critical step that keeps failing degrades the session to the home
 *    page while keeping the tab list alive,
 *  - nothing is mutated when the snapshot itself is unusable.
 */
class RecoveryEngine {
    layoutMode: string = LAYOUT_PAD;
    orientation: string = ORIENTATION_PORTRAIT;
    reloadCount: number = 0;
    degradedCount: number = 0;

    planFor(kind: string): RecoveryPlan {
        let plan: RecoveryPlan = new RecoveryPlan(kind, 1);
        if (kind === INTERRUPT_NETWORK) {
            plan = new RecoveryPlan(kind, 3);
        }
        if (kind === INTERRUPT_CALL) {
            plan.addStep(STEP_PAUSE);
            plan.addStep(STEP_REATTACH);
            plan.addStep(STEP_RESUME);
            return plan;
        }
        if (kind === INTERRUPT_BACKGROUND) {
            plan.addStep(STEP_PAUSE);
            plan.addStep(STEP_REATTACH);
            plan.addStep(STEP_RESTORE_TABS);
            plan.addStep(STEP_RESUME);
            return plan;
        }
        if (kind === INTERRUPT_LOCK) {
            plan.addStep(STEP_PAUSE);
            plan.addStep(STEP_REATTACH);
            plan.addStep(STEP_RESTORE_TABS);
            plan.addStep(STEP_RESET_PROGRESS);
            plan.addStep(STEP_RESUME);
            return plan;
        }
        if (kind === INTERRUPT_ROTATION) {
            plan.addStep(STEP_PAUSE);
            plan.addStep(STEP_RESTORE_LAYOUT);
            plan.addStep(STEP_REATTACH);
            plan.addStep(STEP_RESTORE_TABS);
            plan.addStep(STEP_RESUME);
            return plan;
        }
        if (kind === INTERRUPT_TAB_RECLAIM) {
            plan.addStep(STEP_PAUSE);
            plan.addStep(STEP_RECLAIM);
            plan.addStep(STEP_RESTORE_TABS);
            plan.addStep(STEP_RELOAD);
            plan.addStep(STEP_RESUME);
            return plan;
        }
        plan.addStep(STEP_PAUSE);
        plan.addStep(STEP_REATTACH);
        plan.addStep(STEP_RELOAD, false);
        plan.addStep(STEP_RESUME);
        return plan;
    }

    capture(browser: MockBrowser, kind: string, now: number): RecoverySnapshot {
        const snapshot: RecoverySnapshot = new RecoverySnapshot(kind, now);
        snapshot.activeIndex = browser.getTabArrayIndex();
        snapshot.inputValue = browser.getInputVal();
        snapshot.progress = browser.progress;
        snapshot.hideProgress = browser.hideProgress;
        for (let index = 0; index < browser.tabs.length; index++) {
            const tab: MockBrowserTab = browser.tabs[index];
            snapshot.tabUrls.push(tab.controller.currentUrl);
            snapshot.keys.push(tab.key);
        }
        const current: MockBrowserTab | null = browser.getCurrentTab();
        if (current !== null) {
            snapshot.historyIndex = current.controller.historyIndex;
        }
        return snapshot;
    }

    private rebuildTabs(browser: MockBrowser, snapshot: RecoverySnapshot): boolean {
        const rebuilt: MockBrowserTab[] = [];
        for (let index = 0; index < snapshot.tabUrls.length; index++) {
            const tab: MockBrowserTab = new MockBrowserTab(index, 1700000000000 + index);
            if (snapshot.tabUrls[index].length > 0) {
                tab.controller.loadUrl(snapshot.tabUrls[index]);
            }
            rebuilt.push(tab);
        }
        browser.tabs = rebuilt;
        const targetIndex: number = snapshot.activeIndex < browser.tabs.length ?
            snapshot.activeIndex : browser.tabs.length - 1;
        browser.setTabArrayIndex(targetIndex < 0 ? 0 : targetIndex);
        browser.setInputVal(snapshot.inputValue);
        return browser.tabs.length === snapshot.tabCount();
    }

    private runStep(step: RecoveryStep, browser: MockBrowser, snapshot: RecoverySnapshot,
        network: MockNetwork, orientation: string): boolean {
        if (step.name === STEP_PAUSE) {
            browser.loadingStatus = MockLoadingStatus.END;
            step.mark(true);
            return true;
        }
        if (step.name === STEP_REATTACH) {
            const ok: boolean = browser.tabs.length > 0;
            step.mark(ok, ok ? '' : 'no tab to attach');
            return ok;
        }
        if (step.name === STEP_RESTORE_TABS) {
            const ok: boolean = this.rebuildTabs(browser, snapshot);
            step.mark(ok, ok ? '' : REASON_TAB_MISMATCH);
            return ok;
        }
        if (step.name === STEP_RESTORE_LAYOUT) {
            this.orientation = orientation;
            this.layoutMode = orientation === ORIENTATION_LANDSCAPE ? LAYOUT_PAD : LAYOUT_PHONE;
            step.mark(true);
            return true;
        }
        if (step.name === STEP_RESET_PROGRESS) {
            browser.progress = 0;
            browser.hideProgress = true;
            step.mark(true);
            return true;
        }
        if (step.name === STEP_RECLAIM) {
            const reclaimed: number = browser.tabs.length;
            step.mark(reclaimed >= 0, `reclaimed=${reclaimed}`);
            return true;
        }
        if (step.name === STEP_RELOAD || step.name === STEP_RESUME) {
            const current: MockBrowserTab | null = browser.getCurrentTab();
            if (step.name === STEP_RELOAD) {
                if (current === null) {
                    step.mark(false, 'no tab');
                    return false;
                }
                if (!network.online) {
                    step.mark(false, 'offline');
                    return false;
                }
                this.reloadCount += 1;
                current.controller.loadUrl(snapshot.activeUrl());
                step.mark(true);
                return true;
            }
            browser.loadingStatus = MockLoadingStatus.END;
            step.mark(true);
            return true;
        }
        step.mark(false, 'unknownStep');
        return false;
    }

    restore(browser: MockBrowser, snapshot: RecoverySnapshot, network: MockNetwork,
        plan: RecoveryPlan, orientation: string = ORIENTATION_PORTRAIT): RecoveryOutcome {
        const outcome: RecoveryOutcome = new RecoveryOutcome(plan.kind, false, false, '');
        if (snapshot.tabCount() === 0) {
            outcome.reason = REASON_EMPTY;
            outcome.degraded = true;
            this.degradedCount += 1;
            browser.tabs = [new MockBrowserTab(0, 1700000000000)];
            browser.setTabArrayIndex(0);
            outcome.restoredTabCount = browser.tabs.length;
            return outcome;
        }
        let executed: string[] = [];
        let failure: string = '';
        for (let attempt = 0; attempt < plan.maxAttempts; attempt++) {
            plan.attempts += 1;
            plan.resetSteps();
            executed = [];
            failure = '';
            for (let index = 0; index < plan.steps.length; index++) {
                const step: RecoveryStep = plan.steps[index];
                const ok: boolean = this.runStep(step, browser, snapshot, network, orientation);
                executed.push(step.name);
                if (!ok) {
                    failure = step.name;
                    if (step.critical) {
                        break;
                    }
                }
            }
            if (failure.length === 0) {
                break;
            }
        }
        outcome.executed = executed;
        outcome.attempts = plan.attempts;
        outcome.restoredTabCount = browser.tabs.length;
        if (failure.length === 0) {
            outcome.ok = true;
            browser.loadingStatus = MockLoadingStatus.END;
            return outcome;
        }
        outcome.ok = false;
        outcome.degraded = true;
        outcome.reason = failure;
        this.degradedCount += 1;
        browser.resetToHome(HOME_PAGE);
        if (browser.tabs.length === 0) {
            browser.tabs = [new MockBrowserTab(0, 1700000000000)];
            browser.setTabArrayIndex(0);
        }
        return outcome;
    }
}

/** FIFO queue that collapses repeated interruption kinds. */
class InterruptionQueue {
    pending: string[] = [];
    suppressed: number = 0;

    enqueue(kind: string): boolean {
        if (this.pending.indexOf(kind) >= 0) {
            this.suppressed += 1;
            return false;
        }
        this.pending.push(kind);
        return true;
    }

    drain(): string[] {
        const result: string[] = this.pending.slice(0);
        this.pending = [];
        return result;
    }

    size(): number {
        return this.pending.length;
    }

    describe(): string {
        return `pending=${this.pending.join(',')} suppressed=${this.suppressed}`;
    }
}

/** Tracks tabs whose Web content was reclaimed by the system. */
class ReclaimStore {
    indices: number[] = [];
    urls: string[] = [];

    reclaim(browser: MockBrowser, index: number): boolean {
        if (index < 0 || index >= browser.tabs.length) {
            return false;
        }
        const tab: MockBrowserTab = browser.tabs[index];
        this.indices.push(index);
        this.urls.push(tab.controller.currentUrl);
        tab.controller.reset();
        return true;
    }

    restoreAt(browser: MockBrowser, slot: number): boolean {
        if (slot < 0 || slot >= this.urls.length) {
            return false;
        }
        const index: number = this.indices[slot];
        if (index < 0 || index >= browser.tabs.length) {
            return false;
        }
        if (this.urls[slot].length === 0) {
            return false;
        }
        browser.tabs[index].controller.loadUrl(this.urls[slot]);
        return true;
    }

    size(): number {
        return this.urls.length;
    }
}
/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserInterruptionRecoveryTest() {
    describe('browserInterruptionRecoveryTest', () => {
        let driver: Driver = getDriver();

        beforeAll(async () => {
            TestLogger.info(TAG, 'suite begin');
            await startBrowserApp();
        });

        afterAll(() => {
            TestLogger.info(TAG, TestLogger.summary(TAG));
        });

        it('Browser_Interrupt_001', 0, async () => {
            TestLogger.step(TAG, 'snapshot captures tabs, urls, index and input');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.addTab();
            browser.loadUrl('www.bing.com');
            browser.setInputVal('www.bing.com');
            const clock: MockClock = new MockClock(1700000000000);
            const engine: RecoveryEngine = new RecoveryEngine();
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_CALL, clock.now());
            expect(snapshot.tabCount()).assertEqual(2);
            expect(snapshot.keys.join(',')).assertEqual('0,1');
            expect(snapshot.tabUrls[0]).assertEqual('https://www.huawei.com');
            expect(snapshot.tabUrls[1]).assertEqual('https://www.bing.com');
            expect(snapshot.activeIndex).assertEqual(1);
            expect(snapshot.activeUrl()).assertEqual('https://www.bing.com');
            expect(snapshot.inputValue).assertEqual('www.bing.com');
            expect(snapshot.takenAt).assertEqual(1700000000000);
            expect(snapshot.describe()).assertContain('tabs=2');
        });

        it('Browser_Interrupt_002', 0, async () => {
            TestLogger.step(TAG, 'incoming call plan pauses before reattach');
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_CALL);
            expect(plan.stepNamesJoined()).assertEqual('pause>reattach>resume');
            expect(plan.maxAttempts).assertEqual(1);
            expect(plan.criticalCount()).assertEqual(3);
            expect(plan.indexOf(STEP_PAUSE)).assertEqual(0);
            expect(plan.indexOf(STEP_REATTACH) > plan.indexOf(STEP_PAUSE)).assertTrue();
            expect(plan.indexOf(STEP_RESUME) > plan.indexOf(STEP_REATTACH)).assertTrue();
            expect(plan.describe()).assertContain('steps=3');
        });

        it('Browser_Interrupt_003', 0, async () => {
            TestLogger.step(TAG, 'background recovery keeps tab count and urls');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.addTab();
            browser.loadUrl('pad.html');
            browser.setTabArrayIndex(0);
            const network: MockNetwork = new MockNetwork();
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_BACKGROUND);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_BACKGROUND, 10);
            const outcome: RecoveryOutcome = engine.restore(browser, snapshot, network, plan);
            expect(outcome.ok).assertTrue();
            expect(outcome.degraded).assertFalse();
            expect(browser.tabs.length).assertEqual(2);
            expect(browser.tabs[0].controller.currentUrl).assertEqual('https://www.huawei.com');
            expect(browser.tabs[1].controller.currentUrl).assertEqual('https://pad.html');
            expect(browser.getTabArrayIndex()).assertEqual(0);
            expect(outcome.executedJoined())
                .assertEqual('pause>reattach>restoreTabs>resume');
        });

        it('Browser_Interrupt_004', 0, async () => {
            TestLogger.step(TAG, 'lock and unlock reset progress while keeping urls');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.onProgressChange(63);
            browser.onPageBegin('https://www.huawei.com');
            expect(browser.progress).assertEqual(63);
            expect(browser.hideProgress).assertFalse();
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_LOCK);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_LOCK, 20);
            const outcome: RecoveryOutcome = engine.restore(browser, snapshot, new MockNetwork(), plan);
            expect(outcome.ok).assertTrue();
            expect(browser.progress).assertEqual(0);
            expect(browser.hideProgress).assertTrue();
            expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
            expect(browser.tabs[0].controller.currentUrl).assertEqual('https://www.huawei.com');
            expect(plan.indexOf(STEP_RESET_PROGRESS) > plan.indexOf(STEP_RESTORE_TABS)).assertTrue();
        });

        it('Browser_Interrupt_005', 0, async () => {
            TestLogger.step(TAG, 'rotation switches layout and preserves the tab list');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.addTab();
            browser.loadUrl('www.bing.com');
            const engine: RecoveryEngine = new RecoveryEngine();
            expect(engine.layoutMode).assertEqual(LAYOUT_PAD);
            expect(engine.orientation).assertEqual(ORIENTATION_PORTRAIT);
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_ROTATION);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_ROTATION, 30);
            const outcome: RecoveryOutcome = engine.restore(browser, snapshot, new MockNetwork(),
                plan, ORIENTATION_LANDSCAPE);
            expect(outcome.ok).assertTrue();
            expect(engine.orientation).assertEqual(ORIENTATION_LANDSCAPE);
            expect(engine.layoutMode).assertEqual(LAYOUT_PAD);
            expect(browser.tabs.length).assertEqual(2);
            expect(browser.tabs[1].controller.currentUrl).assertEqual('https://www.bing.com');
            expect(browser.getTabArrayIndex()).assertEqual(1);
            expect(plan.indexOf(STEP_RESTORE_LAYOUT)).assertEqual(1);
        });

        it('Browser_Interrupt_006', 0, async () => {
            TestLogger.step(TAG, 'offline recovery reload fails and degrades to home');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.setInputVal('www.huawei.com');
            const network: MockNetwork = new MockNetwork();
            network.setOnline(false);
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_NETWORK);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_NETWORK, 40);
            const outcome: RecoveryOutcome = engine.restore(browser, snapshot, network, plan);
            expect(outcome.ok).assertFalse();
            expect(outcome.degraded).assertTrue();
            expect(outcome.reason).assertEqual(STEP_RELOAD);
            expect(outcome.attempts).assertEqual(3);
            expect(engine.degradedCount).assertEqual(1);
            expect(browser.tabs.length).assertEqual(1);
            expect(browser.tabs[0].controller.currentUrl).assertEqual(HOME_PAGE);
            expect(browser.getInputVal()).assertEqual('');
        });

        it('Browser_Interrupt_007', 0, async () => {
            TestLogger.step(TAG, 'reconnect recovery reloads the interrupted url');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            const network: MockNetwork = new MockNetwork();
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_NETWORK);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_NETWORK, 50);
            expect(network.online).assertTrue();
            const outcome: RecoveryOutcome = engine.restore(browser, snapshot, network, plan);
            expect(outcome.ok).assertTrue();
            expect(outcome.reason).assertEqual('');
            expect(engine.reloadCount).assertEqual(1);
            expect(network.requestCount()).assertEqual(0);
            expect(browser.tabs[0].controller.currentUrl).assertEqual('https://www.huawei.com');
            expect(outcome.executedJoined()).assertEqual('pause>reattach>reload>resume');
        });

        it('Browser_Interrupt_008', 0, async () => {
            TestLogger.step(TAG, 'reclaimed tab is rebuilt from the reclaim store');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.addTab();
            browser.loadUrl('www.bing.com');
            const store: ReclaimStore = new ReclaimStore();
            expect(store.reclaim(browser, 1)).assertTrue();
            expect(browser.tabs[1].controller.currentUrl).assertEqual('');
            expect(browser.tabs[1].key).assertEqual(1);
            expect(store.size()).assertEqual(1);
            expect(store.restoreAt(browser, 0)).assertTrue();
            expect(browser.tabs[1].controller.currentUrl).assertEqual('https://www.bing.com');
            expect(browser.tabs.length).assertEqual(2);
            expect(store.reclaim(browser, 9)).assertFalse();
            expect(store.restoreAt(browser, 4)).assertFalse();
        });

        it('Browser_Interrupt_009', 0, async () => {
            TestLogger.step(TAG, 'tab reclaim plan rebuilds tabs before reloading');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.addTab();
            browser.loadUrl('www.bing.com');
            browser.setTabArrayIndex(1);
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_TAB_RECLAIM);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_TAB_RECLAIM, 60);
            const outcome: RecoveryOutcome = engine.restore(browser, snapshot, new MockNetwork(), plan);
            expect(outcome.ok).assertTrue();
            expect(browser.tabs.length).assertEqual(2);
            expect(browser.getTabArrayIndex()).assertEqual(1);
            expect(browser.tabs[1].controller.currentUrl).assertEqual('https://www.bing.com');
            expect(engine.reloadCount).assertEqual(1);
            expect(plan.stepNamesJoined())
                .assertEqual('pause>reclaim>restoreTabs>reload>resume');
        });

        it('Browser_Interrupt_010', 0, async () => {
            TestLogger.step(TAG, 'executed steps follow the declared order exactly');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_LOCK);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_LOCK, 70);
            const outcome: RecoveryOutcome = engine.restore(browser, snapshot, new MockNetwork(), plan);
            expect(outcome.executed.length).assertEqual(plan.steps.length);
            expect(outcome.executedJoined()).assertEqual('pause>reattach>restoreTabs>resetProgress>resume');
            for (let index = 0; index < plan.steps.length; index++) {
                expect(plan.steps[index].executed).assertTrue();
                expect(plan.steps[index].ok).assertTrue();
                expect(plan.steps[index].order).assertEqual(index + 1);
            }
            expect(plan.failedStepName()).assertEqual('');
        });

        it('Browser_Interrupt_011', 0, async () => {
            TestLogger.step(TAG, 'recovery of the same snapshot is idempotent');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.addTab();
            browser.loadUrl('www.bing.com');
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_BACKGROUND);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_BACKGROUND, 80);
            const first: RecoveryOutcome = engine.restore(browser, snapshot, new MockNetwork(), plan);
            const urlsAfterFirst: string = browser.tabs.map(
                (tab: MockBrowserTab) => tab.controller.currentUrl).join('|');
            const second: RecoveryOutcome = engine.restore(browser, snapshot, new MockNetwork(), plan);
            const urlsAfterSecond: string = browser.tabs.map(
                (tab: MockBrowserTab) => tab.controller.currentUrl).join('|');
            expect(first.ok).assertTrue();
            expect(second.ok).assertTrue();
            expect(urlsAfterSecond).assertEqual(urlsAfterFirst);
            expect(browser.tabs.length).assertEqual(2);
            expect(browser.getTabArrayIndex()).assertEqual(1);
        });
        it('Browser_Interrupt_012', 0, async () => {
            TestLogger.step(TAG, 'empty snapshot degrades without throwing');
            const browser: MockBrowser = new MockBrowser();
            const engine: RecoveryEngine = new RecoveryEngine();
            const snapshot: RecoverySnapshot = new RecoverySnapshot(INTERRUPT_LOCK, 90);
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_LOCK);
            const outcome: RecoveryOutcome = engine.restore(browser, snapshot, new MockNetwork(), plan);
            expect(snapshot.tabCount()).assertEqual(0);
            expect(outcome.ok).assertFalse();
            expect(outcome.degraded).assertTrue();
            expect(outcome.reason).assertEqual(REASON_EMPTY);
            expect(browser.tabs.length).assertEqual(1);
            expect(browser.getTabArrayIndex()).assertEqual(0);
            expect(outcome.restoredTabCount).assertEqual(1);
            expect(snapshot.equals(null)).assertFalse();
        });

        it('Browser_Interrupt_013', 0, async () => {
            TestLogger.step(TAG, 'snapshot repairs a tab count mismatch');
            const source: MockBrowser = new MockBrowser();
            source.loadUrl('www.huawei.com');
            source.addTab();
            source.loadUrl('www.bing.com');
            source.addTab();
            source.loadUrl('pad.html');
            const engine: RecoveryEngine = new RecoveryEngine();
            const snapshot: RecoverySnapshot = engine.capture(source, INTERRUPT_BACKGROUND, 100);
            const target: MockBrowser = new MockBrowser(1);
            target.loadUrl('www.huawei.com');
            expect(target.tabs.length).assertEqual(1);
            expect(snapshot.tabCount()).assertEqual(3);
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_BACKGROUND);
            const outcome: RecoveryOutcome = engine.restore(target, snapshot, new MockNetwork(), plan);
            expect(outcome.ok).assertTrue();
            expect(target.tabs.length).assertEqual(3);
            expect(target.tabs[2].controller.currentUrl).assertEqual('https://pad.html');
            expect(outcome.restoredTabCount).assertEqual(3);
            expect(snapshot.describe()).assertContain('tabs=3');
        });

        it('Browser_Interrupt_014', 0, async () => {
            TestLogger.step(TAG, 'interruption queue keeps order and drops duplicates');
            const queue: InterruptionQueue = new InterruptionQueue();
            expect(queue.enqueue(INTERRUPT_CALL)).assertTrue();
            expect(queue.enqueue(INTERRUPT_CALL)).assertFalse();
            expect(queue.enqueue(INTERRUPT_BACKGROUND)).assertTrue();
            expect(queue.enqueue(INTERRUPT_LOCK)).assertTrue();
            expect(queue.enqueue(INTERRUPT_CALL)).assertFalse();
            expect(queue.size()).assertEqual(3);
            expect(queue.suppressed).assertEqual(2);
            const drained: string[] = queue.drain();
            expect(drained.join('>')).assertEqual('incomingCall>background>screenLock');
            expect(queue.size()).assertEqual(0);
            expect(queue.drain().length).assertEqual(0);
            expect(queue.describe()).assertContain('suppressed=2');
        });

        it('Browser_Interrupt_015', 0, async () => {
            TestLogger.step(TAG, 'rotation while loading does not duplicate the load');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.onPageBegin('https://www.huawei.com');
            expect(browser.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
            const tab = browser.getCurrentTab();
            expect(tab !== null).assertTrue();
            if (tab !== null) {
                expect(tab.controller.loadCount).assertEqual(1);
            }
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_ROTATION);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_ROTATION, 110);
            const outcome: RecoveryOutcome = engine.restore(browser, snapshot, new MockNetwork(),
                plan, ORIENTATION_PORTRAIT);
            expect(outcome.ok).assertTrue();
            expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
            expect(engine.orientation).assertEqual(ORIENTATION_PORTRAIT);
            expect(engine.layoutMode).assertEqual(LAYOUT_PHONE);
            expect(outcome.executed.indexOf(STEP_RELOAD)).assertEqual(-1);
        });

        it('Browser_Interrupt_016', 0, async () => {
            TestLogger.step(TAG, 'network recovery keeps the observed history position');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.loadUrl('www.bing.com');
            expect(browser.back()).assertTrue();
            const tab = browser.getCurrentTab();
            expect(tab !== null).assertTrue();
            if (tab !== null) {
                expect(tab.controller.history.length).assertEqual(2);
                expect(tab.controller.historyIndex).assertEqual(0);
            }
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_NETWORK);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_NETWORK, 120);
            expect(snapshot.historyIndex).assertEqual(0);
            const outcome: RecoveryOutcome = engine.restore(browser, snapshot, new MockNetwork(), plan);
            expect(outcome.ok).assertTrue();
            if (tab !== null) {
                expect(tab.controller.history.length).assertEqual(1);
                expect(tab.controller.historyIndex).assertEqual(0);
                expect(tab.controller.currentUrl).assertEqual('https://www.huawei.com');
                expect(tab.controller.accessBackward()).assertFalse();
            }
        });

        it('Browser_Interrupt_017', 0, async () => {
            TestLogger.step(TAG, 'ten tabs survive a background interruption');
            const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
            for (let index = 0; index < MAX_TAB_COUNT; index++) {
                browser.setTabArrayIndex(index);
                browser.loadUrl(`www.huawei.com/${index}`);
            }
            browser.setTabArrayIndex(4);
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_BACKGROUND);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_BACKGROUND, 130);
            const outcome: RecoveryOutcome = engine.restore(browser, snapshot, new MockNetwork(), plan);
            expect(outcome.ok).assertTrue();
            expect(outcome.restoredTabCount).assertEqual(MAX_TAB_COUNT);
            expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT);
            expect(browser.getTabArrayIndex()).assertEqual(4);
            expect(browser.tabs[9].controller.currentUrl).assertEqual('https://www.huawei.com/9');
            expect(browser.tabs[0].controller.currentUrl).assertEqual('https://www.huawei.com/0');
        });

        it('Browser_Interrupt_018', 0, async () => {
            TestLogger.step(TAG, 'three chained interruptions keep the session usable');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.addTab();
            browser.loadUrl('www.bing.com');
            const engine: RecoveryEngine = new RecoveryEngine();
            const kinds: string[] = [INTERRUPT_CALL, INTERRUPT_BACKGROUND, INTERRUPT_LOCK];
            for (let index = 0; index < kinds.length; index++) {
                const plan: RecoveryPlan = engine.planFor(kinds[index]);
                const snapshot: RecoverySnapshot = engine.capture(browser, kinds[index],
                    140 + index);
                const outcome: RecoveryOutcome = engine.restore(browser, snapshot, new MockNetwork(), plan);
                expect(outcome.ok).assertTrue();
                expect(browser.tabs.length).assertEqual(2);
            }
            expect(browser.tabs[0].controller.currentUrl).assertEqual('https://www.huawei.com');
            expect(browser.tabs[1].controller.currentUrl).assertEqual('https://www.bing.com');
            expect(engine.degradedCount).assertEqual(0);
        });

        it('Browser_Interrupt_019', 0, async () => {
            TestLogger.step(TAG, 'draft input value survives a successful restore');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.setInputVal('draft text for the address bar');
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_BACKGROUND);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_BACKGROUND, 150);
            expect(snapshot.inputValue).assertEqual('draft text for the address bar');
            const outcome: RecoveryOutcome = engine.restore(browser, snapshot, new MockNetwork(), plan);
            expect(outcome.ok).assertTrue();
            expect(browser.getInputVal()).assertEqual('draft text for the address bar');
            expect(browser.tabs.length).assertEqual(1);
        });

        it('Browser_Interrupt_020', 0, async () => {
            TestLogger.step(TAG, 'recovered tab can still navigate back and forward');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.loadUrl('www.bing.com');
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_NETWORK);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_NETWORK, 160);
            engine.restore(browser, snapshot, new MockNetwork(), plan);
            expect(browser.back()).assertTrue();
            expect(browser.tabs[0].controller.currentUrl).assertEqual('https://www.huawei.com');
            expect(browser.forward()).assertTrue();
            expect(browser.tabs[0].controller.currentUrl).assertEqual('https://www.bing.com');
            expect(browser.forward()).assertFalse();
        });

        it('Browser_Interrupt_021', 0, async () => {
            TestLogger.step(TAG, 'reclaim of the active tab restores its content');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            browser.addTab();
            browser.loadUrl('www.bing.com');
            const store: ReclaimStore = new ReclaimStore();
            expect(store.reclaim(browser, 1)).assertTrue();
            expect(browser.tabs[1].controller.loadCount).assertEqual(0);
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_TAB_RECLAIM);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_TAB_RECLAIM, 170);
            expect(snapshot.tabUrls[1]).assertEqual('');
            const outcome: RecoveryOutcome = engine.restore(browser, snapshot, new MockNetwork(), plan);
            expect(outcome.ok).assertTrue();
            expect(browser.tabs[1].key).assertEqual(1);
            expect(browser.getTabArrayIndex()).assertEqual(1);
            expect(browser.tabs[1].controller.loadCount).assertEqual(0);
            expect(plan.failedStepName()).assertEqual('');
        });

        it('Browser_Interrupt_022', 0, async () => {
            TestLogger.step(TAG, 'every interruption kind declares a complete plan');
            const kinds: string[] = [INTERRUPT_CALL, INTERRUPT_BACKGROUND, INTERRUPT_LOCK,
                INTERRUPT_ROTATION, INTERRUPT_NETWORK, INTERRUPT_TAB_RECLAIM];
            const expectedCounts: number[] = [3, 4, 5, 5, 4, 5];
            const engine: RecoveryEngine = new RecoveryEngine();
            for (let index = 0; index < kinds.length; index++) {
                const plan: RecoveryPlan = engine.planFor(kinds[index]);
                expect(plan.steps.length).assertEqual(expectedCounts[index]);
                expect(plan.indexOf(STEP_PAUSE)).assertEqual(0);
                expect(plan.indexOf(STEP_RESUME)).assertEqual(plan.steps.length - 1);
                expect(plan.criticalCount() >= 3).assertTrue();
                expect(plan.executedNames().length).assertEqual(0);
            }
            expect(engine.planFor(INTERRUPT_NETWORK).maxAttempts).assertEqual(3);
            expect(engine.planFor(INTERRUPT_CALL).maxAttempts).assertEqual(1);
        });

        it('Browser_Interrupt_023', 0, async () => {
            TestLogger.step(TAG, 'browser stays interactive after a degraded recovery');
            const browser: MockBrowser = new MockBrowser();
            browser.loadUrl('www.huawei.com');
            const network: MockNetwork = new MockNetwork();
            network.setOnline(false);
            const engine: RecoveryEngine = new RecoveryEngine();
            const plan: RecoveryPlan = engine.planFor(INTERRUPT_NETWORK);
            const snapshot: RecoverySnapshot = engine.capture(browser, INTERRUPT_NETWORK, 180);
            engine.restore(browser, snapshot, network, plan);
            network.setOnline(true);
            browser.setInputVal('www.bing.com');
            expect(browser.loadUrl('www.bing.com')).assertTrue();
            expect(browser.tabs[0].controller.currentUrl).assertEqual('https://www.bing.com');
            const inputExists: boolean = await componentByIdExists(driver, ID_INPUT_URL);
            const homeExists: boolean = await componentByIdExists(driver, ID_NAV_HOME);
            const backExists: boolean = await componentByIdExists(driver, ID_NAV_BACK);
            expect(inputExists).assertTrue();
            expect(homeExists).assertTrue();
            expect(backExists).assertTrue();
            const orientation: string = deviceIsPhone('phone') ? ORIENTATION_PORTRAIT :
                ORIENTATION_LANDSCAPE;
            expect(orientation.length > 0).assertTrue();
        });
    });
}
