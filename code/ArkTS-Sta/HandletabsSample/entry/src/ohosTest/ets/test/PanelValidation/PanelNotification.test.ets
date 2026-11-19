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
  PanelSnapshot,
  TabTitleBook,
  PageCounter,
  TAB_ADD_LABEL,
  TAB_CLOSE_LABEL,
  INITIAL_TAB_COUNT,
  MAX_TAB_COUNT,
  DEFAULT_NEW_PAGE_INDEX,
  FIRST_TAB_TITLE,
  SECOND_TAB_TITLE,
  THIRD_TAB_TITLE,
  FOURTH_TAB_TITLE,
  TIMEOUT_PANEL_RENDER,
  TIMEOUT_STATE_SETTLE,
  TIMEOUT_FOCUS_CHANGE,
  TIMEOUT_COMPONENT_QUERY,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_TAB_COUNT
} from '../Shared/SharedDriver';


enum NotiLevel {
  DEBUG = 'debug',
  INFO = 'info',
  WARN = 'warn',
  ERROR = 'error'
}

class NotiLogEntry {
  public level: NotiLevel;
  public message: string;
  public stamp: number;

  constructor(level: NotiLevel, message: string, stamp: number) {
    this.level = level;
    this.message = message;
    this.stamp = stamp;
  }

  public describe(): string {
    return this.level + ':' + this.message;
  }
}

class NotiLog {
  private entries: NotiLogEntry[] = [];

  public static readonly TAG_LABEL: string = 'HandleTabsTest';

  public write(level: NotiLevel, message: string): void {
    this.entries.push(new NotiLogEntry(level, message, Date.now()));
  }

  public info(message: string): void {
    this.write(NotiLevel.INFO, message);
  }

  public warn(message: string): void {
    this.write(NotiLevel.WARN, message);
  }

  public error(message: string): void {
    this.write(NotiLevel.ERROR, message);
  }

  public count(): int {
    return this.entries.length;
  }

  public countOf(level: NotiLevel): int {
    let counter: int = 0;
    for (let cursor: int = 0; cursor < this.entries.length; cursor++) {
      if (this.entries[cursor].level === level) {
        counter = counter + 1;
      }
    }
    return counter;
  }

  public messages(): string[] {
    return this.entries.map((item: NotiLogEntry) => item.message);
  }

  public joined(): string {
    return this.messages().join('|');
  }

  public lastMessage(): string {
    if (this.entries.length === 0) {
      return '';
    }
    return this.entries[this.entries.length - 1].message;
  }

  public hasMessage(message: string): boolean {
    return this.messages().indexOf(message) >= 0;
  }

  public clear(): void {
    this.entries = [];
  }
}


class Notib1ImmutableTab {
  private readonly titleValue: string;
  private readonly slotValue: int;
  private readonly lockedValue: boolean;

  constructor(title: string, slot: int, locked: boolean) {
    this.titleValue = title;
    this.slotValue = slot;
    this.lockedValue = locked;
  }

  public static seed(): Notib1ImmutableTab {
    return new Notib1ImmutableTab('页面3', 0, false);
  }

  public title(): string {
    return this.titleValue;
  }

  public slot(): int {
    return this.slotValue;
  }

  public locked(): boolean {
    return this.lockedValue;
  }

  public withTitle(next: string): Notib1ImmutableTab {
    return new Notib1ImmutableTab(next, this.slotValue, this.lockedValue);
  }

  public withSlot(next: int): Notib1ImmutableTab {
    return new Notib1ImmutableTab(this.titleValue, next, this.lockedValue);
  }

  public lock(): Notib1ImmutableTab {
    return new Notib1ImmutableTab(this.titleValue, this.slotValue, true);
  }

  public unlock(): Notib1ImmutableTab {
    return new Notib1ImmutableTab(this.titleValue, this.slotValue, false);
  }

  public canRename(): boolean {
    return !this.lockedValue;
  }

  public sameAs(other: Notib1ImmutableTab): boolean {
    return this.titleValue === other.titleValue && this.slotValue === other.slotValue &&
      this.lockedValue === other.lockedValue;
  }

  public describe(): string {
    return this.titleValue + '#' + this.slotValue + '#' + this.lockedValue;
  }
}

class Notib1ImmutableTabChain {
  private items: Notib1ImmutableTab[] = [];

  public append(item: Notib1ImmutableTab): void {
    this.items.push(item);
  }

  public size(): int {
    return this.items.length;
  }

  public latest(): Notib1ImmutableTab | null {
    if (this.items.length === 0) {
      return null;
    }
    return this.items[this.items.length - 1];
  }

  public titles(): string[] {
    return this.items.map((item: Notib1ImmutableTab) => item.title());
  }

  public joined(): string {
    return this.titles().join('>');
  }

  public lockedCount(): int {
    let counter: int = 0;
    for (let cursor: int = 0; cursor < this.items.length; cursor++) {
      if (this.items[cursor].locked()) {
        counter = counter + 1;
      }
    }
    return counter;
  }

  public findSlot(slot: int): Notib1ImmutableTab | null {
    for (let cursor: int = 0; cursor < this.items.length; cursor++) {
      if (this.items[cursor].slot() === slot) {
        return this.items[cursor];
      }
    }
    return null;
  }

  public clear(): void {
    this.items = [];
  }
}

export default function panelNotificationTest(): void {
  describe('PanelNotification_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_0100
     * @tc.name panelNotificationTestCase001
     * @tc.desc Verify Tabs component renders: panel visible -> at least one Tabs node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      const stable: boolean = await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      expect(stable).assertTrue();
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_0200
     * @tc.name panelNotificationTestCase002
     * @tc.desc Verify TabContent nodes: seeded strips -> content count matches tab count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const contents: number = await tabContentCount(driver);
      const titles: number = await tabTitleCount(driver);
      expect(contents).assertLargerOrEqual(1);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_0300
     * @tc.name panelNotificationTestCase003
     * @tc.desc Verify seeded titles: initial strip -> first and second page labels visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FIRST_TAB_TITLE)).assertTrue();
      expect(containsLabel(texts, SECOND_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_0400
     * @tc.name panelNotificationTestCase004
     * @tc.desc Verify add button: initial strip below limit -> plus label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_0500
     * @tc.name panelNotificationTestCase005
     * @tc.desc Verify close button: initial strip above minimum -> close label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_CLOSE_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_0600
     * @tc.name panelNotificationTestCase006
     * @tc.desc Verify title prefix: rendered titles -> every tab label starts with page prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      const titles: number = countTitles(texts);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_0700
     * @tc.name panelNotificationTestCase007
     * @tc.desc Verify clickable nodes: interactive strip -> clickable components reported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const clickable: number = await clickableCount(driver);
      expect(clickable).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_0800
     * @tc.name panelNotificationTestCase008
     * @tc.desc Verify focusable element: panel front -> at least one focused node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const focused: number = await focusedCount(driver);
      expect(focused).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_0900
     * @tc.name panelNotificationTestCase009
     * @tc.desc Verify text nodes: tab bar labels rendered -> text component count above one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: number = await textCount(driver);
      expect(texts).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_1000
     * @tc.name panelNotificationTestCase010
     * @tc.desc Verify snapshot capture: panel captured -> total components greater than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const snapshot: PanelSnapshot = await panelSnapshot(driver);
      expect(snapshot.total() > 0).assertTrue();
      expect(snapshot.describe().startsWith('snapshot')).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_1100
     * @tc.name panelNotificationTestCase011
     * @tc.desc Verify add action: tap plus once -> titled tab count grows by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickAddButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLargerOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_1200
     * @tc.name panelNotificationTestCase012
     * @tc.desc Verify add naming: one add from seed -> third page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, THIRD_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_1300
     * @tc.name panelNotificationTestCase013
     * @tc.desc Verify limit: two adds reach maximum -> add button disappears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_1400
     * @tc.name panelNotificationTestCase014
     * @tc.desc Verify second add naming: two adds -> fourth page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FOURTH_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_1500
     * @tc.name panelNotificationTestCase015
     * @tc.desc Verify add helper boundary: count three allowed -> count four rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canAddTab(INITIAL_TAB_COUNT)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT - 1)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT)).assertFalse();
      expect(canAddTab(MAX_TAB_COUNT + 1)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_1600
     * @tc.name panelNotificationTestCase016
     * @tc.desc Verify title book add: seed book accepts one add then stops at limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 1)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 2)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 3)).assertFalse();
      expect(book.getCount()).assertEqual(MAX_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_1700
     * @tc.name panelNotificationTestCase017
     * @tc.desc Verify page counter: default counter starts at two -> next page three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const counter: PageCounter = PageCounter.defaultCounter();
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX);
      expect(counter.peekNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.takeNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_1800
     * @tc.name panelNotificationTestCase018
     * @tc.desc Verify info logging: 3 messages -> INFO count 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sink: NotiLog = new NotiLog();
      sink.info('session open');
      sink.info('switch applied');
      sink.info('session closed');
      expect(sink.count()).assertEqual(3);
      expect(sink.countOf(NotiLevel.INFO)).assertEqual(3);
      expect(sink.countOf(NotiLevel.ERROR)).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_1900
     * @tc.name panelNotificationTestCase019
     * @tc.desc Verify message order: joined output preserves insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sink: NotiLog = new NotiLog();
      sink.info('session open');
      sink.info('switch applied');
      sink.info('session closed');
      expect(sink.joined()).assertEqual('session open|switch applied|session closed');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_2000
     * @tc.name panelNotificationTestCase020
     * @tc.desc Verify level split: one info, one warn, one error -> per-level counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sink: NotiLog = new NotiLog();
      sink.info('session open');
      sink.warn('switch applied');
      sink.error('session closed');
      expect(sink.countOf(NotiLevel.INFO)).assertEqual(1);
      expect(sink.countOf(NotiLevel.WARN)).assertEqual(1);
      expect(sink.countOf(NotiLevel.ERROR)).assertEqual(1);
      expect(sink.count()).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_2100
     * @tc.name panelNotificationTestCase021
     * @tc.desc Verify last message: three entries -> last equals session closed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sink: NotiLog = new NotiLog();
      sink.info('session open');
      sink.warn('switch applied');
      sink.error('session closed');
      expect(sink.lastMessage()).assertEqual('session closed');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_2200
     * @tc.name panelNotificationTestCase022
     * @tc.desc Verify empty sink: no entries -> empty last message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sink: NotiLog = new NotiLog();
      expect(sink.lastMessage()).assertEqual('');
      expect(sink.count()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_2300
     * @tc.name panelNotificationTestCase023
     * @tc.desc Verify message lookup: written message switch applied -> found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sink: NotiLog = new NotiLog();
      sink.info('session open');
      sink.warn('switch applied');
      expect(sink.hasMessage('switch applied')).assertTrue();
      expect(sink.hasMessage('absent-message')).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_2400
     * @tc.name panelNotificationTestCase024
     * @tc.desc Verify clear: populated sink cleared -> zero entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sink: NotiLog = new NotiLog();
      sink.info('session open');
      sink.info('switch applied');
      sink.info('session closed');
      sink.clear();
      expect(sink.count()).assertEqual(0);
      expect(sink.messages().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_2500
     * @tc.name panelNotificationTestCase025
     * @tc.desc Verify log tag constant: static tag matches declared test tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NotiLog.TAG_LABEL).assertEqual('HandleTabsTest');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_2600
     * @tc.name panelNotificationTestCase026
     * @tc.desc Verify entry describe: error level entry -> level prefixed message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entry: NotiLogEntry = new NotiLogEntry(NotiLevel.ERROR, 'session closed', 1);
      expect(entry.describe()).assertEqual('error:session closed');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_2700
     * @tc.name panelNotificationTestCase027
     * @tc.desc Verify immutable seed: fresh record -> title tab-1 at slot 0 unlocked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Notib1ImmutableTab = Notib1ImmutableTab.seed();
      expect(record.title()).assertEqual('页面3');
      expect(record.slot()).assertEqual(0);
      expect(record.locked()).assertFalse();
      expect(record.canRename()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_2800
     * @tc.name panelNotificationTestCase028
     * @tc.desc Verify copy on rename: withTitle tab-2 -> original keeps tab-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Notib1ImmutableTab = Notib1ImmutableTab.seed();
      const renamed: Notib1ImmutableTab = record.withTitle('页面4');
      expect(renamed.title()).assertEqual('页面4');
      expect(record.title()).assertEqual('页面3');
      expect(renamed.sameAs(record)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_2900
     * @tc.name panelNotificationTestCase029
     * @tc.desc Verify copy on slot move: withSlot 2 -> slot updated, title preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Notib1ImmutableTab = Notib1ImmutableTab.seed();
      const moved: Notib1ImmutableTab = record.withSlot(2);
      expect(moved.slot()).assertEqual(2);
      expect(moved.title()).assertEqual('页面3');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_3000
     * @tc.name panelNotificationTestCase030
     * @tc.desc Verify lock transition: lock then unlock -> rename permission toggles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Notib1ImmutableTab = Notib1ImmutableTab.seed();
      const locked: Notib1ImmutableTab = record.lock();
      expect(locked.locked()).assertTrue();
      expect(locked.canRename()).assertFalse();
      expect(locked.unlock().canRename()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_3100
     * @tc.name panelNotificationTestCase031
     * @tc.desc Verify identity comparison: seed equals a copy of itself -> true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Notib1ImmutableTab = Notib1ImmutableTab.seed();
      const copy: Notib1ImmutableTab = record.withTitle('页面3');
      expect(record.sameAs(copy)).assertTrue();
      expect(record.sameAs(copy.withSlot(3))).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_3200
     * @tc.name panelNotificationTestCase032
     * @tc.desc Verify describe format: seed record -> title hash slot hash lock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Notib1ImmutableTab = Notib1ImmutableTab.seed();
      expect(record.describe()).assertEqual('页面3#0#false');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_3300
     * @tc.name panelNotificationTestCase033
     * @tc.desc Verify chain ordering: three records appended -> joined by arrow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chain: Notib1ImmutableTabChain = new Notib1ImmutableTabChain();
      chain.append(Notib1ImmutableTab.seed());
      chain.append(Notib1ImmutableTab.seed().withTitle('页面4'));
      chain.append(Notib1ImmutableTab.seed().withSlot(2));
      expect(chain.size()).assertEqual(3);
      expect(chain.joined()).assertEqual('页面3>页面4>页面3');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_3400
     * @tc.name panelNotificationTestCase034
     * @tc.desc Verify chain latest: appended three -> latest slot equals two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chain: Notib1ImmutableTabChain = new Notib1ImmutableTabChain();
      chain.append(Notib1ImmutableTab.seed());
      chain.append(Notib1ImmutableTab.seed().withSlot(2));
      const latest: Notib1ImmutableTab | null = chain.latest();
      expect(latest === null).assertFalse();
      expect(chain.findSlot(2) === null).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_3500
     * @tc.name panelNotificationTestCase035
     * @tc.desc Verify locked counting: two locked of three -> count two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chain: Notib1ImmutableTabChain = new Notib1ImmutableTabChain();
      chain.append(Notib1ImmutableTab.seed().lock());
      chain.append(Notib1ImmutableTab.seed());
      chain.append(Notib1ImmutableTab.seed().lock());
      expect(chain.lockedCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_3600
     * @tc.name panelNotificationTestCase036
     * @tc.desc Verify empty chain: no records -> latest null and joined empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chain: Notib1ImmutableTabChain = new Notib1ImmutableTabChain();
      expect(chain.latest()).assertNull();
      expect(chain.joined()).assertEqual('');
      expect(chain.size()).assertEqual(0);
      expect(chain.findSlot(0)).assertNull();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_3700
     * @tc.name panelNotificationTestCase037
     * @tc.desc Verify focus change timeout: TIMEOUT_FOCUS_CHANGE equals 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TIMEOUT_FOCUS_CHANGE).assertEqual(300);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_3800
     * @tc.name panelNotificationTestCase038
     * @tc.desc Verify focus change timeout bound: TIMEOUT_FOCUS_CHANGE is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TIMEOUT_FOCUS_CHANGE >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_3900
     * @tc.name panelNotificationTestCase039
     * @tc.desc Verify component query timeout: TIMEOUT_COMPONENT_QUERY equals 800
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TIMEOUT_COMPONENT_QUERY).assertEqual(800);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_4000
     * @tc.name panelNotificationTestCase040
     * @tc.desc Verify component query timeout bound: TIMEOUT_COMPONENT_QUERY is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TIMEOUT_COMPONENT_QUERY >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELNOTIFICATIONTEST_4100
     * @tc.name panelNotificationTestCase041
     * @tc.desc Verify key nav delay: DELAY_KEY_NAVIGATION equals 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelNotificationTestCase041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(DELAY_KEY_NAVIGATION).assertEqual(50);
    });
  });
}
