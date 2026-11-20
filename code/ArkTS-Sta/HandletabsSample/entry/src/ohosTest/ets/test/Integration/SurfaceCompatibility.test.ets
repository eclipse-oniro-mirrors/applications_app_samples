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
  getDriver,
  serializedDelay,
  settlePanel,
  resetPanelToInitial,
  bringPanelToFront,
  canAddTab,
  canRemoveTab,
  clampTabIndex,
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
  TIMEOUT_STATE_SETTLE,
  DELAY_KEY_NAVIGATION
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



enum CompPhase {
  IDLE = 'idle',
  RUNNING = 'running',
  FINISHED = 'finished',
  ABORTED = 'aborted'
}


class CompAnimator {
  private phase: CompPhase = CompPhase.IDLE;
  private duration: int;
  private elapsed: int = 0;

  constructor(duration: int) {
    this.duration = duration;
  }

  public getPhase(): CompPhase {
    return this.phase;
  }

  public getElapsed(): int {
    return this.elapsed;
  }

  public getDuration(): int {
    return this.duration;
  }

  public start(): boolean {
    if (this.phase !== CompPhase.IDLE && this.phase !== CompPhase.FINISHED) {
      return false;
    }
    this.phase = CompPhase.RUNNING;
    this.elapsed = 0;
    return true;
  }

  public advance(stepMs: int): void {
    if (this.phase !== CompPhase.RUNNING) {
      return;
    }
    this.elapsed = this.elapsed + stepMs;
    if (this.elapsed >= this.duration) {
      this.elapsed = this.duration;
      this.phase = CompPhase.FINISHED;
    }
  }

  public abort(): boolean {
    if (this.phase !== CompPhase.RUNNING) {
      return false;
    }
    this.phase = CompPhase.ABORTED;
    return true;
  }

  public isFinished(): boolean {
    return this.phase === CompPhase.FINISHED;
  }

  public progress(): number {
    if (this.duration <= 0) {
      return 1;
    }
    return this.elapsed / this.duration;
  }

  public reset(): void {
    this.phase = CompPhase.IDLE;
    this.elapsed = 0;
  }
}

export default function tabsSurfaceCompatibilityTest(): void {
  describe('TabsSurfaceCompatibility_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_0100
     * @tc.name tabsSurfaceCompatibilityTestCase001
     * @tc.desc Verify light profile: default colours -> theme light
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const profile: TabStyleProfile = TabStyleProfile.light();
      expect(profile.isTheme(TabTheme.LIGHT)).assertTrue();
      expect(profile.colorFor(false)).assertEqual(DEFAULT_FONT_COLOR);
      expect(profile.colorFor(true)).assertEqual(SELECTED_FONT_COLOR);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_0200
     * @tc.name tabsSurfaceCompatibilityTestCase002
     * @tc.desc Verify dark profile: unselected colour white -> theme dark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const profile: TabStyleProfile = TabStyleProfile.dark();
      expect(profile.isTheme(TabTheme.DARK)).assertTrue();
      expect(profile.colorFor(false)).assertEqual('#FFFFFF');
      expect(profile.colorFor(true)).assertEqual(SELECTED_FONT_COLOR);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_0300
     * @tc.name tabsSurfaceCompatibilityTestCase003
     * @tc.desc Verify font weight: selected uses heavier weight than normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const profile: TabStyleProfile = TabStyleProfile.light();
      expect(profile.weightFor(true)).assertEqual(TAB_FONT_WEIGHT_SELECTED);
      expect(profile.weightFor(false)).assertEqual(TAB_FONT_WEIGHT_NORMAL);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_0400
     * @tc.name tabsSurfaceCompatibilityTestCase004
     * @tc.desc Verify layout spans: sample margins -> horizontal and vertical totals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const layout: TabLayoutModel = TabLayoutModel.sample();
      expect(layout.horizontalSpan()).assertEqual(TAB_MARGIN_SIDE * 2);
      expect(layout.verticalSpan()).assertEqual(TAB_MARGIN_TOP + TAB_MARGIN_BOTTOM);
      expect(layout.closeMarginLeft).assertEqual(TAB_CLOSE_MARGIN_LEFT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_0500
     * @tc.name tabsSurfaceCompatibilityTestCase005
     * @tc.desc Verify layout describe: sample layout -> margin triple in description
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const layout: TabLayoutModel = TabLayoutModel.sample();
      const expected: string = `layout{${TAB_MARGIN_SIDE}:${TAB_MARGIN_TOP}:${TAB_MARGIN_BOTTOM}}`;
      expect(layout.describe()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_0600
     * @tc.name tabsSurfaceCompatibilityTestCase006
     * @tc.desc Verify colour constants: selected and background values as declared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(SELECTED_FONT_COLOR).assertEqual('#007DFF');
      expect(TABS_BACKGROUND).assertEqual('#F1F3F5');
      expect(TAB_CONTENT_BACKGROUND).assertEqual('#007DFF');
      expect(ADD_BUTTON_FONT_COLOR).assertEqual('#707070');
      expect(CLOSE_BUTTON_COLOR).assertEqual('red');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_0700
     * @tc.name tabsSurfaceCompatibilityTestCase007
     * @tc.desc Verify dimension constants: bar width, height, and animation duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_BAR_WIDTH).assertEqual(360);
      expect(TAB_BAR_HEIGHT).assertEqual(56);
      expect(TAB_CONTENT_HEIGHT).assertEqual(296);
      expect(TAB_ANIMATION_DURATION).assertEqual(400);
      expect(TAB_DIVIDER_STROKE).assertEqual(2);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_0800
     * @tc.name tabsSurfaceCompatibilityTestCase008
     * @tc.desc Verify clamp helper: overshoot index -> clamped to last slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(clampTabIndex(0, 3)).assertEqual(0);
      expect(clampTabIndex(9, 3)).assertEqual(2);
      expect(clampTabIndex(-4, 3)).assertEqual(0);
      expect(clampTabIndex(0, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_0900
     * @tc.name tabsSurfaceCompatibilityTestCase009
     * @tc.desc Verify switch state: begin switch to target one -> animating true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.index).assertEqual(0);
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.targetIndex).assertEqual(1);
      expect(state.animating).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_1000
     * @tc.name tabsSurfaceCompatibilityTestCase010
     * @tc.desc Verify switch guard: target equals current index -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(0)).assertFalse();
      expect(state.animating).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_1100
     * @tc.name tabsSurfaceCompatibilityTestCase011
     * @tc.desc Verify switch completion: begin then finish -> index equals target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.finishSwitch()).assertTrue();
      expect(state.index).assertEqual(1);
      expect(state.isSameIndex()).assertTrue();
      expect(state.finishSwitch()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_1200
     * @tc.name tabsSurfaceCompatibilityTestCase012
     * @tc.desc Verify reentrant guard: second begin during animation -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.beginSwitch(2)).assertFalse();
      expect(state.targetIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_1300
     * @tc.name tabsSurfaceCompatibilityTestCase013
     * @tc.desc Verify bar style: sample profile -> fixed mode with animation enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      expect(style.barWidth).assertEqual(TAB_BAR_WIDTH);
      expect(style.barHeight).assertEqual(TAB_BAR_HEIGHT);
      expect(style.isAnimationEnabled()).assertTrue();
      expect(style.isFixedMode()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_1400
     * @tc.name tabsSurfaceCompatibilityTestCase014
     * @tc.desc Verify style copy: mode changed to scrollable -> original keeps fixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      const scrollable: TabBarStyleModel = style.withMode(TabsBarMode.SCROLLABLE);
      expect(scrollable.isFixedMode()).assertFalse();
      expect(style.isFixedMode()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_1500
     * @tc.name tabsSurfaceCompatibilityTestCase015
     * @tc.desc Verify indicator opacity: selected and unselected -> one and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const selected: TabBarIndicatorModel = TabBarIndicatorModel.selectedIndicator();
      const unselected: TabBarIndicatorModel = TabBarIndicatorModel.unselectedIndicator();
      expect(selected.opacityFor(true)).assertEqual(1);
      expect(selected.opacityFor(false)).assertEqual(0);
      expect(selected.isVisible()).assertTrue();
      expect(unselected.isVisible()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_1600
     * @tc.name tabsSurfaceCompatibilityTestCase016
     * @tc.desc Verify animation start: fresh animator -> running phase at zero elapsed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const animator: CompAnimator = new CompAnimator(400);
      expect(animator.getPhase()).assertEqual(CompPhase.IDLE);
      expect(animator.start()).assertTrue();
      expect(animator.getPhase()).assertEqual(CompPhase.RUNNING);
      expect(animator.getElapsed()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_1700
     * @tc.name tabsSurfaceCompatibilityTestCase017
     * @tc.desc Verify partial advance: first step 100 -> elapsed equals step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const animator: CompAnimator = new CompAnimator(400);
      animator.start();
      animator.advance(100);
      expect(animator.getElapsed()).assertEqual(100);
      expect(animator.isFinished()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSSURFACECOMPATIBILITYTEST_1800
     * @tc.name tabsSurfaceCompatibilityTestCase018
     * @tc.desc Verify key nav delay: DELAY_KEY_NAVIGATION equals 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsSurfaceCompatibilityTestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(DELAY_KEY_NAVIGATION).assertEqual(50);
    });
  });
}
