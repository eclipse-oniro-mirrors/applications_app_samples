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
  getDriver, startBrowserApp, waitForId, countById,
  MAX_TAB_COUNT, ID_INPUT_URL, ID_CANCEL_TAB, TIMEOUT_COMPONENT
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockWebController, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserMemoryLeakDetectionTest';

/* Leak budgets are counted in objects, never in kilobytes. */
const LEAK_TOLERANCE_OBJECTS: number = 0;
const MAX_OUTSTANDING_CONTROLLERS: number = 0;
const MAX_OUTSTANDING_LISTENERS: number = 0;
const TAB_CHURN_ROUNDS: number = 50;
const CONTROLLER_BYTES: number = 32768;
const LISTENER_BYTES: number = 1024;
const MEMORY_LEAK_BYTES_LIMIT: number = 0;
const CLEAN_VERDICT: string = 'CLEAN';
const LEAK_VERDICT: string = 'LEAK';

/* Event kinds registered by WebTab.ets on every Web component. */
const LISTENER_PAGE_BEGIN: string = 'onPageBegin';
const LISTENER_PAGE_END: string = 'onPageEnd';
const LISTENER_PROGRESS: string = 'onProgressChange';
const LISTENER_WINDOW_NEW: string = 'onWindowNew';

/** Reference bookkeeping of one tracked object. */
interface RefEntry {
  id: string;
  kind: string;
  acquires: number;
  releases: number;
}

/** One simulated tab together with the resources it owns. */
interface TrackedTab {
  key: number;
  controllerId: string;
  listenerId: string;
  alive: boolean;
}

/** Listener registration of the Web component of a tab. */
interface ListenerEntry {
  kind: string;
  id: string;
  active: boolean;
}

/**
 * Reference counter of controllers and other native backed objects.
 *
 * The Web component allocates a controller per tab and a listener per event.
 * Both must be released exactly once when the tab is closed; a counter that
 * never returns to zero is the earliest reliable leak signal available in a
 * UI test, long before the heap graph becomes visible.
 */
class RefCounter {
  private entries: RefEntry[] = [];
  private extraReleases: number = 0;
  private acquireTotal: number = 0;
  private releaseTotal: number = 0;

  private indexOf(id: string): number {
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].id === id) {
        return index;
      }
    }
    return -1;
  }

  /** Registers one owner; repeated acquires increase the count. */
  acquire(id: string, kind: string = 'resource'): number {
    const position: number = this.indexOf(id);
    this.acquireTotal += 1;
    if (position < 0) {
      const entry: RefEntry = { id: id, kind: kind, acquires: 1, releases: 0 };
      this.entries.push(entry);
      return 1;
    }
    this.entries[position].acquires += 1;
    return this.entries[position].acquires - this.entries[position].releases;
  }

  /**
   * Releases one owner. Returns false when the id is unknown or when every
   * acquire was already balanced, which also flags the extra release.
   */
  release(id: string): boolean {
    const position: number = this.indexOf(id);
    this.releaseTotal += 1;
    if (position < 0) {
      this.extraReleases += 1;
      return false;
    }
    const outstanding: number = this.entries[position].acquires - this.entries[position].releases;
    if (outstanding <= 0) {
      this.extraReleases += 1;
      return false;
    }
    this.entries[position].releases += 1;
    return true;
  }

  outstanding(id: string): number {
    const position: number = this.indexOf(id);
    if (position < 0) {
      return 0;
    }
    const value: number = this.entries[position].acquires - this.entries[position].releases;
    return value < 0 ? 0 : value;
  }

  totalOutstanding(): number {
    let result: number = 0;
    for (let index = 0; index < this.entries.length; index++) {
      result += this.entries[index].acquires - this.entries[index].releases;
    }
    return result;
  }

  liveIds(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].acquires > this.entries[index].releases) {
        result.push(this.entries[index].id);
      }
    }
    return result;
  }

  liveCount(): number {
    return this.liveIds().length;
  }

  kinds(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.entries.length; index++) {
      if (result.indexOf(this.entries[index].kind) < 0) {
        result.push(this.entries[index].kind);
      }
    }
    return result;
  }

  acquireTotalCount(): number {
    return this.acquireTotal;
  }

  releaseTotalCount(): number {
    return this.releaseTotal;
  }

  extraReleaseCount(): number {
    return this.extraReleases;
  }

  /** True when every acquire was matched by exactly one release. */
  isBalanced(): boolean {
    return this.totalOutstanding() === 0 && this.extraReleases === 0;
  }

  /** Bytes still pinned by the outstanding references. */
  retainedBytes(bytesPerObject: number): number {
    return this.totalOutstanding() * bytesPerObject;
  }

  /** Bytes pinned by the outstanding references of one resource kind. */
  outstandingBytesOfKind(kind: string, bytesPerObject: number): number {
    let counted: number = 0;
    for (let index = 0; index < this.entries.length; index++) {
      const entry: RefEntry = this.entries[index];
      if (entry.kind === kind) {
        const outstanding: number = entry.acquires - entry.releases;
        if (outstanding > 0) {
          counted += outstanding;
        }
      }
    }
    return counted * bytesPerObject;
  }

  reset(): void {
    this.entries = [];
    this.extraReleases = 0;
    this.acquireTotal = 0;
    this.releaseTotal = 0;
  }
}
/**
 * Creates and destroys tabs while keeping the reference graph observable.
 *
 * A tab owns one controller and one listener registration. `createTab` acquires
 * both, `destroyTab` releases both, and a private switch allows a suite to skip
 * one release so a real leak can be asserted instead of assumed.
 */
class TabLifecycleTracker {
  refs: RefCounter = new RefCounter();
  tabs: TrackedTab[] = [];
  created: number = 0;
  destroyed: number = 0;
  peakLive: number = 0;
  closeFailures: number = 0;
  private skipRelease: boolean = false;

  constructor(skipRelease: boolean = false) {
    this.skipRelease = skipRelease;
  }

  setSkipRelease(skip: boolean): void {
    this.skipRelease = skip;
  }

  createTab(): TrackedTab {
    const key: number = this.created;
    const tab: TrackedTab = {
      key: key,
      controllerId: `controller-${key}`,
      listenerId: `listener-${key}`,
      alive: true
    };
    this.refs.acquire(tab.controllerId, 'controller');
    this.refs.acquire(tab.listenerId, 'listener');
    this.tabs.push(tab);
    this.created += 1;
    const live: number = this.liveCount();
    if (live > this.peakLive) {
      this.peakLive = live;
    }
    return tab;
  }

  /** Destroys a tab and releases its resources unless the leak switch is set. */
  destroyTab(key: number): boolean {
    let target: TrackedTab | null = null;
    for (let index = 0; index < this.tabs.length; index++) {
      if (this.tabs[index].key === key && this.tabs[index].alive) {
        target = this.tabs[index];
      }
    }
    if (target === null) {
      this.closeFailures += 1;
      return false;
    }
    target.alive = false;
    if (!this.skipRelease) {
      this.refs.release(target.controllerId);
      this.refs.release(target.listenerId);
    }
    this.destroyed += 1;
    return true;
  }

  liveCount(): number {
    let counter: number = 0;
    for (let index = 0; index < this.tabs.length; index++) {
      if (this.tabs[index].alive) {
        counter += 1;
      }
    }
    return counter;
  }

  /** Controllers of closed tabs that were never released. */
  leakedControllers(): number {
    let counter: number = 0;
    for (let index = 0; index < this.tabs.length; index++) {
      if (!this.tabs[index].alive && this.refs.outstanding(this.tabs[index].controllerId) > 0) {
        counter += 1;
      }
    }
    return counter;
  }

  leakedListeners(): number {
    let counter: number = 0;
    for (let index = 0; index < this.tabs.length; index++) {
      if (!this.tabs[index].alive && this.refs.outstanding(this.tabs[index].listenerId) > 0) {
        counter += 1;
      }
    }
    return counter;
  }

  /** Total retained bytes of the resources that are still outstanding. */
  retainedBytes(): number {
    return this.refs.outstandingBytesOfKind('controller', CONTROLLER_BYTES) +
      this.refs.outstandingBytesOfKind('listener', LISTENER_BYTES);
  }

  reset(): void {
    this.refs.reset();
    this.tabs = [];
    this.created = 0;
    this.destroyed = 0;
    this.peakLive = 0;
    this.closeFailures = 0;
  }
}

/**
 * Registry of the four Web component callbacks.
 *
 * WebTab.ets registers onPageBegin, onPageEnd, onProgressChange and onWindowNew
 * for every tab. Re-registering the same callback without unregistering the old
 * one is a leak the UI cannot show, therefore duplicates are counted explicitly.
 */
class ListenerRegistry {
  private entries: ListenerEntry[] = [];
  duplicateRegistrations: number = 0;
  unknownUnregisters: number = 0;

  private indexOf(kind: string, id: string): number {
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].kind === kind && this.entries[index].id === id) {
        return index;
      }
    }
    return -1;
  }

  register(kind: string, id: string): boolean {
    const position: number = this.indexOf(kind, id);
    if (position >= 0 && this.entries[position].active) {
      this.duplicateRegistrations += 1;
      return false;
    }
    if (position >= 0) {
      this.entries[position].active = true;
      return true;
    }
    const entry: ListenerEntry = { kind: kind, id: id, active: true };
    this.entries.push(entry);
    return true;
  }

  unregister(kind: string, id: string): boolean {
    const position: number = this.indexOf(kind, id);
    if (position < 0 || !this.entries[position].active) {
      this.unknownUnregisters += 1;
      return false;
    }
    this.entries[position].active = false;
    return true;
  }

  activeTotal(): number {
    let counter: number = 0;
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].active) {
        counter += 1;
      }
    }
    return counter;
  }

  activeByKind(kind: string): number {
    let counter: number = 0;
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].active && this.entries[index].kind === kind) {
        counter += 1;
      }
    }
    return counter;
  }

  registeredTotal(): number {
    return this.entries.length;
  }

  /** Registers the full callback set of one tab. */
  registerTab(tabId: string): number {
    let registered: number = 0;
    if (this.register(LISTENER_PAGE_BEGIN, tabId)) {
      registered += 1;
    }
    if (this.register(LISTENER_PAGE_END, tabId)) {
      registered += 1;
    }
    if (this.register(LISTENER_PROGRESS, tabId)) {
      registered += 1;
    }
    if (this.register(LISTENER_WINDOW_NEW, tabId)) {
      registered += 1;
    }
    return registered;
  }

  unregisterTab(tabId: string): number {
    let removed: number = 0;
    if (this.unregister(LISTENER_PAGE_BEGIN, tabId)) {
      removed += 1;
    }
    if (this.unregister(LISTENER_PAGE_END, tabId)) {
      removed += 1;
    }
    if (this.unregister(LISTENER_PROGRESS, tabId)) {
      removed += 1;
    }
    if (this.unregister(LISTENER_WINDOW_NEW, tabId)) {
      removed += 1;
    }
    return removed;
  }

  retainedBytes(): number {
    return this.activeTotal() * LISTENER_BYTES;
  }

  isBalanced(): boolean {
    return this.activeTotal() === 0 && this.duplicateRegistrations === 0;
  }

  reset(): void {
    this.entries = [];
    this.duplicateRegistrations = 0;
    this.unknownUnregisters = 0;
  }
}

/** Applies the leak budget to a measured number of outstanding objects. */
class LeakJudge {
  private toleranceObjects: number;
  private bytesPerObject: number;

  constructor(toleranceObjects: number = LEAK_TOLERANCE_OBJECTS,
    bytesPerObject: number = CONTROLLER_BYTES) {
    this.toleranceObjects = toleranceObjects < 0 ? 0 : toleranceObjects;
    this.bytesPerObject = bytesPerObject;
  }

  isLeaking(outstandingObjects: number): boolean {
    return outstandingObjects > this.toleranceObjects;
  }

  verdict(outstandingObjects: number): string {
    return this.isLeaking(outstandingObjects) ? LEAK_VERDICT : CLEAN_VERDICT;
  }

  retainedBytes(outstandingObjects: number): number {
    const counted: number = outstandingObjects < 0 ? 0 : outstandingObjects;
    return counted * this.bytesPerObject;
  }

  exceedsBytesLimit(outstandingObjects: number, limit: number = MEMORY_LEAK_BYTES_LIMIT): boolean {
    return this.retainedBytes(outstandingObjects) > limit;
  }

  describe(outstandingObjects: number): string {
    return `outstanding=${outstandingObjects} verdict=${this.verdict(outstandingObjects)}`;
  }
}
export default function browserMemoryLeakDetectionTest() {
  describe('browserMemoryLeakDetectionTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'memory leak detection suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Leak_Ref_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Ref_001');
      TestLogger.step(TAG, 'acquire and release one controller reference');
      const refs: RefCounter = new RefCounter();
      refs.acquire('controller-0', 'controller');
      refs.acquire('controller-0', 'controller');
      const afterAcquire: number = refs.outstanding('controller-0');
      const first: boolean = refs.release('controller-0');
      const second: boolean = refs.release('controller-0');
      TestLogger.info(TAG, `outstanding after acquire=${afterAcquire} total=${refs.totalOutstanding()}`);
      expect(afterAcquire).assertEqual(2);
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(refs.outstanding('controller-0')).assertEqual(0);
      expect(refs.isBalanced()).assertTrue();
      expect(refs.extraReleaseCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Leak_Ref_001');
    });

    it('Leak_Ref_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Ref_002');
      TestLogger.step(TAG, 'inspect the live ids of an unbalanced counter');
      const refs: RefCounter = new RefCounter();
      refs.acquire('controller-7', 'controller');
      refs.acquire('listener-7', 'listener');
      refs.acquire('listener-7', 'listener');
      const ids: string[] = refs.liveIds();
      TestLogger.info(TAG, `live ids ${ids.join(',')} live count=${refs.liveCount()}`);
      expect(ids.length).assertEqual(2);
      expect(refs.liveCount()).assertEqual(2);
      expect(refs.totalOutstanding()).assertEqual(3);
      expect(refs.outstanding('listener-7')).assertEqual(2);
      expect(refs.kinds().length).assertEqual(2);
      TestLogger.pass(TAG, 'Leak_Ref_002');
    });

    it('Leak_Ref_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Ref_003');
      TestLogger.step(TAG, 'detect a controller that was never released');
      const refs: RefCounter = new RefCounter();
      refs.acquire('controller-1', 'controller');
      refs.acquire('controller-2', 'controller');
      refs.release('controller-1');
      TestLogger.info(TAG, `outstanding=${refs.totalOutstanding()} balanced=${refs.isBalanced()}`);
      expect(refs.totalOutstanding()).assertEqual(1);
      expect(refs.isBalanced()).assertFalse();
      expect(refs.liveIds().length).assertEqual(1);
      expect(refs.liveIds()[0]).assertEqual('controller-2');
      expect(refs.outstanding('controller-1')).assertEqual(0);
      TestLogger.pass(TAG, 'Leak_Ref_003');
    });

    it('Leak_Ref_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Ref_004');
      TestLogger.step(TAG, 'release the same object twice and flag the extra release');
      const refs: RefCounter = new RefCounter();
      refs.acquire('listener-1', 'listener');
      const accepted: boolean = refs.release('listener-1');
      const duplicate: boolean = refs.release('listener-1');
      TestLogger.info(TAG, `first=${accepted} duplicate=${duplicate} extra=${refs.extraReleaseCount()}`);
      expect(accepted).assertTrue();
      expect(duplicate).assertFalse();
      expect(refs.extraReleaseCount()).assertEqual(1);
      expect(refs.outstanding('listener-1')).assertEqual(0);
      expect(refs.isBalanced()).assertFalse();
      TestLogger.pass(TAG, 'Leak_Ref_004');
    });

    it('Leak_Ref_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Ref_005');
      TestLogger.step(TAG, 'release an object that was never acquired');
      const refs: RefCounter = new RefCounter();
      const released: boolean = refs.release('controller-ghost');
      TestLogger.info(TAG, `ghost release=${released} extra=${refs.extraReleaseCount()}`);
      expect(released).assertFalse();
      expect(refs.extraReleaseCount()).assertEqual(1);
      expect(refs.totalOutstanding()).assertEqual(0);
      expect(refs.liveCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Leak_Ref_005');
    });

    it('Leak_Ref_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Ref_006');
      TestLogger.step(TAG, 'reset the counter before the next tab churn round');
      const refs: RefCounter = new RefCounter();
      refs.acquire('controller-3', 'controller');
      refs.release('controller-3');
      refs.acquire('controller-3', 'controller');
      refs.reset();
      TestLogger.info(TAG, `after reset outstanding=${refs.totalOutstanding()} live=${refs.liveCount()}`);
      expect(refs.totalOutstanding()).assertEqual(0);
      expect(refs.liveCount()).assertEqual(0);
      expect(refs.acquireTotalCount()).assertEqual(0);
      expect(refs.releaseTotalCount()).assertEqual(0);
      expect(refs.isBalanced()).assertTrue();
      TestLogger.pass(TAG, 'Leak_Ref_006');
    });

    it('Leak_Tab_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Tab_007');
      TestLogger.step(TAG, 'create and destroy fifty tabs in a row');
      const tracker: TabLifecycleTracker = new TabLifecycleTracker();
      for (let round = 0; round < TAB_CHURN_ROUNDS; round++) {
        const tab: TrackedTab = tracker.createTab();
        tracker.destroyTab(tab.key);
      }
      TestLogger.info(TAG, `created=${tracker.created} destroyed=${tracker.destroyed}`);
      expect(tracker.created).assertEqual(TAB_CHURN_ROUNDS);
      expect(tracker.destroyed).assertEqual(TAB_CHURN_ROUNDS);
      expect(tracker.liveCount()).assertEqual(0);
      expect(tracker.refs.isBalanced()).assertTrue();
      expect(tracker.leakedControllers()).assertEqual(MAX_OUTSTANDING_CONTROLLERS);
      expect(tracker.retainedBytes()).assertEqual(MEMORY_LEAK_BYTES_LIMIT);
      TestLogger.pass(TAG, 'Leak_Tab_007');
    });

    it('Leak_Tab_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Tab_008');
      TestLogger.step(TAG, 'release the controller together with its tab');
      const tracker: TabLifecycleTracker = new TabLifecycleTracker();
      const tab: TrackedTab = tracker.createTab();
      const outstandingBefore: number = tracker.refs.outstanding(tab.controllerId);
      const closed: boolean = tracker.destroyTab(tab.key);
      const outstandingAfter: number = tracker.refs.outstanding(tab.controllerId);
      let controller: MockWebController | null = null;
      const created: MockWebController = new MockWebController();
      created.loadUrl('https://www.example.com');
      controller = created;
      TestLogger.info(TAG, `controller outstanding ${outstandingBefore} -> ${outstandingAfter}`);
      expect(closed).assertTrue();
      expect(outstandingBefore).assertEqual(1);
      expect(outstandingAfter).assertEqual(0);
      expect(tracker.refs.outstanding(tab.listenerId)).assertEqual(0);
      TestLogger.pass(TAG, 'Leak_Tab_008');
    });
    it('Leak_Tab_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Tab_009');
      TestLogger.step(TAG, 'skip the release of three closed tabs on purpose');
      const tracker: TabLifecycleTracker = new TabLifecycleTracker(true);
      for (let round = 0; round < 3; round++) {
        const tab: TrackedTab = tracker.createTab();
        tracker.destroyTab(tab.key);
      }
      const retained: number = tracker.retainedBytes();
      const judge: LeakJudge = new LeakJudge();
      TestLogger.info(TAG, `leaked controllers=${tracker.leakedControllers()} retained=${retained} bytes`);
      expect(tracker.leakedControllers()).assertEqual(3);
      expect(tracker.leakedListeners()).assertEqual(3);
      expect(tracker.refs.totalOutstanding()).assertEqual(6);
      expect(retained).assertEqual(3 * CONTROLLER_BYTES + 3 * LISTENER_BYTES);
      expect(judge.isLeaking(tracker.refs.totalOutstanding())).assertTrue();
      expect(judge.verdict(tracker.refs.totalOutstanding())).assertEqual(LEAK_VERDICT);
      TestLogger.pass(TAG, 'Leak_Tab_009');
    });

    it('Leak_Tab_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Tab_010');
      TestLogger.step(TAG, 'keep the live tab count stable during tab churn');
      const tracker: TabLifecycleTracker = new TabLifecycleTracker();
      for (let round = 0; round < 10; round++) {
        tracker.createTab();
      }
      for (let round = 0; round < 5; round++) {
        tracker.destroyTab(round);
      }
      const live: number = tracker.liveCount();
      const peak: number = tracker.peakLive;
      for (let round = 5; round < 10; round++) {
        tracker.destroyTab(round);
      }
      TestLogger.info(TAG, `live=${live} peak=${peak} final=${tracker.liveCount()}`);
      expect(live).assertEqual(5);
      expect(peak).assertEqual(10);
      expect(tracker.liveCount()).assertEqual(0);
      expect(tracker.refs.isBalanced()).assertTrue();
      expect(tracker.refs.totalOutstanding()).assertEqual(0);
      TestLogger.pass(TAG, 'Leak_Tab_010');
    });

    it('Leak_Tab_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Tab_011');
      TestLogger.step(TAG, 'close a tab that no longer exists');
      const tracker: TabLifecycleTracker = new TabLifecycleTracker();
      const tab: TrackedTab = tracker.createTab();
      const first: boolean = tracker.destroyTab(tab.key);
      const twice: boolean = tracker.destroyTab(tab.key);
      const unknown: boolean = tracker.destroyTab(99);
      TestLogger.info(TAG, `first=${first} twice=${twice} unknown=${unknown} failures=${tracker.closeFailures}`);
      expect(first).assertTrue();
      expect(twice).assertFalse();
      expect(unknown).assertFalse();
      expect(tracker.closeFailures).assertEqual(2);
      expect(tracker.destroyed).assertEqual(1);
      expect(tracker.refs.isBalanced()).assertTrue();
      TestLogger.pass(TAG, 'Leak_Tab_011');
    });

    it('Leak_Listener_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Listener_012');
      TestLogger.step(TAG, 'register and unregister the four web callbacks of one tab');
      const registry: ListenerRegistry = new ListenerRegistry();
      const registered: number = registry.registerTab('tab-1');
      const activeBefore: number = registry.activeTotal();
      const removed: number = registry.unregisterTab('tab-1');
      TestLogger.info(TAG, `registered=${registered} active=${activeBefore} removed=${removed}`);
      expect(registered).assertEqual(4);
      expect(activeBefore).assertEqual(4);
      expect(removed).assertEqual(4);
      // Every callback of the closed tab must be gone again.
      expect(registry.activeByKind(LISTENER_PAGE_BEGIN)).assertEqual(0);
      expect(registry.activeByKind(LISTENER_PROGRESS)).assertEqual(0);
      expect(registry.activeTotal()).assertEqual(MAX_OUTSTANDING_LISTENERS);
      expect(registry.retainedBytes()).assertEqual(MEMORY_LEAK_BYTES_LIMIT);
      expect(registry.isBalanced()).assertTrue();
      TestLogger.pass(TAG, 'Leak_Listener_012');
    });

    it('Leak_Listener_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Listener_013');
      TestLogger.step(TAG, 'register the same callback twice and count the duplicate');
      const registry: ListenerRegistry = new ListenerRegistry();
      registry.registerTab('tab-2');
      const second: number = registry.registerTab('tab-2');
      TestLogger.info(TAG, `second registration=${second} duplicates=${registry.duplicateRegistrations}`);
      expect(second).assertEqual(0);
      expect(registry.duplicateRegistrations).assertEqual(4);
      expect(registry.activeTotal()).assertEqual(4);
      expect(registry.registeredTotal()).assertEqual(4);
      expect(registry.isBalanced()).assertFalse();
      registry.unregisterTab('tab-2');
      expect(registry.activeTotal()).assertEqual(0);
      TestLogger.pass(TAG, 'Leak_Listener_013');
    });

    it('Leak_Listener_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Listener_014');
      TestLogger.step(TAG, 'unregister a callback that was never registered');
      const registry: ListenerRegistry = new ListenerRegistry();
      registry.registerTab('tab-3');
      const unknown: boolean = registry.unregister(LISTENER_WINDOW_NEW, 'tab-3');
      const ghost: boolean = registry.unregister(LISTENER_PAGE_END, 'tab-ghost');
      TestLogger.info(TAG, `known=${unknown} ghost=${ghost} unknown=${registry.unknownUnregisters}`);
      expect(unknown).assertTrue();
      expect(ghost).assertFalse();
      expect(registry.unknownUnregisters).assertEqual(1);
      expect(registry.activeTotal()).assertEqual(3);
      expect(registry.activeByKind(LISTENER_WINDOW_NEW)).assertEqual(0);
      TestLogger.pass(TAG, 'Leak_Listener_014');
    });

    it('Leak_Judge_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Judge_015');
      TestLogger.step(TAG, 'apply the zero tolerance budget to a clean run');
      const judge: LeakJudge = new LeakJudge();
      TestLogger.info(TAG, judge.describe(0));
      expect(judge.isLeaking(0)).assertFalse();
      expect(judge.verdict(0)).assertEqual(CLEAN_VERDICT);
      expect(judge.retainedBytes(0)).assertEqual(0);
      expect(judge.exceedsBytesLimit(0)).assertFalse();
      expect(judge.retainedBytes(2)).assertEqual(2 * CONTROLLER_BYTES);
      expect(judge.exceedsBytesLimit(1)).assertTrue();
      TestLogger.pass(TAG, 'Leak_Judge_015');
    });

    it('Leak_Judge_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Leak_Judge_016');
      TestLogger.step(TAG, 'apply a tolerant budget to a slightly unbalanced run');
      const strict: LeakJudge = new LeakJudge(0, LISTENER_BYTES);
      const tolerant: LeakJudge = new LeakJudge(2, LISTENER_BYTES);
      TestLogger.info(TAG, `strict=${strict.verdict(1)} tolerant=${tolerant.verdict(2)}`);
      expect(strict.verdict(1)).assertEqual(LEAK_VERDICT);
      expect(tolerant.isLeaking(2)).assertFalse();
      expect(tolerant.verdict(2)).assertEqual(CLEAN_VERDICT);
      expect(tolerant.isLeaking(3)).assertTrue();
      expect(tolerant.retainedBytes(3)).assertEqual(3 * LISTENER_BYTES);
      TestLogger.pass(TAG, 'Leak_Judge_016');
    });
  });
}

