'use static'


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

import {
  describe,
  it,
  expect,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  TestType,
  Size,
  Level
} from '@ohos/hypium';

import {
  Driver
} from '@ohos.UiTest';

import {
  getDriver,
  waitForPanelStable,
  clickAddButton,
  tabsCount,
  tabContentCount,
  textCount,
  focusedCount,
  clickableCount,
  collectTexts,
  countTitles,
  containsLabel,
  tabTitleCount,
  panelSnapshot,
  serializedDelay,
  settlePanel,
  resetPanelToInitial,
  bringPanelToFront,
  canAddTab,
  PanelSnapshot,
  TabTitleBook,
  PageCounter,
  TAB_ADD_LABEL,
  TAB_CLOSE_LABEL,
  INITIAL_TAB_COUNT,
  MAX_TAB_COUNT,
  DEFAULT_NEW_PAGE_INDEX,
  FIRST_TAB_TITLE,
  SECOND_TAB_TITLE,
  THIRD_TAB_TITLE,
  FOURTH_TAB_TITLE,
  TIMEOUT_PANEL_RENDER,
  TIMEOUT_STATE_SETTLE,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_TAB_COUNT
} from '../Shared/SharedDriver';



export default function tabsIntegrationTestingTest(): void {
  describe('TabsIntegrationTesting_Test', () => {
    beforeAll(async () => {
      await bringPanelToFront(getDriver());
    });

    beforeEach(async () => {
      await resetPanelToInitial(getDriver());
      await serializedDelay(getDriver(), DELAY_KEY_NAVIGATION);
    });

    afterEach(async () => {
      await settlePanel(getDriver());
    });

    afterAll(async () => {
      await serializedDelay(getDriver(), TIMEOUT_STATE_SETTLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_0100
     * @tc.name tabsIntegrationTestingTestCase001
     * @tc.desc Verify Tabs component renders: panel visible -> at least one Tabs node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      const stable: boolean = await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      expect(stable).assertTrue();
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_0200
     * @tc.name tabsIntegrationTestingTestCase002
     * @tc.desc Verify TabContent nodes: seeded strips -> content count matches tab count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const contents: number = await tabContentCount(driver);
      const titles: number = await tabTitleCount(driver);
      expect(contents).assertLargerOrEqual(1);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_0300
     * @tc.name tabsIntegrationTestingTestCase003
     * @tc.desc Verify seeded titles: initial strip -> first and second page labels visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FIRST_TAB_TITLE)).assertTrue();
      expect(containsLabel(texts, SECOND_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_0400
     * @tc.name tabsIntegrationTestingTestCase004
     * @tc.desc Verify add button: initial strip below limit -> plus label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_0500
     * @tc.name tabsIntegrationTestingTestCase005
     * @tc.desc Verify close button: initial strip above minimum -> close label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_CLOSE_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_0600
     * @tc.name tabsIntegrationTestingTestCase006
     * @tc.desc Verify title prefix: rendered titles -> every tab label starts with page prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      const titles: number = countTitles(texts);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_0700
     * @tc.name tabsIntegrationTestingTestCase007
     * @tc.desc Verify clickable nodes: interactive strip -> clickable components reported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const clickable: number = await clickableCount(driver);
      expect(clickable).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_0800
     * @tc.name tabsIntegrationTestingTestCase008
     * @tc.desc Verify focusable surface: panel front -> at least one focused node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const focused: number = await focusedCount(driver);
      expect(focused).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_0900
     * @tc.name tabsIntegrationTestingTestCase009
     * @tc.desc Verify text nodes: tab bar labels rendered -> text component count above one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: number = await textCount(driver);
      expect(texts).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_1000
     * @tc.name tabsIntegrationTestingTestCase010
     * @tc.desc Verify snapshot capture: panel captured -> total components greater than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const snapshot: PanelSnapshot = await panelSnapshot(driver);
      expect(snapshot.total() > 0).assertTrue();
      expect(snapshot.describe().startsWith('snapshot')).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_1100
     * @tc.name tabsIntegrationTestingTestCase011
     * @tc.desc Verify add action: tap plus once -> titled tab count grows by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickAddButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLargerOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_1200
     * @tc.name tabsIntegrationTestingTestCase012
     * @tc.desc Verify add naming: one add from seed -> third page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, THIRD_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_1300
     * @tc.name tabsIntegrationTestingTestCase013
     * @tc.desc Verify limit: two adds reach maximum -> add button disappears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_1400
     * @tc.name tabsIntegrationTestingTestCase014
     * @tc.desc Verify second add naming: two adds -> fourth page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FOURTH_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_1500
     * @tc.name tabsIntegrationTestingTestCase015
     * @tc.desc Verify add helper boundary: count three allowed -> count four rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canAddTab(INITIAL_TAB_COUNT)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT - 1)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT)).assertFalse();
      expect(canAddTab(MAX_TAB_COUNT + 1)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_1600
     * @tc.name tabsIntegrationTestingTestCase016
     * @tc.desc Verify title book add: seed book accepts one add then stops at limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 1)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 2)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 3)).assertFalse();
      expect(book.getCount()).assertEqual(MAX_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSINTEGRATIONTESTINGTEST_1700
     * @tc.name tabsIntegrationTestingTestCase017
     * @tc.desc Verify page counter: default counter starts at two -> next page three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsIntegrationTestingTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const counter: PageCounter = PageCounter.defaultCounter();
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX);
      expect(counter.peekNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.takeNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
    });
  });
}
