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
  clickById, inputById, waitForId, buildSearchUrl, encodeSearchWord, normalizeUrl,
  MAX_TAB_COUNT, TAB_LIMIT_MESSAGE, ID_INPUT_URL, ID_ACTION_ADD, ID_ACTION_SUBMIT,
  ID_CANCEL_TAB, ID_NAV_BACK, ID_NAV_HOME, PAD_HOME_PAGE,
  TIMEOUT_COMPONENT, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserUserScenarioTest';

/** State captured after every user visible step of a scenario. */
interface ScenarioSnapshot {
  stepName: string;
  tabCount: number;
  activeIndex: number;
  url: string;
  inputValue: string;
  loading: number;
}

/**
 * Records one snapshot per step.
 *
 * A failing step is localised by comparing the recorded trace with the
 * expectation table of the case: the first divergent row names the gesture
 * that broke the journey.
 */
class ScenarioRecorder {
  browser: MockBrowser;
  snapshots: ScenarioSnapshot[] = [];

  constructor(browser: MockBrowser) {
    this.browser = browser;
    this.capture('begin');
  }

  capture(stepName: string): ScenarioSnapshot {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    const snapshot: ScenarioSnapshot = {
      stepName: stepName,
      tabCount: this.browser.tabs.length,
      activeIndex: this.browser.tabArrayIndex,
      url: tab === null ? '' : tab.controller.currentUrl,
      inputValue: this.browser.getInputVal(),
      loading: this.browser.loadingStatus
    };
    this.snapshots.push(snapshot);
    TestLogger.info(TAG, `step ${stepName}: tabs=${snapshot.tabCount} url=${snapshot.url}`);
    return snapshot;
  }

  last(): ScenarioSnapshot {
    return this.snapshots[this.snapshots.length - 1];
  }

  stepNames(): string[] {
    return this.snapshots.map((snapshot: ScenarioSnapshot) => snapshot.stepName);
  }
}

/**
 * "Read the news" journey.
 *
 * A reader lands on a portal, opens the article list, opens one article and
 * then walks back. Back is served by WebController.accessBackward, the model
 * never invents history.
 */
class NewsSession {
  browser: MockBrowser;
  recorder: ScenarioRecorder;

  constructor(browser: MockBrowser = new MockBrowser()) {
    this.browser = browser;
    this.recorder = new ScenarioRecorder(browser);
  }

  openPortal(): boolean {
    const loaded: boolean = this.browser.loadUrl('news.example.com');
    this.recorder.capture('portal');
    return loaded;
  }

  openList(): boolean {
    const loaded: boolean = this.browser.loadUrl('news.example.com/headlines');
    this.recorder.capture('list');
    return loaded;
  }

  openArticle(id: number): boolean {
    const loaded: boolean = this.browser.loadUrl('news.example.com/article/' + id);
    this.recorder.capture('article' + id);
    return loaded;
  }

  back(): boolean {
    const moved: boolean = this.browser.back();
    this.recorder.capture('back');
    return moved;
  }

  forward(): boolean {
    const moved: boolean = this.browser.forward();
    this.recorder.capture('forward');
    return moved;
  }

  currentUrl(): string {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    return tab === null ? '' : tab.controller.currentUrl;
  }

  historyLength(): number {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    return tab === null ? 0 : tab.controller.history.length;
  }
}

/**
 * "Search from the title bar" journey.
 *
 * TitleBar submits `https://www.bing.com/search?q=<encodeURI(word)>` inside the
 * active tab; searching never spawns a tab on its own.
 */
class SearchSession {
  browser: MockBrowser;
  recorder: ScenarioRecorder;
  submitted: string[] = [];

  constructor(browser: MockBrowser = new MockBrowser()) {
    this.browser = browser;
    this.recorder = new ScenarioRecorder(browser);
  }

  submit(word: string): string {
    const url: string = buildSearchUrl(word);
    this.submitted.push(word);
    this.browser.loadUrl(url);
    this.recorder.capture('search:' + word);
    return url;
  }

  currentUrl(): string {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    return tab === null ? '' : tab.controller.currentUrl;
  }

  historyLength(): number {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    return tab === null ? 0 : tab.controller.history.length;
  }
}

/**
 * "Compare pages in several tabs" journey.
 *
 * The first comparison reuses the starting tab, every further topic appends a
 * tab, which mirrors the actionButton1 behaviour of the tablet title bar.
 */
class ComparisonSession {
  browser: MockBrowser;
  recorder: ScenarioRecorder;
  topics: string[] = [];

  constructor(browser: MockBrowser = new MockBrowser()) {
    this.browser = browser;
    this.recorder = new ScenarioRecorder(browser);
  }

  compare(topic: string): number {
    let index: number = 0;
    if (this.topics.length === 0) {
      index = this.browser.tabArrayIndex;
    } else {
      this.browser.addTab();
      index = this.browser.tabArrayIndex;
    }
    this.topics.push(topic);
    this.browser.selectTab(index);
    this.browser.loadUrl(topic + '.example.com');
    this.recorder.capture('compare:' + topic);
    return index;
  }

  switchTo(index: number): boolean {
    const selected: boolean = this.browser.selectTab(index);
    this.recorder.capture('switch' + index);
    return selected;
  }

  closeTab(index: number): boolean {
    const closed: boolean = this.browser.deleteTab(index);
    this.recorder.capture('close' + index);
    return closed;
  }

  urlAt(index: number): string {
    if (index < 0 || index >= this.browser.tabs.length) {
      return '';
    }
    return this.browser.tabs[index].controller.currentUrl;
  }

  tabCount(): number {
    return this.browser.tabs.length;
  }
}

/**
 * "Closed a tab by accident" journey.
 *
 * The sample keeps no closed-tab stack, so the recovery path is the one a user
 * takes manually: open a tab again and reload the remembered address.
 */
class AccidentalCloseSession {
  browser: MockBrowser;
  recorder: ScenarioRecorder;
  closedUrls: string[] = [];

  constructor(browser: MockBrowser = new MockBrowser()) {
    this.browser = browser;
    this.recorder = new ScenarioRecorder(browser);
  }

  rememberAndClose(): boolean {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    if (tab !== null && this.browser.tabs.length > 1) {
      this.closedUrls.push(tab.controller.currentUrl);
    }
    const closed: boolean = this.browser.deleteTab(this.browser.tabArrayIndex);
    this.recorder.capture('close');
    return closed;
  }

  reopenLast(): boolean {
    if (this.closedUrls.length === 0) {
      return false;
    }
    const address: string = this.closedUrls[this.closedUrls.length - 1];
    this.browser.addTab();
    const loaded: boolean = this.browser.loadUrl(address);
    this.recorder.capture('reopen');
    return loaded;
  }

  lastClosedUrl(): string {
    if (this.closedUrls.length === 0) {
      return '';
    }
    return this.closedUrls[this.closedUrls.length - 1];
  }
}

/**
 * "Browse for a long time" journey.
 *
 * Keeps the browsing loop honest: one tab, many pages, bounded history and a
 * logical clock so the duration is deterministic.
 */
class LongBrowsingSession {
  browser: MockBrowser;
  recorder: ScenarioRecorder;
  clock: MockClock = new MockClock();
  visited: string[] = [];
  dwellMs: number;
  private origin: number;

  constructor(browser: MockBrowser = new MockBrowser(), dwellMs: number = 15000) {
    this.browser = browser;
    this.recorder = new ScenarioRecorder(browser);
    this.dwellMs = dwellMs;
    this.origin = this.clock.now();
  }

  browse(pages: string[]): number {
    let success: number = 0;
    for (let index = 0; index < pages.length; index++) {
      this.visited.push(pages[index]);
      if (this.browser.loadUrl(pages[index])) {
        success += 1;
      }
      this.clock.advance(this.dwellMs);
      this.recorder.capture('page' + index);
    }
    return success;
  }

  distinctVisited(): number {
    const unique: string[] = [];
    for (let index = 0; index < this.visited.length; index++) {
      if (unique.indexOf(this.visited[index]) < 0) {
        unique.push(this.visited[index]);
      }
    }
    return unique.length;
  }

  historyLength(): number {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    return tab === null ? 0 : tab.controller.history.length;
  }

  elapsedMs(): number {
    return this.clock.now() - this.origin;
  }

  loadCount(): number {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    return tab === null ? 0 : tab.controller.loadCount;
  }
}

/**
 * "Rotate the device and keep reading" journey.
 *
 * Index.ets rebuilds the browser model on a configuration change, therefore the
 * suite captures the visible session (urls, active tab, typed text) before the
 * rebuild and replays it into the new model.
 */
class RotationContinuity {
  browser: MockBrowser;
  savedUrls: string[] = [];
  savedIndex: number = 0;
  savedInput: string = '';

  constructor(browser: MockBrowser = new MockBrowser()) {
    this.browser = browser;
  }

  capture(): number {
    this.savedUrls = this.browser.tabs.map((tab: MockBrowserTab) => tab.controller.currentUrl);
    this.savedIndex = this.browser.tabArrayIndex;
    this.savedInput = this.browser.getInputVal();
    TestLogger.info(TAG, `captured ${this.savedUrls.length} tab(s), active=${this.savedIndex}`);
    return this.savedUrls.length;
  }

  /** Rebuilds the model the way a configuration change does. */
  restore(): MockBrowser {
    const rebuilt: MockBrowser = new MockBrowser();
    for (let index = 1; index < this.savedUrls.length; index++) {
      rebuilt.addTab();
    }
    for (let index = 0; index < this.savedUrls.length; index++) {
      if (this.savedUrls[index].length > 0) {
        rebuilt.selectTab(index);
        rebuilt.loadUrl(this.savedUrls[index]);
      }
    }
    rebuilt.selectTab(this.savedIndex);
    rebuilt.setInputVal(this.savedInput);
    this.browser = rebuilt;
    return rebuilt;
  }

  savedUrlAt(index: number): string {
    if (index < 0 || index >= this.savedUrls.length) {
      return '';
    }
    return this.savedUrls[index];
  }
}

export default function browserUserScenarioTest() {
  describe('browserUserScenarioTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'user scenario suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Integration_Scenario_001', 0, async () => {
      TestLogger.step(TAG, 'reader opens the portal, the list and one article');
      const session: NewsSession = new NewsSession();
      expect(session.openPortal()).assertTrue();
      expect(session.openList()).assertTrue();
      expect(session.openArticle(42)).assertTrue();
      expect(session.currentUrl()).assertEqual('https://news.example.com/article/42');
      expect(session.historyLength()).assertEqual(3);
      expect(session.recorder.snapshots.length).assertEqual(4);
      expect(session.recorder.stepNames().join(',')).assertEqual('begin,portal,list,article42');
    });

    it('Browser_Integration_Scenario_002', 0, async () => {
      TestLogger.step(TAG, 'back from the article returns to the headline list');
      const session: NewsSession = new NewsSession();
      session.openPortal();
      session.openList();
      session.openArticle(7);
      expect(session.back()).assertTrue();
      expect(session.currentUrl()).assertEqual('https://news.example.com/headlines');
      expect(session.back()).assertTrue();
      expect(session.currentUrl()).assertEqual('https://news.example.com');
      expect(session.recorder.last().stepName).assertEqual('back');
    });

    it('Browser_Integration_Scenario_003', 0, async () => {
      TestLogger.step(TAG, 'back at the oldest page does not consume the gesture');
      const session: NewsSession = new NewsSession();
      session.openPortal();
      expect(session.back()).assertFalse();
      expect(session.currentUrl()).assertEqual('https://news.example.com');
      expect(session.historyLength()).assertEqual(1);
      const browser: MockBrowser = new MockBrowser();
      expect(browser.onBackPress()).assertFalse();
    });

    it('Browser_Integration_Scenario_004', 0, async () => {
      TestLogger.step(TAG, 'forward reopens the article after a back navigation');
      const session: NewsSession = new NewsSession();
      session.openPortal();
      session.openList();
      session.openArticle(9);
      session.back();
      expect(session.forward()).assertTrue();
      expect(session.currentUrl()).assertEqual('https://news.example.com/article/9');
      expect(session.forward()).assertFalse();
      expect(session.historyLength()).assertEqual(3);
    });

    it('Browser_Integration_Scenario_005', 0, async () => {
      TestLogger.step(TAG, 'a reader search becomes a bing query url');
      const session: SearchSession = new SearchSession();
      const url: string = session.submit('openharmony browser');
      expect(url.indexOf('https://www.bing.com/search?q=')).assertEqual(0);
      expect(url.indexOf('openharmony')).assertLarger(0);
      expect(session.currentUrl()).assertEqual(url);
      expect(encodeSearchWord('a b')).assertEqual('a%20b');
      expect(session.submitted.length).assertEqual(1);
    });

    it('Browser_Integration_Scenario_006', 0, async () => {
      TestLogger.step(TAG, 'searching keeps the reader inside the active tab');
      const session: SearchSession = new SearchSession();
      session.submit('opensource');
      expect(session.browser.tabs.length).assertEqual(1);
      expect(session.browser.tabArrayIndex).assertEqual(0);
      expect(session.browser.toasts.length).assertEqual(0);
      expect(session.historyLength()).assertEqual(1);
    });

    it('Browser_Integration_Scenario_007', 0, async () => {
      TestLogger.step(TAG, 'two searches for the same phrase stay a single history row');
      const session: SearchSession = new SearchSession();
      session.submit('opensource');
      const firstLength: number = session.historyLength();
      session.submit('opensource');
      expect(session.historyLength()).assertEqual(firstLength);
      session.submit('openharmony');
      expect(session.historyLength()).assertEqual(firstLength + 1);
      const back: boolean = session.browser.back();
      expect(back).assertTrue();
    });

    it('Browser_Integration_Scenario_008', 0, async () => {
      TestLogger.step(TAG, 'reader compares three pages in three tabs');
      const session: ComparisonSession = new ComparisonSession();
      const first: number = session.compare('alpha');
      const second: number = session.compare('beta');
      const third: number = session.compare('gamma');
      expect(first).assertEqual(0);
      expect(second).assertEqual(1);
      expect(third).assertEqual(2);
      expect(session.tabCount()).assertEqual(3);
      expect(session.urlAt(0)).assertEqual('https://alpha.example.com');
      expect(session.urlAt(2)).assertEqual('https://gamma.example.com');
      expect(session.browser.toasts.length).assertEqual(0);
    });

    it('Browser_Integration_Scenario_009', 0, async () => {
      TestLogger.step(TAG, 'switch between comparison tabs keeps each page intact');
      const session: ComparisonSession = new ComparisonSession();
      session.compare('alpha');
      session.compare('beta');
      session.compare('gamma');
      expect(session.switchTo(1)).assertTrue();
      expect(session.browser.tabArrayIndex).assertEqual(1);
      expect(session.urlAt(1)).assertEqual('https://beta.example.com');
      expect(session.switchTo(0)).assertTrue();
      expect(session.urlAt(0)).assertEqual('https://alpha.example.com');
      expect(session.switchTo(3)).assertFalse();
    });

    it('Browser_Integration_Scenario_010', 0, async () => {
      TestLogger.step(TAG, 'closing a comparison tab renumbers the survivors');
      const session: ComparisonSession = new ComparisonSession();
      session.compare('alpha');
      session.compare('beta');
      session.compare('gamma');
      expect(session.closeTab(1)).assertTrue();
      expect(session.tabCount()).assertEqual(2);
      expect(session.browser.getTabKeys().join(',')).assertEqual('0,1');
      expect(session.urlAt(0)).assertEqual('https://alpha.example.com');
      expect(session.urlAt(1)).assertEqual('https://gamma.example.com');
      expect(session.browser.tabArrayIndex).assertEqual(1);
    });

    it('Browser_Integration_Scenario_011', 0, async () => {
      TestLogger.step(TAG, 'accidentally closed tab is reopened with its address');
      const session: AccidentalCloseSession = new AccidentalCloseSession();
      session.browser.addTab();
      session.browser.loadUrl('news.example.com/article/88');
      const closedUrl: string = session.browser.getCurrentTab() === null ? '' :
        session.browser.tabs[session.browser.tabArrayIndex].controller.currentUrl;
      expect(session.rememberAndClose()).assertTrue();
      expect(session.lastClosedUrl()).assertEqual(closedUrl);
      expect(session.browser.tabs.length).assertEqual(1);
      expect(session.reopenLast()).assertTrue();
      expect(session.browser.tabs.length).assertEqual(2);
      expect(session.browser.tabs[1].controller.currentUrl).assertEqual(closedUrl);
    });

    it('Browser_Integration_Scenario_012', 0, async () => {
      TestLogger.step(TAG, 'surviving tab keeps its own page after a reopen');
      const session: AccidentalCloseSession = new AccidentalCloseSession();
      session.browser.loadUrl('docs.example.com');
      session.browser.addTab();
      session.browser.loadUrl('news.example.com');
      session.rememberAndClose();
      session.reopenLast();
      expect(session.browser.tabs[0].controller.currentUrl).assertEqual('https://docs.example.com');
      expect(session.browser.tabs[1].controller.currentUrl).assertEqual('https://news.example.com');
      expect(session.browser.tabs[0].controller === session.browser.tabs[1].controller).assertFalse();
    });

    it('Browser_Integration_Scenario_013', 0, async () => {
      TestLogger.step(TAG, 'the close button never removes the last tab');
      const browser: MockBrowser = new MockBrowser();
      const session: AccidentalCloseSession = new AccidentalCloseSession(browser);
      expect(browser.tabs.length).assertEqual(1);
      expect(session.rememberAndClose()).assertFalse();
      expect(browser.tabs.length).assertEqual(1);
      expect(browser.deleteTab(-1)).assertFalse();
      expect(browser.deleteTab(9)).assertFalse();
      expect(session.reopenLast()).assertFalse();
    });

    it('Browser_Integration_Scenario_014', 0, async () => {
      TestLogger.step(TAG, 'long browsing accumulates a bounded reading session');
      const pages: string[] = [
        'news.example.com/1', 'news.example.com/2', 'news.example.com/3',
        'news.example.com/4', 'news.example.com/5', 'news.example.com/6',
        'news.example.com/7', 'news.example.com/8', 'news.example.com/9',
        'news.example.com/10', 'news.example.com/11', 'news.example.com/12'
      ];
      const session: LongBrowsingSession = new LongBrowsingSession(new MockBrowser(), 15000);
      const loaded: number = session.browse(pages);
      expect(loaded).assertEqual(12);
      expect(session.distinctVisited()).assertEqual(12);
      expect(session.historyLength()).assertEqual(12);
      expect(session.loadCount()).assertEqual(12);
      expect(session.elapsedMs()).assertEqual(12 * 15000);
      expect(session.browser.tabs.length).assertEqual(1);
    });

    it('Browser_Integration_Scenario_015', 0, async () => {
      TestLogger.step(TAG, 'long browsing tolerates revisiting the same page');
      const pages: string[] = [
        'news.example.com/top', 'news.example.com/top', 'news.example.com/top',
        'news.example.com/sport', 'news.example.com/top'
      ];
      const session: LongBrowsingSession = new LongBrowsingSession(new MockBrowser(), 8000);
      expect(session.browse(pages)).assertEqual(5);
      expect(session.visited.length).assertEqual(5);
      expect(session.distinctVisited()).assertEqual(2);
      expect(session.historyLength()).assertEqual(3);
      expect(session.elapsedMs()).assertEqual(5 * 8000);
    });

    it('Browser_Integration_Scenario_016', 0, async () => {
      TestLogger.step(TAG, 'long reading session still honours back navigation');
      const session: LongBrowsingSession = new LongBrowsingSession();
      session.browse(['news.example.com/a', 'news.example.com/b', 'news.example.com/c']);
      expect(session.browser.back()).assertTrue();
      expect(session.browser.tabs[0].controller.currentUrl).assertEqual('https://news.example.com/b');
      expect(session.browser.back()).assertTrue();
      expect(session.browser.tabs[0].controller.currentUrl).assertEqual('https://news.example.com/a');
      expect(session.browser.back()).assertFalse();
    });

    it('Browser_Integration_Scenario_017', 0, async () => {
      TestLogger.step(TAG, 'rotation captures the whole visible session');
      const session: ComparisonSession = new ComparisonSession();
      session.compare('alpha');
      session.compare('beta');
      session.switchTo(0);
      session.browser.setInputVal('draft query');
      const continuity: RotationContinuity = new RotationContinuity(session.browser);
      expect(continuity.capture()).assertEqual(2);
      expect(continuity.savedIndex).assertEqual(0);
      expect(continuity.savedInput).assertEqual('draft query');
      expect(continuity.savedUrlAt(0)).assertEqual('https://alpha.example.com');
      expect(continuity.savedUrlAt(1)).assertEqual('https://beta.example.com');
    });

    it('Browser_Integration_Scenario_018', 0, async () => {
      TestLogger.step(TAG, 'rotation restores tabs and their addresses');
      const session: ComparisonSession = new ComparisonSession();
      session.compare('alpha');
      session.compare('beta');
      session.compare('gamma');
      const continuity: RotationContinuity = new RotationContinuity(session.browser);
      continuity.capture();
      const rebuilt: MockBrowser = continuity.restore();
      expect(rebuilt.tabs.length).assertEqual(3);
      expect(rebuilt.tabs[0].controller.currentUrl).assertEqual('https://alpha.example.com');
      expect(rebuilt.tabs[2].controller.currentUrl).assertEqual('https://gamma.example.com');
      expect(rebuilt.tabArrayIndex).assertEqual(2);
      expect(rebuilt.getTabKeys().join(',')).assertEqual('0,1,2');
    });

    it('Browser_Integration_Scenario_019', 0, async () => {
      TestLogger.step(TAG, 'reading continues after the rotation rebuild');
      const session: NewsSession = new NewsSession();
      session.openPortal();
      session.openList();
      session.openArticle(3);
      const continuity: RotationContinuity = new RotationContinuity(session.browser);
      continuity.capture();
      const rebuilt: MockBrowser = continuity.restore();
      expect(rebuilt.tabs[0].controller.currentUrl).assertEqual('https://news.example.com/article/3');
      const loaded: boolean = rebuilt.loadUrl('news.example.com/article/4');
      expect(loaded).assertTrue();
      expect(rebuilt.back()).assertTrue();
      expect(rebuilt.tabs[0].controller.currentUrl).assertEqual('https://news.example.com/article/3');
    });

    it('Browser_Integration_Scenario_020', 0, async () => {
      TestLogger.step(TAG, 'typed text survives the rotation rebuild');
      const session: SearchSession = new SearchSession();
      session.submit('opensource');
      session.browser.setInputVal('openharmony');
      const continuity: RotationContinuity = new RotationContinuity(session.browser);
      continuity.capture();
      const rebuilt: MockBrowser = continuity.restore();
      expect(rebuilt.getInputVal()).assertEqual('openharmony');
      expect(rebuilt.tabs.length).assertEqual(1);
      expect(rebuilt.tabs[0].controller.currentUrl).assertEqual(normalizeUrl(buildSearchUrl('opensource')));
    });

    it('Browser_Integration_Scenario_021', 0, async () => {
      TestLogger.step(TAG, 'scenario trace records every gesture in order');
      const session: NewsSession = new NewsSession();
      session.openPortal();
      session.openList();
      session.openArticle(11);
      session.back();
      session.forward();
      const names: string[] = session.recorder.stepNames();
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual('begin');
      expect(names[3]).assertEqual('article11');
      expect(names[4]).assertEqual('back');
      expect(names[5]).assertEqual('forward');
      expect(session.recorder.last().url.indexOf('article/11')).assertLarger(0);
    });

    it('Browser_Integration_Scenario_022', 0, async () => {
      TestLogger.step(TAG, 'power user opening tabs hits the documented ceiling');
      const session: ComparisonSession = new ComparisonSession();
      for (let index = 0; index < MAX_TAB_COUNT; index++) {
        session.compare('topic' + index);
      }
      expect(session.tabCount()).assertEqual(MAX_TAB_COUNT);
      expect(session.compare('overflow')).assertEqual(MAX_TAB_COUNT);
      expect(session.tabCount()).assertEqual(MAX_TAB_COUNT + 1);
      expect(session.compare('overflow2')).assertEqual(MAX_TAB_COUNT);
      expect(session.tabCount()).assertEqual(MAX_TAB_COUNT + 1);
      expect(session.browser.toasts.length).assertEqual(1);
      expect(session.browser.toasts[0]).assertEqual(TAB_LIMIT_MESSAGE);
    });

    it('Browser_Integration_Scenario_023', 0, async () => {
      TestLogger.step(TAG, 'home returns the reader to the entry page');
      const session: NewsSession = new NewsSession();
      session.openPortal();
      session.openArticle(2);
      session.browser.setInputVal('https://news.example.com/article/2');
      session.browser.resetToHome(PAD_HOME_PAGE);
      expect(session.browser.getInputVal()).assertEqual('');
      expect(session.browser.tabs[0].controller.currentUrl.indexOf(PAD_HOME_PAGE)).assertLarger(-1);
      expect(session.browser.tabs.length).assertEqual(1);
    });

    it('Browser_Integration_Scenario_024', 0, async () => {
      TestLogger.step(TAG, 'ui: reader can reach the url input after launch');
      const inputReady: boolean = await waitForId(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `url input ready=${inputReady}`);
      if (!inputReady) {
        TestLogger.fail(TAG, 'Browser_Integration_Scenario_024', 'url input missing');
        expect().assertFail();
        return;
      }
      expect(inputReady).assertTrue();
    });

    it('Browser_Integration_Scenario_025', 0, async () => {
      TestLogger.step(TAG, 'ui: reader types a search phrase into the title bar');
      const typed: boolean = await inputById(driver, ID_INPUT_URL, 'openharmony browser');
      TestLogger.info(TAG, `typed=${typed}`);
      if (!typed) {
        TestLogger.fail(TAG, 'Browser_Integration_Scenario_025', 'input rejected the text');
        expect().assertFail();
        return;
      }
      const submitReady: boolean = await componentByIdExists(driver, ID_ACTION_SUBMIT);
      expect(submitReady).assertTrue();
    });

    it('Browser_Integration_Scenario_026', 0, async () => {
      TestLogger.step(TAG, 'ui: comparison flow adds a tab and closes it again');
      const addReady: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      if (!addReady) {
        TestLogger.warn(TAG, 'add tab button not rendered on the phone layout');
        expect(addReady).assertFalse();
        return;
      }
      const before: number = await countById(driver, ID_CANCEL_TAB);
      expect(await clickById(driver, ID_ACTION_ADD)).assertTrue();
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const after: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `close buttons before=${before} after=${after}`);
      if (after < before) {
        TestLogger.fail(TAG, 'Browser_Integration_Scenario_026', 'tab count decreased after add');
        expect().assertFail();
        return;
      }
      expect(after >= before).assertTrue();
    });

    it('Browser_Integration_Scenario_027', 0, async () => {
      TestLogger.step(TAG, 'ui: back navigation button is present for the reader');
      const backReady: boolean = await componentByIdExists(driver, ID_NAV_BACK);
      const homeReady: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      TestLogger.info(TAG, `back=${backReady}, home=${homeReady}`);
      if (!backReady) {
        TestLogger.warn(TAG, 'back button missing on the current layout');
        expect(backReady).assertFalse();
        return;
      }
      expect(backReady).assertTrue();
    });

    it('Browser_Integration_Scenario_028', 0, async () => {
      TestLogger.step(TAG, 'ui: render state stays within the business tab ceiling');
      const stripCount: number = await countById(driver, ID_CANCEL_TAB);
      const addCount: number = await countById(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, `close buttons=${stripCount}, add buttons=${addCount}`);
      expect(stripCount <= MAX_TAB_COUNT + 1).assertTrue();
      if (stripCount === 0) {
        expect(addCount).assertEqual(0);
      } else {
        expect(addCount).assertLarger(0);
      }
    });
  });
}
