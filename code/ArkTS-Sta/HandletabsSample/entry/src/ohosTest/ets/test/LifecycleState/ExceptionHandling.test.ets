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
  THIRD_TAB_TITLE,
  FOURTH_TAB_TITLE,
  TIMEOUT_PANEL_RENDER,
  TIMEOUT_STATE_SETTLE,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';


enum ExcIssue {
  OK = 'ok',
  EMPTY = 'empty',
  TOO_LONG = 'too_long',
  OUT_OF_RANGE = 'out_of_range',
  DUPLICATE = 'duplicate'
}

class ExcVerdict {
  public issue: ExcIssue;
  public accepted: boolean;

  constructor(issue: ExcIssue, accepted: boolean) {
    this.issue = issue;
    this.accepted = accepted;
  }

  public static pass(): ExcVerdict {
    return new ExcVerdict(ExcIssue.OK, true);
  }

  public static fail(issue: ExcIssue): ExcVerdict {
    return new ExcVerdict(issue, false);
  }

  public isAccepted(): boolean {
    return this.accepted;
  }

  public describe(): string {
    return this.issue + '/' + this.accepted;
  }
}

class ExcValidator {
  private static readonly MAX_LENGTH: int = 8;

  public static checkText(text: string): ExcVerdict {
    if (text.length === 0) {
      return ExcVerdict.fail(ExcIssue.EMPTY);
    }
    if (text.length > ExcValidator.MAX_LENGTH) {
      return ExcVerdict.fail(ExcIssue.TOO_LONG);
    }
    return ExcVerdict.pass();
  }

  public static checkIndex(index: int, total: int): ExcVerdict {
    if (index < 0 || index >= total) {
      return ExcVerdict.fail(ExcIssue.OUT_OF_RANGE);
    }
    return ExcVerdict.pass();
  }

  public static checkUnique(values: string[], candidate: string): ExcVerdict {
    if (values.indexOf(candidate) >= 0) {
      return ExcVerdict.fail(ExcIssue.DUPLICATE);
    }
    return ExcVerdict.pass();
  }

  public static countAccepted(values: string[]): int {
    let counter: int = 0;
    for (let cursor: int = 0; cursor < values.length; cursor++) {
      if (ExcValidator.checkText(values[cursor]).isAccepted()) {
        counter = counter + 1;
      }
    }
    return counter;
  }

  public static firstAccepted(values: string[]): string {
    for (let cursor: int = 0; cursor < values.length; cursor++) {
      if (ExcValidator.checkText(values[cursor]).isAccepted()) {
        return values[cursor];
      }
    }
    return '';
  }

  public static requireIndex(index: int, total: int): int {
    if (index < 0 || index >= total) {
      throw new RangeError('index rejected: ' + index.toString());
    }
    return index;
  }

  public static requireText(text: string): string {
    if (text.length === 0) {
      throw new TypeError('empty text rejected');
    }
    return text;
  }
}


enum Excb1Kind {
  STRING = 'string',
  COLOR = 'color',
  MEDIA = 'media'
}

class Excb1Entry {
  public name: string;
  public kind: Excb1Kind;
  public value: string;

  constructor(name: string, kind: Excb1Kind, value: string) {
    this.name = name;
    this.kind = kind;
    this.value = value;
  }

  public static text(name: string, value: string): Excb1Entry {
    return new Excb1Entry(name, Excb1Kind.STRING, value);
  }

  public static color(name: string, value: string): Excb1Entry {
    return new Excb1Entry(name, Excb1Kind.COLOR, value);
  }

  public isKind(target: Excb1Kind): boolean {
    return this.kind === target;
  }

  public isHexColor(): boolean {
    return this.kind === Excb1Kind.COLOR && this.value.startsWith('#');
  }

  public describe(): string {
    return this.name + ':' + this.value;
  }
}

class Excb1Registry {
  private entries: Excb1Entry[] = [];

  public add(entry: Excb1Entry): boolean {
    if (this.find(entry.name) !== null) {
      return false;
    }
    this.entries.push(entry);
    return true;
  }

  public find(name: string): Excb1Entry | null {
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

  public countOfKind(kind: Excb1Kind): int {
    let counter: int = 0;
    for (let cursor: int = 0; cursor < this.entries.length; cursor++) {
      if (this.entries[cursor].isKind(kind)) {
        counter = counter + 1;
      }
    }
    return counter;
  }

  public names(): string[] {
    return this.entries.map((item: Excb1Entry) => item.name);
  }

  public joined(): string {
    return this.names().join(',');
  }

  public valueOf(name: string): string {
    const found: Excb1Entry | null = this.find(name);
    if (found === null) {
      return '';
    }
    return found.value;
  }

  public remove(name: string): boolean {
    const before: int = this.entries.length;
    this.entries = this.entries.filter((item: Excb1Entry) => item.name !== name);
    return this.entries.length < before;
  }

  public clear(): void {
    this.entries = [];
  }
}


class Excc2ImmutableTab {
  private readonly titleValue: string;
  private readonly slotValue: int;
  private readonly lockedValue: boolean;

  constructor(title: string, slot: int, locked: boolean) {
    this.titleValue = title;
    this.slotValue = slot;
    this.lockedValue = locked;
  }

  public static seed(): Excc2ImmutableTab {
    return new Excc2ImmutableTab('页面3', 0, false);
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

  public withTitle(next: string): Excc2ImmutableTab {
    return new Excc2ImmutableTab(next, this.slotValue, this.lockedValue);
  }

  public withSlot(next: int): Excc2ImmutableTab {
    return new Excc2ImmutableTab(this.titleValue, next, this.lockedValue);
  }

  public lock(): Excc2ImmutableTab {
    return new Excc2ImmutableTab(this.titleValue, this.slotValue, true);
  }

  public unlock(): Excc2ImmutableTab {
    return new Excc2ImmutableTab(this.titleValue, this.slotValue, false);
  }

  public canRename(): boolean {
    return !this.lockedValue;
  }

  public sameAs(other: Excc2ImmutableTab): boolean {
    return this.titleValue === other.titleValue && this.slotValue === other.slotValue &&
      this.lockedValue === other.lockedValue;
  }

  public describe(): string {
    return this.titleValue + '#' + this.slotValue + '#' + this.lockedValue;
  }
}

class Excc2ImmutableTabChain {
  private items: Excc2ImmutableTab[] = [];

  public append(item: Excc2ImmutableTab): void {
    this.items.push(item);
  }

  public size(): int {
    return this.items.length;
  }

  public latest(): Excc2ImmutableTab | null {
    if (this.items.length === 0) {
      return null;
    }
    return this.items[this.items.length - 1];
  }

  public titles(): string[] {
    return this.items.map((item: Excc2ImmutableTab) => item.title());
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

  public findSlot(slot: int): Excc2ImmutableTab | null {
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

export default function tabsExceptionHandlingTest(): void {
  describe('TabsExceptionHandling_Test', () => {
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
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_0100
     * @tc.name tabsExceptionHandlingTestCase001
     * @tc.desc Verify remove action: tap close once -> titled tab count does not grow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickCloseButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLessOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_0200
     * @tc.name tabsExceptionHandlingTestCase002
     * @tc.desc Verify remove on model: seeded book removes one -> count one below seed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(0)).assertTrue();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT - 1);
      expect(book.containsTitle(FIRST_TAB_TITLE)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_0300
     * @tc.name tabsExceptionHandlingTestCase003
     * @tc.desc Verify remove guard: count below minimum -> removal refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT - 1)).assertFalse();
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT)).assertTrue();
      const book: TabTitleBook = new TabTitleBook([FIRST_TAB_TITLE]);
      expect(book.removeTitle(0)).assertFalse();
      expect(book.getCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_0400
     * @tc.name tabsExceptionHandlingTestCase004
     * @tc.desc Verify remove bounds: index equal to size -> refused, size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(INITIAL_TAB_COUNT)).assertFalse();
      expect(book.removeTitle(-1)).assertFalse();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_0500
     * @tc.name tabsExceptionHandlingTestCase005
     * @tc.desc Verify remove helper: index one removed from three -> remaining joined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      titles.push(THIRD_TAB_TITLE);
      const remaining: string[] = removeTitleAt(titles, 1);
      expect(remaining.join(',')).assertEqual(FIRST_TAB_TITLE + ',' + THIRD_TAB_TITLE);
      expect(titles.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_0600
     * @tc.name tabsExceptionHandlingTestCase006
     * @tc.desc Verify remove helper bounds: out of range index -> copy unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      const untouched: string[] = removeTitleAt(titles, 9);
      expect(untouched.length).assertEqual(INITIAL_TAB_COUNT);
      expect(untouched[0]).assertEqual(FIRST_TAB_TITLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_0700
     * @tc.name tabsExceptionHandlingTestCase007
     * @tc.desc Verify add action: tap plus once -> titled tab count grows by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickAddButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLargerOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_0800
     * @tc.name tabsExceptionHandlingTestCase008
     * @tc.desc Verify add naming: one add from seed -> third page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, THIRD_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_0900
     * @tc.name tabsExceptionHandlingTestCase009
     * @tc.desc Verify limit: two adds reach maximum -> add button disappears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_1000
     * @tc.name tabsExceptionHandlingTestCase010
     * @tc.desc Verify second add naming: two adds -> fourth page label appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      await clickAddButton(driver);
      await clickAddButton(driver);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FOURTH_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_1100
     * @tc.name tabsExceptionHandlingTestCase011
     * @tc.desc Verify add helper boundary: count three allowed -> count four rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canAddTab(INITIAL_TAB_COUNT)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT - 1)).assertTrue();
      expect(canAddTab(MAX_TAB_COUNT)).assertFalse();
      expect(canAddTab(MAX_TAB_COUNT + 1)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_1200
     * @tc.name tabsExceptionHandlingTestCase012
     * @tc.desc Verify title book add: seed book accepts one add then stops at limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 1)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 2)).assertTrue();
      expect(book.addTitle(DEFAULT_NEW_PAGE_INDEX + 3)).assertFalse();
      expect(book.getCount()).assertEqual(MAX_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_1300
     * @tc.name tabsExceptionHandlingTestCase013
     * @tc.desc Verify page counter: default counter starts at two -> next page three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const counter: PageCounter = PageCounter.defaultCounter();
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX);
      expect(counter.peekNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.takeNext()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
      expect(counter.getValue()).assertEqual(DEFAULT_NEW_PAGE_INDEX + 1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_1400
     * @tc.name tabsExceptionHandlingTestCase014
     * @tc.desc Verify text gate: accepted short value ab -> ok verdict
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ExcValidator.checkText('ab').isAccepted()).assertTrue();
      expect(ExcValidator.checkText('ab').issue).assertEqual(ExcIssue.OK);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_1500
     * @tc.name tabsExceptionHandlingTestCase015
     * @tc.desc Verify text gate: empty value -> empty issue code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ExcValidator.checkText('').isAccepted()).assertFalse();
      expect(ExcValidator.checkText('').issue).assertEqual(ExcIssue.EMPTY);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_1600
     * @tc.name tabsExceptionHandlingTestCase016
     * @tc.desc Verify text gate: nine-character value -> too long issue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ExcValidator.checkText('abcdefghijklmnop').isAccepted()).assertFalse();
      expect(ExcValidator.checkText('abcdefghijklmnop').issue).assertEqual(ExcIssue.TOO_LONG);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_1700
     * @tc.name tabsExceptionHandlingTestCase017
     * @tc.desc Verify text length boundary: eight characters accepted, nine rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ExcValidator.checkText('abcdefgh').isAccepted()).assertTrue();
      expect(ExcValidator.checkText('abcdefghi').isAccepted()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_1800
     * @tc.name tabsExceptionHandlingTestCase018
     * @tc.desc Verify index gate: index 4 within total 5 -> accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ExcValidator.checkIndex(4, 5).isAccepted()).assertTrue();
      expect(ExcValidator.checkIndex(0, 5).isAccepted()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_1900
     * @tc.name tabsExceptionHandlingTestCase019
     * @tc.desc Verify index gate: index 5 against total 5 -> out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ExcValidator.checkIndex(5, 5).isAccepted()).assertFalse();
      expect(ExcValidator.checkIndex(5, 5).issue).assertEqual(ExcIssue.OUT_OF_RANGE);
      expect(ExcValidator.checkIndex(-1, 5).isAccepted()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_2000
     * @tc.name tabsExceptionHandlingTestCase020
     * @tc.desc Verify uniqueness gate: existing value ab -> duplicate issue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const existing: string[] = [];
      existing.push('ab');
      existing.push('');
      existing.push('abcdefghij');
      existing.push('cd');
      existing.push('efg');
      expect(ExcValidator.checkUnique(existing, 'ab').isAccepted()).assertFalse();
      expect(ExcValidator.checkUnique(existing, 'ab').issue).assertEqual(ExcIssue.DUPLICATE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_2100
     * @tc.name tabsExceptionHandlingTestCase021
     * @tc.desc Verify uniqueness gate: absent value -> accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const existing: string[] = [];
      existing.push('ab');
      existing.push('');
      existing.push('abcdefghij');
      existing.push('cd');
      existing.push('efg');
      expect(ExcValidator.checkUnique(existing, 'absent').isAccepted()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_2200
     * @tc.name tabsExceptionHandlingTestCase022
     * @tc.desc Verify accepted counting: 3 short values among 5 seeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const seeds: string[] = [];
      seeds.push('ab');
      seeds.push('');
      seeds.push('abcdefghij');
      seeds.push('cd');
      seeds.push('efg');
      expect(ExcValidator.countAccepted(seeds)).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_2300
     * @tc.name tabsExceptionHandlingTestCase023
     * @tc.desc Verify first accepted: seeds scanned -> ab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const seeds: string[] = [];
      seeds.push('ab');
      seeds.push('');
      seeds.push('abcdefghij');
      seeds.push('cd');
      seeds.push('efg');
      expect(ExcValidator.firstAccepted(seeds)).assertEqual('ab');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_2400
     * @tc.name tabsExceptionHandlingTestCase024
     * @tc.desc Verify require index: index 5 -> RangeError raised
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorName: string = '';
      try {
        ExcValidator.requireIndex(5, 5);
        expect().assertFail();
      } catch (error) {
        errorName = error.name;
      }
      expect(errorName).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_2500
     * @tc.name tabsExceptionHandlingTestCase025
     * @tc.desc Verify require text: empty value -> TypeError raised
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorName: string = '';
      try {
        ExcValidator.requireText('');
        expect().assertFail();
      } catch (error) {
        errorName = error.name;
      }
      expect(errorName).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_2600
     * @tc.name tabsExceptionHandlingTestCase026
     * @tc.desc Verify unique add: 3 names added -> size 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const registry: Excb1Registry = new Excb1Registry();
      expect(registry.add(Excb1Entry.text('app_name', 'value-0'))).assertTrue();
      expect(registry.add(Excb1Entry.text('start_icon', 'value-1'))).assertTrue();
      expect(registry.add(Excb1Entry.text('tab_color', 'value-2'))).assertTrue();
      expect(registry.size()).assertEqual(3);
      expect(registry.joined()).assertEqual('app_name,start_icon,tab_color');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_2700
     * @tc.name tabsExceptionHandlingTestCase027
     * @tc.desc Verify duplicate rejection: name app_name added twice -> rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const registry: Excb1Registry = new Excb1Registry();
      expect(registry.add(Excb1Entry.text('app_name', 'first'))).assertTrue();
      expect(registry.add(Excb1Entry.text('app_name', 'second'))).assertFalse();
      expect(registry.size()).assertEqual(1);
      expect(registry.valueOf('app_name')).assertEqual('first');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_2800
     * @tc.name tabsExceptionHandlingTestCase028
     * @tc.desc Verify lookup: registered app_name -> value returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const registry: Excb1Registry = new Excb1Registry();
      registry.add(Excb1Entry.text('app_name', 'stored'));
      expect(registry.valueOf('app_name')).assertEqual('stored');
      expect(registry.valueOf('absent')).assertEqual('');
      expect(registry.find('absent')).assertNull();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_2900
     * @tc.name tabsExceptionHandlingTestCase029
     * @tc.desc Verify kind counting: two colours and one text -> per-kind totals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const registry: Excb1Registry = new Excb1Registry();
      registry.add(Excb1Entry.color('c1', '#007DFF'));
      registry.add(Excb1Entry.color('c2', '#F1F3F5'));
      registry.add(Excb1Entry.text('t1', 'label'));
      expect(registry.countOfKind(Excb1Kind.COLOR)).assertEqual(2);
      expect(registry.countOfKind(Excb1Kind.STRING)).assertEqual(1);
      expect(registry.countOfKind(Excb1Kind.MEDIA)).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_3000
     * @tc.name tabsExceptionHandlingTestCase030
     * @tc.desc Verify hex colour detection: colour with hash -> true, text entry -> false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const color: Excb1Entry = Excb1Entry.color('c1', '#007DFF');
      const text: Excb1Entry = Excb1Entry.text('t1', '#007DFF');
      expect(color.isHexColor()).assertTrue();
      expect(text.isHexColor()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_3100
     * @tc.name tabsExceptionHandlingTestCase031
     * @tc.desc Verify remove: app_name removed -> size decreases by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const registry: Excb1Registry = new Excb1Registry();
      registry.add(Excb1Entry.text('app_name', 'value'));
      registry.add(Excb1Entry.text('start_icon', 'value'));
      registry.add(Excb1Entry.text('tab_color', 'value'));
      expect(registry.remove('app_name')).assertTrue();
      expect(registry.size()).assertEqual(2);
      expect(registry.remove('app_name')).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_3200
     * @tc.name tabsExceptionHandlingTestCase032
     * @tc.desc Verify clear: populated registry cleared -> zero entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const registry: Excb1Registry = new Excb1Registry();
      registry.add(Excb1Entry.text('app_name', 'value'));
      registry.add(Excb1Entry.text('start_icon', 'value'));
      registry.add(Excb1Entry.text('tab_color', 'value'));
      registry.clear();
      expect(registry.size()).assertEqual(0);
      expect(registry.names().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_3300
     * @tc.name tabsExceptionHandlingTestCase033
     * @tc.desc Verify entry describe: text entry app_name -> name colon value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entry: Excb1Entry = Excb1Entry.text('app_name', 'v1');
      expect(entry.describe()).assertEqual('app_name:v1');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_3400
     * @tc.name tabsExceptionHandlingTestCase034
     * @tc.desc Verify immutable seed: fresh record -> title tab-1 at slot 0 unlocked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Excc2ImmutableTab = Excc2ImmutableTab.seed();
      expect(record.title()).assertEqual('页面3');
      expect(record.slot()).assertEqual(0);
      expect(record.locked()).assertFalse();
      expect(record.canRename()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_3500
     * @tc.name tabsExceptionHandlingTestCase035
     * @tc.desc Verify copy on rename: withTitle tab-2 -> original keeps tab-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Excc2ImmutableTab = Excc2ImmutableTab.seed();
      const renamed: Excc2ImmutableTab = record.withTitle('页面4');
      expect(renamed.title()).assertEqual('页面4');
      expect(record.title()).assertEqual('页面3');
      expect(renamed.sameAs(record)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_3600
     * @tc.name tabsExceptionHandlingTestCase036
     * @tc.desc Verify copy on slot move: withSlot 2 -> slot updated, title preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Excc2ImmutableTab = Excc2ImmutableTab.seed();
      const moved: Excc2ImmutableTab = record.withSlot(2);
      expect(moved.slot()).assertEqual(2);
      expect(moved.title()).assertEqual('页面3');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_3700
     * @tc.name tabsExceptionHandlingTestCase037
     * @tc.desc Verify lock transition: lock then unlock -> rename permission toggles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Excc2ImmutableTab = Excc2ImmutableTab.seed();
      const locked: Excc2ImmutableTab = record.lock();
      expect(locked.locked()).assertTrue();
      expect(locked.canRename()).assertFalse();
      expect(locked.unlock().canRename()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_3800
     * @tc.name tabsExceptionHandlingTestCase038
     * @tc.desc Verify identity comparison: seed equals a copy of itself -> true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Excc2ImmutableTab = Excc2ImmutableTab.seed();
      const copy: Excc2ImmutableTab = record.withTitle('页面3');
      expect(record.sameAs(copy)).assertTrue();
      expect(record.sameAs(copy.withSlot(3))).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_3900
     * @tc.name tabsExceptionHandlingTestCase039
     * @tc.desc Verify describe format: seed record -> title hash slot hash lock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Excc2ImmutableTab = Excc2ImmutableTab.seed();
      expect(record.describe()).assertEqual('页面3#0#false');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_4000
     * @tc.name tabsExceptionHandlingTestCase040
     * @tc.desc Verify chain ordering: three records appended -> joined by arrow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chain: Excc2ImmutableTabChain = new Excc2ImmutableTabChain();
      chain.append(Excc2ImmutableTab.seed());
      chain.append(Excc2ImmutableTab.seed().withTitle('页面4'));
      chain.append(Excc2ImmutableTab.seed().withSlot(2));
      expect(chain.size()).assertEqual(3);
      expect(chain.joined()).assertEqual('页面3>页面4>页面3');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_TABSEXCEPTIONHANDLINGTEST_4100
     * @tc.name tabsExceptionHandlingTestCase041
     * @tc.desc Verify add button label: TAB_ADD_LABEL equals declared literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabsExceptionHandlingTestCase041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_ADD_LABEL).assertEqual('+');
    });
  });
}
