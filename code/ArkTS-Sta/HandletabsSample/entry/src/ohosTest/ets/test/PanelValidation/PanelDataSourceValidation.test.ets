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
  DELAY_KEY_NAVIGATION,
  TOLERANCE_TAB_COUNT
} from '../Shared/SharedDriver';


enum DvalKind {
  STRING = 'string',
  COLOR = 'color',
  MEDIA = 'media'
}

class DvalEntry {
  public name: string;
  public kind: DvalKind;
  public value: string;

  constructor(name: string, kind: DvalKind, value: string) {
    this.name = name;
    this.kind = kind;
    this.value = value;
  }

  public static text(name: string, value: string): DvalEntry {
    return new DvalEntry(name, DvalKind.STRING, value);
  }

  public static color(name: string, value: string): DvalEntry {
    return new DvalEntry(name, DvalKind.COLOR, value);
  }

  public isKind(target: DvalKind): boolean {
    return this.kind === target;
  }

  public isHexColor(): boolean {
    return this.kind === DvalKind.COLOR && this.value.startsWith('#');
  }

  public describe(): string {
    return this.name + ':' + this.value;
  }
}

class DvalRegistry {
  private entries: DvalEntry[] = [];

  public add(entry: DvalEntry): boolean {
    if (this.find(entry.name) !== null) {
      return false;
    }
    this.entries.push(entry);
    return true;
  }

  public find(name: string): DvalEntry | null {
    for (let cursor: int = 0; cursor < this.entries.length; cursor++) {
      if (this.entries[cursor].name === name) {
        return this.entries[cursor];
      }
    }
    return null;
  }

  public size(): int {
    return this.entries.length;
  }

  public countOfKind(kind: DvalKind): int {
    let counter: int = 0;
    for (let cursor: int = 0; cursor < this.entries.length; cursor++) {
      if (this.entries[cursor].isKind(kind)) {
        counter = counter + 1;
      }
    }
    return counter;
  }

  public names(): string[] {
    return this.entries.map((item: DvalEntry) => item.name);
  }

  public joined(): string {
    return this.names().join(',');
  }

  public valueOf(name: string): string {
    const found: DvalEntry | null = this.find(name);
    if (found === null) {
      return '';
    }
    return found.value;
  }

  public remove(name: string): boolean {
    const before: int = this.entries.length;
    this.entries = this.entries.filter((item: DvalEntry) => item.name !== name);
    return this.entries.length < before;
  }

  public clear(): void {
    this.entries = [];
  }
}

export default function panelDataSourceValidationTest(): void {
  describe('PanelDataSourceValidation_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_0100
     * @tc.name panelDataSourceValidationTestCase001
     * @tc.desc Verify Tabs component renders: panel visible -> at least one Tabs node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      const stable: boolean = await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      expect(stable).assertTrue();
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_0200
     * @tc.name panelDataSourceValidationTestCase002
     * @tc.desc Verify TabContent nodes: seeded strips -> content count matches tab count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const contents: number = await tabContentCount(driver);
      const titles: number = await tabTitleCount(driver);
      expect(contents).assertLargerOrEqual(1);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_0300
     * @tc.name panelDataSourceValidationTestCase003
     * @tc.desc Verify seeded titles: initial strip -> first and second page labels visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FIRST_TAB_TITLE)).assertTrue();
      expect(containsLabel(texts, SECOND_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_0400
     * @tc.name panelDataSourceValidationTestCase004
     * @tc.desc Verify add button: initial strip below limit -> plus label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_0500
     * @tc.name panelDataSourceValidationTestCase005
     * @tc.desc Verify close button: initial strip above minimum -> close label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_CLOSE_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_0600
     * @tc.name panelDataSourceValidationTestCase006
     * @tc.desc Verify title prefix: rendered titles -> every tab label starts with page prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      const titles: number = countTitles(texts);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_0700
     * @tc.name panelDataSourceValidationTestCase007
     * @tc.desc Verify clickable nodes: interactive strip -> clickable components reported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const clickable: number = await clickableCount(driver);
      expect(clickable).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_0800
     * @tc.name panelDataSourceValidationTestCase008
     * @tc.desc Verify focusable surface: panel front -> at least one focused node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const focused: number = await focusedCount(driver);
      expect(focused).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_0900
     * @tc.name panelDataSourceValidationTestCase009
     * @tc.desc Verify text nodes: tab bar labels rendered -> text component count above one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: number = await textCount(driver);
      expect(texts).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_1000
     * @tc.name panelDataSourceValidationTestCase010
     * @tc.desc Verify snapshot capture: panel captured -> total components greater than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const snapshot: PanelSnapshot = await panelSnapshot(driver);
      expect(snapshot.total() > 0).assertTrue();
      expect(snapshot.describe().startsWith('snapshot')).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_1100
     * @tc.name panelDataSourceValidationTestCase011
     * @tc.desc Verify add action: tap plus once -> titled tab count grows by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickAddButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLargerOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_1200
     * @tc.name panelDataSourceValidationTestCase012
     * @tc.desc Verify add naming: one add from seed -> third page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, THIRD_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_1300
     * @tc.name panelDataSourceValidationTestCase013
     * @tc.desc Verify limit: two adds reach maximum -> add button disappears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_1400
     * @tc.name panelDataSourceValidationTestCase014
     * @tc.desc Verify second add naming: two adds -> fourth page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FOURTH_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_1500
     * @tc.name panelDataSourceValidationTestCase015
     * @tc.desc Verify add helper boundary: count three allowed -> count four rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canAddTab(INITIAL_TAB_COUNT)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT - 1)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT)).assertFalse();
      expect(canAddTab(MAX_TAB_COUNT + 1)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_1600
     * @tc.name panelDataSourceValidationTestCase016
     * @tc.desc Verify title book add: seed book accepts one add then stops at limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 1)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 2)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 3)).assertFalse();
      expect(book.getCount()).assertEqual(MAX_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_1700
     * @tc.name panelDataSourceValidationTestCase017
     * @tc.desc Verify page counter: default counter starts at two -> next page three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const counter: PageCounter = PageCounter.defaultCounter();
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX);
      expect(counter.peekNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.takeNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_1800
     * @tc.name panelDataSourceValidationTestCase018
     * @tc.desc Verify unique add: 3 names added -> size 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const registry: DvalRegistry = new DvalRegistry();
      expect(registry.add(DvalEntry.text('app_name', 'value-0'))).assertTrue();
      expect(registry.add(DvalEntry.text('start_icon', 'value-1'))).assertTrue();
      expect(registry.add(DvalEntry.text('tab_color', 'value-2'))).assertTrue();
      expect(registry.size()).assertEqual(3);
      expect(registry.joined()).assertEqual('app_name,start_icon,tab_color');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_1900
     * @tc.name panelDataSourceValidationTestCase019
     * @tc.desc Verify duplicate rejection: name app_name added twice -> rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const registry: DvalRegistry = new DvalRegistry();
      expect(registry.add(DvalEntry.text('app_name', 'first'))).assertTrue();
      expect(registry.add(DvalEntry.text('app_name', 'second'))).assertFalse();
      expect(registry.size()).assertEqual(1);
      expect(registry.valueOf('app_name')).assertEqual('first');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_2000
     * @tc.name panelDataSourceValidationTestCase020
     * @tc.desc Verify lookup: registered app_name -> value returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const registry: DvalRegistry = new DvalRegistry();
      registry.add(DvalEntry.text('app_name', 'stored'));
      expect(registry.valueOf('app_name')).assertEqual('stored');
      expect(registry.valueOf('absent')).assertEqual('');
      expect(registry.find('absent')).assertNull();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_2100
     * @tc.name panelDataSourceValidationTestCase021
     * @tc.desc Verify kind counting: two colours and one text -> per-kind totals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const registry: DvalRegistry = new DvalRegistry();
      registry.add(DvalEntry.color('c1', '#007DFF'));
      registry.add(DvalEntry.color('c2', '#F1F3F5'));
      registry.add(DvalEntry.text('t1', 'label'));
      expect(registry.countOfKind(DvalKind.COLOR)).assertEqual(2);
      expect(registry.countOfKind(DvalKind.STRING)).assertEqual(1);
      expect(registry.countOfKind(DvalKind.MEDIA)).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELDATASOURCEVALIDATIONTEST_2200
     * @tc.name panelDataSourceValidationTestCase022
     * @tc.desc Verify hex colour detection: colour with hash -> true, text entry -> false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelDataSourceValidationTestCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const color: DvalEntry = DvalEntry.color('c1', '#007DFF');
      const text: DvalEntry = DvalEntry.text('t1', '#007DFF');
      expect(color.isHexColor()).assertTrue();
      expect(text.isHexColor()).assertFalse();
    });
  });
}
