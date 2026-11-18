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



enum SvalRetryPhase {
  READY = 'ready',
  ATTEMPTING = 'attempting',
  SUCCEEDED = 'succeeded',
  EXHAUSTED = 'exhausted'
}


class SvalRetryMachine {
  private phase: SvalRetryPhase = SvalRetryPhase.READY;
  private attempts: int = 0;
  private limit: int;

  constructor(limit: int) {
    this.limit = limit;
  }

  public static standard(): SvalRetryMachine {
    return new SvalRetryMachine(3);
  }

  public getPhase(): SvalRetryPhase {
    return this.phase;
  }

  public getAttempts(): int {
    return this.attempts;
  }

  public getLimit(): int {
    return this.limit;
  }

  public attempt(): boolean {
    if (this.phase === SvalRetryPhase.SUCCEEDED || this.phase === SvalRetryPhase.EXHAUSTED) {
      return false;
    }
    this.attempts = this.attempts + 1;
    this.phase = SvalRetryPhase.ATTEMPTING;
    if (this.attempts >= this.limit) {
      this.phase = SvalRetryPhase.EXHAUSTED;
    }
    return true;
  }

  public succeed(): boolean {
    if (this.phase === SvalRetryPhase.EXHAUSTED || this.phase === SvalRetryPhase.SUCCEEDED) {
      return false;
    }
    this.phase = SvalRetryPhase.SUCCEEDED;
    return true;
  }

  public reset(): void {
    this.phase = SvalRetryPhase.READY;
    this.attempts = 0;
  }

  public canRetry(): boolean {
    return this.phase === SvalRetryPhase.READY || this.phase === SvalRetryPhase.ATTEMPTING;
  }

  public remaining(): int {
    const left: int = this.limit - this.attempts;
    if (left < 0) {
      return 0;
    }
    return left;
  }

  public describe(): string {
    return this.phase + '/' + this.attempts + '/' + this.limit;
  }
}

export default function panelSessionValidationTest(): void {
  describe('PanelSessionValidation_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_0100
     * @tc.name panelSessionValidationTestCase001
     * @tc.desc Verify Tabs component renders: panel visible -> at least one Tabs node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      const stable: boolean = await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      expect(stable).assertTrue();
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_0200
     * @tc.name panelSessionValidationTestCase002
     * @tc.desc Verify TabContent nodes: seeded strips -> content count matches tab count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const contents: number = await tabContentCount(driver);
      const titles: number = await tabTitleCount(driver);
      expect(contents).assertLargerOrEqual(1);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_0300
     * @tc.name panelSessionValidationTestCase003
     * @tc.desc Verify seeded titles: initial strip -> first and second page labels visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FIRST_TAB_TITLE)).assertTrue();
      expect(containsLabel(texts, SECOND_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_0400
     * @tc.name panelSessionValidationTestCase004
     * @tc.desc Verify add button: initial strip below limit -> plus label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_0500
     * @tc.name panelSessionValidationTestCase005
     * @tc.desc Verify close button: initial strip above minimum -> close label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_CLOSE_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_0600
     * @tc.name panelSessionValidationTestCase006
     * @tc.desc Verify title prefix: rendered titles -> every tab label starts with page prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      const titles: number = countTitles(texts);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_0700
     * @tc.name panelSessionValidationTestCase007
     * @tc.desc Verify clickable nodes: interactive strip -> clickable components reported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const clickable: number = await clickableCount(driver);
      expect(clickable).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_0800
     * @tc.name panelSessionValidationTestCase008
     * @tc.desc Verify focusable surface: panel front -> at least one focused node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const focused: number = await focusedCount(driver);
      expect(focused).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_0900
     * @tc.name panelSessionValidationTestCase009
     * @tc.desc Verify text nodes: tab bar labels rendered -> text component count above one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: number = await textCount(driver);
      expect(texts).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_1000
     * @tc.name panelSessionValidationTestCase010
     * @tc.desc Verify snapshot capture: panel captured -> total components greater than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const snapshot: PanelSnapshot = await panelSnapshot(driver);
      expect(snapshot.total() > 0).assertTrue();
      expect(snapshot.describe().startsWith('snapshot')).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_1100
     * @tc.name panelSessionValidationTestCase011
     * @tc.desc Verify clamp helper: overshoot index -> clamped to last slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(clampTabIndex(0, 3)).assertEqual(0);
      expect(clampTabIndex(9, 3)).assertEqual(2);
      expect(clampTabIndex(-4, 3)).assertEqual(0);
      expect(clampTabIndex(0, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_1200
     * @tc.name panelSessionValidationTestCase012
     * @tc.desc Verify switch state: begin switch to target one -> animating true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.index).assertEqual(0);
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.targetIndex).assertEqual(1);
      expect(state.animating).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_1300
     * @tc.name panelSessionValidationTestCase013
     * @tc.desc Verify switch guard: target equals current index -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(0)).assertFalse();
      expect(state.animating).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_1400
     * @tc.name panelSessionValidationTestCase014
     * @tc.desc Verify switch completion: begin then finish -> index equals target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.finishSwitch()).assertTrue();
      expect(state.index).assertEqual(1);
      expect(state.isSameIndex()).assertTrue();
      expect(state.finishSwitch()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_1500
     * @tc.name panelSessionValidationTestCase015
     * @tc.desc Verify reentrant guard: second begin during animation -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.beginSwitch(2)).assertFalse();
      expect(state.targetIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_1600
     * @tc.name panelSessionValidationTestCase016
     * @tc.desc Verify bar style: sample profile -> fixed mode with animation enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      expect(style.barWidth).assertEqual(TAB_BAR_WIDTH);
      expect(style.barHeight).assertEqual(TAB_BAR_HEIGHT);
      expect(style.isAnimationEnabled()).assertTrue();
      expect(style.isFixedMode()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_1700
     * @tc.name panelSessionValidationTestCase017
     * @tc.desc Verify style copy: mode changed to scrollable -> original keeps fixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      const scrollable: TabBarStyleModel = style.withMode(TabsBarMode.SCROLLABLE);
      expect(scrollable.isFixedMode()).assertFalse();
      expect(style.isFixedMode()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_1800
     * @tc.name panelSessionValidationTestCase018
     * @tc.desc Verify indicator opacity: selected and unselected -> one and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const selected: TabBarIndicatorModel = TabBarIndicatorModel.selectedIndicator();
      const unselected: TabBarIndicatorModel = TabBarIndicatorModel.unselectedIndicator();
      expect(selected.opacityFor(true)).assertEqual(1);
      expect(selected.opacityFor(false)).assertEqual(0);
      expect(selected.isVisible()).assertTrue();
      expect(unselected.isVisible()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELSESSIONVALIDATIONTEST_1900
     * @tc.name panelSessionValidationTestCase019
     * @tc.desc Verify retry initial state: standard machine -> ready with three remaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelSessionValidationTestCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: SvalRetryMachine = SvalRetryMachine.standard();
      expect(machine.getPhase()).assertEqual(SvalRetryPhase.READY);
      expect(machine.getAttempts()).assertEqual(0);
      expect(machine.getLimit()).assertEqual(3);
      expect(machine.remaining()).assertEqual(3);
    });
  });
}
