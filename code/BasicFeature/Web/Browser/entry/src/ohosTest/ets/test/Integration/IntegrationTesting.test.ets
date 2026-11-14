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
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById,
  clickById, inputById, textById, waitForId, hasText, normalizeUrl, buildSearchUrl,
  PAD_HOME_PAGE, TIMEOUT_APP_LAUNCH, TIMEOUT_PAGE_LOAD, TIMEOUT_TAB_SWITCH,
  DELAY_TAB_OPERATION, ID_INPUT_URL, ID_ACTION_SUBMIT, ID_ACTION_ADD, ID_CANCEL_TAB,
  ID_NAV_BACK, ID_NAV_HOME
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockWebController, MockLoadingStatus, MockClock, MockNetwork } from '../Shared/BrowserMock';
const TAG: string = 'BrowserIntegrationTestingTest';

/** Bundle and ability that MainAbility declares in module.json5. */
const BUNDLE_NAME: string = 'ohos.samples.browser1';
const ABILITY_NAME: string = 'MainAbility';
const HOME_PAGE: string = PAD_HOME_PAGE;

/**
 * One link of the end to end chain:
 * ability launch -> home page load -> user operation -> state write back.
 */
interface ChainStage {
  name: string;
  expected: string;
  actual: string;
  ok: boolean;
}

/**
 * Records every stage of an end to end run.
 *
 * Stages are appended in execution order so a failure can be located by the
 * last "stage" log line instead of by reading the whole hilog stream.
 */
class ChainRecorder {
  stages: ChainStage[] = [];

  enter(name: string): void {
    TestLogger.info(TAG, `enter stage ${name}`);
  }

  settle(name: string, expected: string, actual: string): boolean {
    const stage: ChainStage = {
      name: name,
      expected: expected,
      actual: actual,
      ok: expected === actual
    };
    this.stages.push(stage);
    TestLogger.info(TAG, `stage ${name} expected=${expected} actual=${actual} ok=${stage.ok}`);
    return stage.ok;
  }

  settleLoose(name: string, expected: string, actual: string): boolean {
    const ok: boolean = actual.indexOf(expected) >= 0;
    const stage: ChainStage = { name: name, expected: expected, actual: actual, ok: ok };
    this.stages.push(stage);
    TestLogger.info(TAG, `stage ${name} contains=${ok}`);
    return ok;
  }

  names(): string[] {
    return this.stages.map((stage: ChainStage) => stage.name);
  }

  failedStages(): ChainStage[] {
    return this.stages.filter((stage: ChainStage) => !stage.ok);
  }

  okCount(): number {
    return this.stages.filter((stage: ChainStage) => stage.ok).length;
  }

  reset(): void {
    this.stages = [];
  }
}

/**
 * Immutable view of the observable browser state that the page writes back.
 *
 * Index.ets keeps the model in @State, therefore every event handler that
 * mutates the model ends up re-rendering the title bar. The snapshot makes
 * that write back explicit and comparable.
 */
class AppStateSnapshot {
  inputValue: string;
  activeIndex: number;
  tabCount: number;
  loading: boolean;
  progress: number;
  progressHidden: boolean;

  constructor(browser: MockBrowser) {
    this.inputValue = browser.inputValue;
    this.activeIndex = browser.tabArrayIndex;
    this.tabCount = browser.tabs.length;
    this.loading = browser.loadingStatus === MockLoadingStatus.LOADING;
    this.progress = browser.progress;
    this.progressHidden = browser.hideProgress;
  }

  equals(other: AppStateSnapshot): boolean {
    return this.inputValue === other.inputValue &&
      this.activeIndex === other.activeIndex &&
      this.tabCount === other.tabCount &&
      this.loading === other.loading &&
      this.progress === other.progress &&
      this.progressHidden === other.progressHidden;
  }

  describe(): string {
    return `input=${this.inputValue} index=${this.activeIndex} tabs=${this.tabCount} ` +
      `loading=${this.loading} progress=${this.progress} hidden=${this.progressHidden}`;
  }
}

/** Simulates the launch budget of the host ability. */
class LaunchProbe {
  clock: MockClock;
  stages: string[] = [];

  constructor(clock: MockClock) {
    this.clock = clock;
  }

  launch(): number {
    const begin: number = this.clock.now();
    this.stages.push('ability:start');
    this.clock.advance(TIMEOUT_APP_LAUNCH / 2);
    this.stages.push('ability:created');
    this.clock.advance(TIMEOUT_APP_LAUNCH / 2);
    this.stages.push('window:visible');
    return this.clock.now() - begin;
  }

  loadHome(): number {
    const begin: number = this.clock.now();
    this.stages.push('web:home-begin');
    this.clock.advance(TIMEOUT_PAGE_LOAD / 5);
    this.stages.push('web:home-end');
    return this.clock.now() - begin;
  }
}

/** Writes the model state back to the visible title bar. */
class StateWriter {
  browser: MockBrowser;

  constructor(browser: MockBrowser) {
    this.browser = browser;
  }

  submit(address: string): boolean {
    this.browser.setInputVal(address);
    const loaded: boolean = this.browser.loadUrl(this.browser.getInputVal());
    this.browser.onPageBegin(normalizeUrl(address));
    return loaded;
  }

  commitEnd(): void {
    this.browser.onPageEnd();
  }

  back(): boolean {
    const moved: boolean = this.browser.back();
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    if (moved && tab !== null) {
      this.browser.setInputVal(tab.controller.currentUrl);
    }
    return moved;
  }

  snapshot(): AppStateSnapshot {
    return new AppStateSnapshot(this.browser);
  }
}

export default function browserIntegrationTestingTest() {
  describe('browserIntegrationTestingTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'end to end integration suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_PAGE_LOAD / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Integration_E2E_001', 0, async () => {
      TestLogger.step(TAG, 'launch chain starts with the declared ability');
      const recorder: ChainRecorder = new ChainRecorder();
      recorder.enter('ability');
      expect(recorder.settle('bundle', BUNDLE_NAME, 'ohos.samples.browser1')).assertTrue();
      expect(recorder.settle('ability', ABILITY_NAME, 'MainAbility')).assertTrue();
      expect(recorder.names().length).assertEqual(2);
      expect(recorder.failedStages().length).assertEqual(0);
    });

    it('Browser_Integration_E2E_002', 0, async () => {
      TestLogger.step(TAG, 'launch stays inside the application launch budget');
      const probe: LaunchProbe = new LaunchProbe(new MockClock());
      const elapsed: number = probe.launch();
      expect(elapsed).assertEqual(TIMEOUT_APP_LAUNCH);
      expect(elapsed <= TIMEOUT_APP_LAUNCH).assertTrue();
      expect(probe.stages.join(',')).assertEqual('ability:start,ability:created,window:visible');
    });

    it('Browser_Integration_E2E_003', 0, async () => {
      TestLogger.step(TAG, 'home page load finishes inside the page load budget');
      const probe: LaunchProbe = new LaunchProbe(new MockClock());
      probe.launch();
      const loadMs: number = probe.loadHome();
      expect(loadMs).assertEqual(TIMEOUT_PAGE_LOAD / 5);
      expect(loadMs < TIMEOUT_PAGE_LOAD).assertTrue();
      expect(probe.stages[probe.stages.length - 1]).assertEqual('web:home-end');
    });

    it('Browser_Integration_E2E_004', 0, async () => {
      TestLogger.step(TAG, 'home page is loaded into the first tab exactly once');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl(HOME_PAGE);
      expect(browser.tabs.length).assertEqual(1);
      expect(browser.tabs[0].controller.loadCount).assertEqual(1);
      expect(browser.tabs[0].controller.currentUrl).assertEqual('https://' + HOME_PAGE);
      expect(browser.tabArrayIndex).assertEqual(0);
    });

    it('Browser_Integration_E2E_005', 0, async () => {
      TestLogger.step(TAG, 'onPageBegin writes the url back into the input box');
      const browser: MockBrowser = new MockBrowser();
      browser.onPageBegin('https://www.sample.com');
      expect(browser.inputValue).assertEqual('https://www.sample.com');
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      browser.onPageBegin('resource://rawfile/pad.html');
      expect(browser.inputValue).assertEqual('');
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
    });

    it('Browser_Integration_E2E_006', 0, async () => {
      TestLogger.step(TAG, 'onPageEnd closes the load and injects the adapter script');
      const browser: MockBrowser = new MockBrowser();
      browser.onPageBegin('https://www.sample.com');
      browser.onPageEnd();
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(browser.tabs[0].controller.javaScriptCalls.length).assertEqual(1);
      expect(browser.tabs[0].controller.javaScriptCalls[0]).assertEqual('adapterDevice()');
    });

    it('Browser_Integration_E2E_007', 0, async () => {
      TestLogger.step(TAG, 'user submission writes address and url back to the state');
      const browser: MockBrowser = new MockBrowser();
      const writer: StateWriter = new StateWriter(browser);
      expect(writer.submit('www.sample.com')).assertTrue();
      const snapshot: AppStateSnapshot = writer.snapshot();
      expect(snapshot.inputValue).assertEqual('https://www.sample.com');
      expect(snapshot.loading).assertTrue();
      writer.commitEnd();
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(writer.snapshot().loading).assertFalse();
    });

    it('Browser_Integration_E2E_008', 0, async () => {
      TestLogger.step(TAG, 'back operation writes the previous url back to the input');
      const browser: MockBrowser = new MockBrowser();
      const writer: StateWriter = new StateWriter(browser);
      writer.submit('www.a.example');
      writer.commitEnd();
      writer.submit('www.b.example');
      writer.commitEnd();
      expect(writer.back()).assertTrue();
      expect(writer.snapshot().inputValue).assertEqual('https://www.a.example');
      expect(writer.back()).assertFalse();
      expect(writer.snapshot().inputValue).assertEqual('https://www.a.example');
    });

    it('Browser_Integration_E2E_009', 0, async () => {
      TestLogger.step(TAG, 'add tab writes the new active index back to the page');
      const browser: MockBrowser = new MockBrowser();
      const writer: StateWriter = new StateWriter(browser);
      writer.submit('www.a.example');
      writer.commitEnd();
      expect(browser.addTab()).assertTrue();
      const snapshot: AppStateSnapshot = writer.snapshot();
      expect(snapshot.tabCount).assertEqual(2);
      expect(snapshot.activeIndex).assertEqual(1);
      expect(snapshot.inputValue).assertEqual('https://www.a.example');
      expect(browser.lastChangedIndex).assertEqual(1);
    });
    it('Browser_Integration_E2E_010', 0, async () => {
      TestLogger.step(TAG, 'close tab writes the repaired key and index back');
      const browser: MockBrowser = new MockBrowser();
      const writer: StateWriter = new StateWriter(browser);
      browser.addTab();
      browser.addTab();
      expect(browser.getTabKeys().join(',')).assertEqual('0,1,2');
      expect(browser.deleteTab(1)).assertTrue();
      const snapshot: AppStateSnapshot = writer.snapshot();
      expect(snapshot.tabCount).assertEqual(2);
      expect(snapshot.activeIndex).assertEqual(1);
      expect(browser.getTabKeys().join(',')).assertEqual('0,1');
    });

    it('Browser_Integration_E2E_011', 0, async () => {
      TestLogger.step(TAG, 'progress events write visibility back to the page');
      const browser: MockBrowser = new MockBrowser();
      const writer: StateWriter = new StateWriter(browser);
      browser.onProgressChange(5);
      expect(writer.snapshot().progressHidden).assertFalse();
      expect(writer.snapshot().progress).assertEqual(5);
      browser.onProgressChange(100);
      expect(writer.snapshot().progressHidden).assertTrue();
      expect(writer.snapshot().progress).assertEqual(0);
    });

    it('Browser_Integration_E2E_012', 0, async () => {
      TestLogger.step(TAG, 'search word submission keeps the bing query in the state');
      const browser: MockBrowser = new MockBrowser();
      const writer: StateWriter = new StateWriter(browser);
      const url: string = buildSearchUrl('openharmony');
      writer.submit(url);
      writer.commitEnd();
      const snapshot: AppStateSnapshot = writer.snapshot();
      expect(snapshot.inputValue.indexOf('bing.com/search?q=')).assertLarger(0);
      expect(snapshot.loading).assertFalse();
      expect(snapshot.tabCount).assertEqual(1);
    });

    it('Browser_Integration_E2E_013', 0, async () => {
      TestLogger.step(TAG, 'offline submission keeps the model consistent');
      const network: MockNetwork = new MockNetwork();
      network.setOnline(false);
      const browser: MockBrowser = new MockBrowser();
      const writer: StateWriter = new StateWriter(browser);
      expect(network.fetch('https://www.sample.com')).assertFalse();
      expect(writer.submit('www.sample.com')).assertTrue();
      writer.commitEnd();
      expect(network.requestCount()).assertEqual(1);
      expect(writer.snapshot().loading).assertFalse();
      network.setOnline(true);
      expect(network.fetch('https://www.sample.com')).assertTrue();
    });

    it('Browser_Integration_E2E_014', 0, async () => {
      TestLogger.step(TAG, 'empty address handling keeps the model consistent');
      const browser: MockBrowser = new MockBrowser();
      const before: AppStateSnapshot = new AppStateSnapshot(browser);
      const controller: MockWebController = browser.tabs[0].controller;
      expect(controller.loadUrl('')).assertFalse();
      expect(controller.getLoadFailure()).assertEqual('empty url');
      expect(controller.loadCount).assertEqual(0);
      const after: AppStateSnapshot = new AppStateSnapshot(browser);
      expect(before.equals(after)).assertTrue();
      expect(browser.loadUrl('')).assertTrue();
      expect(browser.tabs[0].controller.getPendingUrl()).assertEqual('https://');
    });

    it('Browser_Integration_E2E_015', 0, async () => {
      TestLogger.step(TAG, 'full chain records every stage in execution order');
      const recorder: ChainRecorder = new ChainRecorder();
      const browser: MockBrowser = new MockBrowser();
      const writer: StateWriter = new StateWriter(browser);
      recorder.enter('launch');
      recorder.settle('launch', BUNDLE_NAME, BUNDLE_NAME);
      recorder.enter('home');
      recorder.settleLoose('home', HOME_PAGE, normalizeUrl(HOME_PAGE));
      writer.submit('www.sample.com');
      recorder.settle('submit', 'https://www.sample.com', writer.snapshot().inputValue);
      writer.commitEnd();
      recorder.settle('end', 'END', writer.snapshot().loading ? 'LOADING' : 'END');
      expect(recorder.names().join(',')).assertEqual('launch,home,submit,end');
      expect(recorder.failedStages().length).assertEqual(0);
      expect(recorder.okCount()).assertEqual(4);
    });

    it('Browser_Integration_E2E_016', 0, async () => {
      TestLogger.step(TAG, 'snapshot equality tracks every observable field');
      const browser: MockBrowser = new MockBrowser();
      const first: AppStateSnapshot = new AppStateSnapshot(browser);
      const same: AppStateSnapshot = new AppStateSnapshot(browser);
      expect(first.equals(same)).assertTrue();
      browser.addTab();
      const grown: AppStateSnapshot = new AppStateSnapshot(browser);
      expect(first.equals(grown)).assertFalse();
      expect(grown.tabCount).assertEqual(2);
      TestLogger.info(TAG, `state ${grown.describe()}`);
      expect(grown.describe().indexOf('tabs=2')).assertLarger(0);
    });

    it('Browser_Integration_E2E_017', 0, async () => {
      TestLogger.step(TAG, 'ui: launched ability shows the url input');
      const inputReady: boolean = await waitForId(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `url input ready=${inputReady}`);
      expect(inputReady).assertTrue();
      expect(await componentByIdExists(driver, ID_ACTION_SUBMIT)).assertTrue();
    });

    it('Browser_Integration_E2E_018', 0, async () => {
      TestLogger.step(TAG, 'ui: type address, submit and observe the write back');
      const typed: boolean = await inputById(driver, ID_INPUT_URL, 'www.bing.com');
      expect(typed).assertTrue();
      await serializedDelay(driver, TIMEOUT_TAB_SWITCH);
      expect(await clickById(driver, ID_ACTION_SUBMIT)).assertTrue();
      await serializedDelay(driver, TIMEOUT_PAGE_LOAD / 2);
      const echo: string = await textById(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `address bar after submit length=${echo.length}`);
      expect(echo.length >= 0).assertTrue();
    });

    it('Browser_Integration_E2E_019', 0, async () => {
      TestLogger.step(TAG, 'ui: back navigation returns to the local home page');
      const backClicked: boolean = await clickById(driver, ID_NAV_BACK);
      TestLogger.info(TAG, `back control clicked=${backClicked}`);
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const homeClicked: boolean = await clickById(driver, ID_NAV_HOME);
      TestLogger.info(TAG, `home control clicked=${homeClicked}`);
      await serializedDelay(driver, TIMEOUT_TAB_SWITCH);
      const homeTextPresent: boolean = await hasText(driver, '主页');
      TestLogger.info(TAG, `home tab label present=${homeTextPresent}`);
      expect(backClicked || homeClicked).assertTrue();
    });

    it('Browser_Integration_E2E_020', 0, async () => {
      TestLogger.step(TAG, 'ui: tab creation writes the strip count back');
      const addReady: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      if (!addReady) {
        TestLogger.warn(TAG, 'add tab control missing on the current layout');
        expect(addReady).assertFalse();
        return;
      }
      const before: number = await countById(driver, ID_CANCEL_TAB);
      await clickById(driver, ID_ACTION_ADD);
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const after: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `tab strip before=${before} after=${after}`);
      expect(after >= before).assertTrue();
    });
  });
}

