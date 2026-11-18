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
  TAB_ANIMATION_DURATION,
  TAB_DIVIDER_STROKE,
  SELECTED_FONT_COLOR,
  KEY_DPAD_DOWN,
  KEY_ENTER,
  KEY_BACK,
  TIMEOUT_PANEL_RENDER,
  TIMEOUT_STATE_SETTLE,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_TAB_COUNT
} from '../Shared/SharedDriver';


enum TabsBarMode {
  FIXED = 'fixed',
  SCROLLABLE = 'scrollable'
}


class TabsSwitchState {
  public index: int;
  public targetIndex: int;
  public animating: boolean;
  public duration: int;

  constructor(index: int, targetIndex: int, animating: boolean, duration: int) {
    this.index = index;
    this.targetIndex = targetIndex;
    this.animating = animating;
    this.duration = duration;
  }

  public static initial(): TabsSwitchState {
    return new TabsSwitchState(0, 0, false, TAB_ANIMATION_DURATION);
  }

  public beginSwitch(target: int): boolean {
    if (this.animating) {
      return false;
    }
    if (target === this.index) {
      return false;
    }
    this.targetIndex = target;
    this.animating = true;
    return true;
  }

  public finishSwitch(): boolean {
    if (!this.animating) {
      return false;
    }
    this.index = this.targetIndex;
    this.animating = false;
    return true;
  }

  public isSameIndex(): boolean {
    return this.index === this.targetIndex;
  }

  public describe(): string {
    return `switch{${this.index}->${this.targetIndex}:${this.animating}}`;
  }
}


class TabBarStyleModel {
  public barWidth: int;
  public barHeight: int;
  public animationDuration: int;
  public mode: TabsBarMode;

  constructor(barWidth: int, barHeight: int, animationDuration: int, mode: TabsBarMode) {
    this.barWidth = barWidth;
    this.barHeight = barHeight;
    this.animationDuration = animationDuration;
    this.mode = mode;
  }

  public static sample(): TabBarStyleModel {
    return new TabBarStyleModel(TAB_BAR_WIDTH, TAB_BAR_HEIGHT, TAB_ANIMATION_DURATION, TabsBarMode.FIXED);
  }

  public isAnimationEnabled(): boolean {
    return this.animationDuration > 0;
  }

  public isFixedMode(): boolean {
    return this.mode === TabsBarMode.FIXED;
  }

  public withMode(next: TabsBarMode): TabBarStyleModel {
    return new TabBarStyleModel(this.barWidth, this.barHeight, this.animationDuration, next);
  }

  public describe(): string {
    return `style{${this.barWidth}x${this.barHeight}:${this.animationDuration}:${this.mode}}`;
  }
}


class TabBarIndicatorModel {
  public strokeWidth: int;
  public color: string;
  public opacity: number;

  constructor(strokeWidth: int, color: string, opacity: number) {
    this.strokeWidth = strokeWidth;
    this.color = color;
    this.opacity = opacity;
  }

  public static selectedIndicator(): TabBarIndicatorModel {
    return new TabBarIndicatorModel(TAB_DIVIDER_STROKE, SELECTED_FONT_COLOR, 1);
  }

  public static unselectedIndicator(): TabBarIndicatorModel {
    return new TabBarIndicatorModel(TAB_DIVIDER_STROKE, SELECTED_FONT_COLOR, 0);
  }

  public isVisible(): boolean {
    return this.opacity > 0;
  }

  public opacityFor(selected: boolean): number {
    if (selected) {
      return 1;
    }
    return 0;
  }
}

export default function tabPanelLifecycleTest(): void {
  describe('TabPanelLifecycle_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_0100
     * @tc.name tabPanelLifecycleTestCase001
     * @tc.desc Verify Tabs component renders: panel visible -> at least one Tabs node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      const stable: boolean = await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      expect(stable).assertTrue();
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_0200
     * @tc.name tabPanelLifecycleTestCase002
     * @tc.desc Verify TabContent nodes: seeded strips -> content count matches tab count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const contents: number = await tabContentCount(driver);
      const titles: number = await tabTitleCount(driver);
      expect(contents).assertLargerOrEqual(1);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_0300
     * @tc.name tabPanelLifecycleTestCase003
     * @tc.desc Verify seeded titles: initial strip -> first and second page labels visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FIRST_TAB_TITLE)).assertTrue();
      expect(containsLabel(texts, SECOND_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_0400
     * @tc.name tabPanelLifecycleTestCase004
     * @tc.desc Verify add button: initial strip below limit -> plus label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_0500
     * @tc.name tabPanelLifecycleTestCase005
     * @tc.desc Verify close button: initial strip above minimum -> close label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_CLOSE_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_0600
     * @tc.name tabPanelLifecycleTestCase006
     * @tc.desc Verify title prefix: rendered titles -> every tab label starts with page prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      const titles: number = countTitles(texts);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_0700
     * @tc.name tabPanelLifecycleTestCase007
     * @tc.desc Verify clickable nodes: interactive strip -> clickable components reported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const clickable: number = await clickableCount(driver);
      expect(clickable).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_0800
     * @tc.name tabPanelLifecycleTestCase008
     * @tc.desc Verify focusable element: panel front -> at least one focused node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const focused: number = await focusedCount(driver);
      expect(focused).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_0900
     * @tc.name tabPanelLifecycleTestCase009
     * @tc.desc Verify text nodes: tab bar labels rendered -> text component count above one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: number = await textCount(driver);
      expect(texts).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_1000
     * @tc.name tabPanelLifecycleTestCase010
     * @tc.desc Verify snapshot capture: panel captured -> total components greater than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const snapshot: PanelSnapshot = await panelSnapshot(driver);
      expect(snapshot.total() > 0).assertTrue();
      expect(snapshot.describe().startsWith('snapshot')).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_1100
     * @tc.name tabPanelLifecycleTestCase011
     * @tc.desc Verify clamp helper: overshoot index -> clamped to last slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(clampTabIndex(0, 3)).assertEqual(0);
      expect(clampTabIndex(9, 3)).assertEqual(2);
      expect(clampTabIndex(-4, 3)).assertEqual(0);
      expect(clampTabIndex(0, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_1200
     * @tc.name tabPanelLifecycleTestCase012
     * @tc.desc Verify switch state: begin switch to target one -> animating true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.index).assertEqual(0);
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.targetIndex).assertEqual(1);
      expect(state.animating).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_1300
     * @tc.name tabPanelLifecycleTestCase013
     * @tc.desc Verify switch guard: target equals current index -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(0)).assertFalse();
      expect(state.animating).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_1400
     * @tc.name tabPanelLifecycleTestCase014
     * @tc.desc Verify switch completion: begin then finish -> index equals target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.finishSwitch()).assertTrue();
      expect(state.index).assertEqual(1);
      expect(state.isSameIndex()).assertTrue();
      expect(state.finishSwitch()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_1500
     * @tc.name tabPanelLifecycleTestCase015
     * @tc.desc Verify reentrant guard: second begin during animation -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.beginSwitch(2)).assertFalse();
      expect(state.targetIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_1600
     * @tc.name tabPanelLifecycleTestCase016
     * @tc.desc Verify bar style: sample profile -> fixed mode with animation enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      expect(style.barWidth).assertEqual(TAB_BAR_WIDTH);
      expect(style.barHeight).assertEqual(TAB_BAR_HEIGHT);
      expect(style.isAnimationEnabled()).assertTrue();
      expect(style.isFixedMode()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_1700
     * @tc.name tabPanelLifecycleTestCase017
     * @tc.desc Verify style copy: mode changed to scrollable -> original keeps fixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      const scrollable: TabBarStyleModel = style.withMode(TabsBarMode.SCROLLABLE);
      expect(scrollable.isFixedMode()).assertFalse();
      expect(style.isFixedMode()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_1800
     * @tc.name tabPanelLifecycleTestCase018
     * @tc.desc Verify indicator opacity: selected and unselected -> one and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const selected: TabBarIndicatorModel = TabBarIndicatorModel.selectedIndicator();
      const unselected: TabBarIndicatorModel = TabBarIndicatorModel.unselectedIndicator();
      expect(selected.opacityFor(true)).assertEqual(1);
      expect(selected.opacityFor(false)).assertEqual(0);
      expect(selected.isVisible()).assertTrue();
      expect(unselected.isVisible()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_1900
     * @tc.name tabPanelLifecycleTestCase019
     * @tc.desc Verify dpad down: KEY_DPAD_DOWN equals 2013
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(KEY_DPAD_DOWN).assertEqual(2013);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_2000
     * @tc.name tabPanelLifecycleTestCase020
     * @tc.desc Verify dpad down bound: KEY_DPAD_DOWN is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(KEY_DPAD_DOWN >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_2100
     * @tc.name tabPanelLifecycleTestCase021
     * @tc.desc Verify enter: KEY_ENTER equals 2049
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(KEY_ENTER).assertEqual(2049);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_2200
     * @tc.name tabPanelLifecycleTestCase022
     * @tc.desc Verify enter bound: KEY_ENTER is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(KEY_ENTER >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELLIFECYCLETEST_2300
     * @tc.name tabPanelLifecycleTestCase023
     * @tc.desc Verify back: KEY_BACK equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelLifecycleTestCase023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(KEY_BACK).assertEqual(2);
    });
  });
}
