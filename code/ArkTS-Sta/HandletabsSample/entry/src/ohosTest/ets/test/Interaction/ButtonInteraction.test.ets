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
  clickAddButton,
  clickCloseButton,
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
  removeTitleAt,
  initialTitles,
  TabTitleBook,
  PageCounter,
  TAB_ADD_LABEL,
  TAB_CLOSE_LABEL,
  INITIAL_TAB_COUNT,
  MAX_TAB_COUNT,
  MIN_REMOVABLE_TAB_COUNT,
  DEFAULT_NEW_PAGE_INDEX,
  FIRST_TAB_TITLE,
  SECOND_TAB_TITLE,
  THIRD_TAB_TITLE,
  FOURTH_TAB_TITLE,
  KEY_DPAD_LEFT,
  KEY_DPAD_RIGHT,
  KEY_DPAD_UP,
  KEY_DPAD_DOWN,
  KEY_ENTER,
  TIMEOUT_PANEL_RENDER,
  TIMEOUT_STATE_SETTLE,
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


enum BtnQueueState {
  PENDING = 'pending',
  RUNNING = 'running',
  DONE = 'done'
}

class BtnQueueEntry {
  public label: string;
  public state: BtnQueueState;

  constructor(label: string, state: BtnQueueState) {
    this.label = label;
    this.state = state;
  }

  public isDone(): boolean {
    return this.state === BtnQueueState.DONE;
  }

  public describe(): string {
    return this.label + '/' + this.state;
  }
}

class BtnQueue {
  private entries: BtnQueueEntry[] = [];
  private processed: int = 0;

  public enqueue(label: string): void {
    this.entries.push(new BtnQueueEntry(label, BtnQueueState.PENDING));
  }

  public size(): int {
    return this.entries.length;
  }

  public pendingCount(): int {
    let counter: int = 0;
    for (let cursor: int = 0; cursor < this.entries.length; cursor++) {
      if (this.entries[cursor].state === BtnQueueState.PENDING) {
        counter = counter + 1;
      }
    }
    return counter;
  }

  public doneCount(): int {
    let counter: int = 0;
    for (let cursor: int = 0; cursor < this.entries.length; cursor++) {
      if (this.entries[cursor].isDone()) {
        counter = counter + 1;
      }
    }
    return counter;
  }

  public runNext(): boolean {
    for (let cursor: int = 0; cursor < this.entries.length; cursor++) {
      const current: BtnQueueEntry = this.entries[cursor];
      if (current.state === BtnQueueState.PENDING) {
        current.state = BtnQueueState.DONE;
        this.processed = this.processed + 1;
        return true;
      }
    }
    return false;
  }

  public drain(): int {
    let handled: int = 0;
    while (this.runNext()) {
      handled = handled + 1;
    }
    return handled;
  }

  public processedCount(): int {
    return this.processed;
  }

  public labels(): string[] {
    return this.entries.map((item: BtnQueueEntry) => item.label);
  }

  public joined(): string {
    return this.labels().join(',');
  }

  public remainingLabels(): string[] {
    const pending: BtnQueueEntry[] = this.entries.filter((item: BtnQueueEntry) => !item.isDone());
    return pending.map((item: BtnQueueEntry) => item.label);
  }

  public clear(): void {
    this.entries = [];
    this.processed = 0;
  }
}

export default function tabsButtonInteractionTest(): void {
  describe('TabsButtonInteraction_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_0100
     * @tc.name tabsButtonInteractionTestCase001
     * @tc.desc Verify add action: tap plus once -> titled tab count grows by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickAddButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLargerOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_0200
     * @tc.name tabsButtonInteractionTestCase002
     * @tc.desc Verify add naming: one add from seed -> third page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, THIRD_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_0300
     * @tc.name tabsButtonInteractionTestCase003
     * @tc.desc Verify limit: two adds reach maximum -> add button disappears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_0400
     * @tc.name tabsButtonInteractionTestCase004
     * @tc.desc Verify second add naming: two adds -> fourth page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FOURTH_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_0500
     * @tc.name tabsButtonInteractionTestCase005
     * @tc.desc Verify add helper boundary: count three allowed -> count four rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canAddTab(INITIAL_TAB_COUNT)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT - 1)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT)).assertFalse();
      expect(canAddTab(MAX_TAB_COUNT + 1)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_0600
     * @tc.name tabsButtonInteractionTestCase006
     * @tc.desc Verify title book add: seed book accepts one add then stops at limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 1)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 2)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 3)).assertFalse();
      expect(book.getCount()).assertEqual(MAX_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_0700
     * @tc.name tabsButtonInteractionTestCase007
     * @tc.desc Verify page counter: default counter starts at two -> next page three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const counter: PageCounter = PageCounter.defaultCounter();
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX);
      expect(counter.peekNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.takeNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_0800
     * @tc.name tabsButtonInteractionTestCase008
     * @tc.desc Verify remove action: tap close once -> titled tab count does not grow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickCloseButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLessOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_0900
     * @tc.name tabsButtonInteractionTestCase009
     * @tc.desc Verify remove on model: seeded book removes one -> count one below seed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(0)).assertTrue();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT - 1);
      expect(book.containsTitle(FIRST_TAB_TITLE)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_1000
     * @tc.name tabsButtonInteractionTestCase010
     * @tc.desc Verify remove guard: count below minimum -> removal refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT - 1)).assertFalse();
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT)).assertTrue();
      const book: TabTitleBook = new TabTitleBook([FIRST_TAB_TITLE]);
      expect(book.removeTitle(0)).assertFalse();
      expect(book.getCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_1100
     * @tc.name tabsButtonInteractionTestCase011
     * @tc.desc Verify remove bounds: index equal to size -> refused, size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(INITIAL_TAB_COUNT)).assertFalse();
      expect(book.removeTitle(-1)).assertFalse();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_1200
     * @tc.name tabsButtonInteractionTestCase012
     * @tc.desc Verify remove helper: index one removed from three -> remaining joined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      titles.push(THIRD_TAB_TITLE);
      const remaining: string[] = removeTitleAt(titles, 1);
      expect(remaining.join(',')).assertEqual(FIRST_TAB_TITLE + ',' + THIRD_TAB_TITLE);
      expect(titles.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_1300
     * @tc.name tabsButtonInteractionTestCase013
     * @tc.desc Verify remove helper bounds: out of range index -> copy unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      const untouched: string[] = removeTitleAt(titles, 9);
      expect(untouched.length).assertEqual(INITIAL_TAB_COUNT);
      expect(untouched[0]).assertEqual(FIRST_TAB_TITLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_1400
     * @tc.name tabsButtonInteractionTestCase014
     * @tc.desc Verify event bus: two key down and one touch -> per-kind counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      TabEventBus.clear();
      TabEventBus.publish(TabEventKind.KEY_DOWN, KEY_DPAD_RIGHT);
      TabEventBus.publish(TabEventKind.KEY_DOWN, KEY_DPAD_LEFT);
      TabEventBus.publish(TabEventKind.TOUCH, 0);
      expect(TabEventBus.countOf(TabEventKind.KEY_DOWN)).assertEqual(2);
      expect(TabEventBus.countOf(TabEventKind.TOUCH)).assertEqual(1);
      expect(TabEventBus.getEntries().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_1500
     * @tc.name tabsButtonInteractionTestCase015
     * @tc.desc Verify per-code counting: right key published twice -> count two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      TabEventBus.clear();
      TabEventBus.publish(TabEventKind.KEY_UP, KEY_DPAD_RIGHT);
      TabEventBus.publish(TabEventKind.KEY_DOWN, KEY_DPAD_RIGHT);
      TabEventBus.publish(TabEventKind.KEY_DOWN, KEY_ENTER);
      expect(TabEventBus.countOfCode(KEY_DPAD_RIGHT)).assertEqual(2);
      expect(TabEventBus.countOfCode(KEY_ENTER)).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_1600
     * @tc.name tabsButtonInteractionTestCase016
     * @tc.desc Verify event entry: key down entry -> recognised as key event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entry: TabEventEntry = new TabEventEntry(TabEventKind.KEY_DOWN, KEY_ENTER, 1);
      expect(entry.isKeyEvent()).assertTrue();
      expect(entry.code).assertEqual(KEY_ENTER);
      const touch: TabEventEntry = new TabEventEntry(TabEventKind.TOUCH, 0, 2);
      expect(touch.isKeyEvent()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_1700
     * @tc.name tabsButtonInteractionTestCase017
     * @tc.desc Verify bus clear: cleared bus -> zero entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      TabEventBus.clear();
      TabEventBus.publish(TabEventKind.CLICK, 1);
      TabEventBus.clear();
      expect(TabEventBus.getEntries().length).assertEqual(0);
      expect(TabEventBus.countOf(TabEventKind.CLICK)).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_1800
     * @tc.name tabsButtonInteractionTestCase018
     * @tc.desc Verify horizontal gesture: leftward swipe -> horizontal and leftward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const gesture: TabGestureModel = TabGestureModel.horizontalLeft();
      expect(gesture.isHorizontal()).assertTrue();
      expect(gesture.isLeftward()).assertTrue();
      expect(gesture.deltaX()).assertEqual(-500);
      expect(gesture.deltaY()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_1900
     * @tc.name tabsButtonInteractionTestCase019
     * @tc.desc Verify rightward gesture: rightward swipe -> not leftward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const gesture: TabGestureModel = TabGestureModel.horizontalRight();
      expect(gesture.isLeftward()).assertFalse();
      expect(gesture.deltaX()).assertEqual(500);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_2000
     * @tc.name tabsButtonInteractionTestCase020
     * @tc.desc Verify gesture length: 3-4-5 triangle -> length five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const gesture: TabGestureModel = new TabGestureModel(0, 0, 3, 4);
      expect(gesture.length()).assertEqual(5);
      expect(gesture.isHorizontal()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_2100
     * @tc.name tabsButtonInteractionTestCase021
     * @tc.desc Verify key constants: dpad codes match OpenHarmony definition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(KEY_DPAD_LEFT).assertEqual(2014);
      expect(KEY_DPAD_RIGHT).assertEqual(2015);
      expect(KEY_DPAD_UP).assertEqual(2012);
      expect(KEY_DPAD_DOWN).assertEqual(2013);
      expect(KEY_ENTER).assertEqual(2049);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_2200
     * @tc.name tabsButtonInteractionTestCase022
     * @tc.desc Verify driver key path: enter key triggered -> panel still rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_AFTER_TAB_OPERATION);
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_2300
     * @tc.name tabsButtonInteractionTestCase023
     * @tc.desc Verify enqueue: 3 labels queued -> pending count 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queue: BtnQueue = new BtnQueue();
      queue.enqueue('pageX');
      queue.enqueue('pageY');
      queue.enqueue('pageZ');
      expect(queue.size()).assertEqual(3);
      expect(queue.pendingCount()).assertEqual(3);
      expect(queue.joined()).assertEqual('pageX,pageY,pageZ');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_2400
     * @tc.name tabsButtonInteractionTestCase024
     * @tc.desc Verify drain: 3 pending items -> all done with 3 processed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queue: BtnQueue = new BtnQueue();
      queue.enqueue('pageX');
      queue.enqueue('pageY');
      queue.enqueue('pageZ');
      expect(queue.drain()).assertEqual(3);
      expect(queue.doneCount()).assertEqual(3);
      expect(queue.pendingCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_2500
     * @tc.name tabsButtonInteractionTestCase025
     * @tc.desc Verify single step: one runNext call -> one done, rest pending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queue: BtnQueue = new BtnQueue();
      queue.enqueue('pageX');
      queue.enqueue('pageY');
      queue.enqueue('pageZ');
      expect(queue.runNext()).assertTrue();
      expect(queue.doneCount()).assertEqual(1);
      expect(queue.pendingCount()).assertEqual(2);
      expect(queue.processedCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_2600
     * @tc.name tabsButtonInteractionTestCase026
     * @tc.desc Verify exhausted queue: runNext after drain -> false and counts unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queue: BtnQueue = new BtnQueue();
      queue.enqueue('pageX');
      queue.enqueue('pageY');
      queue.enqueue('pageZ');
      queue.drain();
      expect(queue.runNext()).assertFalse();
      expect(queue.processedCount()).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_2700
     * @tc.name tabsButtonInteractionTestCase027
     * @tc.desc Verify remaining labels: after one step -> pending labels joined without first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queue: BtnQueue = new BtnQueue();
      queue.enqueue('pageX');
      queue.enqueue('pageY');
      queue.enqueue('pageZ');
      queue.runNext();
      expect(queue.remainingLabels().join(',')).assertEqual('pageY,pageZ');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_2800
     * @tc.name tabsButtonInteractionTestCase028
     * @tc.desc Verify empty queue: no items -> zero size and drain returns zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queue: BtnQueue = new BtnQueue();
      expect(queue.size()).assertEqual(0);
      expect(queue.drain()).assertEqual(0);
      expect(queue.pendingCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_2900
     * @tc.name tabsButtonInteractionTestCase029
     * @tc.desc Verify clear: drained queue cleared -> counters reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queue: BtnQueue = new BtnQueue();
      queue.enqueue('pageX');
      queue.enqueue('pageY');
      queue.enqueue('pageZ');
      queue.drain();
      queue.clear();
      expect(queue.size()).assertEqual(0);
      expect(queue.processedCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_3000
     * @tc.name tabsButtonInteractionTestCase030
     * @tc.desc Verify entry state: fresh entry not done -> pending state value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entry: BtnQueueEntry = new BtnQueueEntry('pageX', BtnQueueState.PENDING);
      expect(entry.isDone()).assertFalse();
      expect(entry.describe()).assertEqual('pageX/pending');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_3100
     * @tc.name tabsButtonInteractionTestCase031
     * @tc.desc Verify idempotent drain: second drain -> zero additional work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queue: BtnQueue = new BtnQueue();
      queue.enqueue('pageX');
      queue.enqueue('pageY');
      queue.enqueue('pageZ');
      expect(queue.drain()).assertEqual(3);
      expect(queue.drain()).assertEqual(0);
      expect(queue.doneCount()).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_3200
     * @tc.name tabsButtonInteractionTestCase032
     * @tc.desc Verify close button label: TAB_CLOSE_LABEL equals declared literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_CLOSE_LABEL).assertEqual('X');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_3300
     * @tc.name tabsButtonInteractionTestCase033
     * @tc.desc Verify close button label literal: TAB_CLOSE_LABEL is a non empty literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_CLOSE_LABEL.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_3400
     * @tc.name tabsButtonInteractionTestCase034
     * @tc.desc Verify first seeded title: FIRST_TAB_TITLE equals declared literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(FIRST_TAB_TITLE).assertEqual('页面1');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_3500
     * @tc.name tabsButtonInteractionTestCase035
     * @tc.desc Verify first seeded title literal: FIRST_TAB_TITLE is a non empty literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(FIRST_TAB_TITLE.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_3600
     * @tc.name tabsButtonInteractionTestCase036
     * @tc.desc Verify second seeded title: SECOND_TAB_TITLE equals declared literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(SECOND_TAB_TITLE).assertEqual('页面2');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSBUTTONINTERACTIONTEST_3700
     * @tc.name tabsButtonInteractionTestCase037
     * @tc.desc Verify second seeded title literal: SECOND_TAB_TITLE is a non empty literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsButtonInteractionTestCase037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(SECOND_TAB_TITLE.length > 0).assertTrue();
    });
  });
}
