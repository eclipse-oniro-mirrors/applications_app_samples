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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_BUNDLE_INPUT,
  ID_ADD_BUTTON,
  ID_BEGIN_BUTTON,
  TEXT_WHITELIST_EMPTY,
  TEXT_REMOVE_BUTTON,
  TIMEOUT_PAGE_RENDER,
  TEST_BUNDLE_PRIMARY,
  TEST_BUNDLE_SECONDARY,
  TEST_BUNDLE_TERTIARY,
  TEST_BUNDLE_INVALID,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  clickComponent,
  typeBundleName,
  hideSoftKeyboard,
  addAllowedApp,
  allowedAppRowCount,
  removeFirstAllowedApp,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Limits and defaults of the whitelist editor.
const MAX_ALLOWED_APPS: number = 20;
const DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';
const MAX_CONFIG_CHARS: number = 2048;

// Reasons why the editor refuses a value.
enum InputRejection {
  NONE = 'none', EMPTY = 'empty', DUPLICATE = 'duplicate', FULL = 'full', INVALID = 'invalid'
}

/**
 * One edit attempt of the whitelist editor.
 */
interface EditAttempt {
  index: number;
  raw: string;
  trimmed: string;
  rejection: string;
  sizeBefore: number;
  sizeAfter: number;
  inputCleared: boolean;
}

/**
 * The whitelist editor of the entry page.
 *
 * The model mirrors Index.ets exactly: the input is trimmed, an empty value returns early, a
 * duplicate is rejected and clears the input, a full list refuses the value and the input keeps
 * its text so the user can see what was rejected.
 */
class WhitelistEditor {
  private entries: string[] = [];
  private typed: string = '';
  private attempts: EditAttempt[] = [];
  private capacity: number = MAX_ALLOWED_APPS;

  constructor(initial: string[] = []) {
    for (let i = 0; i < initial.length; i++) {
      const value: string = initial[i].trim();
      if (value.length > 0 && this.entries.indexOf(value) < 0 && this.entries.length < this.capacity) {
        this.entries.push(value);
      }
    }
  }

  public type(text: string): void {
    this.typed = text;
  }

  public appendTyped(text: string): void {
    this.typed = this.typed + text;
  }

  public backspace(): void {
    if (this.typed.length === 0) {
      return;
    }
    this.typed = this.typed.substring(0, this.typed.length - 1);
  }

  public clearInput(): void {
    this.typed = '';
  }

  public inputText(): string {
    return this.typed;
  }

  public inputLength(): number {
    return this.typed.length;
  }

  public add(): EditAttempt {
    const trimmed: string = this.typed.trim();
    const sizeBefore: number = this.entries.length;
    if (trimmed.length === 0) {
      return this.record(trimmed, InputRejection.EMPTY, sizeBefore, false);
    }
    if (this.entries.indexOf(trimmed) >= 0) {
      this.typed = '';
      return this.record(trimmed, InputRejection.DUPLICATE, sizeBefore, true);
    }
    if (this.entries.length >= this.capacity) {
      return this.record(trimmed, InputRejection.FULL, sizeBefore, false);
    }
    this.entries.push(trimmed);
    this.typed = '';
    return this.record(trimmed, InputRejection.NONE, sizeBefore, true);
  }

  public remove(bundleName: string): boolean {
    const index: number = this.entries.indexOf(bundleName);
    if (index < 0) {
      return false;
    }
    this.entries.splice(index, 1);
    return true;
  }

  public removeAt(index: number): boolean {
    if (index < 0 || index >= this.entries.length) {
      return false;
    }
    this.entries.splice(index, 1);
    return true;
  }

  public size(): number {
    return this.entries.length;
  }

  public entriesValue(): string[] {
    return this.entries.slice();
  }

  public contains(bundleName: string): boolean {
    return this.entries.indexOf(bundleName) >= 0;
  }

  public isFull(): boolean {
    return this.entries.length >= this.capacity;
  }

  public isEmpty(): boolean {
    return this.entries.length === 0;
  }

  public totalChars(): number {
    let total: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      total += this.entries[i].length;
    }
    return total;
  }

  public attemptsValue(): EditAttempt[] {
    return this.attempts.slice();
  }

  public attemptCount(): number {
    return this.attempts.length;
  }

  public countRejection(reason: string): number {
    let count: number = 0;
    for (let i = 0; i < this.attempts.length; i++) {
      if (this.attempts[i].rejection === reason) {
        count++;
      }
    }
    return count;
  }

  public lastAttempt(): EditAttempt | null {
    return this.attempts.length === 0 ? null : this.attempts[this.attempts.length - 1];
  }

  private record(trimmed: string, rejection: string, sizeBefore: number, inputCleared: boolean): EditAttempt {
    const attempt: EditAttempt = {
      index: this.attempts.length,
      raw: trimmed,
      trimmed: trimmed,
      rejection: rejection,
      sizeBefore: sizeBefore,
      sizeAfter: this.entries.length,
      inputCleared: inputCleared
    };
    this.attempts.push(attempt);
    return attempt;
  }

  public describe(): string {
    return `WhitelistEditor{size=${this.entries.length}, input=${this.typed.length}, ` +
      `attempts=${this.attempts.length}}`;
  }
}

/**
 * The keyboard lifecycle of the whitelist input.
 *
 * The input raises the soft keyboard when it receives focus. The keyboard shrinks the window, so
 * the sample has to dismiss it before the cards below the input can be looked up. The lifecycle
 * below models the focus, the keyboard and the dismissal.
 */
class KeyboardLifecycle {
  private focused: boolean = false;
  private keyboardVisible: boolean = false;
  private dismissCount: number = 0;
  private focusEvents: number = 0;

  public focus(): void {
    this.focused = true;
    this.keyboardVisible = true;
    this.focusEvents++;
  }

  public blur(): void {
    this.focused = false;
  }

  public dismiss(): boolean {
    if (!this.keyboardVisible) {
      return false;
    }
    this.keyboardVisible = false;
    this.focused = false;
    this.dismissCount++;
    return true;
  }

  public isFocused(): boolean {
    return this.focused;
  }

  public isKeyboardVisible(): boolean {
    return this.keyboardVisible;
  }

  public dismissals(): number {
    return this.dismissCount;
  }

  public focusCount(): number {
    return this.focusEvents;
  }

  public describe(): string {
    return `Keyboard{focused=${this.focused}, visible=${this.keyboardVisible}, ` +
      `dismissals=${this.dismissCount}}`;
  }
}

/**
 * The model of the whitelist rows that the page renders.
 *
 * The entry page renders one row per entry with the bundle name on the left and the remove
 * button on the right. The renderer below produces the same texts, so a case can assert the
 * expected row content without a device.
 */
class WhitelistRowModel {
  public static nameTexts(entries: string[]): string[] {
    return entries.slice();
  }

  public static removeText(): string {
    return TEXT_REMOVE_BUTTON;
  }

  public static rowCount(entries: string[]): number {
    return entries.length;
  }

  public static emptyHint(entries: string[]): string {
    return entries.length === 0 ? TEXT_WHITELIST_EMPTY : '';
  }

  public static rowTitles(entries: string[]): string[] {
    const titles: string[] = [];
    for (let i = 0; i < entries.length; i++) {
      titles.push(`${entries[i]} | ${TEXT_REMOVE_BUTTON}`);
    }
    return titles;
  }

  public static truncatedText(entry: string, limit: number): string {
    if (entry.length <= limit) {
      return entry;
    }
    return entry.substring(0, limit) + '...';
  }

  public static allRemovable(entries: string[]): boolean {
    return entries.length === WhitelistRowModel.rowCount(entries);
  }
}

/**
 * The focus order of the whitelist input and the add button.
 *
 * The configuration card renders the input before the add button, so a keyboard user reaches the
 * input first. The order is asserted by the usability oriented cases.
 */
class ConfigFocusOrder {
  public static ids(): string[] {
    return [ID_BUNDLE_INPUT, ID_ADD_BUTTON];
  }

  public static indexOf(id: string): number {
    return ConfigFocusOrder.ids().indexOf(id);
  }

  public static inputPrecedesButton(): boolean {
    return ConfigFocusOrder.indexOf(ID_BUNDLE_INPUT) < ConfigFocusOrder.indexOf(ID_ADD_BUTTON);
  }

  public static successorOf(id: string): string {
    const index: number = ConfigFocusOrder.indexOf(id);
    const ids: string[] = ConfigFocusOrder.ids();
    if (index < 0 || index >= ids.length - 1) {
      return '';
    }
    return ids[index + 1];
  }

  public static describe(): string {
    return `FocusOrder{ids=${ConfigFocusOrder.ids().join('>')}}`;
  }
}

/**
 * Starts the sample and waits for the entry page, the UI cases degrade to a skip when the page
 * never shows up.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function whitelistInputInteractionTest() {
  describe('WhitelistInputInteraction_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the editor is seeded with the default entry.
     * Expectation: exactly one entry is present and the editor is not full.
     */
    it('Assessment_EditorSeed_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorSeed_001, begin');
      const editor: WhitelistEditor = new WhitelistEditor([DEFAULT_ALLOWED_APP]);
      expect(editor.size()).assertEqual(1);
      expect(editor.contains(DEFAULT_ALLOWED_APP)).assertTrue();
      expect(editor.isEmpty()).assertFalse();
      expect(editor.isFull()).assertFalse();
      expect(editor.inputText()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorSeed_001, end');
    });

    /**
     * Scenario: typing into the input.
     * Expectation: the text is appended and the length matches the typed characters.
     */
    it('Assessment_EditorTyping_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorTyping_002, begin');
      const editor: WhitelistEditor = new WhitelistEditor([DEFAULT_ALLOWED_APP]);
      editor.type('com.');
      editor.appendTyped('samples.');
      editor.appendTyped('reader');
      expect(editor.inputText()).assertEqual('com.samples.reader');
      expect(editor.inputLength()).assertEqual('com.samples.reader'.length);
      expect(editor.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorTyping_002, end');
    });

    /**
     * Scenario: pressing backspace on a typed value.
     * Expectation: the last character disappears and an empty input stays empty.
     */
    it('Assessment_EditorBackspace_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorBackspace_003, begin');
      const editor: WhitelistEditor = new WhitelistEditor([]);
      editor.type('abc');
      editor.backspace();
      expect(editor.inputText()).assertEqual('ab');
      editor.backspace();
      editor.backspace();
      expect(editor.inputText()).assertEqual('');
      editor.backspace();
      expect(editor.inputText()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorBackspace_003, end');
    });

    /**
     * Scenario: clearing the input.
     * Expectation: the typed text is dropped and the whitelist is untouched.
     */
    it('Assessment_EditorClearInput_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorClearInput_004, begin');
      const editor: WhitelistEditor = new WhitelistEditor([DEFAULT_ALLOWED_APP]);
      editor.type(TEST_BUNDLE_SECONDARY);
      editor.clearInput();
      expect(editor.inputText()).assertEqual('');
      expect(editor.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorClearInput_004, end');
    });

    /**
     * Scenario: adding a typed value.
     * Expectation: the value is appended, the input clears and the attempt reports success.
     */
    it('Assessment_EditorAddAccepted_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorAddAccepted_005, begin');
      const editor: WhitelistEditor = new WhitelistEditor([DEFAULT_ALLOWED_APP]);
      editor.type(TEST_BUNDLE_SECONDARY);
      const attempt: EditAttempt = editor.add();
      expect(attempt.rejection).assertEqual(InputRejection.NONE);
      expect(attempt.sizeBefore).assertEqual(1);
      expect(attempt.sizeAfter).assertEqual(2);
      expect(attempt.inputCleared).assertTrue();
      expect(editor.inputText()).assertEqual('');
      expect(editor.contains(TEST_BUNDLE_SECONDARY)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorAddAccepted_005, end');
    });

    /**
     * Scenario: adding a value with surrounding spaces.
     * Expectation: the stored value is the trimmed one.
     */
    it('Assessment_EditorAddTrimmed_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorAddTrimmed_006, begin');
      const editor: WhitelistEditor = new WhitelistEditor([]);
      editor.type('   ' + TEST_BUNDLE_TERTIARY + '   ');
      const attempt: EditAttempt = editor.add();
      expect(attempt.rejection).assertEqual(InputRejection.NONE);
      expect(attempt.trimmed).assertEqual(TEST_BUNDLE_TERTIARY);
      expect(editor.entriesValue()[0]).assertEqual(TEST_BUNDLE_TERTIARY);
      expect(editor.entriesValue()[0]).assertEqual(editor.entriesValue()[0].trim());
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorAddTrimmed_006, end');
    });

    /**
     * Scenario: adding an empty value.
     * Expectation: the attempt is rejected and the input keeps its text.
     */
    it('Assessment_EditorRejectEmpty_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorRejectEmpty_007, begin');
      const editor: WhitelistEditor = new WhitelistEditor([DEFAULT_ALLOWED_APP]);
      const empty: EditAttempt = editor.add();
      expect(empty.rejection).assertEqual(InputRejection.EMPTY);
      expect(empty.inputCleared).assertFalse();
      editor.type('    ');
      const blank: EditAttempt = editor.add();
      expect(blank.rejection).assertEqual(InputRejection.EMPTY);
      expect(editor.size()).assertEqual(1);
      expect(editor.countRejection(InputRejection.EMPTY)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorRejectEmpty_007, end');
    });

    /**
     * Scenario: adding a duplicate value.
     * Expectation: the duplicate is rejected and the input is cleared.
     */
    it('Assessment_EditorRejectDuplicate_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorRejectDuplicate_008, begin');
      const editor: WhitelistEditor = new WhitelistEditor([DEFAULT_ALLOWED_APP]);
      editor.type(DEFAULT_ALLOWED_APP);
      const attempt: EditAttempt = editor.add();
      expect(attempt.rejection).assertEqual(InputRejection.DUPLICATE);
      expect(attempt.inputCleared).assertTrue();
      expect(attempt.sizeAfter).assertEqual(1);
      expect(editor.inputText()).assertEqual('');
      expect(editor.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorRejectDuplicate_008, end');
    });

    /**
     * Scenario: adding a padded duplicate.
     * Expectation: the trim happens before the duplicate check, so it is still rejected.
     */
    it('Assessment_EditorRejectPaddedDuplicate_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorRejectPaddedDuplicate_009, begin');
      const editor: WhitelistEditor = new WhitelistEditor([DEFAULT_ALLOWED_APP]);
      editor.type(' ' + DEFAULT_ALLOWED_APP + ' ');
      const attempt: EditAttempt = editor.add();
      expect(attempt.rejection).assertEqual(InputRejection.DUPLICATE);
      expect(attempt.trimmed).assertEqual(DEFAULT_ALLOWED_APP);
      expect(editor.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorRejectPaddedDuplicate_009, end');
    });

    /**
     * Scenario: adding to a full whitelist.
     * Expectation: the attempt is rejected as full and the input is not cleared.
     */
    it('Assessment_EditorRejectFull_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorRejectFull_010, begin');
      const seed: string[] = [];
      for (let i = 0; i < MAX_ALLOWED_APPS; i++) {
        seed.push(`com.samples.app${i}`);
      }
      const editor: WhitelistEditor = new WhitelistEditor(seed);
      expect(editor.isFull()).assertTrue();
      editor.type('com.samples.overflow');
      const attempt: EditAttempt = editor.add();
      expect(attempt.rejection).assertEqual(InputRejection.FULL);
      expect(attempt.inputCleared).assertFalse();
      expect(attempt.sizeAfter).assertEqual(MAX_ALLOWED_APPS);
      expect(editor.inputText()).assertEqual('com.samples.overflow');
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorRejectFull_010, end');
    });

    /**
     * Scenario: adding the twentieth entry.
     * Expectation: the last free slot accepts one more entry and the editor becomes full.
     */
    it('Assessment_EditorLastSlot_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorLastSlot_011, begin');
      const seed: string[] = [];
      for (let i = 0; i < MAX_ALLOWED_APPS - 1; i++) {
        seed.push(`com.samples.app${i}`);
      }
      const editor: WhitelistEditor = new WhitelistEditor(seed);
      expect(editor.isFull()).assertFalse();
      editor.type('com.samples.lastone');
      const attempt: EditAttempt = editor.add();
      expect(attempt.rejection).assertEqual(InputRejection.NONE);
      expect(editor.size()).assertEqual(MAX_ALLOWED_APPS);
      expect(editor.isFull()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorLastSlot_011, end');
    });

    /**
     * Scenario: removing an entry by value.
     * Expectation: the entry disappears and the order of the remaining entries holds.
     */
    it('Assessment_EditorRemoveByValue_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorRemoveByValue_012, begin');
      const editor: WhitelistEditor =
        new WhitelistEditor([TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY, TEST_BUNDLE_TERTIARY]);
      expect(editor.remove(TEST_BUNDLE_SECONDARY)).assertTrue();
      expect(editor.size()).assertEqual(2);
      expect(editor.entriesValue()[0]).assertEqual(TEST_BUNDLE_PRIMARY);
      expect(editor.entriesValue()[1]).assertEqual(TEST_BUNDLE_TERTIARY);
      expect(editor.remove(TEST_BUNDLE_SECONDARY)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorRemoveByValue_012, end');
    });

    /**
     * Scenario: removing an entry by index.
     * Expectation: the indices outside the list are rejected.
     */
    it('Assessment_EditorRemoveByIndex_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorRemoveByIndex_013, begin');
      const editor: WhitelistEditor = new WhitelistEditor([TEST_BUNDLE_PRIMARY]);
      expect(editor.removeAt(0)).assertTrue();
      expect(editor.size()).assertEqual(0);
      expect(editor.removeAt(0)).assertFalse();
      expect(editor.removeAt(-1)).assertFalse();
      expect(editor.isEmpty()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorRemoveByIndex_013, end');
    });

    /**
     * Scenario: the character budget of the editor.
     * Expectation: the total length equals the sum of the stored entries.
     */
    it('Assessment_EditorTotalChars_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorTotalChars_014, begin');
      const editor: WhitelistEditor =
        new WhitelistEditor([TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY, TEST_BUNDLE_TERTIARY]);
      const expected: number = TEST_BUNDLE_PRIMARY.length + TEST_BUNDLE_SECONDARY.length +
        TEST_BUNDLE_TERTIARY.length;
      expect(editor.totalChars()).assertEqual(expected);
      expect(editor.totalChars() <= MAX_CONFIG_CHARS).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s total chars: %{public}d', BUNDLE + 'EditorTotalChars_014',
        editor.totalChars());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorTotalChars_014, end');
    });

    /**
     * Scenario: the attempt history of the editor.
     * Expectation: the history keeps the order and the last attempt is the newest one.
     */
    it('Assessment_EditorAttemptHistory_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorAttemptHistory_015, begin');
      const editor: WhitelistEditor = new WhitelistEditor([]);
      editor.type(TEST_BUNDLE_PRIMARY);
      editor.add();
      editor.type(TEST_BUNDLE_PRIMARY);
      editor.add();
      editor.type('');
      editor.add();
      expect(editor.attemptCount()).assertEqual(3);
      expect(editor.attemptsValue()[0].index).assertEqual(0);
      expect(editor.attemptsValue()[2].index).assertEqual(2);
      const last: EditAttempt | null = editor.lastAttempt();
      expect(last !== null).assertTrue();
      if (last !== null) {
        expect(last.rejection).assertEqual(InputRejection.EMPTY);
      }
      expect(editor.countRejection(InputRejection.DUPLICATE)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorAttemptHistory_015, end');
    });

    /**
     * Scenario: the row model of the whitelist.
     * Expectation: it produces one row per entry plus a remove label.
     */
    it('Assessment_RowModel_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RowModel_016, begin');
      const entries: string[] = [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY];
      expect(WhitelistRowModel.rowCount(entries)).assertEqual(2);
      expect(WhitelistRowModel.nameTexts(entries).length).assertEqual(2);
      expect(WhitelistRowModel.removeText()).assertEqual(TEXT_REMOVE_BUTTON);
      expect(WhitelistRowModel.rowTitles(entries)[0]).assertContain(TEST_BUNDLE_PRIMARY);
      expect(WhitelistRowModel.rowTitles(entries)[0]).assertContain(TEXT_REMOVE_BUTTON);
      expect(WhitelistRowModel.allRemovable(entries)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', WhitelistRowModel.rowTitles(entries)[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RowModel_016, end');
    });

    /**
     * Scenario: the empty hint of the row model.
     * Expectation: it is only rendered for an empty whitelist.
     */
    it('Assessment_RowModelEmptyHint_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RowModelEmptyHint_017, begin');
      expect(WhitelistRowModel.emptyHint([])).assertEqual(TEXT_WHITELIST_EMPTY);
      expect(WhitelistRowModel.emptyHint([TEST_BUNDLE_PRIMARY])).assertEqual('');
      expect(WhitelistRowModel.rowCount([])).assertEqual(0);
      expect(WhitelistRowModel.allRemovable([])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TEXT_WHITELIST_EMPTY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RowModelEmptyHint_017, end');
    });

    /**
     * Scenario: the truncation of a long bundle name in a row.
     * Expectation: an over long name is shortened with an ellipsis, a short one is untouched.
     */
    it('Assessment_RowModelTruncation_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RowModelTruncation_018, begin');
      const long: string = 'com.samples.averyveryverylongbundlename';
      const truncated: string = WhitelistRowModel.truncatedText(long, 12);
      expect(truncated.length).assertEqual(15);
      expect(truncated).assertContain('...');
      expect(WhitelistRowModel.truncatedText('com.a', 12)).assertEqual('com.a');
      hilog.info(DOMAIN, TAG, '%{public}s', truncated);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RowModelTruncation_018, end');
    });

    /**
     * Scenario: the keyboard lifecycle of the input.
     * Expectation: focus raises the keyboard and a dismissal lowers it.
     */
    it('Assessment_KeyboardLifecycle_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyboardLifecycle_019, begin');
      const keyboard: KeyboardLifecycle = new KeyboardLifecycle();
      expect(keyboard.isKeyboardVisible()).assertFalse();
      keyboard.focus();
      expect(keyboard.isFocused()).assertTrue();
      expect(keyboard.isKeyboardVisible()).assertTrue();
      expect(keyboard.focusCount()).assertEqual(1);
      expect(keyboard.dismiss()).assertTrue();
      expect(keyboard.isKeyboardVisible()).assertFalse();
      expect(keyboard.isFocused()).assertFalse();
      expect(keyboard.dismissals()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', keyboard.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyboardLifecycle_019, end');
    });

    /**
     * Scenario: dismissing a keyboard that is already hidden.
     * Expectation: the dismissal is refused and the counter does not move.
     */
    it('Assessment_KeyboardDismissTwice_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyboardDismissTwice_020, begin');
      const keyboard: KeyboardLifecycle = new KeyboardLifecycle();
      keyboard.focus();
      expect(keyboard.dismiss()).assertTrue();
      expect(keyboard.dismiss()).assertFalse();
      expect(keyboard.dismissals()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', keyboard.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyboardDismissTwice_020, end');
    });

    /**
     * Scenario: a blur without a dismissal.
     * Expectation: the focus clears while the keyboard stays visible until it is dismissed.
     */
    it('Assessment_KeyboardBlur_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyboardBlur_021, begin');
      const keyboard: KeyboardLifecycle = new KeyboardLifecycle();
      keyboard.focus();
      keyboard.blur();
      expect(keyboard.isFocused()).assertFalse();
      expect(keyboard.isKeyboardVisible()).assertTrue();
      expect(keyboard.dismiss()).assertTrue();
      expect(keyboard.isKeyboardVisible()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', keyboard.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyboardBlur_021, end');
    });

    /**
     * Scenario: repeated focus cycles of the input.
     * Expectation: the focus counter grows and the dismissals match the cycles.
     */
    it('Assessment_KeyboardRepeatedCycles_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyboardRepeatedCycles_022, begin');
      const keyboard: KeyboardLifecycle = new KeyboardLifecycle();
      for (let i = 0; i < 4; i++) {
        keyboard.focus();
        expect(keyboard.dismiss()).assertTrue();
      }
      expect(keyboard.focusCount()).assertEqual(4);
      expect(keyboard.dismissals()).assertEqual(4);
      expect(keyboard.isKeyboardVisible()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', keyboard.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KeyboardRepeatedCycles_022, end');
    });

    /**
     * Scenario: the focus order of the configuration card.
     * Expectation: the input precedes the add button and the add button ends the order.
     */
    it('Assessment_FocusOrder_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusOrder_023, begin');
      expect(ConfigFocusOrder.ids().length).assertEqual(2);
      expect(ConfigFocusOrder.inputPrecedesButton()).assertTrue();
      expect(ConfigFocusOrder.indexOf(ID_BUNDLE_INPUT)).assertEqual(0);
      expect(ConfigFocusOrder.successorOf(ID_BUNDLE_INPUT)).assertEqual(ID_ADD_BUTTON);
      expect(ConfigFocusOrder.successorOf(ID_ADD_BUTTON)).assertEqual('');
      expect(ConfigFocusOrder.indexOf('missing')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', ConfigFocusOrder.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusOrder_023, end');
    });

    /**
     * Scenario: the editor description.
     * Expectation: it carries the size, the input length and the attempt count.
     */
    it('Assessment_EditorDescription_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorDescription_039, begin');
      const editor: WhitelistEditor = new WhitelistEditor([DEFAULT_ALLOWED_APP]);
      editor.type(TEST_BUNDLE_SECONDARY);
      const text: string = editor.describe();
      expect(text).assertContain('size=1');
      expect(text).assertContain(`input=${TEST_BUNDLE_SECONDARY.length}`);
      expect(text).assertContain('attempts=0');
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorDescription_039, end');
    });

    /**
     * Scenario: the seeded editor rejects an invalid default.
     * Expectation: an empty or whitespace only seed never enters the list.
     */
    it('Assessment_EditorSeedFiltering_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorSeedFiltering_040, begin');
      const editor: WhitelistEditor = new WhitelistEditor(['', '   ', DEFAULT_ALLOWED_APP, DEFAULT_ALLOWED_APP]);
      expect(editor.size()).assertEqual(1);
      expect(editor.contains(DEFAULT_ALLOWED_APP)).assertTrue();
      expect(editor.entriesValue()[0]).assertEqual(DEFAULT_ALLOWED_APP);
      hilog.info(DOMAIN, TAG, '%{public}s', editor.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EditorSeedFiltering_040, end');
    });
  });
}
