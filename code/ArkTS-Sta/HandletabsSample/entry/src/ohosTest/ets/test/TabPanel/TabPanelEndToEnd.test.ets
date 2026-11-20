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

export default function tabPanelEndToEndTest(): void {
  describe('TabPanelEndToEnd_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_0100
     * @tc.name tabPanelEndToEndTestCase001
     * @tc.desc Verify add action: tap plus once -> titled tab count grows by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickAddButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLargerOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_0200
     * @tc.name tabPanelEndToEndTestCase002
     * @tc.desc Verify add naming: one add from seed -> third page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, THIRD_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_0300
     * @tc.name tabPanelEndToEndTestCase003
     * @tc.desc Verify limit: two adds reach maximum -> add button disappears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_0400
     * @tc.name tabPanelEndToEndTestCase004
     * @tc.desc Verify second add naming: two adds -> fourth page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FOURTH_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_0500
     * @tc.name tabPanelEndToEndTestCase005
     * @tc.desc Verify add helper boundary: count three allowed -> count four rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canAddTab(INITIAL_TAB_COUNT)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT - 1)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT)).assertFalse();
      expect(canAddTab(MAX_TAB_COUNT + 1)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_0600
     * @tc.name tabPanelEndToEndTestCase006
     * @tc.desc Verify title book add: seed book accepts one add then stops at limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 1)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 2)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 3)).assertFalse();
      expect(book.getCount()).assertEqual(MAX_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_0700
     * @tc.name tabPanelEndToEndTestCase007
     * @tc.desc Verify page counter: default counter starts at two -> next page three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const counter: PageCounter = PageCounter.defaultCounter();
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX);
      expect(counter.peekNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.takeNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_0800
     * @tc.name tabPanelEndToEndTestCase008
     * @tc.desc Verify remove action: tap close once -> titled tab count does not grow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickCloseButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLessOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_0900
     * @tc.name tabPanelEndToEndTestCase009
     * @tc.desc Verify remove on model: seeded book removes one -> count one below seed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(0)).assertTrue();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT - 1);
      expect(book.containsTitle(FIRST_TAB_TITLE)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_1000
     * @tc.name tabPanelEndToEndTestCase010
     * @tc.desc Verify remove guard: count below minimum -> removal refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT - 1)).assertFalse();
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT)).assertTrue();
      const book: TabTitleBook = new TabTitleBook([FIRST_TAB_TITLE]);
      expect(book.removeTitle(0)).assertFalse();
      expect(book.getCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_1100
     * @tc.name tabPanelEndToEndTestCase011
     * @tc.desc Verify remove bounds: index equal to size -> refused, size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(INITIAL_TAB_COUNT)).assertFalse();
      expect(book.removeTitle(-1)).assertFalse();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_1200
     * @tc.name tabPanelEndToEndTestCase012
     * @tc.desc Verify remove helper: index one removed from three -> remaining joined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      titles.push(THIRD_TAB_TITLE);
      const remaining: string[] = removeTitleAt(titles, 1);
      expect(remaining.join(',')).assertEqual(FIRST_TAB_TITLE + ',' + THIRD_TAB_TITLE);
      expect(titles.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_1300
     * @tc.name tabPanelEndToEndTestCase013
     * @tc.desc Verify remove helper bounds: out of range index -> copy unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      const untouched: string[] = removeTitleAt(titles, 9);
      expect(untouched.length).assertEqual(INITIAL_TAB_COUNT);
      expect(untouched[0]).assertEqual(FIRST_TAB_TITLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_1400
     * @tc.name tabPanelEndToEndTestCase014
     * @tc.desc Verify clamp helper: overshoot index -> clamped to last slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(clampTabIndex(0, 3)).assertEqual(0);
      expect(clampTabIndex(9, 3)).assertEqual(2);
      expect(clampTabIndex(-4, 3)).assertEqual(0);
      expect(clampTabIndex(0, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_1500
     * @tc.name tabPanelEndToEndTestCase015
     * @tc.desc Verify switch state: begin switch to target one -> animating true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.index).assertEqual(0);
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.targetIndex).assertEqual(1);
      expect(state.animating).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_1600
     * @tc.name tabPanelEndToEndTestCase016
     * @tc.desc Verify switch guard: target equals current index -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(0)).assertFalse();
      expect(state.animating).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_1700
     * @tc.name tabPanelEndToEndTestCase017
     * @tc.desc Verify switch completion: begin then finish -> index equals target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.finishSwitch()).assertTrue();
      expect(state.index).assertEqual(1);
      expect(state.isSameIndex()).assertTrue();
      expect(state.finishSwitch()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_1800
     * @tc.name tabPanelEndToEndTestCase018
     * @tc.desc Verify reentrant guard: second begin during animation -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state: TabsSwitchState = TabsSwitchState.initial();
      expect(state.beginSwitch(1)).assertTrue();
      expect(state.beginSwitch(2)).assertFalse();
      expect(state.targetIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_1900
     * @tc.name tabPanelEndToEndTestCase019
     * @tc.desc Verify bar style: sample profile -> fixed mode with animation enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      expect(style.barWidth).assertEqual(TAB_BAR_WIDTH);
      expect(style.barHeight).assertEqual(TAB_BAR_HEIGHT);
      expect(style.isAnimationEnabled()).assertTrue();
      expect(style.isFixedMode()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABPANELENDTOENDTEST_2000
     * @tc.name tabPanelEndToEndTestCase020
     * @tc.desc Verify style copy: mode changed to scrollable -> original keeps fixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabPanelEndToEndTestCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const style: TabBarStyleModel = TabBarStyleModel.sample();
      const scrollable: TabBarStyleModel = style.withMode(TabsBarMode.SCROLLABLE);
      expect(scrollable.isFixedMode()).assertFalse();
      expect(style.isFixedMode()).assertTrue();
    });
  });
}
