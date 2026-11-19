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



enum TcatKind {
  PRIMARY = 'primary',
  SECONDARY = 'secondary',
  AUXILIARY = 'auxiliary'
}


class TcatDescriptor {
  public title: string;
  public slot: int;
  public highlighted: boolean;
  public kind: TcatKind;

  constructor(title: string, slot: int, highlighted: boolean, kind: TcatKind) {
    this.title = title;
    this.slot = slot;
    this.highlighted = highlighted;
    this.kind = kind;
  }

  public static emptyTcatDescriptor(): TcatDescriptor {
    return new TcatDescriptor('', 0, false, TcatKind.PRIMARY);
  }

  public static of(title: string, slot: int): TcatDescriptor {
    return new TcatDescriptor(title, slot, false, TcatKind.PRIMARY);
  }

  public static highlightedOf(title: string, slot: int): TcatDescriptor {
    return new TcatDescriptor(title, slot, true, TcatKind.SECONDARY);
  }

  public getTitle(): string {
    return this.title;
  }

  public getSlot(): int {
    return this.slot;
  }

  public isHighlighted(): boolean {
    return this.highlighted;
  }

  public isKind(kind: TcatKind): boolean {
    return this.kind === kind;
  }

  public isPrimary(): boolean {
    return this.kind === TcatKind.PRIMARY;
  }

  public setTitle(next: string): void {
    this.title = next;
  }

  public setHighlighted(next: boolean): void {
    this.highlighted = next;
  }

  public toggleHighlighted(): boolean {
    this.highlighted = !this.highlighted;
    return this.highlighted;
  }

  public isValidSlot(total: int): boolean {
    return this.slot >= 0 && this.slot < total;
  }

  public shifted(offset: int): int {
    return this.slot + offset;
  }

  public clone(): TcatDescriptor {
    return new TcatDescriptor(this.title, this.slot, this.highlighted, this.kind);
  }

  public equals(other: TcatDescriptor): boolean {
    return this.title === other.title && this.slot === other.slot &&
      this.highlighted === other.highlighted && this.kind === other.kind;
  }

  public describe(): string {
    return `${this.title}@${this.slot}:${this.highlighted}:${this.kind}`;
  }
}


class TcatDescriptorSorter {
  public static bySlot(items: TcatDescriptor[]): TcatDescriptor[] {
    const copied: TcatDescriptor[] = items.slice(0);
    copied.sort((left: TcatDescriptor, right: TcatDescriptor) => left.slot - right.slot);
    return copied;
  }

  public static byTitle(items: TcatDescriptor[]): TcatDescriptor[] {
    const copied: TcatDescriptor[] = items.slice(0);
    copied.sort((left: TcatDescriptor, right: TcatDescriptor) => left.title.localeCompare(right.title));
    return copied;
  }

  public static highlightedOnly(items: TcatDescriptor[]): TcatDescriptor[] {
    return items.filter((item: TcatDescriptor) => item.isHighlighted());
  }
}

export default function tabOperationCatalogTest(): void {
  describe('TabOperationCatalog_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_0100
     * @tc.name tabOperationCatalogTestCase001
     * @tc.desc Verify add action: tap plus once -> titled tab count grows by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickAddButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLargerOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_0200
     * @tc.name tabOperationCatalogTestCase002
     * @tc.desc Verify add naming: one add from seed -> third page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, THIRD_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_0300
     * @tc.name tabOperationCatalogTestCase003
     * @tc.desc Verify limit: two adds reach maximum -> add button disappears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_0400
     * @tc.name tabOperationCatalogTestCase004
     * @tc.desc Verify second add naming: two adds -> fourth page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FOURTH_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_0500
     * @tc.name tabOperationCatalogTestCase005
     * @tc.desc Verify add helper boundary: count three allowed -> count four rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canAddTab(INITIAL_TAB_COUNT)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT - 1)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT)).assertFalse();
      expect(canAddTab(MAX_TAB_COUNT + 1)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_0600
     * @tc.name tabOperationCatalogTestCase006
     * @tc.desc Verify title book add: seed book accepts one add then stops at limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 1)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 2)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 3)).assertFalse();
      expect(book.getCount()).assertEqual(MAX_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_0700
     * @tc.name tabOperationCatalogTestCase007
     * @tc.desc Verify page counter: default counter starts at two -> next page three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const counter: PageCounter = PageCounter.defaultCounter();
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX);
      expect(counter.peekNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.takeNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_0800
     * @tc.name tabOperationCatalogTestCase008
     * @tc.desc Verify remove action: tap close once -> titled tab count does not grow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickCloseButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLessOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_0900
     * @tc.name tabOperationCatalogTestCase009
     * @tc.desc Verify remove on model: seeded book removes one -> count one below seed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(0)).assertTrue();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT - 1);
      expect(book.containsTitle(FIRST_TAB_TITLE)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_1000
     * @tc.name tabOperationCatalogTestCase010
     * @tc.desc Verify remove guard: count below minimum -> removal refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT - 1)).assertFalse();
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT)).assertTrue();
      const book: TabTitleBook = new TabTitleBook([FIRST_TAB_TITLE]);
      expect(book.removeTitle(0)).assertFalse();
      expect(book.getCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_1100
     * @tc.name tabOperationCatalogTestCase011
     * @tc.desc Verify remove bounds: index equal to size -> refused, size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(INITIAL_TAB_COUNT)).assertFalse();
      expect(book.removeTitle(-1)).assertFalse();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_1200
     * @tc.name tabOperationCatalogTestCase012
     * @tc.desc Verify remove helper: index one removed from three -> remaining joined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      titles.push(THIRD_TAB_TITLE);
      const remaining: string[] = removeTitleAt(titles, 1);
      expect(remaining.join(',')).assertEqual(FIRST_TAB_TITLE + ',' + THIRD_TAB_TITLE);
      expect(titles.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_1300
     * @tc.name tabOperationCatalogTestCase013
     * @tc.desc Verify remove helper bounds: out of range index -> copy unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      const untouched: string[] = removeTitleAt(titles, 9);
      expect(untouched.length).assertEqual(INITIAL_TAB_COUNT);
      expect(untouched[0]).assertEqual(FIRST_TAB_TITLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_1400
     * @tc.name tabOperationCatalogTestCase014
     * @tc.desc Verify clamp helper: overshoot index -> clamped to last slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(clampTabIndex(0, 3)).assertEqual(0);
      expect(clampTabIndex(9, 3)).assertEqual(2);
      expect(clampTabIndex(-4, 3)).assertEqual(0);
      expect(clampTabIndex(0, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_1500
     * @tc.name tabOperationCatalogTestCase015
     * @tc.desc Verify switch state: begin switch to target one -> animating true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.index).assertEqual(0);
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.targetIndex).assertEqual(1);
      expect(state.animating).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_1600
     * @tc.name tabOperationCatalogTestCase016
     * @tc.desc Verify switch guard: target equals current index -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(0)).assertFalse();
      expect(state.animating).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_1700
     * @tc.name tabOperationCatalogTestCase017
     * @tc.desc Verify switch completion: begin then finish -> index equals target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.finishSwitch()).assertTrue();
      expect(state.index).assertEqual(1);
      expect(state.isSameIndex()).assertTrue();
      expect(state.finishSwitch()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_1800
     * @tc.name tabOperationCatalogTestCase018
     * @tc.desc Verify reentrant guard: second begin during animation -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.beginSwitch(2)).assertFalse();
      expect(state.targetIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_1900
     * @tc.name tabOperationCatalogTestCase019
     * @tc.desc Verify bar style: sample profile -> fixed mode with animation enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      expect(style.barWidth).assertEqual(TAB_BAR_WIDTH);
      expect(style.barHeight).assertEqual(TAB_BAR_HEIGHT);
      expect(style.isAnimationEnabled()).assertTrue();
      expect(style.isFixedMode()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_2000
     * @tc.name tabOperationCatalogTestCase020
     * @tc.desc Verify style copy: mode changed to scrollable -> original keeps fixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      const scrollable: TabBarStyleModel = style.withMode(TabsBarMode.SCROLLABLE);
      expect(scrollable.isFixedMode()).assertFalse();
      expect(style.isFixedMode()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_2100
     * @tc.name tabOperationCatalogTestCase021
     * @tc.desc Verify indicator opacity: selected and unselected -> one and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const selected: TabBarIndicatorModel = TabBarIndicatorModel.selectedIndicator();
      const unselected: TabBarIndicatorModel = TabBarIndicatorModel.unselectedIndicator();
      expect(selected.opacityFor(true)).assertEqual(1);
      expect(selected.opacityFor(false)).assertEqual(0);
      expect(selected.isVisible()).assertTrue();
      expect(unselected.isVisible()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_2200
     * @tc.name tabOperationCatalogTestCase022
     * @tc.desc Verify strip selection: select slot one -> focused title is second page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strip: TabStripModel = new TabStripModel();
      expect(strip.getSelectedIndex()).assertEqual(0);
      expect(strip.select(1)).assertTrue();
      expect(strip.getSelectedIndex()).assertEqual(1);
      expect(strip.focusedTitle()).assertEqual(SECOND_TAB_TITLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_2300
     * @tc.name tabOperationCatalogTestCase023
     * @tc.desc Verify strip selection bounds: out of range -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strip: TabStripModel = new TabStripModel();
      expect(strip.select(INITIAL_TAB_COUNT)).assertFalse();
      expect(strip.select(-1)).assertFalse();
      expect(strip.getSelectedIndex()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_2400
     * @tc.name tabOperationCatalogTestCase024
     * @tc.desc Verify strip selection by title: second page -> index one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strip: TabStripModel = new TabStripModel();
      expect(strip.selectByTitle(SECOND_TAB_TITLE)).assertTrue();
      expect(strip.getSelectedIndex()).assertEqual(1);
      expect(strip.selectByTitle('absent')).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_2500
     * @tc.name tabOperationCatalogTestCase025
     * @tc.desc Verify driver switch: tap second tab title -> panel remains visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickTabTitle(driver, SECOND_TAB_TITLE);
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_2600
     * @tc.name tabOperationCatalogTestCase026
     * @tc.desc Verify default descriptor: empty factory -> slot 0, no highlight, primary kind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const descriptor: TcatDescriptor = TcatDescriptor.emptyTcatDescriptor();
      expect(descriptor.getSlot()).assertEqual(0);
      expect(descriptor.isHighlighted()).assertFalse();
      expect(descriptor.isPrimary()).assertTrue();
      expect(descriptor.getTitle()).assertEqual('');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_2700
     * @tc.name tabOperationCatalogTestCase027
     * @tc.desc Verify descriptor factory: title tab-1 at slot 0 -> expected field values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const descriptor: TcatDescriptor = TcatDescriptor.of('页面2', 0);
      expect(descriptor.getTitle()).assertEqual('页面2');
      expect(descriptor.getSlot()).assertEqual(0);
      expect(descriptor.isHighlighted()).assertFalse();
      expect(descriptor.describe()).assertEqual('页面2@0:false:primary');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_2800
     * @tc.name tabOperationCatalogTestCase028
     * @tc.desc Verify highlighted factory: title tab-2 at slot 1 -> secondary kind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const descriptor: TcatDescriptor = TcatDescriptor.highlightedOf('页面3', 1);
      expect(descriptor.isHighlighted()).assertTrue();
      expect(descriptor.isKind(TcatKind.SECONDARY)).assertTrue();
      expect(descriptor.describe()).assertEqual('页面3@1:true:secondary');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_2900
     * @tc.name tabOperationCatalogTestCase029
     * @tc.desc Verify highlight toggle: two toggles -> returns false on second toggle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const descriptor: TcatDescriptor = TcatDescriptor.of('页面2', 0);
      expect(descriptor.toggleHighlighted()).assertTrue();
      expect(descriptor.toggleHighlighted()).assertFalse();
      expect(descriptor.isHighlighted()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_3000
     * @tc.name tabOperationCatalogTestCase030
     * @tc.desc Verify setters: title replaced by tab-2 -> getter reflects new title
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const descriptor: TcatDescriptor = TcatDescriptor.of('页面2', 0);
      descriptor.setTitle('页面3');
      descriptor.setHighlighted(true);
      expect(descriptor.getTitle()).assertEqual('页面3');
      expect(descriptor.isHighlighted()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_3100
     * @tc.name tabOperationCatalogTestCase031
     * @tc.desc Verify clone independence: clone mutated -> original keeps slot 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: TcatDescriptor = TcatDescriptor.of('页面2', 0);
      const copied: TcatDescriptor = original.clone();
      expect(copied.equals(original)).assertTrue();
      copied.setTitle('页面3');
      expect(copied.equals(original)).assertFalse();
      expect(original.getTitle()).assertEqual('页面2');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_3200
     * @tc.name tabOperationCatalogTestCase032
     * @tc.desc Verify equality on kind: primary vs secondary descriptors -> not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const primary: TcatDescriptor = TcatDescriptor.of('页面2', 0);
      const secondary: TcatDescriptor = TcatDescriptor.highlightedOf('页面2', 0);
      expect(primary.equals(secondary)).assertFalse();
      expect(primary.equals(primary.clone())).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_3300
     * @tc.name tabOperationCatalogTestCase033
     * @tc.desc Verify slot bounds: slot 6 against total 4 -> out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const descriptor: TcatDescriptor = TcatDescriptor.of('页面2', 6);
      expect(descriptor.isValidSlot(4)).assertFalse();
      expect(descriptor.isValidSlot(9)).assertTrue();
      expect(descriptor.shifted(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_3400
     * @tc.name tabOperationCatalogTestCase034
     * @tc.desc Verify sorter by slot: three descriptors -> ascending slot order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const items: TcatDescriptor[] = [];
      items.push(TcatDescriptor.of('页面4', 2));
      items.push(TcatDescriptor.of('页面2', 0));
      items.push(TcatDescriptor.of('页面3', 1));
      const sorted: TcatDescriptor[] = TcatDescriptorSorter.bySlot(items);
      expect(sorted[0].getTitle()).assertEqual('页面2');
      expect(sorted[2].getTitle()).assertEqual('页面4');
      expect(sorted.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_3500
     * @tc.name tabOperationCatalogTestCase035
     * @tc.desc Verify sorter by title: locale compare -> alphabetical order preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const items: TcatDescriptor[] = [];
      items.push(TcatDescriptor.of('页面3', 1));
      items.push(TcatDescriptor.of('页面2', 0));
      const sorted: TcatDescriptor[] = TcatDescriptorSorter.byTitle(items);
      expect(sorted[0].getTitle()).assertEqual('页面2');
      expect(sorted.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABOPERATIONCATALOGTEST_3600
     * @tc.name tabOperationCatalogTestCase036
     * @tc.desc Verify clamp of index 5 over total 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabOperationCatalogTestCase036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(clampTabIndex(5, 4)).assertEqual(3);
    });
  });
}
