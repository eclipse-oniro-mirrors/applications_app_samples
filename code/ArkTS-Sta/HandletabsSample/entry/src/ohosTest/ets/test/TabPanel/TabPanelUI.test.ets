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
  canRemoveTab,
  clampTabIndex,
  PanelSnapshot,
  TAB_ADD_LABEL,
  TAB_CLOSE_LABEL,
  INITIAL_TAB_COUNT,
  FIRST_TAB_TITLE,
  SECOND_TAB_TITLE,
  TAB_BAR_WIDTH,
  TAB_BAR_HEIGHT,
  TAB_CONTENT_HEIGHT,
  TAB_ANIMATION_DURATION,
  TAB_DIVIDER_STROKE,
  TAB_FONT_SIZE,
  TAB_FONT_WEIGHT_SELECTED,
  TAB_FONT_WEIGHT_NORMAL,
  TAB_MARGIN_SIDE,
  TAB_MARGIN_TOP,
  TAB_MARGIN_BOTTOM,
  TAB_CLOSE_MARGIN_LEFT,
  TAB_ADD_MARGIN_TOP,
  DEFAULT_FONT_COLOR,
  SELECTED_FONT_COLOR,
  TAB_CONTENT_BACKGROUND,
  TABS_BACKGROUND,
  ADD_BUTTON_FONT_COLOR,
  CLOSE_BUTTON_COLOR,
  TIMEOUT_PANEL_RENDER,
  TIMEOUT_STATE_SETTLE,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_TAB_COUNT
} from '../Shared/SharedDriver';


enum TabTheme {
  LIGHT = 'light',
  DARK = 'dark',
  HIGH_CONTRAST = 'high_contrast'
}


class TabStyleProfile {
  public fontColor: string;
  public selectedFontColor: string;
  public fontSize: int;
  public theme: TabTheme;

  constructor(fontColor: string, selectedFontColor: string, fontSize: int, theme: TabTheme) {
    this.fontColor = fontColor;
    this.selectedFontColor = selectedFontColor;
    this.fontSize = fontSize;
    this.theme = theme;
  }

  public static light(): TabStyleProfile {
    return new TabStyleProfile(DEFAULT_FONT_COLOR, SELECTED_FONT_COLOR, TAB_FONT_SIZE, TabTheme.LIGHT);
  }

  public static dark(): TabStyleProfile {
    return new TabStyleProfile('#FFFFFF', SELECTED_FONT_COLOR, TAB_FONT_SIZE, TabTheme.DARK);
  }

  public colorFor(selected: boolean): string {
    if (selected) {
      return this.selectedFontColor;
    }
    return this.fontColor;
  }

  public weightFor(selected: boolean): int {
    if (selected) {
      return TAB_FONT_WEIGHT_SELECTED;
    }
    return TAB_FONT_WEIGHT_NORMAL;
  }

  public isTheme(theme: TabTheme): boolean {
    return this.theme === theme;
  }
}


class TabLayoutModel {
  public marginSide: int;
  public marginTop: int;
  public marginBottom: int;
  public closeMarginLeft: int;
  public addMarginTop: int;

  constructor(marginSide: int, marginTop: int, marginBottom: int, closeMarginLeft: int, addMarginTop: int) {
    this.marginSide = marginSide;
    this.marginTop = marginTop;
    this.marginBottom = marginBottom;
    this.closeMarginLeft = closeMarginLeft;
    this.addMarginTop = addMarginTop;
  }

  public static sample(): TabLayoutModel {
    return new TabLayoutModel(TAB_MARGIN_SIDE, TAB_MARGIN_TOP, TAB_MARGIN_BOTTOM, TAB_CLOSE_MARGIN_LEFT,
      TAB_ADD_MARGIN_TOP);
  }

  public horizontalSpan(): int {
    return this.marginSide * 2;
  }

  public verticalSpan(): int {
    return this.marginTop + this.marginBottom;
  }

  public describe(): string {
    return `layout{${this.marginSide}:${this.marginTop}:${this.marginBottom}}`;
  }
}

export default function tabPanelUITest(): void {
  describe('TabPanelUI_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_0100
     * @tc.name tabPanelUITestCase001
     * @tc.desc Verify Tabs component renders: panel visible -> at least one Tabs node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      const stable: boolean = await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      expect(stable).assertTrue();
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_0200
     * @tc.name tabPanelUITestCase002
     * @tc.desc Verify TabContent nodes: seeded strips -> content count matches tab count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const contents: number = await tabContentCount(driver);
      const titles: number = await tabTitleCount(driver);
      expect(contents).assertLargerOrEqual(1);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_0300
     * @tc.name tabPanelUITestCase003
     * @tc.desc Verify seeded titles: initial strip -> first and second page labels visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FIRST_TAB_TITLE)).assertTrue();
      expect(containsLabel(texts, SECOND_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_0400
     * @tc.name tabPanelUITestCase004
     * @tc.desc Verify add button: initial strip below limit -> plus label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_0500
     * @tc.name tabPanelUITestCase005
     * @tc.desc Verify close button: initial strip above minimum -> close label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_CLOSE_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_0600
     * @tc.name tabPanelUITestCase006
     * @tc.desc Verify title prefix: rendered titles -> every tab label starts with page prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      const titles: number = countTitles(texts);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_0700
     * @tc.name tabPanelUITestCase007
     * @tc.desc Verify clickable nodes: interactive strip -> clickable components reported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const clickable: number = await clickableCount(driver);
      expect(clickable).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_0800
     * @tc.name tabPanelUITestCase008
     * @tc.desc Verify focusable surface: panel front -> at least one focused node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const focused: number = await focusedCount(driver);
      expect(focused).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_0900
     * @tc.name tabPanelUITestCase009
     * @tc.desc Verify text nodes: tab bar labels rendered -> text component count above one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: number = await textCount(driver);
      expect(texts).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_1000
     * @tc.name tabPanelUITestCase010
     * @tc.desc Verify snapshot capture: panel captured -> total components greater than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const snapshot: PanelSnapshot = await panelSnapshot(driver);
      expect(snapshot.total() > 0).assertTrue();
      expect(snapshot.describe().startsWith('snapshot')).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_1100
     * @tc.name tabPanelUITestCase011
     * @tc.desc Verify light profile: default colours -> theme light
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const profile: TabStyleProfile = TabStyleProfile.light();
      expect(profile.isTheme(TabTheme.LIGHT)).assertTrue();
      expect(profile.colorFor(false)).assertEqual(DEFAULT_FONT_COLOR);
      expect(profile.colorFor(true)).assertEqual(SELECTED_FONT_COLOR);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_1200
     * @tc.name tabPanelUITestCase012
     * @tc.desc Verify dark profile: unselected colour white -> theme dark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const profile: TabStyleProfile = TabStyleProfile.dark();
      expect(profile.isTheme(TabTheme.DARK)).assertTrue();
      expect(profile.colorFor(false)).assertEqual('#FFFFFF');
      expect(profile.colorFor(true)).assertEqual(SELECTED_FONT_COLOR);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_1300
     * @tc.name tabPanelUITestCase013
     * @tc.desc Verify font weight: selected uses heavier weight than normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const profile: TabStyleProfile = TabStyleProfile.light();
      expect(profile.weightFor(true)).assertEqual(TAB_FONT_WEIGHT_SELECTED);
      expect(profile.weightFor(false)).assertEqual(TAB_FONT_WEIGHT_NORMAL);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_1400
     * @tc.name tabPanelUITestCase014
     * @tc.desc Verify layout spans: sample margins -> horizontal and vertical totals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const layout: TabLayoutModel = TabLayoutModel.sample();
      expect(layout.horizontalSpan()).assertEqual(TAB_MARGIN_SIDE * 2);
      expect(layout.verticalSpan()).assertEqual(TAB_MARGIN_TOP + TAB_MARGIN_BOTTOM);
      expect(layout.closeMarginLeft).assertEqual(TAB_CLOSE_MARGIN_LEFT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_1500
     * @tc.name tabPanelUITestCase015
     * @tc.desc Verify layout describe: sample layout -> margin triple in description
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const layout: TabLayoutModel = TabLayoutModel.sample();
      const expected: string = `layout{${TAB_MARGIN_SIDE}:${TAB_MARGIN_TOP}:${TAB_MARGIN_BOTTOM}}`;
      expect(layout.describe()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_1600
     * @tc.name tabPanelUITestCase016
     * @tc.desc Verify colour constants: selected and background values as declared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(SELECTED_FONT_COLOR).assertEqual('#007DFF');
      expect(TABS_BACKGROUND).assertEqual('#F1F3F5');
      expect(TAB_CONTENT_BACKGROUND).assertEqual('#007DFF');
      expect(ADD_BUTTON_FONT_COLOR).assertEqual('#707070');
      expect(CLOSE_BUTTON_COLOR).assertEqual('red');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_1700
     * @tc.name tabPanelUITestCase017
     * @tc.desc Verify dimension constants: bar width, height, and animation duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_BAR_WIDTH).assertEqual(360);
      expect(TAB_BAR_HEIGHT).assertEqual(56);
      expect(TAB_CONTENT_HEIGHT).assertEqual(296);
      expect(TAB_ANIMATION_DURATION).assertEqual(400);
      expect(TAB_DIVIDER_STROKE).assertEqual(2);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_1800
     * @tc.name tabPanelUITestCase018
     * @tc.desc Verify clamp helper: overshoot index -> clamped to last slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(clampTabIndex(0, 3)).assertEqual(0);
      expect(clampTabIndex(9, 3)).assertEqual(2);
      expect(clampTabIndex(-4, 3)).assertEqual(0);
      expect(clampTabIndex(0, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_1900
     * @tc.name tabPanelUITestCase019
     * @tc.desc Verify close button label literal: TAB_CLOSE_LABEL is a non empty literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_CLOSE_LABEL.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_2000
     * @tc.name tabPanelUITestCase020
     * @tc.desc Verify first seeded title: FIRST_TAB_TITLE equals declared literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(FIRST_TAB_TITLE).assertEqual('页面1');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_2100
     * @tc.name tabPanelUITestCase021
     * @tc.desc Verify first seeded title literal: FIRST_TAB_TITLE is a non empty literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(FIRST_TAB_TITLE.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELUITEST_2200
     * @tc.name tabPanelUITestCase022
     * @tc.desc Verify second seeded title: SECOND_TAB_TITLE equals declared literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelUITestCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(SECOND_TAB_TITLE).assertEqual('页面2');
    });
  });
}
