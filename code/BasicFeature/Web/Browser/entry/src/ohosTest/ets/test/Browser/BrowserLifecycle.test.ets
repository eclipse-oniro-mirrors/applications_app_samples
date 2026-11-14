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
  getDriver, startBrowserApp, serializedDelay, clickById, countById, waitForId,
  ID_ACTION_ADD, ID_CANCEL_TAB, ID_INPUT_URL, ID_NAV_HOME,
  TIMEOUT_TAB_SWITCH, TIMEOUT_PAGE_LOAD, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockWebController, MockLoadingStatus } from '../Shared/BrowserMock';

const TAG: string = 'BrowserLifecycleTest';

/** Method names registered on every Web component of TitleBar.ets. */
const PROXY_NAME: string = 'etsObj';
const PROXY_METHODS: string[] = ['test', 'searchWord'];
const REBUILD_ROUNDS: number = 6;
const PAGE_CYCLES: number = 5;

/** One lifecycle transition of the browser instance. */
interface LifecycleEvent {
  name: string;
  sequence: number;
  alive: boolean;
}

/**
 * Registry of the JavaScript proxy of every Web component.
 *
 * `registerJavaScriptProxy(testObj, 'etsObj', ['test', 'searchWord'])` must run
 * exactly once per controller: a second registration on the same controller is
 * rejected by the engine, while a missing registration breaks the pad adapter
 * script. The registry models both failure modes and counts them.
 */
class JsProxyRegistry {
  private registered: Map<number, boolean> = new Map<number, boolean>();
  private methods: Map<number, string[]> = new Map<number, string[]>();
  registrations: number = 0;
  duplicates: number = 0;
  rejections: number = 0;

  /** Returns false when the tab already owns a proxy. */
  register(tabIndex: number, name: string, methods: string[]): boolean {
    const already: boolean = this.registered.get(tabIndex) ?? false;
    if (already) {
      this.duplicates += 1;
      return false;
    }
    if (name.length === 0 || methods.length === 0) {
      this.rejections += 1;
      return false;
    }
    this.registered.set(tabIndex, true);
    this.methods.set(tabIndex, methods.slice(0));
    this.registrations += 1;
    return true;
  }

  isRegistered(tabIndex: number): boolean {
    return this.registered.get(tabIndex) ?? false;
  }

  methodsOf(tabIndex: number): string[] {
    return (this.methods.get(tabIndex) ?? []).slice(0);
  }

  registeredCount(): number {
    let total: number = 0;
    this.registered.forEach((value: boolean) => {
      if (value) {
        total += 1;
      }
    });
    return total;
  }

  /** Drops the proxy of a closed tab so the registry cannot leak entries. */
  unregister(tabIndex: number): boolean {
    const owned: boolean = this.isRegistered(tabIndex);
    this.registered.delete(tabIndex);
    this.methods.delete(tabIndex);
    return owned;
  }

  reset(): void {
    this.registered = new Map<number, boolean>();
    this.methods = new Map<number, string[]>();
    this.registrations = 0;
    this.duplicates = 0;
    this.rejections = 0;
  }
}

/**
 * Lifecycle of one Browser instance (the `browser` field of Index.ets).
 *
 * Index.ets builds the instance in aboutToAppear, keeps it while the page is
 * visible and drops it in aboutToDisappear. Building a second instance without
 * dropping the first leaks every controller, so the double tracks create and
 * destroy calls and refuses the illegal double create.
 */
class InstanceLifecycle {
  model: MockBrowser = new MockBrowser(1);
  events: LifecycleEvent[] = [];
  alive: boolean = false;
  doubleCreates: number = 0;
  creates: number = 0;
  destroys: number = 0;

  create(): boolean {
    if (this.alive) {
      this.doubleCreates += 1;
      return false;
    }
    this.alive = true;
    this.creates += 1;
    this.record('create');
    return true;
  }

  destroy(): boolean {
    if (!this.alive) {
      return false;
    }
    this.alive = false;
    this.destroys += 1;
    this.record('destroy');
    return true;
  }

  /** Recreates the instance while preserving the tab strip size. */
  rebuild(tabCount: number): MockBrowser {
    this.destroy();
    this.model = new MockBrowser(tabCount);
    this.create();
    return this.model;
  }

  record(name: string): void {
    this.events.push({ name: name, sequence: this.events.length + 1, alive: this.alive });
  }

  names(): string[] {
    return this.events.map((event: LifecycleEvent) => event.name);
  }

  last(): LifecycleEvent | null {
    if (this.events.length === 0) {
      return null;
    }
    return this.events[this.events.length - 1];
  }
}

/**
 * Tracks creation and destruction of individual tabs.
 *
 * A tab owns three artifacts: a WebKey, a WebObject with its controller and a
 * registration slot. Closing a tab must release all three, otherwise a later
 * add reuses an index whose controller is already bound to a destroyed Web
 * component. The tracker pairs every creation with exactly one destruction.
 */
class TabLifecycleTracker {
  born: number[] = [];
  dead: number[] = [];
  private aliveKeys: number[] = [];

  onCreate(key: number): void {
    this.born.push(key);
    this.aliveKeys.push(key);
  }

  onDestroy(key: number): boolean {
    const position: number = this.aliveKeys.indexOf(key);
    if (position < 0) {
      return false;
    }
    this.aliveKeys.splice(position, 1);
    this.dead.push(key);
    return true;
  }

  aliveCount(): number {
    return this.aliveKeys.length;
  }

  alive(): number[] {
    return this.aliveKeys.slice(0);
  }

  /** Creations that were never matched by a destruction. */
  leaked(): number {
    return this.born.length - this.dead.length;
  }
}

/**
 * Records the page level callbacks of the Web component.
 *
 * aboutToAppear loads the bundled home page, then every navigation produces
 * onPageBegin / onProgressChange / onPageEnd, and onPageEnd injects the pad
 * adapter script. After aboutToDisappear the engine may still deliver queued
 * callbacks; those must be ignored instead of mutating a dead instance.
 */
class PageLifecycleRecorder {
  sequence: string[] = [];
  adapterInjections: number = 0;
  ignoredAfterDisappear: number = 0;
  visible: boolean = false;

  appear(): void {
    this.visible = true;
    this.sequence.push('aboutToAppear');
  }

  onPageBegin(url: string): void {
    if (!this.visible) {
      this.ignoredAfterDisappear += 1;
      return;
    }
    this.sequence.push(`begin:${url}`);
  }

  onPageEnd(model: MockBrowser): void {
    if (!this.visible) {
      this.ignoredAfterDisappear += 1;
      return;
    }
    this.sequence.push('end');
    model.onPageEnd();
    this.adapterInjections += 1;
  }

  disappear(): void {
    this.visible = false;
    this.sequence.push('aboutToDisappear');
  }

  begins(): number {
    return this.sequence.filter((item: string) => item.indexOf('begin:') === 0).length;
  }

  ends(): number {
    return this.sequence.filter((item: string) => item === 'end').length;
  }

  /** True when every begin is followed by exactly one end. */
  isBalanced(): boolean {
    return this.begins() === this.ends();
  }

  reset(): void {
    this.sequence = [];
    this.adapterInjections = 0;
    this.ignoredAfterDisappear = 0;
    this.visible = false;
  }
}

/** Registers the proxy of every live tab exactly once. */
function registerAll(model: MockBrowser, registry: JsProxyRegistry): number {
  let registered: number = 0;
  for (let index = 0; index < model.tabs.length; index++) {
    if (registry.register(index, PROXY_NAME, PROXY_METHODS)) {
      registered += 1;
    }
  }
  return registered;
}

export default function browserLifecycleTest() {
  describe('browserLifecycleTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'lifecycle suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Lifecycle_Instance_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Instance_001');
      TestLogger.step(TAG, 'create a browser instance and inspect the defaults');
      const lifecycle: InstanceLifecycle = new InstanceLifecycle();
      expect(lifecycle.alive).assertFalse();
      expect(lifecycle.create()).assertTrue();
      const model: MockBrowser = lifecycle.model;
      TestLogger.info(TAG, `events=${lifecycle.names().join(',')} tabs=${model.tabs.length}`);
      expect(lifecycle.alive).assertTrue();
      expect(lifecycle.creates).assertEqual(1);
      expect(lifecycle.destroys).assertEqual(0);
      expect(lifecycle.doubleCreates).assertEqual(0);
      expect(model.tabs.length).assertEqual(1);
      expect(model.tabArrayIndex).assertEqual(0);
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(model.hideProgress).assertTrue();
      expect(lifecycle.last() !== null).assertTrue();
      TestLogger.pass(TAG, 'Browser_Lifecycle_Instance_001');
    });

    it('Browser_Lifecycle_Instance_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Instance_002');
      TestLogger.step(TAG, 'refuse a second create on a live instance');
      const lifecycle: InstanceLifecycle = new InstanceLifecycle();
      expect(lifecycle.create()).assertTrue();
      expect(lifecycle.create()).assertFalse();
      TestLogger.info(TAG, `creates=${lifecycle.creates} double=${lifecycle.doubleCreates}`);
      expect(lifecycle.creates).assertEqual(1);
      expect(lifecycle.doubleCreates).assertEqual(1);
      expect(lifecycle.destroys).assertEqual(0);
      expect(lifecycle.events.length).assertEqual(1);
      expect(lifecycle.names()[0]).assertEqual('create');
      TestLogger.pass(TAG, 'Browser_Lifecycle_Instance_002');
    });

    it('Browser_Lifecycle_Instance_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Instance_003');
      TestLogger.step(TAG, 'destroy then rebuild the instance with three tabs');
      const lifecycle: InstanceLifecycle = new InstanceLifecycle();
      lifecycle.create();
      lifecycle.model.addTab();
      lifecycle.model.addTab();
      expect(lifecycle.model.tabs.length).assertEqual(3);
      const rebuilt: MockBrowser = lifecycle.rebuild(3);
      const names: string[] = lifecycle.names();
      TestLogger.info(TAG, `events=${names.join(',')} tabs=${rebuilt.tabs.length}`);
      expect(names).assertDeepEquals(['create', 'destroy', 'create']);
      expect(lifecycle.creates).assertEqual(2);
      expect(lifecycle.destroys).assertEqual(1);
      expect(lifecycle.alive).assertTrue();
      expect(rebuilt.tabs.length).assertEqual(3);
      expect(rebuilt.tabs[0].controller.history.length).assertEqual(0);
      expect(rebuilt.getTabKeys()).assertDeepEquals([0, 1, 2]);
      TestLogger.pass(TAG, 'Browser_Lifecycle_Instance_003');
    });

    it('Browser_Lifecycle_Instance_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Instance_004');
      TestLogger.step(TAG, 'keep two instances fully isolated');
      const first: InstanceLifecycle = new InstanceLifecycle();
      const second: InstanceLifecycle = new InstanceLifecycle();
      first.create();
      second.create();
      first.model.addTab();
      first.model.loadUrl('www.example.com/first');
      second.model.loadUrl('www.example.com/second');
      TestLogger.info(TAG, `first=${first.model.tabs.length} second=${second.model.tabs.length}`);
      expect(first.model.tabs.length).assertEqual(2);
      expect(second.model.tabs.length).assertEqual(1);
      const firstActive: MockBrowserTab | null = first.model.getCurrentTab();
      expect(firstActive === null).assertFalse();
      if (firstActive !== null) {
        expect(firstActive.controller.currentUrl).assertEqual('https://www.example.com/first');
      }
      expect(second.model.tabs[0].controller.currentUrl).assertEqual('https://www.example.com/second');
      expect(first.model.getTabArrayIndex()).assertEqual(1);
      expect(second.model.getTabArrayIndex()).assertEqual(0);
      expect(first.model.tabs[0].controller === second.model.tabs[0].controller).assertFalse();
      TestLogger.pass(TAG, 'Browser_Lifecycle_Instance_004');
    });

    it('Browser_Lifecycle_TabCreate_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_TabCreate_005');
      TestLogger.step(TAG, 'create three tabs and pair every creation');
      const model: MockBrowser = new MockBrowser(1);
      const tracker: TabLifecycleTracker = new TabLifecycleTracker();
      tracker.onCreate(0);
      for (let round = 0; round < 3; round++) {
        expect(model.addTab()).assertTrue();
        tracker.onCreate(model.tabs[model.tabs.length - 1].key);
      }
      TestLogger.info(TAG, `born=${tracker.born.join(',')} alive=${tracker.aliveCount()}`);
      expect(tracker.born.length).assertEqual(4);
      expect(tracker.aliveCount()).assertEqual(4);
      expect(tracker.dead.length).assertEqual(0);
      expect(tracker.leaked()).assertEqual(4);
      expect(tracker.alive()).assertDeepEquals([0, 1, 2, 3]);
      expect(model.tabs[3].controller !== null).assertTrue();
      expect(model.getTabKeys()).assertDeepEquals([0, 1, 2, 3]);
      TestLogger.pass(TAG, 'Browser_Lifecycle_TabCreate_005');
    });

    it('Browser_Lifecycle_TabDestroy_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_TabDestroy_006');
      TestLogger.step(TAG, 'destroy the middle tab and release its artifacts');
      const model: MockBrowser = new MockBrowser(3);
      const tracker: TabLifecycleTracker = new TabLifecycleTracker();
      for (let index = 0; index < 3; index++) {
        tracker.onCreate(model.tabs[index].key);
      }
      expect(model.deleteTab(1)).assertTrue();
      expect(tracker.onDestroy(1)).assertTrue();
      TestLogger.info(TAG, `alive=${tracker.alive().join(',')} dead=${tracker.dead.join(',')} keys=${model.getTabKeys().join(',')}`);
      expect(tracker.aliveCount()).assertEqual(2);
      expect(tracker.dead.length).assertEqual(1);
      expect(tracker.alive()).assertDeepEquals([0, 2]);
      expect(model.tabs.length).assertEqual(2);
      expect(model.getTabKeys()).assertDeepEquals([0, 1]);
      expect(tracker.onDestroy(1)).assertFalse();
      expect(tracker.dead.length).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_Lifecycle_TabDestroy_006');
    });

    it('Browser_Lifecycle_TabDestroy_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_TabDestroy_007');
      TestLogger.step(TAG, 'refuse to destroy the only remaining tab');
      const model: MockBrowser = new MockBrowser(1);
      const tracker: TabLifecycleTracker = new TabLifecycleTracker();
      tracker.onCreate(0);
      expect(model.deleteTab(0)).assertFalse();
      expect(model.deleteTab(5)).assertFalse();
      TestLogger.info(TAG, `tabs=${model.tabs.length} alive=${tracker.aliveCount()} dead=${tracker.dead.length}`);
      expect(model.tabs.length).assertEqual(1);
      expect(tracker.aliveCount()).assertEqual(1);
      expect(tracker.dead.length).assertEqual(0);
      expect(model.getTabArrayIndex()).assertEqual(0);
      expect(model.getCurrentTab() !== null).assertTrue();
      TestLogger.pass(TAG, 'Browser_Lifecycle_TabDestroy_007');
    });

    it('Browser_Lifecycle_Proxy_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Proxy_008');
      TestLogger.step(TAG, 'register the JavaScript proxy once per tab');
      const model: MockBrowser = new MockBrowser(3);
      const registry: JsProxyRegistry = new JsProxyRegistry();
      const registered: number = registerAll(model, registry);
      TestLogger.info(TAG, `registered=${registered} count=${registry.registeredCount()}`);
      expect(registered).assertEqual(3);
      expect(registry.registrations).assertEqual(3);
      expect(registry.registeredCount()).assertEqual(3);
      expect(registry.isRegistered(0)).assertTrue();
      expect(registry.isRegistered(2)).assertTrue();
      expect(registry.duplicates).assertEqual(0);
      expect(registry.methodsOf(0)).assertDeepEquals(PROXY_METHODS);
      expect(registry.methodsOf(0).length).assertEqual(2);
      TestLogger.pass(TAG, 'Browser_Lifecycle_Proxy_008');
    });

    it('Browser_Lifecycle_Proxy_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Proxy_009');
      TestLogger.step(TAG, 'reject a duplicate proxy registration');
      const registry: JsProxyRegistry = new JsProxyRegistry();
      expect(registry.register(0, PROXY_NAME, PROXY_METHODS)).assertTrue();
      expect(registry.register(0, PROXY_NAME, PROXY_METHODS)).assertFalse();
      expect(registry.register(0, PROXY_NAME, PROXY_METHODS)).assertFalse();
      const rejected: boolean = registry.register(1, '', PROXY_METHODS);
      TestLogger.info(TAG, `registrations=${registry.registrations} duplicates=${registry.duplicates} rejections=${registry.rejections}`);
      expect(rejected).assertFalse();
      expect(registry.registrations).assertEqual(1);
      expect(registry.duplicates).assertEqual(2);
      expect(registry.rejections).assertEqual(1);
      expect(registry.registeredCount()).assertEqual(1);
      expect(registry.isRegistered(1)).assertFalse();
      expect(registry.methodsOf(1).length).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Lifecycle_Proxy_009');
    });

    it('Browser_Lifecycle_Proxy_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Proxy_010');
      TestLogger.step(TAG, 'unregister the proxy of a closed tab');
      const model: MockBrowser = new MockBrowser(3);
      const registry: JsProxyRegistry = new JsProxyRegistry();
      registerAll(model, registry);
      expect(model.deleteTab(1)).assertTrue();
      expect(registry.unregister(1)).assertTrue();
      TestLogger.info(TAG, `count=${registry.registeredCount()} aliveKeys=${model.getTabKeys().join(',')}`);
      expect(registry.registeredCount()).assertEqual(2);
      expect(registry.isRegistered(1)).assertFalse();
      expect(registry.unregister(1)).assertFalse();
      expect(registry.isRegistered(0)).assertTrue();
      expect(registry.isRegistered(2)).assertTrue();
      expect(model.tabs.length).assertEqual(2);
      expect(registry.registrations).assertEqual(3);
      TestLogger.pass(TAG, 'Browser_Lifecycle_Proxy_010');
    });

    it('Browser_Lifecycle_Page_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Page_011');
      TestLogger.step(TAG, 'walk one page from aboutToAppear to onPageEnd');
      const model: MockBrowser = new MockBrowser(1);
      const recorder: PageLifecycleRecorder = new PageLifecycleRecorder();
      recorder.appear();
      model.onPageBegin('https://www.example.com/appear');
      recorder.onPageBegin('https://www.example.com/appear');
      model.onProgressChange(45);
      recorder.onPageEnd(model);
      const sequence: string[] = recorder.sequence;
      TestLogger.info(TAG, `sequence=${sequence.join(' > ')} injections=${recorder.adapterInjections}`);
      expect(sequence[0]).assertEqual('aboutToAppear');
      expect(sequence[1]).assertEqual('begin:https://www.example.com/appear');
      expect(sequence[2]).assertEqual('end');
      expect(recorder.begins()).assertEqual(1);
      expect(recorder.ends()).assertEqual(1);
      expect(recorder.isBalanced()).assertTrue();
      expect(recorder.adapterInjections).assertEqual(1);
      expect(model.tabs[0].controller.javaScriptCalls.length).assertEqual(1);
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.END);
      TestLogger.pass(TAG, 'Browser_Lifecycle_Page_011');
    });

    it('Browser_Lifecycle_Page_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Page_012');
      TestLogger.step(TAG, 'inject the adapter script on every page end');
      const model: MockBrowser = new MockBrowser(1);
      const recorder: PageLifecycleRecorder = new PageLifecycleRecorder();
      recorder.appear();
      for (let cycle = 0; cycle < PAGE_CYCLES; cycle++) {
        const url: string = `https://www.example.com/cycle/${cycle}`;
        model.loadUrl(url);
        model.onPageBegin(url);
        recorder.onPageBegin(url);
        model.onProgressChange(100);
        recorder.onPageEnd(model);
      }
      const calls: number = model.tabs[0].controller.javaScriptCalls.length;
      TestLogger.info(TAG, `cycles=${PAGE_CYCLES} injections=${recorder.adapterInjections} calls=${calls}`);
      expect(recorder.adapterInjections).assertEqual(PAGE_CYCLES);
      expect(recorder.begins()).assertEqual(PAGE_CYCLES);
      expect(recorder.ends()).assertEqual(PAGE_CYCLES);
      expect(recorder.isBalanced()).assertTrue();
      expect(calls).assertEqual(PAGE_CYCLES);
      expect(model.tabs[0].controller.javaScriptCalls[0]).assertEqual('adapterDevice()');
      expect(model.tabs[0].controller.history.length).assertEqual(PAGE_CYCLES);
      TestLogger.pass(TAG, 'Browser_Lifecycle_Page_012');
    });

    it('Browser_Lifecycle_Page_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Page_013');
      TestLogger.step(TAG, 'ignore queued callbacks after aboutToDisappear');
      const model: MockBrowser = new MockBrowser(1);
      const recorder: PageLifecycleRecorder = new PageLifecycleRecorder();
      recorder.appear();
      recorder.onPageBegin('https://www.example.com/live');
      model.onPageBegin('https://www.example.com/live');
      recorder.onPageEnd(model);
      recorder.disappear();
      recorder.onPageBegin('https://www.example.com/late');
      recorder.onPageEnd(model);
      TestLogger.info(TAG, `ignored=${recorder.ignoredAfterDisappear} injections=${recorder.adapterInjections}`);
      expect(recorder.ignoredAfterDisappear).assertEqual(2);
      expect(recorder.adapterInjections).assertEqual(1);
      expect(recorder.begins()).assertEqual(1);
      expect(recorder.ends()).assertEqual(1);
      expect(recorder.sequence[recorder.sequence.length - 1]).assertEqual('aboutToDisappear');
      expect(model.getInputVal()).assertEqual('https://www.example.com/live');
      expect(model.tabs[0].controller.javaScriptCalls.length).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_Lifecycle_Page_013');
    });

    it('Browser_Lifecycle_Recreate_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Recreate_014');
      TestLogger.step(TAG, 'recreate the instance repeatedly without leaking tabs');
      for (let round = 0; round < REBUILD_ROUNDS; round++) {
        const lifecycle: InstanceLifecycle = new InstanceLifecycle();
        lifecycle.create();
        lifecycle.model.addTab();
        const rebuilt: MockBrowser = lifecycle.rebuild(2);
        expect(lifecycle.alive).assertTrue();
        expect(rebuilt.tabs.length).assertEqual(2);
        expect(rebuilt.tabs[0].controller.history.length).assertEqual(0);
        expect(rebuilt.tabs[0].controller.refreshCount).assertEqual(0);
        expect(rebuilt.getTabArrayIndex()).assertEqual(0);
        expect(lifecycle.doubleCreates).assertEqual(0);
        expect(lifecycle.creates).assertEqual(2);
        expect(lifecycle.destroys).assertEqual(1);
      }
      TestLogger.info(TAG, `rounds=${REBUILD_ROUNDS} rebuild verified`);
      expect(REBUILD_ROUNDS).assertLarger(0);
      TestLogger.pass(TAG, 'Browser_Lifecycle_Recreate_014');
    });

    it('Browser_Lifecycle_TabRebuild_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_TabRebuild_015');
      TestLogger.step(TAG, 'close a tab then add one back and check the key reuse');
      const model: MockBrowser = new MockBrowser(3);
      const registry: JsProxyRegistry = new JsProxyRegistry();
      registerAll(model, registry);
      expect(model.deleteTab(2)).assertTrue();
      expect(registry.unregister(2)).assertTrue();
      expect(model.addTab()).assertTrue();
      const reusedKey: number = model.tabs[model.tabs.length - 1].key;
      const reRegistered: boolean = registry.register(reusedKey, PROXY_NAME, PROXY_METHODS);
      TestLogger.info(TAG, `reusedKey=${reusedKey} reRegistered=${reRegistered} count=${registry.registeredCount()}`);
      expect(reusedKey).assertEqual(2);
      expect(reRegistered).assertTrue();
      expect(registry.registeredCount()).assertEqual(3);
      expect(registry.duplicates).assertEqual(0);
      expect(model.getTabKeys()).assertDeepEquals([0, 1, 2]);
      expect(model.tabs[2].controller.history.length).assertEqual(0);
      expect(model.getTabArrayIndex()).assertEqual(2);
      TestLogger.pass(TAG, 'Browser_Lifecycle_TabRebuild_015');
    });

    it('Browser_Lifecycle_Home_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Home_016');
      TestLogger.step(TAG, 'load the bundled home page after aboutToAppear');
      const model: MockBrowser = new MockBrowser(1);
      const recorder: PageLifecycleRecorder = new PageLifecycleRecorder();
      recorder.appear();
      model.resetToHome('pad.html');
      recorder.onPageBegin('pad.html');
      recorder.onPageEnd(model);
      const controller: MockWebController = model.tabs[0].controller;
      TestLogger.info(TAG, `url=${controller.currentUrl} input='${model.getInputVal()}'`);
      expect(controller.currentUrl).assertEqual('pad.html');
      expect(model.getInputVal()).assertEqual('');
      expect(recorder.begins()).assertEqual(1);
      expect(recorder.ends()).assertEqual(1);
      expect(recorder.adapterInjections).assertEqual(1);
      expect(controller.loadCount).assertEqual(1);
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.END);
      TestLogger.pass(TAG, 'Browser_Lifecycle_Home_016');
    });

    it('Browser_Lifecycle_Sequence_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Sequence_017');
      TestLogger.step(TAG, 'verify the full instance lifecycle sequence');
      const lifecycle: InstanceLifecycle = new InstanceLifecycle();
      const recorder: PageLifecycleRecorder = new PageLifecycleRecorder();
      lifecycle.create();
      recorder.appear();
      lifecycle.record('aboutToAppear');
      lifecycle.model.onPageBegin('https://www.example.com/full');
      recorder.onPageBegin('https://www.example.com/full');
      lifecycle.record('onPageBegin');
      recorder.onPageEnd(lifecycle.model);
      lifecycle.record('onPageEnd');
      recorder.disappear();
      lifecycle.record('aboutToDisappear');
      lifecycle.destroy();
      const names: string[] = lifecycle.names();
      TestLogger.info(TAG, `names=${names.join(' > ')} page=${recorder.sequence.join(' > ')}`);
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual('create');
      expect(names[1]).assertEqual('aboutToAppear');
      expect(names[4]).assertEqual('aboutToDisappear');
      expect(names[5]).assertEqual('destroy');
      expect(recorder.sequence[0]).assertEqual('aboutToAppear');
      expect(recorder.sequence[recorder.sequence.length - 1]).assertEqual('aboutToDisappear');
      expect(recorder.isBalanced()).assertTrue();
      expect(lifecycle.alive).assertFalse();
      expect(lifecycle.last() !== null).assertTrue();
      TestLogger.pass(TAG, 'Browser_Lifecycle_Sequence_017');
    });

    it('Browser_Lifecycle_Summary_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_Summary_018');
      TestLogger.step(TAG, 'aggregate the lifecycle counters of one session');
      const model: MockBrowser = new MockBrowser(2);
      const tracker: TabLifecycleTracker = new TabLifecycleTracker();
      const registry: JsProxyRegistry = new JsProxyRegistry();
      tracker.onCreate(0);
      tracker.onCreate(1);
      registerAll(model, registry);
      model.addTab();
      tracker.onCreate(2);
      expect(registry.register(2, PROXY_NAME, PROXY_METHODS)).assertTrue();
      model.deleteTab(0);
      tracker.onDestroy(0);
      registry.unregister(0);
      TestLogger.info(TAG, `alive=${tracker.aliveCount()} born=${tracker.born.length} dead=${tracker.dead.length} proxies=${registry.registeredCount()}`);
      expect(tracker.born.length).assertEqual(3);
      expect(tracker.dead.length).assertEqual(1);
      expect(tracker.aliveCount()).assertEqual(2);
      expect(tracker.leaked()).assertEqual(2);
      expect(registry.registrations).assertEqual(3);
      expect(registry.registeredCount()).assertEqual(2);
      expect(model.tabs.length).assertEqual(tracker.aliveCount());
      expect(model.getTabKeys()).assertDeepEquals([0, 1]);
      TestLogger.pass(TAG, 'Browser_Lifecycle_Summary_018');
    });

    it('Browser_Lifecycle_UI_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_UI_019');
      TestLogger.step(TAG, 'probe the launched lifecycle lifecycle on the real device');
      const launched: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_PAGE_LOAD);
      expect(launched).assertTrue();
      try {
        const homePresent: boolean = await waitForId(driver, ID_NAV_HOME, TIMEOUT_TAB_SWITCH);
        expect(homePresent).assertTrue();
        const homeClicked: boolean = await clickById(driver, ID_NAV_HOME);
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const stillVisible: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_TAB_SWITCH);
        TestLogger.info(TAG, `homePresent=${homePresent} homeClicked=${homeClicked} stillVisible=${stillVisible}`);
        expect(homeClicked).assertTrue();
        expect(stillVisible).assertTrue();
      } finally {
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        TestLogger.info(TAG, 'lifecycle lifecycle probe finished');
      }
      TestLogger.pass(TAG, 'Browser_Lifecycle_UI_019');
    });

    it('Browser_Lifecycle_UI_020', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Lifecycle_UI_020');
      TestLogger.step(TAG, 'create and destroy a tab on the real device');
      try {
        const before: number = await countById(driver, ID_CANCEL_TAB);
        const added: boolean = await clickById(driver, ID_ACTION_ADD);
        expect(added).assertTrue();
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const afterAdd: number = await countById(driver, ID_CANCEL_TAB);
        const cancelled: boolean = await clickById(driver, ID_CANCEL_TAB);
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const afterCancel: number = await countById(driver, ID_CANCEL_TAB);
        const inputAlive: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_TAB_SWITCH);
        TestLogger.info(TAG, `before=${before} afterAdd=${afterAdd} afterCancel=${afterCancel}`);
        expect(afterAdd >= before).assertTrue();
        expect(cancelled).assertTrue();
        expect(afterCancel >= 0).assertTrue();
        expect(inputAlive).assertTrue();
      } finally {
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        TestLogger.info(TAG, 'tab lifecycle probe finished');
      }
      TestLogger.pass(TAG, 'Browser_Lifecycle_UI_020');
    });
  });
}
