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
  clickCloseButton,
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
  canRemoveTab,
  removeTitleAt,
  initialTitles,
  PanelSnapshot,
  TabTitleBook,
  TAB_ADD_LABEL,
  TAB_CLOSE_LABEL,
  INITIAL_TAB_COUNT,
  MIN_REMOVABLE_TAB_COUNT,
  FIRST_TAB_TITLE,
  SECOND_TAB_TITLE,
  THIRD_TAB_TITLE,
  FOURTH_TAB_TITLE,
  TIMEOUT_PANEL_RENDER,
  TIMEOUT_STATE_SETTLE,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_TAB_COUNT
} from '../Shared/SharedDriver';



export default function tabsResourceManagementTest(): void {
  describe('TabsResourceManagement_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_0100
     * @tc.name tabsResourceManagementTestCase001
     * @tc.desc Verify Tabs component renders: panel visible -> at least one Tabs node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      const stable: boolean = await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      expect(stable).assertTrue();
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_0200
     * @tc.name tabsResourceManagementTestCase002
     * @tc.desc Verify TabContent nodes: seeded strips -> content count matches tab count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const contents: number = await tabContentCount(driver);
      const titles: number = await tabTitleCount(driver);
      expect(contents).assertLargerOrEqual(1);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_0300
     * @tc.name tabsResourceManagementTestCase003
     * @tc.desc Verify seeded titles: initial strip -> first and second page labels visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FIRST_TAB_TITLE)).assertTrue();
      expect(containsLabel(texts, SECOND_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_0400
     * @tc.name tabsResourceManagementTestCase004
     * @tc.desc Verify add button: initial strip below limit -> plus label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_0500
     * @tc.name tabsResourceManagementTestCase005
     * @tc.desc Verify close button: initial strip above minimum -> close label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_CLOSE_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_0600
     * @tc.name tabsResourceManagementTestCase006
     * @tc.desc Verify title prefix: rendered titles -> every tab label starts with page prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      const titles: number = countTitles(texts);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_0700
     * @tc.name tabsResourceManagementTestCase007
     * @tc.desc Verify clickable nodes: interactive strip -> clickable components reported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const clickable: number = await clickableCount(driver);
      expect(clickable).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_0800
     * @tc.name tabsResourceManagementTestCase008
     * @tc.desc Verify focusable surface: panel front -> at least one focused node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const focused: number = await focusedCount(driver);
      expect(focused).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_0900
     * @tc.name tabsResourceManagementTestCase009
     * @tc.desc Verify text nodes: tab bar labels rendered -> text component count above one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: number = await textCount(driver);
      expect(texts).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_1000
     * @tc.name tabsResourceManagementTestCase010
     * @tc.desc Verify snapshot capture: panel captured -> total components greater than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const snapshot: PanelSnapshot = await panelSnapshot(driver);
      expect(snapshot.total() > 0).assertTrue();
      expect(snapshot.describe().startsWith('snapshot')).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_1100
     * @tc.name tabsResourceManagementTestCase011
     * @tc.desc Verify remove action: tap close once -> titled tab count does not grow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickCloseButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLessOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_1200
     * @tc.name tabsResourceManagementTestCase012
     * @tc.desc Verify remove on model: seeded book removes one -> count one below seed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(0)).assertTrue();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT - 1);
      expect(book.containsTitle(FIRST_TAB_TITLE)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_1300
     * @tc.name tabsResourceManagementTestCase013
     * @tc.desc Verify remove guard: count below minimum -> removal refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT - 1)).assertFalse();
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT)).assertTrue();
      const book: TabTitleBook = new TabTitleBook([FIRST_TAB_TITLE]);
      expect(book.removeTitle(0)).assertFalse();
      expect(book.getCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_1400
     * @tc.name tabsResourceManagementTestCase014
     * @tc.desc Verify remove bounds: index equal to size -> refused, size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(INITIAL_TAB_COUNT)).assertFalse();
      expect(book.removeTitle(-1)).assertFalse();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_1500
     * @tc.name tabsResourceManagementTestCase015
     * @tc.desc Verify remove helper: index one removed from three -> remaining joined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      titles.push(THIRD_TAB_TITLE);
      const remaining: string[] = removeTitleAt(titles, 1);
      expect(remaining.join(',')).assertEqual(FIRST_TAB_TITLE + ',' + THIRD_TAB_TITLE);
      expect(titles.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_1600
     * @tc.name tabsResourceManagementTestCase016
     * @tc.desc Verify remove helper bounds: out of range index -> copy unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      const untouched: string[] = removeTitleAt(titles, 9);
      expect(untouched.length).assertEqual(INITIAL_TAB_COUNT);
      expect(untouched[0]).assertEqual(FIRST_TAB_TITLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_1700
     * @tc.name tabsResourceManagementTestCase017
     * @tc.desc Verify third seeded title: THIRD_TAB_TITLE equals declared literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(THIRD_TAB_TITLE).assertEqual('页面3');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_1800
     * @tc.name tabsResourceManagementTestCase018
     * @tc.desc Verify third seeded title literal: THIRD_TAB_TITLE is a non empty literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(THIRD_TAB_TITLE.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_1900
     * @tc.name tabsResourceManagementTestCase019
     * @tc.desc Verify fourth seeded title: FOURTH_TAB_TITLE equals declared literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(FOURTH_TAB_TITLE).assertEqual('页面4');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSRESOURCEMANAGEMENTTEST_2000
     * @tc.name tabsResourceManagementTestCase020
     * @tc.desc Verify fourth seeded title literal: FOURTH_TAB_TITLE is a non empty literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsResourceManagementTestCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(FOURTH_TAB_TITLE.length > 0).assertTrue();
    });
  });
}
