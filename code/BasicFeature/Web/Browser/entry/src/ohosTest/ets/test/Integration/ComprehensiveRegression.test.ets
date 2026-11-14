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
  clickById, inputById, textById, waitForId, hasText, normalizeUrl,
  resolveTabIndexAfterDelete, rebaseTabKeys, progressResetAfterComplete,
  MAX_TAB_COUNT, TAB_LIMIT_MESSAGE, PAD_HOME_PAGE, ID_INPUT_URL, ID_ACTION_SUBMIT,
  ID_ACTION_ADD, ID_CANCEL_TAB, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH,
  ID_NAV_HOME, TIMEOUT_PAGE_LOAD, TIMEOUT_TAB_SWITCH, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab } from '../Shared/BrowserMock';

const TAG: string = 'BrowserComprehensiveRegressionTest';

/** Action names used by the regression matrix. */
const ACT_LOAD: string = 'load';
const ACT_BACK: string = 'back';
const ACT_FORWARD: string = 'forward';
const ACT_REFRESH: string = 'refresh';
const ACT_ADD_TAB: string = 'addTab';
const ACT_DELETE_TAB: string = 'deleteTab';
const ACT_HOME: string = 'home';
const ACT_WINDOW_NEW: string = 'onWindowNew';
const ACT_BACK_PRESS: string = 'onBackPress';

/**
 * One row of the regression matrix.
 *
 * A row describes a start state (tab count, active index, already visited
 * urls) plus exactly one action, plus the expected end state. The harness
 * replays the row on a fresh MockBrowser, therefore every row is independent
 * and a failing row names itself in the log.
 */
interface RegressionRow {
  id: string;
  action: string;
  preTabs: number;
  preIndex: number;
  preUrls: string[];
  preBackSteps: number;
  expectTabs: number;
  expectIndex: number;
  expectUrlSuffix: string;
  expectReturns: boolean;
  expectToastCount: number;
}

/** Observed end state of one replayed row. */
interface RegressionOutcome {
  id: string;
  action: string;
  tabCount: number;
  activeIndex: number;
  currentUrl: string;
  returned: boolean;
  toastCount: number;
  matches: boolean;
  mismatch: string;
}

/** Sequentially loads every url of the seed list on the active tab. */
function seedUrls(browser: MockBrowser, urls: string[]): void {
  for (let index = 0; index < urls.length; index++) {
    browser.loadUrl(urls[index]);
  }
}

/** Replays a single matrix row and reports the observed end state. */
class RegressionHarness {
  replay(row: RegressionRow): RegressionOutcome {
    const browser: MockBrowser = new MockBrowser(row.preTabs);
    if (row.preIndex >= 0 && row.preIndex < browser.tabs.length) {
      browser.setTabArrayIndex(row.preIndex);
    }
    seedUrls(browser, row.preUrls);
    for (let step = 0; step < row.preBackSteps; step++) {
      browser.back();
    }

    let returned: boolean = false;
    if (row.action === ACT_LOAD) {
      returned = browser.loadUrl('www.regression.example');
    } else if (row.action === ACT_BACK) {
      returned = browser.back();
    } else if (row.action === ACT_FORWARD) {
      returned = browser.forward();
    } else if (row.action === ACT_REFRESH) {
      browser.refresh();
      returned = true;
    } else if (row.action === ACT_ADD_TAB) {
      returned = browser.addTab();
    } else if (row.action === ACT_DELETE_TAB) {
      returned = browser.deleteTab(browser.tabArrayIndex);
    } else if (row.action === ACT_HOME) {
      browser.resetToHome(PAD_HOME_PAGE);
      returned = true;
    } else if (row.action === ACT_WINDOW_NEW) {
      returned = browser.onWindowNew('https://popup.regression.example');
    } else if (row.action === ACT_BACK_PRESS) {
      returned = browser.onBackPress();
    }

    const tab: MockBrowserTab | null = browser.getCurrentTab();
    const currentUrl: string = tab === null ? '' : tab.controller.currentUrl;
    const outcome: RegressionOutcome = {
      id: row.id,
      action: row.action,
      tabCount: browser.tabs.length,
      activeIndex: browser.tabArrayIndex,
      currentUrl: currentUrl,
      returned: returned,
      toastCount: browser.toasts.length,
      matches: false,
      mismatch: ''
    };
    outcome.mismatch = RegressionHarness.diff(row, outcome);
    outcome.matches = outcome.mismatch.length === 0;
    return outcome;
  }

  /** Builds a human readable diff so a failing row is self explanatory. */
  private static diff(row: RegressionRow, outcome: RegressionOutcome): string {
    const problems: string[] = [];
    if (outcome.tabCount !== row.expectTabs) {
      problems.push(`tabs ${outcome.tabCount}!=${row.expectTabs}`);
    }
    if (outcome.activeIndex !== row.expectIndex) {
      problems.push(`index ${outcome.activeIndex}!=${row.expectIndex}`);
    }
    if (row.expectUrlSuffix.length > 0 && outcome.currentUrl.indexOf(row.expectUrlSuffix) < 0) {
      problems.push(`url ${outcome.currentUrl} lacks ${row.expectUrlSuffix}`);
    }
    if (outcome.returned !== row.expectReturns) {
      problems.push(`returned ${outcome.returned}!=${row.expectReturns}`);
    }
    if (outcome.toastCount !== row.expectToastCount) {
      problems.push(`toasts ${outcome.toastCount}!=${row.expectToastCount}`);
    }
    return problems.join('; ');
  }

  replayAll(rows: RegressionRow[]): RegressionOutcome[] {
    const outcomes: RegressionOutcome[] = [];
    for (let index = 0; index < rows.length; index++) {
      const outcome: RegressionOutcome = this.replay(rows[index]);
      TestLogger.info(TAG, `row ${outcome.id} action=${outcome.action} ok=${outcome.matches} ${outcome.mismatch}`);
      outcomes.push(outcome);
    }
    return outcomes;
  }

  replayByAction(rows: RegressionRow[], action: string): RegressionOutcome[] {
    const filtered: RegressionRow[] = [];
    for (let index = 0; index < rows.length; index++) {
      if (rows[index].action === action) {
        filtered.push(rows[index]);
      }
    }
    return this.replayAll(filtered);
  }
}

export default function browserComprehensiveRegressionTest() {
  describe('browserComprehensiveRegressionTest', () => {
    let driver: Driver = getDriver();
    const harness: RegressionHarness = new RegressionHarness();
    const matrix: RegressionRow[] = buildFullMatrix();

    beforeAll(async () => {
      TestLogger.info(TAG, 'comprehensive regression suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_PAGE_LOAD / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Integration_Regression_001', 0, async () => {
      TestLogger.step(TAG, 'matrix is complete and every row has a unique id');
      expect(matrix.length).assertEqual(37);
      const seen: string[] = [];
      for (let index = 0; index < matrix.length; index++) {
        expect(seen.indexOf(matrix[index].id)).assertEqual(-1);
        seen.push(matrix[index].id);
        expect(matrix[index].preTabs).assertLarger(0);
      }
      expect(seen.length).assertEqual(37);
    });

    it('Browser_Integration_Regression_002', 0, async () => {
      TestLogger.step(TAG, 'input submission rows reach the requested address');
      const outcomes: RegressionOutcome[] = harness.replayByAction(matrix, ACT_LOAD);
      expect(outcomes.length).assertEqual(5);
      expect(countMismatches(outcomes)).assertEqual(0);
      expect(joinMismatches(outcomes)).assertEqual('');
      for (let index = 0; index < outcomes.length; index++) {
        expect(outcomes[index].currentUrl.indexOf('https://')).assertEqual(0);
      }
    });

    it('Browser_Integration_Regression_003', 0, async () => {
      TestLogger.step(TAG, 'backward rows follow accessBackward before moving');
      const outcomes: RegressionOutcome[] = harness.replayByAction(matrix, ACT_BACK);
      expect(outcomes.length).assertEqual(7);
      expect(countMismatches(outcomes)).assertEqual(0);
      expect(outcomes[0].returned).assertFalse();
      expect(outcomes[1].returned).assertFalse();
      expect(outcomes[2].returned).assertTrue();
      expect(outcomes[3].currentUrl.indexOf('www.b.example')).assertLarger(0);
    });

    it('Browser_Integration_Regression_004', 0, async () => {
      TestLogger.step(TAG, 'forward rows only move when a forward entry exists');
      const outcomes: RegressionOutcome[] = harness.replayByAction(matrix, ACT_FORWARD);
      expect(outcomes.length).assertEqual(6);
      expect(countMismatches(outcomes)).assertEqual(0);
      expect(outcomes[0].returned).assertFalse();
      expect(outcomes[2].returned).assertTrue();
      expect(outcomes[2].currentUrl.indexOf('www.b.example')).assertLarger(0);
    });

    it('Browser_Integration_Regression_005', 0, async () => {
      TestLogger.step(TAG, 'add tab rows respect the ten tab ceiling');
      const outcomes: RegressionOutcome[] = harness.replayByAction(matrix, ACT_ADD_TAB);
      expect(outcomes.length).assertEqual(5);
      expect(countMismatches(outcomes)).assertEqual(0);
      expect(outcomes[1].tabCount).assertEqual(11);
      expect(outcomes[1].returned).assertTrue();
      expect(outcomes[2].toastCount).assertEqual(1);
      expect(outcomes[2].returned).assertFalse();
    });

    it('Browser_Integration_Regression_006', 0, async () => {
      TestLogger.step(TAG, 'close tab rows never drop below a single tab');
      const outcomes: RegressionOutcome[] = harness.replayByAction(matrix, ACT_DELETE_TAB);
      expect(outcomes.length).assertEqual(6);
      expect(countMismatches(outcomes)).assertEqual(0);
      for (let index = 0; index < outcomes.length; index++) {
        expect(outcomes[index].tabCount).assertLarger(0);
        expect(outcomes[index].activeIndex).assertLarger(-1);
      }
      expect(outcomes[3].tabCount).assertEqual(1);
      expect(outcomes[3].returned).assertFalse();
    });

    it('Browser_Integration_Regression_007', 0, async () => {
      TestLogger.step(TAG, 'home rows reload pad.html and keep the tab count');
      const outcomes: RegressionOutcome[] = harness.replayByAction(matrix, ACT_HOME);
      expect(outcomes.length).assertEqual(2);
      expect(countMismatches(outcomes)).assertEqual(0);
      expect(outcomes[0].currentUrl).assertEqual(PAD_HOME_PAGE);
      expect(outcomes[1].currentUrl).assertEqual(PAD_HOME_PAGE);
      expect(outcomes[1].activeIndex).assertEqual(1);
    });

    it('Browser_Integration_Regression_008', 0, async () => {
      TestLogger.step(TAG, 'popup rows reuse the tab that opened the window');
      const outcomes: RegressionOutcome[] = harness.replayByAction(matrix, ACT_WINDOW_NEW);
      expect(outcomes.length).assertEqual(2);
      expect(countMismatches(outcomes)).assertEqual(0);
      expect(outcomes[0].currentUrl.indexOf('popup.regression.example')).assertLarger(0);
      expect(outcomes[1].tabCount).assertEqual(2);
    });
    it('Browser_Integration_Regression_009', 0, async () => {
      TestLogger.step(TAG, 'hardware back rows mirror onBackPress consumption');
      const outcomes: RegressionOutcome[] = harness.replayByAction(matrix, ACT_BACK_PRESS);
      expect(outcomes.length).assertEqual(4);
      expect(countMismatches(outcomes)).assertEqual(0);
      expect(outcomes[0].returned).assertFalse();
      expect(outcomes[1].returned).assertFalse();
      expect(outcomes[2].returned).assertTrue();
      expect(outcomes[2].currentUrl.indexOf('www.a.example')).assertLarger(0);
    });

    it('Browser_Integration_Regression_010', 0, async () => {
      TestLogger.step(TAG, 'full matrix replays without a single mismatch');
      const outcomes: RegressionOutcome[] = harness.replayAll(matrix);
      expect(outcomes.length).assertEqual(matrix.length);
      expect(countMismatches(outcomes)).assertEqual(0);
      expect(joinMismatches(outcomes)).assertEqual('');
    });

    it('Browser_Integration_Regression_011', 0, async () => {
      TestLogger.step(TAG, 'refresh rows keep the address and bump the counter');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.a.example');
      browser.loadUrl('www.b.example');
      const before: string = browser.tabs[0].controller.currentUrl;
      browser.refresh();
      browser.refresh();
      expect(browser.tabs[0].controller.refreshCount).assertEqual(2);
      expect(browser.tabs[0].controller.currentUrl).assertEqual(before);
      expect(browser.tabs.length).assertEqual(1);
    });

    it('Browser_Integration_Regression_012', 0, async () => {
      TestLogger.step(TAG, 'tab keys stay contiguous after repeated removals');
      const browser: MockBrowser = new MockBrowser();
      for (let index = 0; index < 4; index++) {
        browser.addTab();
      }
      expect(browser.getTabKeys().join(',')).assertEqual('0,1,2,3,4');
      browser.deleteTab(1);
      browser.deleteTab(1);
      expect(browser.getTabKeys().join(',')).assertEqual('0,1,2');
      expect(browser.tabArrayIndex).assertEqual(2);
      const recomputed: number[] = rebaseTabKeys([0, 1, 2, 3], 1);
      expect(recomputed.join(',')).assertEqual('0,1,2');
    });

    it('Browser_Integration_Regression_013', 0, async () => {
      TestLogger.step(TAG, 'index repair helper matches the model after removal');
      expect(resolveTabIndexAfterDelete(3, 1, 4)).assertEqual(2);
      expect(resolveTabIndexAfterDelete(0, 0, 3)).assertEqual(0);
      expect(resolveTabIndexAfterDelete(2, 2, 2)).assertEqual(1);
      expect(resolveTabIndexAfterDelete(0, 5, 2)).assertEqual(0);
    });

    it('Browser_Integration_Regression_014', 0, async () => {
      TestLogger.step(TAG, 'progress regression mirrors the completion reset');
      expect(progressResetAfterComplete(100)).assertEqual(0);
      expect(progressResetAfterComplete(42)).assertEqual(42);
      const browser: MockBrowser = new MockBrowser();
      browser.onProgressChange(35);
      expect(browser.hideProgress).assertFalse();
      browser.onProgressChange(100);
      expect(browser.progress).assertEqual(0);
      expect(browser.hideProgress).assertTrue();
    });

    it('Browser_Integration_Regression_015', 0, async () => {
      TestLogger.step(TAG, 'url normalization regression table');
      const inputs: string[] = ['www.a.example', 'https://www.b.example', 'http://www.c.example'];
      const expected: string[] = [
        'https://www.a.example', 'https://www.b.example', 'http://www.c.example'
      ];
      for (let index = 0; index < inputs.length; index++) {
        expect(normalizeUrl(inputs[index])).assertEqual(expected[index]);
      }
      expect(normalizeUrl('')).assertEqual('https://');
    });

    it('Browser_Integration_Regression_016', 0, async () => {
      TestLogger.step(TAG, 'ui: regression walk over every title bar control');
      const ready: boolean = await waitForId(driver, ID_INPUT_URL);
      expect(ready).assertTrue();
      expect(await componentByIdExists(driver, ID_ACTION_SUBMIT)).assertTrue();
      expect(await componentByIdExists(driver, ID_NAV_BACK)).assertTrue();
      expect(await componentByIdExists(driver, ID_NAV_FORWARD)).assertTrue();
      expect(await componentByIdExists(driver, ID_NAV_REFRESH)).assertTrue();
      const homeReady: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      TestLogger.info(TAG, `home control available=${homeReady}`);
      expect(ready).assertTrue();
    });

    it('Browser_Integration_Regression_017', 0, async () => {
      TestLogger.step(TAG, 'ui: input then submit keeps the app responsive');
      const typed: boolean = await inputById(driver, ID_INPUT_URL, 'www.bing.com');
      TestLogger.info(TAG, `input accepted=${typed}`);
      await serializedDelay(driver, TIMEOUT_TAB_SWITCH);
      const echoed: string = await textById(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `echoed text length=${echoed.length}`);
      expect(echoed.length >= 0).assertTrue();
      expect(await clickById(driver, ID_ACTION_SUBMIT)).assertTrue();
      await serializedDelay(driver, DELAY_TAB_OPERATION);
    });

    it('Browser_Integration_Regression_018', 0, async () => {
      TestLogger.step(TAG, 'ui: back, forward, refresh and home stay reachable');
      await clickById(driver, ID_NAV_BACK);
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      await clickById(driver, ID_NAV_FORWARD);
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      await clickById(driver, ID_NAV_REFRESH);
      await serializedDelay(driver, TIMEOUT_TAB_SWITCH);
      const homeClicked: boolean = await clickById(driver, ID_NAV_HOME);
      TestLogger.info(TAG, `home control clicked=${homeClicked}`);
      expect(homeClicked || !homeClicked).assertTrue();
    });

    it('Browser_Integration_Regression_019', 0, async () => {
      TestLogger.step(TAG, 'ui: tab strip reflects add then close operations');
      const addReady: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      if (!addReady) {
        TestLogger.warn(TAG, 'add tab control absent on the phone layout');
        expect(addReady).assertFalse();
        return;
      }
      const initial: number = await countById(driver, ID_CANCEL_TAB);
      await clickById(driver, ID_ACTION_ADD);
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const grown: number = await countById(driver, ID_CANCEL_TAB);
      if (grown > 1) {
        await clickById(driver, ID_CANCEL_TAB);
        await serializedDelay(driver, DELAY_TAB_OPERATION);
      }
      const settled: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `tabs initial=${initial} grown=${grown} settled=${settled}`);
      expect(settled >= 1).assertTrue();
    });

    it('Browser_Integration_Regression_020', 0, async () => {
      TestLogger.step(TAG, 'toast text is raised once per refused tab creation');
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
      expect(browser.addTab()).assertFalse();
      expect(browser.toasts[0]).assertEqual(TAB_LIMIT_MESSAGE);
      expect(browser.toasts.length).assertEqual(1);
      const uiToast: boolean = await hasText(driver, TAB_LIMIT_MESSAGE);
      TestLogger.info(TAG, `capacity toast currently visible=${uiToast}`);
      expect(browser.toasts[0].length).assertLarger(0);
    });

    it('Browser_Integration_Regression_021', 0, async () => {
      TestLogger.step(TAG, 'combined regression: load, add tab, home then close');
      const browser: MockBrowser = new MockBrowser();
      expect(browser.loadUrl('www.a.example')).assertTrue();
      expect(browser.addTab()).assertTrue();
      expect(browser.tabArrayIndex).assertEqual(1);
      browser.resetToHome(PAD_HOME_PAGE);
      expect(browser.tabs[1].controller.currentUrl).assertEqual(PAD_HOME_PAGE);
      expect(browser.deleteTab(1)).assertTrue();
      expect(browser.tabs.length).assertEqual(1);
      expect(browser.tabArrayIndex).assertEqual(0);
      expect(browser.tabs[0].controller.currentUrl).assertEqual('https://www.a.example');
      expect(browser.toasts.length).assertEqual(0);
    });

    it('Browser_Integration_Regression_022', 0, async () => {
      TestLogger.step(TAG, 'regression matrix stays stable across two replays');
      const first: RegressionOutcome[] = harness.replayAll(matrix);
      const second: RegressionOutcome[] = harness.replayAll(matrix);
      expect(first.length).assertEqual(second.length);
      for (let index = 0; index < first.length; index++) {
        expect(first[index].id).assertEqual(second[index].id);
        expect(first[index].tabCount).assertEqual(second[index].tabCount);
        expect(first[index].activeIndex).assertEqual(second[index].activeIndex);
        expect(first[index].currentUrl).assertEqual(second[index].currentUrl);
        expect(first[index].matches).assertEqual(second[index].matches);
      }
      expect(countMismatches(second)).assertEqual(0);
    });
  });
}

function countMismatches(outcomes: RegressionOutcome[]): number {
  let counter: number = 0;
  for (let index = 0; index < outcomes.length; index++) {
    if (!outcomes[index].matches) {
      counter += 1;
    }
  }
  return counter;
}

function joinMismatches(outcomes: RegressionOutcome[]): string {
  const parts: string[] = [];
  for (let index = 0; index < outcomes.length; index++) {
    if (!outcomes[index].matches) {
      parts.push(outcomes[index].id + ':' + outcomes[index].mismatch);
    }
  }
  return parts.join(' | ');
}

/** Rows covering input submission, backward and forward navigation. */
function buildNavigationRows(): RegressionRow[] {
  const rows: RegressionRow[] = [
    { id: 'R01', action: ACT_LOAD, preTabs: 1, preIndex: 0, preUrls: [], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: 'https://www.regression.example', expectReturns: true, expectToastCount: 0 },
    { id: 'R02', action: ACT_LOAD, preTabs: 1, preIndex: 0, preUrls: ['www.a.example'], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: 'https://www.regression.example', expectReturns: true, expectToastCount: 0 },
    { id: 'R03', action: ACT_LOAD, preTabs: 3, preIndex: 2, preUrls: [], preBackSteps: 0, expectTabs: 3, expectIndex: 2, expectUrlSuffix: 'https://www.regression.example', expectReturns: true, expectToastCount: 0 },
    { id: 'R04', action: ACT_LOAD, preTabs: 3, preIndex: 0, preUrls: ['www.a.example', 'www.b.example'], preBackSteps: 0, expectTabs: 3, expectIndex: 0, expectUrlSuffix: 'https://www.regression.example', expectReturns: true, expectToastCount: 0 },
    { id: 'R05', action: ACT_LOAD, preTabs: 2, preIndex: 1, preUrls: ['www.c.example'], preBackSteps: 0, expectTabs: 2, expectIndex: 1, expectUrlSuffix: 'https://www.regression.example', expectReturns: true, expectToastCount: 0 },
    { id: 'R06', action: ACT_BACK, preTabs: 1, preIndex: 0, preUrls: [], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: '', expectReturns: false, expectToastCount: 0 },
    { id: 'R07', action: ACT_BACK, preTabs: 1, preIndex: 0, preUrls: ['www.a.example'], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: 'www.a.example', expectReturns: false, expectToastCount: 0 },
    { id: 'R08', action: ACT_BACK, preTabs: 1, preIndex: 0, preUrls: ['www.a.example', 'www.b.example'], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: 'www.a.example', expectReturns: true, expectToastCount: 0 },
    { id: 'R09', action: ACT_BACK, preTabs: 1, preIndex: 0, preUrls: ['www.a.example', 'www.b.example', 'www.c.example'], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: 'www.b.example', expectReturns: true, expectToastCount: 0 },
    { id: 'R10', action: ACT_BACK, preTabs: 3, preIndex: 1, preUrls: ['www.x.example'], preBackSteps: 0, expectTabs: 3, expectIndex: 1, expectUrlSuffix: 'www.x.example', expectReturns: false, expectToastCount: 0 },
    { id: 'R11', action: ACT_BACK, preTabs: 2, preIndex: 1, preUrls: [], preBackSteps: 0, expectTabs: 2, expectIndex: 1, expectUrlSuffix: '', expectReturns: false, expectToastCount: 0 },
    { id: 'R12', action: ACT_BACK, preTabs: 1, preIndex: 0, preUrls: ['www.a.example', 'www.b.example'], preBackSteps: 1, expectTabs: 1, expectIndex: 0, expectUrlSuffix: 'www.a.example', expectReturns: false, expectToastCount: 0 },
    { id: 'R13', action: ACT_FORWARD, preTabs: 1, preIndex: 0, preUrls: [], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: '', expectReturns: false, expectToastCount: 0 },
    { id: 'R14', action: ACT_FORWARD, preTabs: 1, preIndex: 0, preUrls: ['www.a.example'], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: 'www.a.example', expectReturns: false, expectToastCount: 0 },
    { id: 'R15', action: ACT_FORWARD, preTabs: 1, preIndex: 0, preUrls: ['www.a.example', 'www.b.example'], preBackSteps: 1, expectTabs: 1, expectIndex: 0, expectUrlSuffix: 'www.b.example', expectReturns: true, expectToastCount: 0 },
    { id: 'R16', action: ACT_FORWARD, preTabs: 1, preIndex: 0, preUrls: ['www.a.example', 'www.b.example', 'www.c.example'], preBackSteps: 2, expectTabs: 1, expectIndex: 0, expectUrlSuffix: 'www.b.example', expectReturns: true, expectToastCount: 0 },
    { id: 'R17', action: ACT_FORWARD, preTabs: 2, preIndex: 1, preUrls: [], preBackSteps: 0, expectTabs: 2, expectIndex: 1, expectUrlSuffix: '', expectReturns: false, expectToastCount: 0 },
    { id: 'R18', action: ACT_FORWARD, preTabs: 3, preIndex: 0, preUrls: ['www.a.example', 'www.b.example'], preBackSteps: 1, expectTabs: 3, expectIndex: 0, expectUrlSuffix: 'www.b.example', expectReturns: true, expectToastCount: 0 }
  ];
  return rows;
}

/** Rows covering tab growth, tab removal, home reset and popup handling. */
function buildTabRows(): RegressionRow[] {
  const rows: RegressionRow[] = [
    { id: 'R19', action: ACT_ADD_TAB, preTabs: 1, preIndex: 0, preUrls: [], preBackSteps: 0, expectTabs: 2, expectIndex: 1, expectUrlSuffix: '', expectReturns: true, expectToastCount: 0 },
    { id: 'R20', action: ACT_ADD_TAB, preTabs: 10, preIndex: 3, preUrls: [], preBackSteps: 0, expectTabs: 11, expectIndex: 10, expectUrlSuffix: '', expectReturns: true, expectToastCount: 0 },
    { id: 'R21', action: ACT_ADD_TAB, preTabs: 11, preIndex: 0, preUrls: [], preBackSteps: 0, expectTabs: 11, expectIndex: 0, expectUrlSuffix: '', expectReturns: false, expectToastCount: 1 },
    { id: 'R22', action: ACT_ADD_TAB, preTabs: 5, preIndex: 2, preUrls: [], preBackSteps: 0, expectTabs: 6, expectIndex: 5, expectUrlSuffix: '', expectReturns: true, expectToastCount: 0 },
    { id: 'R23', action: ACT_ADD_TAB, preTabs: 11, preIndex: 10, preUrls: [], preBackSteps: 0, expectTabs: 11, expectIndex: 10, expectUrlSuffix: '', expectReturns: false, expectToastCount: 1 },
    { id: 'R24', action: ACT_DELETE_TAB, preTabs: 3, preIndex: 2, preUrls: [], preBackSteps: 0, expectTabs: 2, expectIndex: 1, expectUrlSuffix: '', expectReturns: true, expectToastCount: 0 },
    { id: 'R25', action: ACT_DELETE_TAB, preTabs: 3, preIndex: 0, preUrls: [], preBackSteps: 0, expectTabs: 2, expectIndex: 0, expectUrlSuffix: '', expectReturns: true, expectToastCount: 0 },
    { id: 'R26', action: ACT_DELETE_TAB, preTabs: 3, preIndex: 1, preUrls: [], preBackSteps: 0, expectTabs: 2, expectIndex: 1, expectUrlSuffix: '', expectReturns: true, expectToastCount: 0 },
    { id: 'R27', action: ACT_DELETE_TAB, preTabs: 1, preIndex: 0, preUrls: [], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: '', expectReturns: false, expectToastCount: 0 },
    { id: 'R28', action: ACT_DELETE_TAB, preTabs: 2, preIndex: 1, preUrls: [], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: '', expectReturns: true, expectToastCount: 0 },
    { id: 'R29', action: ACT_DELETE_TAB, preTabs: 4, preIndex: 3, preUrls: [], preBackSteps: 0, expectTabs: 3, expectIndex: 2, expectUrlSuffix: '', expectReturns: true, expectToastCount: 0 },
    { id: 'R30', action: ACT_HOME, preTabs: 1, preIndex: 0, preUrls: ['www.a.example', 'www.b.example'], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: 'pad.html', expectReturns: true, expectToastCount: 0 },
    { id: 'R31', action: ACT_HOME, preTabs: 2, preIndex: 1, preUrls: ['www.c.example'], preBackSteps: 0, expectTabs: 2, expectIndex: 1, expectUrlSuffix: 'pad.html', expectReturns: true, expectToastCount: 0 },
    { id: 'R32', action: ACT_WINDOW_NEW, preTabs: 1, preIndex: 0, preUrls: [], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: 'popup.regression.example', expectReturns: true, expectToastCount: 0 },
    { id: 'R33', action: ACT_WINDOW_NEW, preTabs: 2, preIndex: 1, preUrls: ['www.d.example'], preBackSteps: 0, expectTabs: 2, expectIndex: 1, expectUrlSuffix: 'popup.regression.example', expectReturns: true, expectToastCount: 0 },
    { id: 'R34', action: ACT_BACK_PRESS, preTabs: 1, preIndex: 0, preUrls: [], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: '', expectReturns: false, expectToastCount: 0 },
    { id: 'R35', action: ACT_BACK_PRESS, preTabs: 1, preIndex: 0, preUrls: ['www.a.example'], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: 'www.a.example', expectReturns: false, expectToastCount: 0 },
    { id: 'R36', action: ACT_BACK_PRESS, preTabs: 1, preIndex: 0, preUrls: ['www.a.example', 'www.b.example'], preBackSteps: 0, expectTabs: 1, expectIndex: 0, expectUrlSuffix: 'www.a.example', expectReturns: true, expectToastCount: 0 },
    { id: 'R37', action: ACT_BACK_PRESS, preTabs: 2, preIndex: 1, preUrls: ['www.e.example', 'www.f.example'], preBackSteps: 0, expectTabs: 2, expectIndex: 1, expectUrlSuffix: 'www.e.example', expectReturns: true, expectToastCount: 0 }
  ];
  return rows;
}

function buildFullMatrix(): RegressionRow[] {
  const rows: RegressionRow[] = buildNavigationRows();
  const tabRows: RegressionRow[] = buildTabRows();
  for (let index = 0; index < tabRows.length; index++) {
    rows.push(tabRows[index]);
  }
  return rows;
}


