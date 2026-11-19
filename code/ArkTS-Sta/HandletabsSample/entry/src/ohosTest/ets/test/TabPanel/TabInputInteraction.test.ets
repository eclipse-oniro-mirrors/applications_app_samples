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
  pressAndWait,
  tabsCount,
  serializedDelay,
  settlePanel,
  resetPanelToInitial,
  bringPanelToFront,
  TAB_DIVIDER_STROKE,
  SELECTED_FONT_COLOR,
  KEY_DPAD_LEFT,
  KEY_DPAD_RIGHT,
  KEY_DPAD_UP,
  KEY_DPAD_DOWN,
  KEY_ENTER,
  TIMEOUT_PANEL_RENDER,
  TIMEOUT_STATE_SETTLE,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_TAB_OPERATION
} from '../Shared/SharedDriver';


enum TabEventKind {
  KEY_DOWN = 'key_down',
  KEY_UP = 'key_up',
  TOUCH = 'touch',
  CLICK = 'click'
}

class TabEventEntry {
  public kind: TabEventKind;
  public code: int;
  public stamp: number;

  constructor(kind: TabEventKind, code: int, stamp: number) {
    this.kind = kind;
    this.code = code;
    this.stamp = stamp;
  }

  public isKeyEvent(): boolean {
    return this.kind === TabEventKind.KEY_DOWN || this.kind === TabEventKind.KEY_UP;
  }

  public describe(): string {
    return `${this.kind}#${this.code}#${this.stamp}`;
  }
}

class TabEventBus {
  private static entries: TabEventEntry[] = [];

  public static publish(kind: TabEventKind, code: int): void {
    TabEventBus.entries.push(new TabEventEntry(kind, code, Date.now()));
  }

  public static getEntries(): TabEventEntry[] {
    return TabEventBus.entries.slice(0);
  }

  public static countOf(kind: TabEventKind): int {
    let counter: int = 0;
    for (let cursor: int = 0; cursor < TabEventBus.entries.length; cursor++) {
      if (TabEventBus.entries[cursor].kind === kind) {
        counter = counter + 1;
      }
    }
    return counter;
  }

  public static countOfCode(code: int): int {
    let counter: int = 0;
    for (let cursor: int = 0; cursor < TabEventBus.entries.length; cursor++) {
      if (TabEventBus.entries[cursor].code === code) {
        counter = counter + 1;
      }
    }
    return counter;
  }

  public static clear(): void {
    TabEventBus.entries = [];
  }
}

class TabGestureModel {
  public startX: int;
  public startY: int;
  public endX: int;
  public endY: int;

  constructor(startX: int, startY: int, endX: int, endY: int) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
  }

  public static horizontalLeft(): TabGestureModel {
    return new TabGestureModel(600, 300, 100, 300);
  }

  public static horizontalRight(): TabGestureModel {
    return new TabGestureModel(100, 300, 600, 300);
  }

  public deltaX(): int {
    return this.endX - this.startX;
  }

  public deltaY(): int {
    return this.endY - this.startY;
  }

  public isHorizontal(): boolean {
    const horizontal: int = this.deltaX() < 0 ? -this.deltaX() : this.deltaX();
    const vertical: int = this.deltaY() < 0 ? -this.deltaY() : this.deltaY();
    return horizontal > vertical;
  }

  public isLeftward(): boolean {
    return this.deltaX() < 0;
  }

  public length(): number {
    const dx: number = this.deltaX();
    const dy: number = this.deltaY();
    return Math.sqrt(dx * dx + dy * dy);
  }
}


enum FocusDirection {
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down'
}

class FocusTrail {
  private history: int[] = [];
  private static readonly MAX_HISTORY: int = 16;

  public record(index: int): void {
    this.history.push(index);
    if (this.history.length > FocusTrail.MAX_HISTORY) {
      this.history.shift();
    }
  }

  public getHistory(): int[] {
    return this.history.slice(0);
  }

  public getLast(): int {
    if (this.history.length === 0) {
      return -1;
    }
    return this.history[this.history.length - 1];
  }

  public getCount(): int {
    return this.history.length;
  }

  public clear(): void {
    this.history = [];
  }
}

class FocusNavigator {
  private current: int;
  private total: int;

  constructor(total: int) {
    this.total = total;
    this.current = 0;
  }

  public getCurrent(): int {
    return this.current;
  }

  public getTotal(): int {
    return this.total;
  }

  public moveTo(index: int): boolean {
    if (index < 0 || index >= this.total) {
      return false;
    }
    this.current = index;
    return true;
  }

  public moveNext(): boolean {
    if (this.current + 1 >= this.total) {
      return false;
    }
    this.current = this.current + 1;
    return true;
  }

  public movePrevious(): boolean {
    if (this.current - 1 < 0) {
      return false;
    }
    this.current = this.current - 1;
    return true;
  }

  public applyDirection(direction: FocusDirection): boolean {
    if (direction === FocusDirection.RIGHT || direction === FocusDirection.DOWN) {
      return this.moveNext();
    }
    return this.movePrevious();
  }

  public isAtStart(): boolean {
    return this.current === 0;
  }

  public isAtEnd(): boolean {
    return this.current === this.total - 1;
  }

  public reset(): void {
    this.current = 0;
  }
}

class FocusRingModel {
  public ringWidth: int;
  public ringColor: string;
  public animationMs: int;

  constructor(ringWidth: int, ringColor: string, animationMs: int) {
    this.ringWidth = ringWidth;
    this.ringColor = ringColor;
    this.animationMs = animationMs;
  }

  public static defaultRing(): FocusRingModel {
    return new FocusRingModel(TAB_DIVIDER_STROKE, SELECTED_FONT_COLOR, TIMEOUT_FOCUS_CHANGE);
  }

  public isAnimated(): boolean {
    return this.animationMs > 0;
  }

  public describe(): string {
    return `ring{${this.ringWidth}:${this.ringColor}:${this.animationMs}}`;
  }
}

export default function tabInputInteractionTest(): void {
  describe('TabInputInteraction_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_0100
     * @tc.name tabInputInteractionTestCase001
     * @tc.desc Verify event bus: two key down and one touch -> per-kind counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      TabEventBus.clear();
      TabEventBus.publish(TabEventKind.KEY_DOWN, KEY_DPAD_RIGHT);
      TabEventBus.publish(TabEventKind.KEY_DOWN, KEY_DPAD_LEFT);
      TabEventBus.publish(TabEventKind.TOUCH, 0);
      expect(TabEventBus.countOf(TabEventKind.KEY_DOWN)).assertEqual(2);
      expect(TabEventBus.countOf(TabEventKind.TOUCH)).assertEqual(1);
      expect(TabEventBus.getEntries().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_0200
     * @tc.name tabInputInteractionTestCase002
     * @tc.desc Verify per-code counting: right key published twice -> count two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      TabEventBus.clear();
      TabEventBus.publish(TabEventKind.KEY_UP, KEY_DPAD_RIGHT);
      TabEventBus.publish(TabEventKind.KEY_DOWN, KEY_DPAD_RIGHT);
      TabEventBus.publish(TabEventKind.KEY_DOWN, KEY_ENTER);
      expect(TabEventBus.countOfCode(KEY_DPAD_RIGHT)).assertEqual(2);
      expect(TabEventBus.countOfCode(KEY_ENTER)).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_0300
     * @tc.name tabInputInteractionTestCase003
     * @tc.desc Verify event entry: key down entry -> recognised as key event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entry: TabEventEntry = new TabEventEntry(TabEventKind.KEY_DOWN, KEY_ENTER, 1);
      expect(entry.isKeyEvent()).assertTrue();
      expect(entry.code).assertEqual(KEY_ENTER);
      const touch: TabEventEntry = new TabEventEntry(TabEventKind.TOUCH, 0, 2);
      expect(touch.isKeyEvent()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_0400
     * @tc.name tabInputInteractionTestCase004
     * @tc.desc Verify bus clear: cleared bus -> zero entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      TabEventBus.clear();
      TabEventBus.publish(TabEventKind.CLICK, 1);
      TabEventBus.clear();
      expect(TabEventBus.getEntries().length).assertEqual(0);
      expect(TabEventBus.countOf(TabEventKind.CLICK)).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_0500
     * @tc.name tabInputInteractionTestCase005
     * @tc.desc Verify horizontal gesture: leftward swipe -> horizontal and leftward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const gesture: TabGestureModel = TabGestureModel.horizontalLeft();
      expect(gesture.isHorizontal()).assertTrue();
      expect(gesture.isLeftward()).assertTrue();
      expect(gesture.deltaX()).assertEqual(-500);
      expect(gesture.deltaY()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_0600
     * @tc.name tabInputInteractionTestCase006
     * @tc.desc Verify rightward gesture: rightward swipe -> not leftward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const gesture: TabGestureModel = TabGestureModel.horizontalRight();
      expect(gesture.isLeftward()).assertFalse();
      expect(gesture.deltaX()).assertEqual(500);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_0700
     * @tc.name tabInputInteractionTestCase007
     * @tc.desc Verify gesture length: 3-4-5 triangle -> length five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const gesture: TabGestureModel = new TabGestureModel(0, 0, 3, 4);
      expect(gesture.length()).assertEqual(5);
      expect(gesture.isHorizontal()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_0800
     * @tc.name tabInputInteractionTestCase008
     * @tc.desc Verify key constants: dpad codes match OpenHarmony definition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(KEY_DPAD_LEFT).assertEqual(2014);
      expect(KEY_DPAD_RIGHT).assertEqual(2015);
      expect(KEY_DPAD_UP).assertEqual(2012);
      expect(KEY_DPAD_DOWN).assertEqual(2013);
      expect(KEY_ENTER).assertEqual(2049);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_0900
     * @tc.name tabInputInteractionTestCase009
     * @tc.desc Verify driver key path: enter key triggered -> panel still rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_AFTER_TAB_OPERATION);
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_1000
     * @tc.name tabInputInteractionTestCase010
     * @tc.desc Verify focus navigation: two moves right -> current index two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const navigator: FocusNavigator = new FocusNavigator(4);
      expect(navigator.moveNext()).assertTrue();
      expect(navigator.moveNext()).assertTrue();
      expect(navigator.getCurrent()).assertEqual(2);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_1100
     * @tc.name tabInputInteractionTestCase011
     * @tc.desc Verify backward navigation: move from zero -> refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const navigator: FocusNavigator = new FocusNavigator(4);
      expect(navigator.movePrevious()).assertFalse();
      navigator.moveTo(2);
      expect(navigator.movePrevious()).assertTrue();
      expect(navigator.getCurrent()).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_1200
     * @tc.name tabInputInteractionTestCase012
     * @tc.desc Verify focus end boundary: at last slot -> next move refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const navigator: FocusNavigator = new FocusNavigator(3);
      expect(navigator.moveTo(2)).assertTrue();
      expect(navigator.isAtEnd()).assertTrue();
      expect(navigator.moveNext()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_1300
     * @tc.name tabInputInteractionTestCase013
     * @tc.desc Verify direction mapping: right advances, left retreats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const navigator: FocusNavigator = new FocusNavigator(3);
      expect(navigator.applyDirection(FocusDirection.RIGHT)).assertTrue();
      expect(navigator.getCurrent()).assertEqual(1);
      expect(navigator.applyDirection(FocusDirection.LEFT)).assertTrue();
      expect(navigator.getCurrent()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_1400
     * @tc.name tabInputInteractionTestCase014
     * @tc.desc Verify vertical direction: down advances like right, up retreats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const navigator: FocusNavigator = new FocusNavigator(3);
      expect(navigator.applyDirection(FocusDirection.DOWN)).assertTrue();
      expect(navigator.getCurrent()).assertEqual(1);
      expect(navigator.applyDirection(FocusDirection.UP)).assertTrue();
      expect(navigator.getCurrent()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_1500
     * @tc.name tabInputInteractionTestCase015
     * @tc.desc Verify moveTo bounds: out of range target -> refused and position kept
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const navigator: FocusNavigator = new FocusNavigator(3);
      expect(navigator.moveTo(3)).assertFalse();
      expect(navigator.moveTo(-1)).assertFalse();
      expect(navigator.getCurrent()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_1600
     * @tc.name tabInputInteractionTestCase016
     * @tc.desc Verify focus trail: three records -> last equals two and count three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trail: FocusTrail = new FocusTrail();
      trail.record(0);
      trail.record(1);
      trail.record(2);
      expect(trail.getCount()).assertEqual(3);
      expect(trail.getLast()).assertEqual(2);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_1700
     * @tc.name tabInputInteractionTestCase017
     * @tc.desc Verify trail capacity: more than limit recorded -> history trimmed to limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trail: FocusTrail = new FocusTrail();
      for (let cursor: int = 0; cursor < 20; cursor++) {
        trail.record(cursor);
      }
      expect(trail.getCount()).assertEqual(16);
      expect(trail.getLast()).assertEqual(19);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_1800
     * @tc.name tabInputInteractionTestCase018
     * @tc.desc Verify empty trail: no records -> last index minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trail: FocusTrail = new FocusTrail();
      expect(trail.getLast()).assertEqual(-1);
      expect(trail.getHistory().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_1900
     * @tc.name tabInputInteractionTestCase019
     * @tc.desc Verify focus ring: default ring -> animated with expected width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ring: FocusRingModel = FocusRingModel.defaultRing();
      expect(ring.ringWidth).assertEqual(TAB_DIVIDER_STROKE);
      expect(ring.isAnimated()).assertTrue();
      expect(ring.ringColor).assertEqual(SELECTED_FONT_COLOR);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_2000
     * @tc.name tabInputInteractionTestCase020
     * @tc.desc Verify driver focus navigation: arrow keys pressed -> panel stays visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await pressAndWait(driver, KEY_DPAD_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_DPAD_LEFT, 1, DELAY_KEY_NAVIGATION);
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABINPUTINTERACTIONTEST_2100
     * @tc.name tabInputInteractionTestCase021
     * @tc.desc Verify Tabs component renders: panel visible -> at least one Tabs node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabInputInteractionTestCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      const stable: boolean = await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      expect(stable).assertTrue();
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });
  });
}
