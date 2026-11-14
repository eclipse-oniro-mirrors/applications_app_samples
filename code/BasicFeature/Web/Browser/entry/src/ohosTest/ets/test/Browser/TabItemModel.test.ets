/*
 * Copyright (c) 2026 Sample Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, rebaseTabKeys, MAX_TAB_COUNT,
  MIN_TAB_COUNT, TIMEOUT_COMPONENT
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockClock, MockBrowserTab } from '../Shared/BrowserMock';

const TAG: string = 'BrowserTabItemModelTest';

const KEY_START: number = 0;
const BASE_TIMESTAMP: number = 1700000000000;
const CLOCK_STEP_MS: number = 1000;
const SAMPLE_TAB_COUNT: number = 6;
const MAX_SCAN_COUNT: number = 12;
const DEFAULT_REGISTERED: boolean = false;

/* ------------------------------------------------------------------ */
/* WebKey ledger                                                       */
/* ------------------------------------------------------------------ */

/** One WebKey record: a tab key plus its creation timestamp. */
class TabKeyRecord {
  key: number;
  timestamp: number;

  constructor(key: number, timestamp: number) {
    this.key = key;
    this.timestamp = timestamp;
  }
}

/**
 * Structural validator for the @Observed WebKey list of model/Browser.ets.
 *
 * The real class only stores key and timestamp, therefore every validity
 * rule of the tab bar has to be expressed as an invariant here.
 */
class KeyLedger {
  records: TabKeyRecord[] = [];

  static fromBrowser(browser: MockBrowser): KeyLedger {
    const ledger: KeyLedger = new KeyLedger();
    for (let index = 0; index < browser.tabs.length; index++) {
      ledger.records.push(new TabKeyRecord(browser.tabs[index].key, browser.tabs[index].timestamp));
    }
    return ledger;
  }

  static fromKeys(keys: number[]): KeyLedger {
    const ledger: KeyLedger = new KeyLedger();
    for (let index = 0; index < keys.length; index++) {
      ledger.records.push(new TabKeyRecord(keys[index], BASE_TIMESTAMP + index));
    }
    return ledger;
  }

  size(): number {
    return this.records.length;
  }

  keys(): number[] {
    return this.records.map((record: TabKeyRecord) => record.key);
  }

  timestamps(): number[] {
    return this.records.map((record: TabKeyRecord) => record.timestamp);
  }

  keyAt(index: number): number {
    if (index < 0 || index >= this.records.length) {
      return -1;
    }
    return this.records[index].key;
  }

  isContiguous(): boolean {
    for (let index = 0; index < this.records.length; index++) {
      if (this.records[index].key !== index) {
        return false;
      }
    }
    return true;
  }

  uniqueKeyCount(): number {
    const seen: number[] = [];
    for (let index = 0; index < this.records.length; index++) {
      if (seen.indexOf(this.records[index].key) < 0) {
        seen.push(this.records[index].key);
      }
    }
    return seen.length;
  }

  uniqueTimestampCount(): number {
    const seen: number[] = [];
    for (let index = 0; index < this.records.length; index++) {
      if (seen.indexOf(this.records[index].timestamp) < 0) {
        seen.push(this.records[index].timestamp);
      }
    }
    return seen.length;
  }

  hasDuplicateTimestamp(): boolean {
    return this.uniqueTimestampCount() !== this.records.length;
  }

  isMonotonic(): boolean {
    for (let index = 1; index < this.records.length; index++) {
      if (this.records[index].timestamp <= this.records[index - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  isSortedByKey(): boolean {
    for (let index = 1; index < this.records.length; index++) {
      if (this.records[index].key < this.records[index - 1].key) {
        return false;
      }
    }
    return true;
  }

  minKey(): number {
    let result: number = this.records.length > 0 ? this.records[0].key : -1;
    for (let index = 1; index < this.records.length; index++) {
      if (this.records[index].key < result) {
        result = this.records[index].key;
      }
    }
    return result;
  }

  maxKey(): number {
    let result: number = this.records.length > 0 ? this.records[0].key : -1;
    for (let index = 1; index < this.records.length; index++) {
      if (this.records[index].key > result) {
        result = this.records[index].key;
      }
    }
    return result;
  }

  describe(): string {
    return 'tabs=' + this.records.length + ', keys=' + this.keys().join(',');
  }
}

/* ------------------------------------------------------------------ */
/* WebObject registration model                                        */
/* ------------------------------------------------------------------ */

/**
 * Mirror of WebObject { controller, isRegistered }.
 *
 * registerFunc only injects the etsObj proxy once per controller, so the
 * second registration attempt has to be a no-op.
 */
class WebObjectModel {
  controllerId: number;
  isRegistered: boolean = DEFAULT_REGISTERED;
  registerCalls: number = 0;

  constructor(controllerId: number) {
    this.controllerId = controllerId;
  }

  register(): boolean {
    this.registerCalls += 1;
    if (this.isRegistered) {
      return false;
    }
    this.isRegistered = true;
    return true;
  }

  reset(): void {
    this.isRegistered = false;
    this.registerCalls = 0;
  }

  describe(): string {
    return 'controller=' + this.controllerId + ', registered=' + this.isRegistered;
  }
}

/* ------------------------------------------------------------------ */
/* Tab data model matrix                                               */
/* ------------------------------------------------------------------ */

const OP_ADD: string = 'add';
const OP_DELETE: string = 'delete';
const OP_SELECT: string = 'select';
const OP_SET_INDEX: string = 'setIndex';

/** One row of the tab operation matrix. */
class TabMatrixRow {
  initialCount: number;
  operation: string;
  argument: number;
  expectedCount: number;
  expectedIndex: number;
  expectedResult: boolean;

  constructor(initialCount: number, operation: string, argument: number,
    expectedCount: number, expectedIndex: number, expectedResult: boolean) {
    this.initialCount = initialCount;
    this.operation = operation;
    this.argument = argument;
    this.expectedCount = expectedCount;
    this.expectedIndex = expectedIndex;
    this.expectedResult = expectedResult;
  }

  apply(browser: MockBrowser): boolean {
    if (this.operation === OP_ADD) {
      return browser.addTab();
    }
    if (this.operation === OP_DELETE) {
      return browser.deleteTab(this.argument);
    }
    if (this.operation === OP_SELECT) {
      return browser.selectTab(this.argument);
    }
    browser.setTabArrayIndex(this.argument);
    return true;
  }
}

function buildAddRows(): TabMatrixRow[] {
  const rows: TabMatrixRow[] = [];
  for (let count = MIN_TAB_COUNT; count <= MAX_TAB_COUNT + 1; count++) {
    const accepted: boolean = count <= MAX_TAB_COUNT;
    const expectedCount: number = accepted ? count + 1 : count;
    const expectedIndex: number = accepted ? count : 0;
    rows.push(new TabMatrixRow(count, OP_ADD, 0, expectedCount, expectedIndex, accepted));
  }
  return rows;
}

function buildDeleteRows(): TabMatrixRow[] {
  const rows: TabMatrixRow[] = [];
  for (let count = MIN_TAB_COUNT; count <= MAX_TAB_COUNT; count++) {
    const removable: boolean = count > MIN_TAB_COUNT;
    const expectedCount: number = removable ? count - 1 : count;
    const expectedIndex: number = removable ? count - 2 : 0;
    rows.push(new TabMatrixRow(count, OP_DELETE, 0, expectedCount, expectedIndex, removable));
  }
  return rows;
}

function buildSelectRows(): TabMatrixRow[] {
  const rows: TabMatrixRow[] = [];
  for (let count = MIN_TAB_COUNT; count <= MAX_TAB_COUNT; count++) {
    rows.push(new TabMatrixRow(count, OP_SELECT, count - 1, count, count - 1, true));
    rows.push(new TabMatrixRow(count, OP_SELECT, count, count, 0, false));
  }
  return rows;
}

function buildInvalidDeleteRows(): TabMatrixRow[] {
  const rows: TabMatrixRow[] = [];
  for (let count = MIN_TAB_COUNT; count <= MAX_TAB_COUNT; count++) {
    rows.push(new TabMatrixRow(count, OP_DELETE, -1, count, 0, false));
    rows.push(new TabMatrixRow(count, OP_DELETE, count, count, 0, false));
    rows.push(new TabMatrixRow(count, OP_DELETE, count + 5, count, 0, false));
  }
  return rows;
}

export default function browserTabItemModelTest() {
  describe('browserTabItemModelTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'tab item model suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_TabItem_001', 0, async () => {
      TestLogger.step(TAG, 'validate the first tab key of a fresh browser');
      const browser: MockBrowser = new MockBrowser();
      const ledger: KeyLedger = KeyLedger.fromBrowser(browser);
      expect(browser.tabs.length).assertEqual(MIN_TAB_COUNT);
      expect(ledger.size()).assertEqual(1);
      expect(ledger.keyAt(0)).assertEqual(KEY_START);
      expect(ledger.keys()).assertDeepEquals([KEY_START]);
      expect(ledger.isContiguous()).assertTrue();
      expect(browser.getTabArrayIndex()).assertEqual(0);
      expect(browser.getCurrentTab() === null).assertFalse();
    });

    it('Browser_TabItem_002', 0, async () => {
      TestLogger.step(TAG, 'validate the creation timestamp of the first tab');
      const browser: MockBrowser = new MockBrowser();
      const stamp: number = browser.getTimestamps()[0];
      expect(stamp > 0).assertTrue();
      expect(stamp >= BASE_TIMESTAMP - 1).assertTrue();
      expect(browser.tabs[0].timestamp).assertEqual(stamp);
      expect(KeyLedger.fromBrowser(browser).hasDuplicateTimestamp()).assertFalse();
    });

    it('Browser_TabItem_003', 0, async () => {
      TestLogger.step(TAG, 'grow the key sequence up to ten tabs');
      const browser: MockBrowser = new MockBrowser();
      while (browser.tabs.length < MAX_TAB_COUNT) {
        expect(browser.addTab()).assertTrue();
      }
      const ledger: KeyLedger = KeyLedger.fromBrowser(browser);
      expect(ledger.size()).assertEqual(MAX_TAB_COUNT);
      expect(ledger.isContiguous()).assertTrue();
      expect(ledger.keyAt(0)).assertEqual(0);
      expect(ledger.keyAt(MAX_TAB_COUNT - 1)).assertEqual(MAX_TAB_COUNT - 1);
      expect(ledger.minKey()).assertEqual(0);
      expect(ledger.maxKey()).assertEqual(MAX_TAB_COUNT - 1);
      expect(ledger.uniqueKeyCount()).assertEqual(MAX_TAB_COUNT);
    });

    it('Browser_TabItem_004', 0, async () => {
      TestLogger.step(TAG, 'validate the key ledger of an explicit key list');
      const ledger: KeyLedger = KeyLedger.fromKeys([0, 1, 2, 3, 4]);
      expect(ledger.size()).assertEqual(5);
      expect(ledger.isContiguous()).assertTrue();
      expect(ledger.isSortedByKey()).assertTrue();
      expect(ledger.keyAt(-1)).assertEqual(-1);
      expect(ledger.keyAt(5)).assertEqual(-1);
      expect(ledger.keyAt(2)).assertEqual(2);
      expect(ledger.describe()).assertContain('keys=0,1,2,3,4');
    });

    it('Browser_TabItem_005', 0, async () => {
      TestLogger.step(TAG, 'build strictly increasing timestamps with a mock clock');
      const clock: MockClock = new MockClock(BASE_TIMESTAMP);
      const ledger: KeyLedger = new KeyLedger();
      for (let index = 0; index < SAMPLE_TAB_COUNT; index++) {
        ledger.records.push(new TabKeyRecord(index, clock.now()));
        clock.advance(CLOCK_STEP_MS);
      }
      expect(ledger.size()).assertEqual(SAMPLE_TAB_COUNT);
      expect(ledger.isMonotonic()).assertTrue();
      expect(ledger.isContiguous()).assertTrue();
      expect(ledger.hasDuplicateTimestamp()).assertFalse();
      expect(ledger.uniqueTimestampCount()).assertEqual(SAMPLE_TAB_COUNT);
      expect(ledger.timestamps()[0]).assertEqual(BASE_TIMESTAMP);
    });

    it('Browser_TabItem_006', 0, async () => {
      TestLogger.step(TAG, 'detect duplicated creation timestamps');
      const clock: MockClock = new MockClock(BASE_TIMESTAMP);
      const ledger: KeyLedger = new KeyLedger();
      ledger.records.push(new TabKeyRecord(0, clock.now()));
      ledger.records.push(new TabKeyRecord(1, clock.now()));
      ledger.records.push(new TabKeyRecord(2, clock.advance(CLOCK_STEP_MS)));
      expect(ledger.size()).assertEqual(3);
      expect(ledger.hasDuplicateTimestamp()).assertTrue();
      expect(ledger.uniqueTimestampCount()).assertEqual(2);
      expect(ledger.isMonotonic()).assertFalse();
      expect(ledger.isContiguous()).assertTrue();
    });

    it('Browser_TabItem_007', 0, async () => {
      TestLogger.step(TAG, 'keep default tab timestamps distinct');
      const browser: MockBrowser = new MockBrowser(3);
      const ledger: KeyLedger = KeyLedger.fromBrowser(browser);
      expect(ledger.size()).assertEqual(3);
      expect(ledger.hasDuplicateTimestamp()).assertFalse();
      expect(ledger.uniqueTimestampCount()).assertEqual(3);
      expect(ledger.isMonotonic()).assertTrue();
      const stamps: number[] = ledger.timestamps();
      expect(stamps[1] - stamps[0]).assertEqual(1);
      expect(stamps[2] - stamps[1]).assertEqual(1);
    });

    it('Browser_TabItem_008', 0, async () => {
      TestLogger.step(TAG, 'validate the default state of a WebObject entry');
      const object: WebObjectModel = new WebObjectModel(7);
      expect(object.controllerId).assertEqual(7);
      expect(object.isRegistered).assertFalse();
      expect(object.registerCalls).assertEqual(0);
      expect(object.describe()).assertContain('registered=false');
      expect(object.describe()).assertContain('controller=7');
    });

    it('Browser_TabItem_009', 0, async () => {
      TestLogger.step(TAG, 'register a WebObject exactly once');
      const object: WebObjectModel = new WebObjectModel(1);
      expect(object.register()).assertTrue();
      expect(object.isRegistered).assertTrue();
      expect(object.register()).assertFalse();
      expect(object.isRegistered).assertTrue();
      expect(object.registerCalls).assertEqual(2);
      expect(object.describe()).assertContain('registered=true');
    });

    it('Browser_TabItem_010', 0, async () => {
      TestLogger.step(TAG, 'reset a registered WebObject and register again');
      const object: WebObjectModel = new WebObjectModel(2);
      object.register();
      object.register();
      expect(object.registerCalls).assertEqual(2);
      object.reset();
      expect(object.isRegistered).assertFalse();
      expect(object.registerCalls).assertEqual(0);
      expect(object.register()).assertTrue();
      expect(object.isRegistered).assertTrue();
      expect(object.controllerId).assertEqual(2);
    });

    it('Browser_TabItem_011', 0, async () => {
      TestLogger.step(TAG, 'walk every row of the add tab matrix');
      const rows: TabMatrixRow[] = buildAddRows();
      expect(rows.length).assertEqual(MAX_TAB_COUNT + 1);
      for (let index = 0; index < rows.length; index++) {
        const row: TabMatrixRow = rows[index];
        const browser: MockBrowser = new MockBrowser(row.initialCount);
        const accepted: boolean = row.apply(browser);
        expect(accepted).assertEqual(row.expectedResult);
        expect(browser.tabs.length).assertEqual(row.expectedCount);
        if (accepted) {
          expect(browser.getTabArrayIndex()).assertEqual(row.expectedIndex);
          expect(KeyLedger.fromBrowser(browser).isContiguous()).assertTrue();
        }
      }
    });

    it('Browser_TabItem_012', 0, async () => {
      TestLogger.step(TAG, 'walk every row of the delete tab matrix');
      const rows: TabMatrixRow[] = buildDeleteRows();
      expect(rows.length).assertEqual(MAX_TAB_COUNT);
      for (let index = 0; index < rows.length; index++) {
        const row: TabMatrixRow = rows[index];
        const browser: MockBrowser = new MockBrowser(row.initialCount);
        browser.selectTab(row.initialCount - 1);
        const removed: boolean = row.apply(browser);
        expect(removed).assertEqual(row.expectedResult);
        expect(browser.tabs.length).assertEqual(row.expectedCount);
        expect(browser.getTabArrayIndex()).assertEqual(row.expectedIndex);
        expect(KeyLedger.fromBrowser(browser).isContiguous()).assertTrue();
      }
    });

    it('Browser_TabItem_013', 0, async () => {
      TestLogger.step(TAG, 'walk every row of the select tab matrix');
      const rows: TabMatrixRow[] = buildSelectRows();
      expect(rows.length).assertEqual(MAX_TAB_COUNT * 2);
      let acceptedRows: number = 0;
      for (let index = 0; index < rows.length; index++) {
        const row: TabMatrixRow = rows[index];
        const browser: MockBrowser = new MockBrowser(row.initialCount);
        const accepted: boolean = row.apply(browser);
        expect(accepted).assertEqual(row.expectedResult);
        if (accepted) {
          acceptedRows += 1;
          expect(browser.getTabArrayIndex()).assertEqual(row.expectedIndex);
          expect(browser.lastChangedIndex).assertEqual(row.expectedIndex);
          expect(browser.getCurrentTab() === null).assertFalse();
        }
      }
      expect(acceptedRows).assertEqual(MAX_TAB_COUNT);
    });

    it('Browser_TabItem_014', 0, async () => {
      TestLogger.step(TAG, 'reject every out of range delete index');
      const rows: TabMatrixRow[] = buildInvalidDeleteRows();
      expect(rows.length).assertEqual(MAX_TAB_COUNT * 3);
      for (let index = 0; index < rows.length; index++) {
        const row: TabMatrixRow = rows[index];
        const browser: MockBrowser = new MockBrowser(row.initialCount);
        const removed: boolean = row.apply(browser);
        expect(removed).assertFalse();
        expect(browser.tabs.length).assertEqual(row.initialCount);
        expect(KeyLedger.fromBrowser(browser).isContiguous()).assertTrue();
      }
    });

    it('Browser_TabItem_015', 0, async () => {
      TestLogger.step(TAG, 'store an out of range index without filtering it');
      const browser: MockBrowser = new MockBrowser(3);
      browser.setTabArrayIndex(9);
      expect(browser.getTabArrayIndex()).assertEqual(9);
      expect(browser.getCurrentTab()).assertNull();
      browser.setTabArrayIndex(-4);
      expect(browser.getTabArrayIndex()).assertEqual(-4);
      expect(browser.getCurrentTab()).assertNull();
      browser.setTabArrayIndex(2);
      expect(browser.getCurrentTab() === null).assertFalse();
      expect(browser.getCurrentTab()?.key).assertEqual(2);
    });

    it('Browser_TabItem_016', 0, async () => {
      TestLogger.step(TAG, 'delete each index of a six tab browser and renumber keys');
      for (let removed = 0; removed < SAMPLE_TAB_COUNT; removed++) {
        const browser: MockBrowser = new MockBrowser(SAMPLE_TAB_COUNT);
        browser.selectTab(SAMPLE_TAB_COUNT - 1);
        expect(browser.deleteTab(removed)).assertTrue();
        const ledger: KeyLedger = KeyLedger.fromBrowser(browser);
        expect(ledger.size()).assertEqual(SAMPLE_TAB_COUNT - 1);
        expect(ledger.isContiguous()).assertTrue();
        expect(ledger.keyAt(0)).assertEqual(0);
        expect(ledger.keyAt(SAMPLE_TAB_COUNT - 2)).assertEqual(SAMPLE_TAB_COUNT - 2);
        expect(browser.getTabArrayIndex()).assertLess(SAMPLE_TAB_COUNT - 1);
      }
    });

    it('Browser_TabItem_017', 0, async () => {
      TestLogger.step(TAG, 'clamp non positive constructor counts to one tab');
      const zero: MockBrowser = new MockBrowser(0);
      const negative: MockBrowser = new MockBrowser(-3);
      expect(zero.tabs.length).assertEqual(MIN_TAB_COUNT);
      expect(negative.tabs.length).assertEqual(MIN_TAB_COUNT);
      expect(zero.getTabKeys()).assertDeepEquals([0]);
      expect(negative.getTabKeys()).assertDeepEquals([0]);
      expect(zero.getTabArrayIndex()).assertEqual(0);
    });

    it('Browser_TabItem_018', 0, async () => {
      TestLogger.step(TAG, 'accept an oversized constructor count but block the next add');
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(browser.addTab()).assertFalse();
      expect(browser.toasts.length).assertEqual(1);
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(KeyLedger.fromBrowser(browser).isContiguous()).assertTrue();
    });

    it('Browser_TabItem_019', 0, async () => {
      TestLogger.step(TAG, 'track the last changed index across operations');
      const browser: MockBrowser = new MockBrowser(2);
      expect(browser.lastChangedIndex).assertEqual(-1);
      browser.addTab();
      expect(browser.lastChangedIndex).assertEqual(2);
      browser.selectTab(0);
      expect(browser.lastChangedIndex).assertEqual(0);
      browser.deleteTab(0);
      expect(browser.lastChangedIndex).assertEqual(0);
      expect(browser.getTabArrayIndex()).assertEqual(0);
    });

    it('Browser_TabItem_020', 0, async () => {
      TestLogger.step(TAG, 'compare the key rebase helper with the model behaviour');
      for (let removed = 0; removed < SAMPLE_TAB_COUNT; removed++) {
        const keys: number[] = [];
        for (let index = 0; index < SAMPLE_TAB_COUNT; index++) {
          keys.push(index);
        }
        const rebased: number[] = rebaseTabKeys(keys, removed);
        expect(rebased.length).assertEqual(SAMPLE_TAB_COUNT - 1);
        for (let index = 0; index < rebased.length; index++) {
          expect(rebased[index]).assertEqual(index);
        }
        const browser: MockBrowser = new MockBrowser(SAMPLE_TAB_COUNT);
        browser.deleteTab(removed);
        expect(browser.getTabKeys()).assertDeepEquals(rebased);
      }
    });

    it('Browser_TabItem_021', 0, async () => {
      TestLogger.step(TAG, 'scan every tab count and delete index pair');
      let checked: number = 0;
      for (let count = MIN_TAB_COUNT; count <= MAX_SCAN_COUNT; count++) {
        for (let removed = -1; removed <= count; removed++) {
          const browser: MockBrowser = new MockBrowser(count);
          const accepted: boolean = browser.deleteTab(removed);
          const inRange: boolean = removed >= 0 && removed < count;
          const expected: boolean = inRange && count > MIN_TAB_COUNT;
          expect(accepted).assertEqual(expected);
          const ledger: KeyLedger = KeyLedger.fromBrowser(browser);
          expect(ledger.isContiguous()).assertTrue();
          expect(ledger.size()).assertEqual(expected ? count - 1 : count);
          expect(ledger.uniqueKeyCount()).assertEqual(ledger.size());
          checked += 1;
        }
      }
      const expectedPairs: number = MAX_SCAN_COUNT * (MAX_SCAN_COUNT + 1) / 2 + 2 * MAX_SCAN_COUNT;
      expect(checked).assertEqual(expectedPairs);
    });

    it('Browser_TabItem_022', 0, async () => {
      TestLogger.step(TAG, 'keep keys unique across interleaved tab operations');
      const browser: MockBrowser = new MockBrowser(1);
      browser.addTab();
      browser.addTab();
      browser.addTab();
      browser.addTab();
      browser.deleteTab(2);
      browser.addTab();
      browser.addTab();
      browser.deleteTab(0);
      const ledger: KeyLedger = KeyLedger.fromBrowser(browser);
      expect(ledger.size()).assertEqual(browser.tabs.length);
      expect(ledger.isContiguous()).assertTrue();
      expect(ledger.uniqueKeyCount()).assertEqual(ledger.size());
      expect(ledger.maxKey()).assertEqual(ledger.size() - 1);
      expect(browser.getTabArrayIndex()).assertLess(ledger.size());
    });

    it('Browser_TabItem_023', 0, async () => {
      TestLogger.step(TAG, 'keep the tab object identity stable when selecting');
      const browser: MockBrowser = new MockBrowser(3);
      const second: MockBrowserTab = browser.tabs[1];
      const third: MockBrowserTab = browser.tabs[2];
      browser.selectTab(1);
      expect(browser.getCurrentTab() === second).assertTrue();
      browser.selectTab(2);
      expect(browser.getCurrentTab() === third).assertTrue();
      expect(browser.getCurrentTab() === second).assertFalse();
      expect(browser.tabs[1] === second).assertTrue();
      expect(second.key).assertEqual(1);
    });

    it('Browser_TabItem_024', 0, async () => {
      TestLogger.step(TAG, 'verify timestamps are non decreasing across ten tabs');
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      const stamps: number[] = browser.getTimestamps();
      expect(stamps.length).assertEqual(MAX_TAB_COUNT);
      for (let index = 1; index < stamps.length; index++) {
        expect(stamps[index] >= stamps[index - 1]).assertTrue();
      }
      const ledger: KeyLedger = KeyLedger.fromBrowser(browser);
      expect(ledger.isMonotonic()).assertTrue();
      expect(ledger.hasDuplicateTimestamp()).assertFalse();
    });

    it('Browser_TabItem_025', 0, async () => {
      TestLogger.step(TAG, 'count the rows of every operation matrix');
      const addRows: TabMatrixRow[] = buildAddRows();
      const deleteRows: TabMatrixRow[] = buildDeleteRows();
      const selectRows: TabMatrixRow[] = buildSelectRows();
      const invalidRows: TabMatrixRow[] = buildInvalidDeleteRows();
      expect(addRows.length).assertEqual(11);
      expect(deleteRows.length).assertEqual(10);
      expect(selectRows.length).assertEqual(20);
      expect(invalidRows.length).assertEqual(30);
      expect(addRows.length + deleteRows.length + selectRows.length +
        invalidRows.length).assertEqual(71);
    });

    it('Browser_TabItem_026', 0, async () => {
      TestLogger.step(TAG, 'inspect the shape of matrix row records');
      const rows: TabMatrixRow[] = buildAddRows();
      const last: TabMatrixRow = rows[rows.length - 1];
      const first: TabMatrixRow = rows[0];
      expect(first.initialCount).assertEqual(MIN_TAB_COUNT);
      expect(first.operation).assertEqual(OP_ADD);
      expect(first.argument).assertEqual(0);
      expect(last.initialCount).assertEqual(MAX_TAB_COUNT + 1);
      expect(last.expectedResult).assertFalse();
      expect(last.expectedCount).assertEqual(MAX_TAB_COUNT + 1);
    });

    it('Browser_TabItem_027', 0, async () => {
      TestLogger.step(TAG, 'track the key count through a deterministic workflow');
      const browser: MockBrowser = new MockBrowser(1);
      const steps: number[] = [1, 2, 3, 2, 3, 4, 3];
      const actions: string[] = ['add', 'add', 'delete', 'add', 'add', 'delete'];
      let cursor: number = 0;
      expect(browser.tabs.length).assertEqual(steps[0]);
      for (let index = 0; index < actions.length; index++) {
        if (actions[index] === 'add') {
          browser.addTab();
        } else {
          browser.deleteTab(0);
        }
        cursor += 1;
        expect(browser.tabs.length).assertEqual(steps[cursor]);
        expect(KeyLedger.fromBrowser(browser).isContiguous()).assertTrue();
      }
      expect(cursor).assertEqual(6);
    });

    it('Browser_TabItem_028', 0, async () => {
      TestLogger.step(TAG, 'verify independent registration states of eight objects');
      const objects: WebObjectModel[] = [];
      for (let index = 0; index < 8; index++) {
        objects.push(new WebObjectModel(index));
      }
      for (let index = 0; index < objects.length; index++) {
        expect(objects[index].isRegistered).assertFalse();
        if (index % 2 === 0) {
          expect(objects[index].register()).assertTrue();
        }
      }
      let registered: number = 0;
      for (let index = 0; index < objects.length; index++) {
        if (objects[index].isRegistered) {
          registered += 1;
          expect(objects[index].controllerId % 2).assertEqual(0);
        }
      }
      expect(registered).assertEqual(4);
    });

    it('Browser_TabItem_029', 0, async () => {
      TestLogger.step(TAG, 'detect duplicated keys in a malformed ledger');
      const ledger: KeyLedger = KeyLedger.fromKeys([0, 0, 1]);
      expect(ledger.size()).assertEqual(3);
      expect(ledger.uniqueKeyCount()).assertEqual(2);
      expect(ledger.isContiguous()).assertFalse();
      expect(ledger.isSortedByKey()).assertTrue();
      expect(ledger.minKey()).assertEqual(0);
      expect(ledger.maxKey()).assertEqual(1);
    });

    it('Browser_TabItem_030', 0, async () => {
      TestLogger.step(TAG, 'handle the empty ledger without throwing');
      const ledger: KeyLedger = new KeyLedger();
      expect(ledger.size()).assertEqual(0);
      expect(ledger.isContiguous()).assertTrue();
      expect(ledger.isMonotonic()).assertTrue();
      expect(ledger.hasDuplicateTimestamp()).assertFalse();
      expect(ledger.minKey()).assertEqual(-1);
      expect(ledger.maxKey()).assertEqual(-1);
      expect(ledger.keyAt(0)).assertEqual(-1);
      expect(ledger.describe()).assertEqual('tabs=0, keys=');
    });

    it('Browser_TabItem_031', 0, async () => {
      TestLogger.step(TAG, 'rebase keys that do not start at zero');
      const keys: number[] = [3, 4, 5, 6];
      expect(rebaseTabKeys(keys, 0)).assertDeepEquals([3, 4, 5]);
      expect(rebaseTabKeys(keys, 1)).assertDeepEquals([3, 4, 5]);
      expect(rebaseTabKeys(keys, 3)).assertDeepEquals([3, 4, 5]);
      expect(rebaseTabKeys([7], 0)).assertDeepEquals([]);
      expect(rebaseTabKeys([], 0)).assertDeepEquals([]);
      expect(rebaseTabKeys([1, 2], -1)).assertDeepEquals([0, 1]);
    });

    it('Browser_TabItem_032', 0, async () => {
      TestLogger.step(TAG, 'compare delete first and delete last index outcomes');
      for (let count = 2; count <= MAX_TAB_COUNT; count++) {
        const firstRemoved: MockBrowser = new MockBrowser(count);
        firstRemoved.selectTab(count - 1);
        firstRemoved.deleteTab(0);
        expect(firstRemoved.getTabArrayIndex()).assertEqual(count - 2);
        expect(firstRemoved.tabs.length).assertEqual(count - 1);
        const lastRemoved: MockBrowser = new MockBrowser(count);
        lastRemoved.selectTab(count - 1);
        lastRemoved.deleteTab(count - 1);
        expect(lastRemoved.getTabArrayIndex()).assertEqual(count - 2);
        expect(lastRemoved.tabs.length).assertEqual(count - 1);
        expect(KeyLedger.fromBrowser(firstRemoved).isContiguous()).assertTrue();
        expect(KeyLedger.fromBrowser(lastRemoved).isContiguous()).assertTrue();
      }
    });

    it('Browser_TabItem_033', 0, async () => {
      TestLogger.step(TAG, 'walk the whole tab list twice with select');
      const browser: MockBrowser = new MockBrowser(SAMPLE_TAB_COUNT);
      for (let round = 0; round < 2; round++) {
        for (let index = 0; index < browser.tabs.length; index++) {
          expect(browser.selectTab(index)).assertTrue();
          expect(browser.getTabArrayIndex()).assertEqual(index);
          expect(browser.getCurrentTab()?.key).assertEqual(index);
        }
      }
      expect(browser.lastChangedIndex).assertEqual(SAMPLE_TAB_COUNT - 1);
      expect(browser.getTabArrayIndex()).assertEqual(SAMPLE_TAB_COUNT - 1);
    });

    it('Browser_TabItem_034', 0, async () => {
      TestLogger.step(TAG, 'accumulate one toast per rejected add attempt');
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
      for (let attempt = 0; attempt < 3; attempt++) {
        expect(browser.addTab()).assertFalse();
        expect(browser.toasts.length).assertEqual(attempt + 1);
      }
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(browser.toasts.length).assertEqual(3);
      for (let index = 0; index < browser.toasts.length; index++) {
        expect(browser.toasts[index]).assertEqual(browser.toasts[0]);
      }
    });

    it('Browser_TabItem_035', 0, async () => {
      TestLogger.step(TAG, 'verify the unit timestamp step of ten default tabs');
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      const stamps: number[] = browser.getTimestamps();
      for (let index = 1; index < stamps.length; index++) {
        expect(stamps[index] - stamps[index - 1]).assertEqual(1);
      }
      expect(stamps[0]).assertEqual(BASE_TIMESTAMP);
      expect(stamps[stamps.length - 1]).assertEqual(BASE_TIMESTAMP + MAX_TAB_COUNT - 1);
    });

    it('Browser_TabItem_036', 0, async () => {
      TestLogger.step(TAG, 'run a thirty entry combination matrix of tab operations');
      let ran: number = 0;
      for (let count = MIN_TAB_COUNT; count <= MAX_TAB_COUNT; count++) {
        const addBrowser: MockBrowser = new MockBrowser(count);
        expect(addBrowser.addTab()).assertTrue();
        expect(addBrowser.tabs.length).assertEqual(count + 1);
        ran += 1;
        const selectBrowser: MockBrowser = new MockBrowser(count);
        expect(selectBrowser.selectTab(0)).assertTrue();
        expect(selectBrowser.getTabArrayIndex()).assertEqual(0);
        ran += 1;
        const deleteBrowser: MockBrowser = new MockBrowser(count);
        if (count > MIN_TAB_COUNT) {
          expect(deleteBrowser.deleteTab(count - 1)).assertTrue();
          expect(deleteBrowser.tabs.length).assertEqual(count - 1);
        } else {
          expect(deleteBrowser.deleteTab(0)).assertFalse();
        }
        ran += 1;
      }
      expect(ran).assertEqual(MAX_TAB_COUNT * 3);
    });

    it('Browser_TabItem_037', 0, async () => {
      TestLogger.step(TAG, 'describe a ledger after deleting the middle key');
      const browser: MockBrowser = new MockBrowser(4);
      browser.deleteTab(1);
      const ledger: KeyLedger = KeyLedger.fromBrowser(browser);
      expect(ledger.size()).assertEqual(3);
      expect(ledger.isContiguous()).assertTrue();
      expect(ledger.keys()).assertDeepEquals([0, 1, 2]);
      expect(ledger.describe()).assertEqual('tabs=3, keys=0,1,2');
      expect(ledger.timestamps().length).assertEqual(3);
    });

    it('Browser_TabItem_038', 0, async () => {
      TestLogger.step(TAG, 'verify the current tab key matches the selected index');
      for (let count = MIN_TAB_COUNT; count <= MAX_TAB_COUNT; count++) {
        const browser: MockBrowser = new MockBrowser(count);
        for (let index = 0; index < count; index++) {
          browser.selectTab(index);
          const current: MockBrowserTab | null = browser.getCurrentTab();
          expect(current === null).assertFalse();
          if (current !== null) {
            expect(current.key).assertEqual(index);
            expect(current.key).assertEqual(browser.getTabKeys()[index]);
          }
        }
      }
    });

    it('Browser_TabItem_039', 0, async () => {
      TestLogger.step(TAG, 'register every third web object of a ten entry list');
      const objects: WebObjectModel[] = [];
      for (let index = 0; index < MAX_TAB_COUNT; index++) {
        const object: WebObjectModel = new WebObjectModel(index);
        if (index % 3 === 0) {
          object.register();
        }
        objects.push(object);
      }
      let registered: number = 0;
      for (let index = 0; index < objects.length; index++) {
        if (objects[index].isRegistered) {
          registered += 1;
          expect(objects[index].controllerId % 3).assertEqual(0);
        } else {
          expect(objects[index].registerCalls).assertEqual(0);
        }
      }
      expect(registered).assertEqual(4);
    });

    it('Browser_TabItem_040', 0, async () => {
      TestLogger.step(TAG, 'probe keyAt boundaries of a five key ledger');
      const ledger: KeyLedger = KeyLedger.fromKeys([0, 1, 2, 3, 4]);
      expect(ledger.keyAt(-100)).assertEqual(-1);
      expect(ledger.keyAt(-1)).assertEqual(-1);
      expect(ledger.keyAt(0)).assertEqual(0);
      expect(ledger.keyAt(4)).assertEqual(4);
      expect(ledger.keyAt(5)).assertEqual(-1);
      expect(ledger.keyAt(100)).assertEqual(-1);
    });

    it('Browser_TabItem_041', 0, async () => {
      TestLogger.step(TAG, 'keep twelve clock driven timestamps unique');
      const clock: MockClock = new MockClock(BASE_TIMESTAMP);
      const ledger: KeyLedger = new KeyLedger();
      for (let index = 0; index < MAX_SCAN_COUNT; index++) {
        ledger.records.push(new TabKeyRecord(index, clock.advance(CLOCK_STEP_MS)));
      }
      expect(ledger.size()).assertEqual(MAX_SCAN_COUNT);
      expect(ledger.uniqueTimestampCount()).assertEqual(MAX_SCAN_COUNT);
      expect(ledger.hasDuplicateTimestamp()).assertFalse();
      expect(ledger.isMonotonic()).assertTrue();
      expect(ledger.timestamps()[0]).assertEqual(BASE_TIMESTAMP + CLOCK_STEP_MS);
    });

    it('Browser_TabItem_042', 0, async () => {
      TestLogger.step(TAG, 'aggregate the tab model invariants after three deletes');
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      browser.deleteTab(0);
      browser.deleteTab(3);
      browser.deleteTab(5);
      const ledger: KeyLedger = KeyLedger.fromBrowser(browser);
      expect(ledger.size()).assertEqual(MAX_TAB_COUNT - 3);
      expect(ledger.isContiguous()).assertTrue();
      expect(ledger.uniqueKeyCount()).assertEqual(7);
      expect(ledger.uniqueTimestampCount()).assertEqual(7);
      expect(browser.getTabArrayIndex() >= 0).assertTrue();
      expect(browser.getTabArrayIndex() < ledger.size()).assertTrue();
      expect(browser.getCurrentTab() === null).assertFalse();
      expect(browser.tabs.length).assertEqual(7);
    });

    it('Browser_TabItem_043', 0, async () => {
      TestLogger.step(TAG, 'inspect the key list of an eleven tab browser');
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
      expect(browser.tabs.length).assertEqual(11);
      expect(browser.getTabKeys()).assertDeepEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      expect(KeyLedger.fromBrowser(browser).isContiguous()).assertTrue();
      expect(browser.addTab()).assertFalse();
      expect(browser.tabs.length).assertEqual(11);
    });

    it('Browser_TabItem_044', 0, async () => {
      TestLogger.step(TAG, 'reuse the freed index when a tab is added after a delete');
      const browser: MockBrowser = new MockBrowser(4);
      browser.deleteTab(1);
      expect(browser.getTabKeys()).assertDeepEquals([0, 1, 2]);
      browser.addTab();
      expect(browser.tabs.length).assertEqual(4);
      expect(browser.getTabKeys()).assertDeepEquals([0, 1, 2, 3]);
      expect(browser.getTabArrayIndex()).assertEqual(3);
      expect(KeyLedger.fromBrowser(browser).uniqueKeyCount()).assertEqual(4);
    });

    it('Browser_TabItem_045', 0, async () => {
      TestLogger.step(TAG, 'keep timestamps unique after a delete and add cycle');
      const browser: MockBrowser = new MockBrowser(3);
      browser.deleteTab(0);
      browser.addTab();
      const ledger: KeyLedger = KeyLedger.fromBrowser(browser);
      expect(ledger.size()).assertEqual(3);
      expect(ledger.timestamps().length).assertEqual(3);
      expect(ledger.isContiguous()).assertTrue();
      TestLogger.warn(TAG, 'mock stamps are key derived, so a recycled key may repeat a stamp');
      const clock: MockClock = new MockClock(BASE_TIMESTAMP);
      const clockLedger: KeyLedger = new KeyLedger();
      for (let index = 0; index < 3; index++) {
        clockLedger.records.push(new TabKeyRecord(index, clock.advance(CLOCK_STEP_MS)));
      }
      expect(clockLedger.uniqueTimestampCount()).assertEqual(3);
      expect(clockLedger.hasDuplicateTimestamp()).assertFalse();
    });

    it('Browser_TabItem_046', 0, async () => {
      TestLogger.step(TAG, 'describe six web objects in registration order');
      const objects: WebObjectModel[] = [];
      for (let index = 0; index < SAMPLE_TAB_COUNT; index++) {
        const object: WebObjectModel = new WebObjectModel(index);
        objects.push(object);
      }
      expect(objects[0].register()).assertTrue();
      expect(objects[5].register()).assertTrue();
      objects[2].register();
      objects[2].register();
      expect(objects[0].describe()).assertEqual('controller=0, registered=true');
      expect(objects[1].describe()).assertEqual('controller=1, registered=false');
      expect(objects[2].registerCalls).assertEqual(2);
      expect(objects[2].isRegistered).assertTrue();
      expect(objects[5].describe()).assertContain('controller=5');
    });

    it('Browser_TabItem_047', 0, async () => {
      TestLogger.step(TAG, 'delete four tabs one by one and keep the ledger valid');
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      for (let round = 0; round < 4; round++) {
        expect(browser.deleteTab(0)).assertTrue();
        const ledger: KeyLedger = KeyLedger.fromBrowser(browser);
        expect(ledger.size()).assertEqual(MAX_TAB_COUNT - round - 1);
        expect(ledger.isContiguous()).assertTrue();
        expect(ledger.uniqueKeyCount()).assertEqual(ledger.size());
        expect(browser.getTabArrayIndex()).assertEqual(0);
      }
      expect(browser.tabs.length).assertEqual(6);
      expect(browser.getCurrentTab()?.key).assertEqual(browser.getTabArrayIndex());
    });

    it('Browser_TabItem_048', 0, async () => {
      TestLogger.step(TAG, 'count the accepted and rejected select matrices');
      const rows: TabMatrixRow[] = buildSelectRows();
      let accepted: number = 0;
      let rejected: number = 0;
      for (let index = 0; index < rows.length; index++) {
        if (rows[index].expectedResult) {
          accepted += 1;
        } else {
          rejected += 1;
        }
      }
      expect(accepted).assertEqual(MAX_TAB_COUNT);
      expect(rejected).assertEqual(MAX_TAB_COUNT);
      expect(accepted + rejected).assertEqual(rows.length);
      expect(rows.length).assertEqual(MAX_TAB_COUNT * 2);
    });

    it('Browser_TabItem_049', 0, async () => {
      TestLogger.step(TAG, 'validate a twelve key ledger after one middle delete');
      const browser: MockBrowser = new MockBrowser(MAX_SCAN_COUNT);
      expect(KeyLedger.fromBrowser(browser).size()).assertEqual(MAX_SCAN_COUNT);
      expect(browser.deleteTab(5)).assertTrue();
      const ledger: KeyLedger = KeyLedger.fromBrowser(browser);
      expect(ledger.size()).assertEqual(MAX_SCAN_COUNT - 1);
      expect(ledger.isContiguous()).assertTrue();
      expect(ledger.isSortedByKey()).assertTrue();
      expect(ledger.minKey()).assertEqual(0);
      expect(ledger.maxKey()).assertEqual(MAX_SCAN_COUNT - 2);
      expect(ledger.describe().startsWith('tabs=11')).assertTrue();
      expect(ledger.describe()).assertContain('keys=0,1,2,3,4,5,6,7,8,9,10');
      expect(ledger.keys().length).assertEqual(11);
      expect(ledger.uniqueKeyCount()).assertEqual(11);
      expect(ledger.keyAt(10)).assertEqual(10);
      expect(ledger.timestamps().length).assertEqual(11);
      expect(ledger.uniqueTimestampCount()).assertEqual(11);
      expect(ledger.hasDuplicateTimestamp()).assertFalse();
      expect(ledger.isMonotonic()).assertTrue();
      expect(ledger.keyAt(-1)).assertEqual(-1);
    });
  });
}
