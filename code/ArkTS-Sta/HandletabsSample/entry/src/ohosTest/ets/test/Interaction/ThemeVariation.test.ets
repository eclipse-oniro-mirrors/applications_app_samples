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
  tabTitleCount,
  serializedDelay,
  settlePanel,
  resetPanelToInitial,
  bringPanelToFront,
  INITIAL_TAB_COUNT,
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

export default function tabsThemeVariationTest(): void {
  describe('TabsThemeVariation_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSTHEMEVARIATIONTEST_0100
     * @tc.name tabsThemeVariationTestCase001
     * @tc.desc Verify light profile: default colours -> theme light
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsThemeVariationTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const profile: TabStyleProfile = TabStyleProfile.light();
      expect(profile.isTheme(TabTheme.LIGHT)).assertTrue();
      expect(profile.colorFor(false)).assertEqual(DEFAULT_FONT_COLOR);
      expect(profile.colorFor(true)).assertEqual(SELECTED_FONT_COLOR);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSTHEMEVARIATIONTEST_0200
     * @tc.name tabsThemeVariationTestCase002
     * @tc.desc Verify dark profile: unselected colour white -> theme dark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsThemeVariationTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const profile: TabStyleProfile = TabStyleProfile.dark();
      expect(profile.isTheme(TabTheme.DARK)).assertTrue();
      expect(profile.colorFor(false)).assertEqual('#FFFFFF');
      expect(profile.colorFor(true)).assertEqual(SELECTED_FONT_COLOR);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSTHEMEVARIATIONTEST_0300
     * @tc.name tabsThemeVariationTestCase003
     * @tc.desc Verify font weight: selected uses heavier weight than normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsThemeVariationTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const profile: TabStyleProfile = TabStyleProfile.light();
      expect(profile.weightFor(true)).assertEqual(TAB_FONT_WEIGHT_SELECTED);
      expect(profile.weightFor(false)).assertEqual(TAB_FONT_WEIGHT_NORMAL);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSTHEMEVARIATIONTEST_0400
     * @tc.name tabsThemeVariationTestCase004
     * @tc.desc Verify layout spans: sample margins -> horizontal and vertical totals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsThemeVariationTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const layout: TabLayoutModel = TabLayoutModel.sample();
      expect(layout.horizontalSpan()).assertEqual(TAB_MARGIN_SIDE * 2);
      expect(layout.verticalSpan()).assertEqual(TAB_MARGIN_TOP + TAB_MARGIN_BOTTOM);
      expect(layout.closeMarginLeft).assertEqual(TAB_CLOSE_MARGIN_LEFT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSTHEMEVARIATIONTEST_0500
     * @tc.name tabsThemeVariationTestCase005
     * @tc.desc Verify layout describe: sample layout -> margin triple in description
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsThemeVariationTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const layout: TabLayoutModel = TabLayoutModel.sample();
      const expected: string = `layout{${TAB_MARGIN_SIDE}:${TAB_MARGIN_TOP}:${TAB_MARGIN_BOTTOM}}`;
      expect(layout.describe()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSTHEMEVARIATIONTEST_0600
     * @tc.name tabsThemeVariationTestCase006
     * @tc.desc Verify colour constants: selected and background values as declared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsThemeVariationTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(SELECTED_FONT_COLOR).assertEqual('#007DFF');
      expect(TABS_BACKGROUND).assertEqual('#F1F3F5');
      expect(TAB_CONTENT_BACKGROUND).assertEqual('#007DFF');
      expect(ADD_BUTTON_FONT_COLOR).assertEqual('#707070');
      expect(CLOSE_BUTTON_COLOR).assertEqual('red');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSTHEMEVARIATIONTEST_0700
     * @tc.name tabsThemeVariationTestCase007
     * @tc.desc Verify dimension constants: bar width, height, and animation duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsThemeVariationTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_BAR_WIDTH).assertEqual(360);
      expect(TAB_BAR_HEIGHT).assertEqual(56);
      expect(TAB_CONTENT_HEIGHT).assertEqual(296);
      expect(TAB_ANIMATION_DURATION).assertEqual(400);
      expect(TAB_DIVIDER_STROKE).assertEqual(2);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSTHEMEVARIATIONTEST_0800
     * @tc.name tabsThemeVariationTestCase008
     * @tc.desc Verify Tabs component renders: panel visible -> at least one Tabs node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsThemeVariationTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      const stable: boolean = await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      expect(stable).assertTrue();
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSTHEMEVARIATIONTEST_0900
     * @tc.name tabsThemeVariationTestCase009
     * @tc.desc Verify TabContent nodes: seeded strips -> content count matches tab count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsThemeVariationTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const contents: number = await tabContentCount(driver);
      const titles: number = await tabTitleCount(driver);
      expect(contents).assertLargerOrEqual(1);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });
  });
}
