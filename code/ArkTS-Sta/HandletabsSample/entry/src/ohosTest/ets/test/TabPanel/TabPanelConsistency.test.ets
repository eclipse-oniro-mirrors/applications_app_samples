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
  INITIAL_TAB_COUNT,
  FIRST_TAB_TITLE,
  SECOND_TAB_TITLE,
  TAB_BAR_WIDTH,
  TAB_BAR_HEIGHT,
  TAB_ANIMATION_DURATION,
  TAB_DIVIDER_STROKE,
  SELECTED_FONT_COLOR,
  TIMEOUT_STATE_SETTLE,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';


class TabDescriptor {
  public title: string;
  public indexValue: int;
  public focused: boolean;
  public removable: boolean;

  constructor(title: string, indexValue: int, focused: boolean, removable: boolean) {
    this.title = title;
    this.indexValue = indexValue;
    this.focused = focused;
    this.removable = removable;
  }

  public static createDefault(): TabDescriptor {
    return new TabDescriptor('', 0, false, false);
  }

  public static create(title: string, indexValue: int): TabDescriptor {
    const descriptor: TabDescriptor = new TabDescriptor(title, indexValue, false, true);
    return descriptor;
  }

  public getTitle(): string {
    return this.title;
  }

  public getIndex(): int {
    return this.indexValue;
  }

  public isFocusedState(): boolean {
    return this.focused;
  }

  public isRemovable(): boolean {
    return this.removable;
  }

  public setFocused(next: boolean): void {
    this.focused = next;
  }

  public setTitle(next: string): void {
    this.title = next;
  }

  public clone(): TabDescriptor {
    return new TabDescriptor(this.title, this.indexValue, this.focused, this.removable);
  }

  public equals(other: TabDescriptor): boolean {
    return this.title === other.title && this.indexValue === other.indexValue &&
      this.focused === other.focused && this.removable === other.removable;
  }

  public isValidIndex(total: int): boolean {
    return this.indexValue >= 0 && this.indexValue < total;
  }

  public describe(): string {
    return `tab{${this.title}:${this.indexValue}:${this.focused}}`;
  }
}

class TabStripModel {
  private tabs: TabDescriptor[] = [];
  private selected: int = 0;

  constructor() {
    this.tabs.push(new TabDescriptor(FIRST_TAB_TITLE, 0, true, true));
    this.tabs.push(new TabDescriptor(SECOND_TAB_TITLE, 1, false, true));
  }

  public getTabs(): TabDescriptor[] {
    return this.tabs.slice(0);
  }

  public getCount(): int {
    return this.tabs.length;
  }

  public getSelectedIndex(): int {
    return this.selected;
  }

  public select(index: int): boolean {
    if (index < 0 || index >= this.tabs.length) {
      return false;
    }
    for (let cursor: int = 0; cursor < this.tabs.length; cursor++) {
      const current: TabDescriptor = this.tabs[cursor];
      current.setFocused(cursor === index);
    }
    this.selected = index;
    return true;
  }

  public selectByTitle(title: string): boolean {
    for (let cursor: int = 0; cursor < this.tabs.length; cursor++) {
      if (this.tabs[cursor].getTitle() === title) {
        return this.select(cursor);
      }
    }
    return false;
  }

  public addTab(title: string): boolean {
    if (!canAddTab(this.tabs.length)) {
      return false;
    }
    const descriptor: TabDescriptor = new TabDescriptor(title, this.tabs.length, false, true);
    this.tabs.push(descriptor);
    return true;
  }

  public removeTab(index: int): boolean {
    if (!canRemoveTab(this.tabs.length)) {
      return false;
    }
    if (index < 0 || index >= this.tabs.length) {
      return false;
    }
    this.tabs.splice(index, 1);
    this.reindex();
    if (this.selected >= this.tabs.length) {
      this.selected = this.tabs.length - 1;
    }
    return true;
  }

  private reindex(): void {
    for (let cursor: int = 0; cursor < this.tabs.length; cursor++) {
      const current: TabDescriptor = this.tabs[cursor];
      current.indexValue = cursor;
    }
  }

  public titles(): string[] {
    return this.tabs.map((item: TabDescriptor) => item.title);
  }

  public focusedTitle(): string {
    for (let cursor: int = 0; cursor < this.tabs.length; cursor++) {
      if (this.tabs[cursor].isFocusedState()) {
        return this.tabs[cursor].getTitle();
      }
    }
    return '';
  }

  public canAdd(): boolean {
    return canAddTab(this.tabs.length);
  }

  public canRemove(): boolean {
    return canRemoveTab(this.tabs.length);
  }

  public reset(): void {
    this.tabs = [];
    this.tabs.push(new TabDescriptor(FIRST_TAB_TITLE, 0, true, true));
    this.tabs.push(new TabDescriptor(SECOND_TAB_TITLE, 1, false, true));
    this.selected = 0;
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

export default function tabPanelConsistencyTest(): void {
  describe('TabPanelConsistency_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELCONSISTENCYTEST_0100
     * @tc.name tabPanelConsistencyTestCase001
     * @tc.desc Verify clamp helper: overshoot index -> clamped to last slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelConsistencyTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(clampTabIndex(0, 3)).assertEqual(0);
      expect(clampTabIndex(9, 3)).assertEqual(2);
      expect(clampTabIndex(-4, 3)).assertEqual(0);
      expect(clampTabIndex(0, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELCONSISTENCYTEST_0200
     * @tc.name tabPanelConsistencyTestCase002
     * @tc.desc Verify switch state: begin switch to target one -> animating true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelConsistencyTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.index).assertEqual(0);
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.targetIndex).assertEqual(1);
      expect(state.animating).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELCONSISTENCYTEST_0300
     * @tc.name tabPanelConsistencyTestCase003
     * @tc.desc Verify switch guard: target equals current index -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelConsistencyTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(0)).assertFalse();
      expect(state.animating).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELCONSISTENCYTEST_0400
     * @tc.name tabPanelConsistencyTestCase004
     * @tc.desc Verify switch completion: begin then finish -> index equals target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelConsistencyTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.finishSwitch()).assertTrue();
      expect(state.index).assertEqual(1);
      expect(state.isSameIndex()).assertTrue();
      expect(state.finishSwitch()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELCONSISTENCYTEST_0500
     * @tc.name tabPanelConsistencyTestCase005
     * @tc.desc Verify reentrant guard: second begin during animation -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelConsistencyTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.beginSwitch(2)).assertFalse();
      expect(state.targetIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELCONSISTENCYTEST_0600
     * @tc.name tabPanelConsistencyTestCase006
     * @tc.desc Verify bar style: sample profile -> fixed mode with animation enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelConsistencyTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      expect(style.barWidth).assertEqual(TAB_BAR_WIDTH);
      expect(style.barHeight).assertEqual(TAB_BAR_HEIGHT);
      expect(style.isAnimationEnabled()).assertTrue();
      expect(style.isFixedMode()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELCONSISTENCYTEST_0700
     * @tc.name tabPanelConsistencyTestCase007
     * @tc.desc Verify style copy: mode changed to scrollable -> original keeps fixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelConsistencyTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      const scrollable: TabBarStyleModel = style.withMode(TabsBarMode.SCROLLABLE);
      expect(scrollable.isFixedMode()).assertFalse();
      expect(style.isFixedMode()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELCONSISTENCYTEST_0800
     * @tc.name tabPanelConsistencyTestCase008
     * @tc.desc Verify indicator opacity: selected and unselected -> one and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelConsistencyTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const selected: TabBarIndicatorModel = TabBarIndicatorModel.selectedIndicator();
      const unselected: TabBarIndicatorModel = TabBarIndicatorModel.unselectedIndicator();
      expect(selected.opacityFor(true)).assertEqual(1);
      expect(selected.opacityFor(false)).assertEqual(0);
      expect(selected.isVisible()).assertTrue();
      expect(unselected.isVisible()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELCONSISTENCYTEST_0900
     * @tc.name tabPanelConsistencyTestCase009
     * @tc.desc Verify strip selection: select slot one -> focused title is second page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelConsistencyTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strip: TabStripModel = new TabStripModel();
      expect(strip.getSelectedIndex()).assertEqual(0);
      expect(strip.select(1)).assertTrue();
      expect(strip.getSelectedIndex()).assertEqual(1);
      expect(strip.focusedTitle()).assertEqual(SECOND_TAB_TITLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELCONSISTENCYTEST_1000
     * @tc.name tabPanelConsistencyTestCase010
     * @tc.desc Verify strip selection bounds: out of range -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelConsistencyTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strip: TabStripModel = new TabStripModel();
      expect(strip.select(INITIAL_TAB_COUNT)).assertFalse();
      expect(strip.select(-1)).assertFalse();
      expect(strip.getSelectedIndex()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELCONSISTENCYTEST_1100
     * @tc.name tabPanelConsistencyTestCase011
     * @tc.desc Verify strip selection by title: second page -> index one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelConsistencyTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strip: TabStripModel = new TabStripModel();
      expect(strip.selectByTitle(SECOND_TAB_TITLE)).assertTrue();
      expect(strip.getSelectedIndex()).assertEqual(1);
      expect(strip.selectByTitle('absent')).assertFalse();
    });
  });
}
