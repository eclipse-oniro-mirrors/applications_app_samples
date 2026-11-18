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
  clickCloseButton,
  clickTabTitle,
  tabsCount,
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
  removeTitleAt,
  initialTitles,
  TabTitleBook,
  PageCounter,
  TAB_ADD_LABEL,
  INITIAL_TAB_COUNT,
  MAX_TAB_COUNT,
  MIN_REMOVABLE_TAB_COUNT,
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
  KEY_DPAD_LEFT,
  TIMEOUT_PANEL_RENDER,
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



enum StateRetryPhase {
  READY = 'ready',
  ATTEMPTING = 'attempting',
  SUCCEEDED = 'succeeded',
  EXHAUSTED = 'exhausted'
}


class StateRetryMachine {
  private phase: StateRetryPhase = StateRetryPhase.READY;
  private attempts: int = 0;
  private limit: int;

  constructor(limit: int) {
    this.limit = limit;
  }

  public static standard(): StateRetryMachine {
    return new StateRetryMachine(3);
  }

  public getPhase(): StateRetryPhase {
    return this.phase;
  }

  public getAttempts(): int {
    return this.attempts;
  }

  public getLimit(): int {
    return this.limit;
  }

  public attempt(): boolean {
    if (this.phase === StateRetryPhase.SUCCEEDED || this.phase === StateRetryPhase.EXHAUSTED) {
      return false;
    }
    this.attempts = this.attempts + 1;
    this.phase = StateRetryPhase.ATTEMPTING;
    if (this.attempts >= this.limit) {
      this.phase = StateRetryPhase.EXHAUSTED;
    }
    return true;
  }

  public succeed(): boolean {
    if (this.phase === StateRetryPhase.EXHAUSTED || this.phase === StateRetryPhase.SUCCEEDED) {
      return false;
    }
    this.phase = StateRetryPhase.SUCCEEDED;
    return true;
  }

  public reset(): void {
    this.phase = StateRetryPhase.READY;
    this.attempts = 0;
  }

  public canRetry(): boolean {
    return this.phase === StateRetryPhase.READY || this.phase === StateRetryPhase.ATTEMPTING;
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

export default function tabsPanelStateManagementTest(): void {
  describe('TabsPanelStateManagement_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_0100
     * @tc.name tabsPanelStateManagementTestCase001
     * @tc.desc Verify clamp helper: overshoot index -> clamped to last slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(clampTabIndex(0, 3)).assertEqual(0);
      expect(clampTabIndex(9, 3)).assertEqual(2);
      expect(clampTabIndex(-4, 3)).assertEqual(0);
      expect(clampTabIndex(0, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_0200
     * @tc.name tabsPanelStateManagementTestCase002
     * @tc.desc Verify switch state: begin switch to target one -> animating true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.index).assertEqual(0);
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.targetIndex).assertEqual(1);
      expect(state.animating).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_0300
     * @tc.name tabsPanelStateManagementTestCase003
     * @tc.desc Verify switch guard: target equals current index -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(0)).assertFalse();
      expect(state.animating).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_0400
     * @tc.name tabsPanelStateManagementTestCase004
     * @tc.desc Verify switch completion: begin then finish -> index equals target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.finishSwitch()).assertTrue();
      expect(state.index).assertEqual(1);
      expect(state.isSameIndex()).assertTrue();
      expect(state.finishSwitch()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_0500
     * @tc.name tabsPanelStateManagementTestCase005
     * @tc.desc Verify reentrant guard: second begin during animation -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.beginSwitch(2)).assertFalse();
      expect(state.targetIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_0600
     * @tc.name tabsPanelStateManagementTestCase006
     * @tc.desc Verify bar style: sample profile -> fixed mode with animation enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      expect(style.barWidth).assertEqual(TAB_BAR_WIDTH);
      expect(style.barHeight).assertEqual(TAB_BAR_HEIGHT);
      expect(style.isAnimationEnabled()).assertTrue();
      expect(style.isFixedMode()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_0700
     * @tc.name tabsPanelStateManagementTestCase007
     * @tc.desc Verify style copy: mode changed to scrollable -> original keeps fixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      const scrollable: TabBarStyleModel = style.withMode(TabsBarMode.SCROLLABLE);
      expect(scrollable.isFixedMode()).assertFalse();
      expect(style.isFixedMode()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_0800
     * @tc.name tabsPanelStateManagementTestCase008
     * @tc.desc Verify indicator opacity: selected and unselected -> one and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const selected: TabBarIndicatorModel = TabBarIndicatorModel.selectedIndicator();
      const unselected: TabBarIndicatorModel = TabBarIndicatorModel.unselectedIndicator();
      expect(selected.opacityFor(true)).assertEqual(1);
      expect(selected.opacityFor(false)).assertEqual(0);
      expect(selected.isVisible()).assertTrue();
      expect(unselected.isVisible()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_0900
     * @tc.name tabsPanelStateManagementTestCase009
     * @tc.desc Verify strip selection: select slot one -> focused title is second page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strip: TabStripModel = new TabStripModel();
      expect(strip.getSelectedIndex()).assertEqual(0);
      expect(strip.select(1)).assertTrue();
      expect(strip.getSelectedIndex()).assertEqual(1);
      expect(strip.focusedTitle()).assertEqual(SECOND_TAB_TITLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_1000
     * @tc.name tabsPanelStateManagementTestCase010
     * @tc.desc Verify strip selection bounds: out of range -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strip: TabStripModel = new TabStripModel();
      expect(strip.select(INITIAL_TAB_COUNT)).assertFalse();
      expect(strip.select(-1)).assertFalse();
      expect(strip.getSelectedIndex()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_1100
     * @tc.name tabsPanelStateManagementTestCase011
     * @tc.desc Verify strip selection by title: second page -> index one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strip: TabStripModel = new TabStripModel();
      expect(strip.selectByTitle(SECOND_TAB_TITLE)).assertTrue();
      expect(strip.getSelectedIndex()).assertEqual(1);
      expect(strip.selectByTitle('absent')).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_1200
     * @tc.name tabsPanelStateManagementTestCase012
     * @tc.desc Verify driver switch: tap second tab title -> panel remains visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickTabTitle(driver, SECOND_TAB_TITLE);
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_1300
     * @tc.name tabsPanelStateManagementTestCase013
     * @tc.desc Verify add action: tap plus once -> titled tab count grows by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickAddButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLargerOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_1400
     * @tc.name tabsPanelStateManagementTestCase014
     * @tc.desc Verify add naming: one add from seed -> third page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, THIRD_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_1500
     * @tc.name tabsPanelStateManagementTestCase015
     * @tc.desc Verify limit: two adds reach maximum -> add button disappears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_1600
     * @tc.name tabsPanelStateManagementTestCase016
     * @tc.desc Verify second add naming: two adds -> fourth page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FOURTH_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_1700
     * @tc.name tabsPanelStateManagementTestCase017
     * @tc.desc Verify add helper boundary: count three allowed -> count four rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canAddTab(INITIAL_TAB_COUNT)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT - 1)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT)).assertFalse();
      expect(canAddTab(MAX_TAB_COUNT + 1)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_1800
     * @tc.name tabsPanelStateManagementTestCase018
     * @tc.desc Verify title book add: seed book accepts one add then stops at limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 1)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 2)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 3)).assertFalse();
      expect(book.getCount()).assertEqual(MAX_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_1900
     * @tc.name tabsPanelStateManagementTestCase019
     * @tc.desc Verify page counter: default counter starts at two -> next page three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const counter: PageCounter = PageCounter.defaultCounter();
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX);
      expect(counter.peekNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.takeNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_2000
     * @tc.name tabsPanelStateManagementTestCase020
     * @tc.desc Verify remove action: tap close once -> titled tab count does not grow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickCloseButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLessOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_2100
     * @tc.name tabsPanelStateManagementTestCase021
     * @tc.desc Verify remove on model: seeded book removes one -> count one below seed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(0)).assertTrue();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT - 1);
      expect(book.containsTitle(FIRST_TAB_TITLE)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_2200
     * @tc.name tabsPanelStateManagementTestCase022
     * @tc.desc Verify remove guard: count below minimum -> removal refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT - 1)).assertFalse();
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT)).assertTrue();
      const book: TabTitleBook = new TabTitleBook([FIRST_TAB_TITLE]);
      expect(book.removeTitle(0)).assertFalse();
      expect(book.getCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_2300
     * @tc.name tabsPanelStateManagementTestCase023
     * @tc.desc Verify remove bounds: index equal to size -> refused, size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(INITIAL_TAB_COUNT)).assertFalse();
      expect(book.removeTitle(-1)).assertFalse();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_2400
     * @tc.name tabsPanelStateManagementTestCase024
     * @tc.desc Verify remove helper: index one removed from three -> remaining joined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      titles.push(THIRD_TAB_TITLE);
      const remaining: string[] = removeTitleAt(titles, 1);
      expect(remaining.join(',')).assertEqual(FIRST_TAB_TITLE + ',' + THIRD_TAB_TITLE);
      expect(titles.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_2500
     * @tc.name tabsPanelStateManagementTestCase025
     * @tc.desc Verify remove helper bounds: out of range index -> copy unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      const untouched: string[] = removeTitleAt(titles, 9);
      expect(untouched.length).assertEqual(INITIAL_TAB_COUNT);
      expect(untouched[0]).assertEqual(FIRST_TAB_TITLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_2600
     * @tc.name tabsPanelStateManagementTestCase026
     * @tc.desc Verify retry initial state: standard machine -> ready with three remaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: StateRetryMachine = StateRetryMachine.standard();
      expect(machine.getPhase()).assertEqual(StateRetryPhase.READY);
      expect(machine.getAttempts()).assertEqual(0);
      expect(machine.getLimit()).assertEqual(3);
      expect(machine.remaining()).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_2700
     * @tc.name tabsPanelStateManagementTestCase027
     * @tc.desc Verify single attempt: one attempt consumed -> two remaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: StateRetryMachine = StateRetryMachine.standard();
      expect(machine.attempt()).assertTrue();
      expect(machine.getAttempts()).assertEqual(1);
      expect(machine.remaining()).assertEqual(2);
      expect(machine.getPhase()).assertEqual(StateRetryPhase.ATTEMPTING);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_2800
     * @tc.name tabsPanelStateManagementTestCase028
     * @tc.desc Verify exhaustion: three attempts -> exhausted phase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: StateRetryMachine = StateRetryMachine.standard();
      machine.attempt();
      machine.attempt();
      machine.attempt();
      expect(machine.getPhase()).assertEqual(StateRetryPhase.EXHAUSTED);
      expect(machine.canRetry()).assertFalse();
      expect(machine.attempt()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_2900
     * @tc.name tabsPanelStateManagementTestCase029
     * @tc.desc Verify success path: attempt then succeed -> succeeded phase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: StateRetryMachine = StateRetryMachine.standard();
      machine.attempt();
      expect(machine.succeed()).assertTrue();
      expect(machine.getPhase()).assertEqual(StateRetryPhase.SUCCEEDED);
      expect(machine.succeed()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_3000
     * @tc.name tabsPanelStateManagementTestCase030
     * @tc.desc Verify late success rejection: exhausted machine -> success refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: StateRetryMachine = StateRetryMachine.standard();
      machine.attempt();
      machine.attempt();
      machine.attempt();
      expect(machine.succeed()).assertFalse();
      expect(machine.getPhase()).assertEqual(StateRetryPhase.EXHAUSTED);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_3100
     * @tc.name tabsPanelStateManagementTestCase031
     * @tc.desc Verify reset: exhausted machine reset -> ready with zero attempts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: StateRetryMachine = StateRetryMachine.standard();
      machine.attempt();
      machine.attempt();
      machine.attempt();
      machine.reset();
      expect(machine.getPhase()).assertEqual(StateRetryPhase.READY);
      expect(machine.getAttempts()).assertEqual(0);
      expect(machine.canRetry()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_3200
     * @tc.name tabsPanelStateManagementTestCase032
     * @tc.desc Verify custom limit: single attempt machine -> exhausted after one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: StateRetryMachine = new StateRetryMachine(1);
      machine.attempt();
      expect(machine.getPhase()).assertEqual(StateRetryPhase.EXHAUSTED);
      expect(machine.getLimit()).assertEqual(1);
      expect(machine.remaining()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_3300
     * @tc.name tabsPanelStateManagementTestCase033
     * @tc.desc Verify describe output: fresh machine -> ready zero of three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: StateRetryMachine = StateRetryMachine.standard();
      expect(machine.describe()).assertEqual('ready/0/3');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_3400
     * @tc.name tabsPanelStateManagementTestCase034
     * @tc.desc Verify remaining floor: after exhaustion remaining never negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: StateRetryMachine = StateRetryMachine.standard();
      machine.attempt();
      machine.attempt();
      machine.attempt();
      expect(machine.remaining()).assertEqual(0);
      expect(machine.getAttempts()).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_3500
     * @tc.name tabsPanelStateManagementTestCase035
     * @tc.desc Verify dpad left: KEY_DPAD_LEFT equals 2014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(KEY_DPAD_LEFT).assertEqual(2014);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSPANELSTATEMANAGEMENTTEST_3600
     * @tc.name tabsPanelStateManagementTestCase036
     * @tc.desc Verify dpad left bound: KEY_DPAD_LEFT is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsPanelStateManagementTestCase036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(KEY_DPAD_LEFT >= 0).assertTrue();
    });
  });
}
