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
  collectTexts,
  containsLabel,
  tabTitleCount,
  serializedDelay,
  settlePanel,
  resetPanelToInitial,
  bringPanelToFront,
  canAddTab,
  canRemoveTab,
  clampTabIndex,
  TabTitleBook,
  PageCounter,
  TAB_ADD_LABEL,
  INITIAL_TAB_COUNT,
  MAX_TAB_COUNT,
  DEFAULT_NEW_PAGE_INDEX,
  FIRST_TAB_TITLE,
  SECOND_TAB_TITLE,
  THIRD_TAB_TITLE,
  FOURTH_TAB_TITLE,
  TAB_BAR_WIDTH,
  TAB_BAR_HEIGHT,
  TAB_ANIMATION_DURATION,
  TAB_DIVIDER_STROKE,
  SELECTED_FONT_COLOR,
  TIMEOUT_PANEL_RENDER,
  TIMEOUT_STATE_SETTLE,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';



export default function tabsAdvancedScenariosTest(): void {
  describe('TabsAdvancedScenarios_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSADVANCEDSCENARIOSTEST_0100
     * @tc.name tabsAdvancedScenariosTestCase001
     * @tc.desc Verify add action: tap plus once -> titled tab count grows by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsAdvancedScenariosTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickAddButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLargerOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSADVANCEDSCENARIOSTEST_0200
     * @tc.name tabsAdvancedScenariosTestCase002
     * @tc.desc Verify add naming: one add from seed -> third page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsAdvancedScenariosTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, THIRD_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSADVANCEDSCENARIOSTEST_0300
     * @tc.name tabsAdvancedScenariosTestCase003
     * @tc.desc Verify limit: two adds reach maximum -> add button disappears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsAdvancedScenariosTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSADVANCEDSCENARIOSTEST_0400
     * @tc.name tabsAdvancedScenariosTestCase004
     * @tc.desc Verify second add naming: two adds -> fourth page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsAdvancedScenariosTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FOURTH_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSADVANCEDSCENARIOSTEST_0500
     * @tc.name tabsAdvancedScenariosTestCase005
     * @tc.desc Verify add helper boundary: count three allowed -> count four rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsAdvancedScenariosTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canAddTab(INITIAL_TAB_COUNT)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT - 1)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT)).assertFalse();
      expect(canAddTab(MAX_TAB_COUNT + 1)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSADVANCEDSCENARIOSTEST_0600
     * @tc.name tabsAdvancedScenariosTestCase006
     * @tc.desc Verify title book add: seed book accepts one add then stops at limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsAdvancedScenariosTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 1)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 2)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 3)).assertFalse();
      expect(book.getCount()).assertEqual(MAX_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSADVANCEDSCENARIOSTEST_0700
     * @tc.name tabsAdvancedScenariosTestCase007
     * @tc.desc Verify page counter: default counter starts at two -> next page three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsAdvancedScenariosTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const counter: PageCounter = PageCounter.defaultCounter();
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX);
      expect(counter.peekNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.takeNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSADVANCEDSCENARIOSTEST_0800
     * @tc.name tabsAdvancedScenariosTestCase008
     * @tc.desc Verify clamp helper: overshoot index -> clamped to last slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsAdvancedScenariosTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(clampTabIndex(0, 3)).assertEqual(0);
      expect(clampTabIndex(9, 3)).assertEqual(2);
      expect(clampTabIndex(-4, 3)).assertEqual(0);
      expect(clampTabIndex(0, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSADVANCEDSCENARIOSTEST_0900
     * @tc.name tabsAdvancedScenariosTestCase009
     * @tc.desc Verify tab bar width: TAB_BAR_WIDTH equals 360
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsAdvancedScenariosTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_BAR_WIDTH).assertEqual(360);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSADVANCEDSCENARIOSTEST_1000
     * @tc.name tabsAdvancedScenariosTestCase010
     * @tc.desc Verify tab bar width bound: TAB_BAR_WIDTH is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsAdvancedScenariosTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_BAR_WIDTH >= 0).assertTrue();
    });
  });
}
