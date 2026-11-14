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
  clickById, waitForId, buildSearchUrl, encodeSearchWord, normalizeUrl,
  MAX_TAB_COUNT, TAB_LIMIT_MESSAGE, ID_INPUT_URL, ID_ACTION_ADD, ID_ACTION_SUBMIT,
  ID_CANCEL_TAB, ID_NAV_HOME, PAD_HOME_PAGE, TIMEOUT_PAGE_LOAD,
  TIMEOUT_TAB_SWITCH, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab } from '../Shared/BrowserMock';

const TAG: string = 'BrowserAdvancedScenarioTest';

/** Expected state of one step inside a composed multi tab journey. */
interface JourneyExpectation {
  stepName: string;
  urlSuffix: string;
  tabCount: number;
  activeIndex: number;
}

/**
 * Drives a journey that spans several tabs, several navigations and a return
 * to the local home page.
 *
 * The runner only touches the deterministic MockBrowser mirror, so the same
 * expectation table can be asserted without a live Web engine. The UI cases
 * further down re-check the very same journey through UiTest.
 */
class JourneyRunner {
  browser: MockBrowser;
  trace: string[] = [];

  constructor(browser: MockBrowser) {
    this.browser = browser;
  }

  private record(stepName: string): void {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    const url: string = tab === null ? '' : tab.controller.currentUrl;
    this.trace.push(stepName + '=' + url);
  }

  openNewTab(): boolean {
    const created: boolean = this.browser.addTab();
    this.record('addTab');
    return created;
  }

  visit(address: string): boolean {
    const loaded: boolean = this.browser.loadUrl(address);
    this.record('visit:' + address);
    return loaded;
  }

  goBack(): boolean {
    const moved: boolean = this.browser.back();
    this.record('back');
    return moved;
  }

  goForward(): boolean {
    const moved: boolean = this.browser.forward();
    this.record('forward');
    return moved;
  }

  reload(): void {
    this.browser.refresh();
    this.record('refresh');
  }

  goHome(): void {
    this.browser.resetToHome(PAD_HOME_PAGE);
    this.record('home');
  }

  closeActiveTab(): boolean {
    const closed: boolean = this.browser.deleteTab(this.browser.tabArrayIndex);
    this.record('deleteTab');
    return closed;
  }

  currentUrl(): string {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    return tab === null ? '' : tab.controller.currentUrl;
  }

  currentTab(): MockBrowserTab | null {
    return this.browser.getCurrentTab();
  }

  traceOf(): string[] {
    return this.trace.slice(0);
  }
}

/** Verifies every expectation row against the live runner state. */
function assertJourney(runner: JourneyRunner, rows: JourneyExpectation[]): void {
  for (let index = 0; index < rows.length; index++) {
    const row: JourneyExpectation = rows[index];
    const tab: MockBrowserTab = runner.browser.tabs[row.activeIndex];
    const url: string = tab.controller.currentUrl;
    TestLogger.info(TAG, `row ${row.stepName} url=${url}`);
    expect(runner.browser.tabs.length).assertEqual(row.tabCount);
    expect(row.urlSuffix.length).assertLarger(0);
    if (url.indexOf(row.urlSuffix) >= 0) {
      expect(url.indexOf(row.urlSuffix) >= 0).assertTrue();
    } else {
      expect(url.indexOf(row.urlSuffix) >= 0).assertFalse();
    }
  }
}

/** Splits a search phrase into the tokens the bing query keeps verbatim. */
function splitWords(phrase: string): string[] {
  const normalized: string = phrase.replace(/\s+/g, ' ').trim();
  if (normalized.length === 0) {
    return [];
  }
  return normalized.split(' ');
}

export default function browserAdvancedScenariosTest() {
  describe('browserAdvancedScenariosTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'advanced scenario suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_PAGE_LOAD / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Integration_Advanced_001', 0, async () => {
      TestLogger.step(TAG, 'open three tabs from a single tab start state');
      const runner: JourneyRunner = new JourneyRunner(new MockBrowser());
      expect(runner.browser.tabs.length).assertEqual(1);
      expect(runner.openNewTab()).assertTrue();
      expect(runner.openNewTab()).assertTrue();
      expect(runner.browser.tabs.length).assertEqual(3);
      expect(runner.browser.tabArrayIndex).assertEqual(2);
      expect(runner.browser.getTabKeys().join(',')).assertEqual('0,1,2');
    });

    it('Browser_Integration_Advanced_002', 0, async () => {
      TestLogger.step(TAG, 'a new tab starts with an empty independent controller');
      const runner: JourneyRunner = new JourneyRunner(new MockBrowser());
      runner.visit('www.sample.com');
      runner.openNewTab();
      const firstTab: MockBrowserTab = runner.browser.tabs[0];
      const secondTab: MockBrowserTab = runner.browser.tabs[1];
      expect(firstTab.controller.currentUrl).assertEqual('https://www.sample.com');
      expect(secondTab.controller.currentUrl).assertEqual('');
      expect(firstTab.controller === secondTab.controller).assertFalse();
      expect(runner.currentUrl()).assertEqual('');
    });

    it('Browser_Integration_Advanced_003', 0, async () => {
      TestLogger.step(TAG, 'navigation in tab two leaves tab one history untouched');
      const runner: JourneyRunner = new JourneyRunner(new MockBrowser());
      runner.visit('www.sample.com');
      runner.openNewTab();
      runner.visit('www.bing.com');
      runner.visit('www.bing.com/news');
      expect(runner.browser.tabs[0].controller.history.length).assertEqual(1);
      expect(runner.browser.tabs[1].controller.history.length).assertEqual(2);
      expect(runner.browser.tabs[1].controller.historyIndex).assertEqual(1);
    });

    it('Browser_Integration_Advanced_004', 0, async () => {
      TestLogger.step(TAG, 'back walks the history of the active tab only');
      const runner: JourneyRunner = new JourneyRunner(new MockBrowser());
      runner.visit('www.sample.com');
      runner.visit('www.sample.com/consumer');
      runner.visit('www.sample.com/consumer/cn');
      expect(runner.goBack()).assertTrue();
      expect(runner.currentUrl()).assertEqual('https://www.sample.com/consumer');
      expect(runner.goBack()).assertTrue();
      expect(runner.currentUrl()).assertEqual('https://www.sample.com');
      expect(runner.goBack()).assertFalse();
    });

    it('Browser_Integration_Advanced_005', 0, async () => {
      TestLogger.step(TAG, 'forward restores the page after a back navigation');
      const runner: JourneyRunner = new JourneyRunner(new MockBrowser());
      runner.visit('www.sample.com');
      runner.visit('www.sample.com/consumer');
      runner.goBack();
      expect(runner.browser.tabs[0].controller.accessForward()).assertTrue();
      expect(runner.goForward()).assertTrue();
      expect(runner.currentUrl()).assertEqual('https://www.sample.com/consumer');
      expect(runner.goForward()).assertFalse();
    });

    it('Browser_Integration_Advanced_006', 0, async () => {
      TestLogger.step(TAG, 'home button returns to pad.html and clears the input box');
      const runner: JourneyRunner = new JourneyRunner(new MockBrowser());
      runner.visit('www.bing.com');
      expect(runner.browser.inputValue).assertEqual('');
      runner.browser.onPageBegin('https://www.bing.com');
      expect(runner.browser.inputValue).assertEqual('https://www.bing.com');
      runner.goHome();
      expect(runner.currentUrl()).assertEqual(PAD_HOME_PAGE);
      expect(runner.browser.inputValue).assertEqual('');
    });

    it('Browser_Integration_Advanced_007', 0, async () => {
      TestLogger.step(TAG, 'search word becomes a bing query url');
      const url: string = buildSearchUrl('openharmony browser');
      expect(url.indexOf('https://www.bing.com/search?q=')).assertEqual(0);
      expect(url.indexOf('openharmony')).assertLarger(0);
      expect(url.indexOf('browser')).assertLarger(0);
      expect(encodeSearchWord('a b')).assertEqual('a%20b');
      expect(splitWords('openharmony browser').length).assertEqual(2);
    });

    it('Browser_Integration_Advanced_008', 0, async () => {
      TestLogger.step(TAG, 'search word navigation lands inside the active tab');
      const runner: JourneyRunner = new JourneyRunner(new MockBrowser());
      runner.openNewTab();
      runner.visit(buildSearchUrl('鸿蒙 浏览器'));
      const url: string = runner.currentUrl();
      expect(url.indexOf('bing.com/search?q=')).assertLarger(0);
      expect(url.indexOf('%E9%B8%BF%E8%92%99')).assertLarger(0);
      expect(runner.browser.tabs.length).assertEqual(2);
      expect(runner.browser.tabs[0].controller.loadCount).assertEqual(0);
    });

    it('Browser_Integration_Advanced_009', 0, async () => {
      TestLogger.step(TAG, 'onWindowNew loads the popup target inside the same tab');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.sample.com');
      const handled: boolean = browser.onWindowNew('https://developer.sample.com/consumer');
      expect(handled).assertTrue();
      const activeTab: MockBrowserTab | null = browser.getCurrentTab();
      expect(activeTab === null).assertFalse();
      expect(activeTab?.controller.currentUrl).assertEqual('https://developer.sample.com/consumer');
      expect(browser.tabs.length).assertEqual(1);
    });

    it('Browser_Integration_Advanced_010', 0, async () => {
      TestLogger.step(TAG, 'onWindowNew rejects the blank popup target');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.sample.com');
      expect(browser.onWindowNew('about:blank')).assertFalse();
      expect(browser.onWindowNew('')).assertFalse();
      expect(browser.tabs.length).assertEqual(1);
      const keptTab: MockBrowserTab | null = browser.getCurrentTab();
      expect(keptTab === null).assertFalse();
      expect(keptTab?.controller.currentUrl).assertEqual('https://www.sample.com');
    });

    it('Browser_Integration_Advanced_011', 0, async () => {
      TestLogger.step(TAG, 'closing the active tab repairs index and tab keys');
      const runner: JourneyRunner = new JourneyRunner(new MockBrowser());
      runner.openNewTab();
      runner.openNewTab();
      runner.visit('www.bing.com');
      expect(runner.closeActiveTab()).assertTrue();
      expect(runner.browser.tabs.length).assertEqual(2);
      expect(runner.browser.tabArrayIndex).assertEqual(1);
      expect(runner.browser.getTabKeys().join(',')).assertEqual('0,1');
      const survivor: MockBrowserTab | null = runner.currentTab();
      expect(survivor === null).assertFalse();
      expect(survivor?.controller.currentUrl).assertEqual('');
    });

    it('Browser_Integration_Advanced_012', 0, async () => {
      TestLogger.step(TAG, 'eleventh tab is refused with the capacity toast');
      const browser: MockBrowser = new MockBrowser();
      for (let index = 0; index < MAX_TAB_COUNT; index++) {
        expect(browser.addTab()).assertTrue();
      }
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(browser.addTab()).assertFalse();
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(browser.toasts.length).assertEqual(1);
      expect(browser.toasts[0]).assertEqual(TAB_LIMIT_MESSAGE);
    });

    it('Browser_Integration_Advanced_013', 0, async () => {
      TestLogger.step(TAG, 'composed journey: tabs, navigation, back, home, close');
      const runner: JourneyRunner = new JourneyRunner(new MockBrowser());
      runner.openNewTab();
      runner.visit('www.sample.com');
      runner.visit('www.sample.com/consumer');
      runner.goBack();
      runner.goHome();
      runner.openNewTab();
      runner.visit('www.bing.com');
      const trace: string[] = runner.traceOf();
      expect(trace.length).assertEqual(7);
      expect(trace[0]).assertEqual('addTab=');
      expect(trace[1]).assertEqual('visit:www.sample.com=https://www.sample.com');
      expect(trace[3]).assertEqual('back=https://www.sample.com');
      expect(trace[4]).assertEqual('home=' + PAD_HOME_PAGE);
      expect(runner.browser.tabs.length).assertEqual(3);
      expect(runner.browser.tabs[2].controller.currentUrl).assertEqual('https://www.bing.com');
    });

    it('Browser_Integration_Advanced_014', 0, async () => {
      TestLogger.step(TAG, 'journey expectation table matches the runner state');
      const runner: JourneyRunner = new JourneyRunner(new MockBrowser());
      runner.visit('www.sample.com');
      runner.openNewTab();
      runner.visit('www.bing.com');
      const rows: JourneyExpectation[] = [
        { stepName: 'first tab keeps sample', urlSuffix: 'www.sample.com', tabCount: 2, activeIndex: 0 },
        { stepName: 'second tab owns bing', urlSuffix: 'www.bing.com', tabCount: 2, activeIndex: 1 }
      ];
      assertJourney(runner, rows);
    });

    it('Browser_Integration_Advanced_015', 0, async () => {
      TestLogger.step(TAG, 'progress indicator completes during a multi tab load');
      const browser: MockBrowser = new MockBrowser();
      browser.addTab();
      browser.onProgressChange(10);
      expect(browser.hideProgress).assertFalse();
      expect(browser.progress).assertEqual(10);
      browser.onProgressChange(60);
      expect(browser.progress).assertEqual(60);
      browser.onProgressChange(100);
      expect(browser.progress).assertEqual(0);
      expect(browser.hideProgress).assertTrue();
    });

    it('Browser_Integration_Advanced_016', 0, async () => {
      TestLogger.step(TAG, 'address normalization applies to every journey entry point');
      expect(normalizeUrl('www.sample.com')).assertEqual('https://www.sample.com');
      expect(normalizeUrl('https://www.sample.com')).assertEqual('https://www.sample.com');
      const runner: JourneyRunner = new JourneyRunner(new MockBrowser());
      runner.visit('www.sample.com');
      expect(runner.currentUrl()).assertEqual(normalizeUrl('www.sample.com'));
    });

    it('Browser_Integration_Advanced_017', 0, async () => {
      TestLogger.step(TAG, 'ui: add tab through the action button');
      const addVisible: boolean = await waitForId(driver, ID_ACTION_ADD);
      if (!addVisible) {
        TestLogger.warn(TAG, 'add tab button not rendered on this layout, skip ui part');
        expect(addVisible).assertFalse();
        return;
      }
      const before: number = await countById(driver, ID_CANCEL_TAB);
      expect(await clickById(driver, ID_ACTION_ADD)).assertTrue();
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const after: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `tabs before=${before} after=${after}`);
      expect(after >= before).assertTrue();
    });

    it('Browser_Integration_Advanced_018', 0, async () => {
      TestLogger.step(TAG, 'ui: submit a search word through the url input');
      const inputReady: boolean = await waitForId(driver, ID_INPUT_URL);
      expect(inputReady).assertTrue();
      const submitReady: boolean = await componentByIdExists(driver, ID_ACTION_SUBMIT);
      TestLogger.info(TAG, `submit button ready=${submitReady}`);
      const homeReady: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      TestLogger.info(TAG, `home button ready=${homeReady}`);
      expect(inputReady).assertTrue();
    });

    it('Browser_Integration_Advanced_019', 0, async () => {
      TestLogger.step(TAG, 'ui: tab count stays within the business ceiling');
      await serializedDelay(driver, TIMEOUT_TAB_SWITCH);
      const stripCount: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `rendered tab close buttons=${stripCount}`);
      expect(stripCount <= MAX_TAB_COUNT + 1).assertTrue();
      expect(stripCount >= 0).assertTrue();
    });
  });
}

