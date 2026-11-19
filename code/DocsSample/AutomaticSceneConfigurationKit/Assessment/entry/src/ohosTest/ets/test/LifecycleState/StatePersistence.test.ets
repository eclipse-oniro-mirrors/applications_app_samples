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
  TEXT_STATE_INACTIVE,
  TEXT_WHITELIST_EMPTY,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  allowedAppRowCount,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// AppStorage keys of the sample. The pages declare the same literals through their decorators.
const KEY_ACTIVE: string = 'assessmentActive';
const KEY_DURATION: string = 'assessmentDuration';
const KEY_LOGS: string = 'assessmentLogs';
const KEY_EVENT_TYPE: string = 'assessmentEventType';
const KEY_EVENT_CODE: string = 'assessmentEventCode';
const KEY_EVENT_MESSAGE: string = 'assessmentEventMessage';
const KEY_EVENT_SEQ: string = 'assessmentEventSeq';

// Event types published by the controller.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_END: string = 'onEnd';

// Durations and limits of the sample.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN: number = 600000;
const DURATION_THIRTY: number = 1800000;
const DURATION_SIXTY: number = 3600000;
const MAX_ALLOWED_APPS: number = 20;
const DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';
const INVALID_DURATION: number = -1;

// The page keeps its whitelist in a private state field, a rebuild seeds it again.
const INITIAL_DURATION_INDEX: number = 1;

/**
 * One restored key of a page rebuild.
 */
interface RestoredKey {
  key: string;
  value: string;
  source: string;
}

/**
 * The result of a rebuild of the entry page.
 */
interface RebuildResult {
  durationIndex: number;
  durationMs: number;
  allowedApps: string[];
  active: boolean;
  logSize: number;
  seq: number;
}

/**
 * The storage the pages read on a rebuild.
 *
 * The store separates the keys the pages persist through AppStorage from the keys a page keeps
 * in its own state. Only the persistent keys survive a rebuild, the local ones are re-seeded
 * from their declarations, which is exactly what the entry page does with its whitelist.
 */
class PersistentStore {
  private values: Map<string, string> = new Map<string, string>();
  private writes: number = 0;

  public constructor() {
    this.values.set(KEY_ACTIVE, 'false');
    this.values.set(KEY_DURATION, `${DURATION_DEFAULT}`);
    this.values.set(KEY_LOGS, '');
    this.values.set(KEY_EVENT_TYPE, '');
    this.values.set(KEY_EVENT_CODE, '0');
    this.values.set(KEY_EVENT_MESSAGE, '');
    this.values.set(KEY_EVENT_SEQ, '0');
  }

  /**
   * Writes a key.
   *
   * @param key key to write.
   * @param value rendered value.
   * @returns true when the key is declared.
   */
  public write(key: string, value: string): boolean {
    if (!this.values.has(key)) {
      hilog.warn(DOMAIN, TAG, 'PersistentStore.write: unknown key %{public}s', key);
      return false;
    }
    this.values.set(key, value);
    this.writes++;
    return true;
  }

  public read(key: string): string {
    return this.values.get(key) ?? '';
  }

  public readNumber(key: string): number {
    const raw: string = this.read(key);
    const parsed: number = Number.parseInt(raw, 10);
    if (Number.isNaN(parsed)) {
      return 0;
    }
    return parsed;
  }

  public readBoolean(key: string): boolean {
    return this.read(key) === 'true';
  }

  public readList(key: string): string[] {
    const raw: string = this.read(key);
    if (raw.length === 0) {
      return [];
    }
    return raw.split('|');
  }

  public writeList(key: string, values: string[]): boolean {
    return this.write(key, values.join('|'));
  }

  public has(key: string): boolean {
    return this.values.has(key);
  }

  public keyCount(): number {
    return this.values.size;
  }

  public writesDone(): number {
    return this.writes;
  }

  /**
   * Creates the restore list of a page rebuild. Every declared key is part of it, so a rebuild
   * never silently drops a key.
   *
   * @returns the keys with their current values, in declaration order.
   */
  public restoreList(): RestoredKey[] {
    const keys: string[] = [KEY_ACTIVE, KEY_DURATION, KEY_LOGS, KEY_EVENT_TYPE, KEY_EVENT_CODE,
      KEY_EVENT_MESSAGE, KEY_EVENT_SEQ];
    const result: RestoredKey[] = [];
    for (let i = 0; i < keys.length; i++) {
      const restored: RestoredKey = {
        key: keys[i],
        value: this.read(keys[i]),
        source: 'appStorage'
      };
      result.push(restored);
    }
    return result;
  }

  public reset(): void {
    this.values.set(KEY_ACTIVE, 'false');
    this.values.set(KEY_DURATION, `${DURATION_DEFAULT}`);
    this.values.set(KEY_LOGS, '');
    this.values.set(KEY_EVENT_TYPE, '');
    this.values.set(KEY_EVENT_CODE, '0');
    this.values.set(KEY_EVENT_MESSAGE, '');
    this.values.set(KEY_EVENT_SEQ, '0');
    this.writes = 0;
  }

  public toString(): string {
    return `PersistentStore{keys=${this.values.size}, writes=${this.writes}}`;
  }
}

/**
 * The local state of the entry page.
 *
 * The duration index, the whitelist and the input text live in the page component, not in
 * AppStorage. A rebuild therefore re-seeds them from their declarations, which is why a custom
 * whitelist entry does not survive and the default bundle does.
 */
class IndexPageState {
  private durationIndex: number = INITIAL_DURATION_INDEX;
  private allowedApps: string[] = [];
  private input: string = '';
  private durationCandidates: number[] = [];

  public constructor() {
    this.durationCandidates.push(DURATION_DEFAULT);
    this.durationCandidates.push(DURATION_TEN);
    this.durationCandidates.push(DURATION_THIRTY);
    this.durationCandidates.push(DURATION_SIXTY);
    this.allowedApps.push(DEFAULT_ALLOWED_APP);
  }

  /**
   * Adds a bundle to the whitelist with the guards of the page.
   *
   * @param bundle bundle name to add.
   * @returns true when the entry was appended.
   */
  public addApp(bundle: string): boolean {
    const trimmed: string = bundle.trim();
    if (trimmed.length === 0) {
      return false;
    }
    if (this.allowedApps.indexOf(trimmed) >= 0) {
      return false;
    }
    if (this.allowedApps.length >= MAX_ALLOWED_APPS) {
      return false;
    }
    this.allowedApps.push(trimmed);
    return true;
  }

  public removeApp(bundle: string): boolean {
    const index: number = this.allowedApps.indexOf(bundle);
    if (index < 0) {
      return false;
    }
    this.allowedApps.splice(index, 1);
    return true;
  }

  public selectDuration(index: number): boolean {
    if (index < 0 || index >= this.durationCandidates.length) {
      return false;
    }
    this.durationIndex = index;
    return true;
  }

  public selectedDurationMs(): number {
    return this.durationCandidates[this.durationIndex];
  }

  public durationIndexValue(): number {
    return this.durationIndex;
  }

  public apps(): string[] {
    return this.allowedApps.slice();
  }

  public appCount(): number {
    return this.allowedApps.length;
  }

  public setInput(text: string): void {
    this.input = text;
  }

  public inputValue(): string {
    return this.input;
  }

  public candidates(): number[] {
    return this.durationCandidates.slice();
  }

  public reset(): void {
    this.durationIndex = INITIAL_DURATION_INDEX;
    this.allowedApps = [];
    this.allowedApps.push(DEFAULT_ALLOWED_APP);
    this.input = '';
  }
}

/**
 * Rebuilds the entry page against a persistent store.
 */
class PageRebuilder {
  private store: PersistentStore;

  public constructor(store: PersistentStore) {
    this.store = store;
  }

  /**
   * Performs a rebuild.
   *
   * @param previous state of the page before the rebuild.
   * @returns the state the rebuilt page renders.
   */
  public rebuild(previous: IndexPageState): RebuildResult {
    const fresh: IndexPageState = new IndexPageState();
    const restored: RestoredKey[] = this.store.restoreList();
    // The duration of the session is persistent, the selected candidate index is not, so the
    // rebuilt page starts at its declared index and keeps the stored duration untouched.
    const storedDuration: number = this.store.readNumber(KEY_DURATION);
    const result: RebuildResult = {
      durationIndex: fresh.durationIndexValue(),
      durationMs: storedDuration,
      allowedApps: fresh.apps(),
      active: this.store.readBoolean(KEY_ACTIVE),
      logSize: this.store.readList(KEY_LOGS).length,
      seq: this.store.readNumber(KEY_EVENT_SEQ)
    };
    hilog.info(DOMAIN, TAG, 'PageRebuilder: restored %{public}d keys, previous apps %{public}d',
      restored.length, previous.appCount());
    return result;
  }

  /**
   * Counts the restored keys that carry a non default value.
   *
   * @returns the number of keys that differ from their default.
   */
  public changedKeyCount(): number {
    const restored: RestoredKey[] = this.store.restoreList();
    let changed: number = 0;
    for (let i = 0; i < restored.length; i++) {
      if (restored[i].key === KEY_ACTIVE && restored[i].value !== 'false') {
        changed++;
      } else if (restored[i].key === KEY_DURATION && restored[i].value !== `${DURATION_DEFAULT}`) {
        changed++;
      } else if (restored[i].key === KEY_LOGS && restored[i].value.length > 0) {
        changed++;
      } else if (restored[i].key === KEY_EVENT_SEQ && restored[i].value !== '0') {
        changed++;
      }
    }
    return changed;
  }
}

/**
 * Starts the sample and waits until the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page showed up.
 */
async function openIndexPageOnce(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is retried');
  }
  return rendered;
}

/**
 * Brings the entry page to the front.
 *
 * A previous case may have pushed the exam page or left an alert dialog behind. The Back key
 * closes the dialog and pops the exam page, after that the entry page is rendered again.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  const first: boolean = await openIndexPageOnce(driver);
  if (first) {
    return true;
  }
  await pressAndWait(driver, KEY_BACK, 1, 200);
  return await openIndexPageOnce(driver);
}

export default function statePersistenceTest() {
  describe('StatePersistence_Test', () => {
    let driver: Driver;
    let store: PersistentStore;
    let page: IndexPageState;
    let rebuilder: PageRebuilder;

    beforeAll(async () => {
      driver = getDriver();
      store = new PersistentStore();
      page = new IndexPageState();
      rebuilder = new PageRebuilder(store);
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: a fresh persistent store.
     * Expectation: the seven keys of the sample are declared with their defaults.
     */
    it('Assessment_StatePersistence_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_001, begin');
      store.reset();
      expect(store.keyCount()).assertEqual(7);
      expect(store.has(KEY_ACTIVE)).assertTrue();
      expect(store.has(KEY_DURATION)).assertTrue();
      expect(store.has(KEY_LOGS)).assertTrue();
      expect(store.has(KEY_EVENT_SEQ)).assertTrue();
      expect(store.has('assessmentUnknown')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', store.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_001, end');
    });

    /**
     * Scenario: the default values of the persistent keys.
     * Expectation: the flag is false, the duration is zero and the log is empty.
     */
    it('Assessment_StatePersistence_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_002, begin');
      store.reset();
      expect(store.readBoolean(KEY_ACTIVE)).assertFalse();
      expect(store.readNumber(KEY_DURATION)).assertEqual(DURATION_DEFAULT);
      expect(store.readList(KEY_LOGS).length).assertEqual(0);
      expect(store.read(KEY_EVENT_TYPE)).assertEqual('');
      expect(store.readNumber(KEY_EVENT_SEQ)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_002, end');
    });

    /**
     * Scenario: a duration is written and read back.
     * Expectation: the number round trips unchanged.
     */
    it('Assessment_StatePersistence_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_003, begin');
      store.reset();
      expect(store.write(KEY_DURATION, `${DURATION_TEN}`)).assertTrue();
      expect(store.readNumber(KEY_DURATION)).assertEqual(DURATION_TEN);
      expect(store.write(KEY_DURATION, `${DURATION_SIXTY}`)).assertTrue();
      expect(store.readNumber(KEY_DURATION)).assertEqual(DURATION_SIXTY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_003, end');
    });

    /**
     * Scenario: an undeclared key is written.
     * Expectation: the write is rejected and the key count does not grow.
     */
    it('Assessment_StatePersistence_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_004, begin');
      store.reset();
      expect(store.write('assessmentLocalOnly', 'value')).assertFalse();
      expect(store.keyCount()).assertEqual(7);
      expect(store.read('assessmentLocalOnly')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_004, end');
    });

    /**
     * Scenario: the restore list of a rebuild is built.
     * Expectation: it holds one entry per declared key and every entry names AppStorage.
     */
    it('Assessment_StatePersistence_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_005, begin');
      store.reset();
      const restored: RestoredKey[] = store.restoreList();
      expect(restored.length).assertEqual(7);
      for (let i = 0; i < restored.length; i++) {
        expect(restored[i].source).assertEqual('appStorage');
        expect(restored[i].key.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_005, end');
    });

    /**
     * Scenario: a duration survives a rebuild.
     * Expectation: the rebuilt page reports the stored duration although the selected index is
     * re-seeded.
     */
    it('Assessment_StatePersistence_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_006, begin');
      store.reset();
      store.write(KEY_DURATION, `${DURATION_THIRTY}`);
      const result: RebuildResult = rebuilder.rebuild(page);
      expect(result.durationMs).assertEqual(DURATION_THIRTY);
      expect(result.durationIndex).assertEqual(INITIAL_DURATION_INDEX);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_006, end');
    });

    /**
     * Scenario: the whitelist is re-seeded after a rebuild.
     * Expectation: only the default bundle name is present again.
     */
    it('Assessment_StatePersistence_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_007, begin');
      store.reset();
      page.reset();
      page.addApp('com.samples.dictionary');
      page.addApp('com.samples.reader');
      expect(page.appCount()).assertEqual(3);
      const result: RebuildResult = rebuilder.rebuild(page);
      expect(result.allowedApps.length).assertEqual(1);
      expect(result.allowedApps[0]).assertEqual(DEFAULT_ALLOWED_APP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_007, end');
    });

    /**
     * Scenario: the default bundle name is added twice.
     * Expectation: the duplicate is rejected and the whitelist keeps one entry.
     */
    it('Assessment_StatePersistence_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_008, begin');
      page.reset();
      expect(page.addApp(DEFAULT_ALLOWED_APP)).assertFalse();
      expect(page.appCount()).assertEqual(1);
      expect(page.addApp('com.samples.dictionary')).assertTrue();
      expect(page.addApp('com.samples.dictionary')).assertFalse();
      expect(page.appCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_008, end');
    });

    /**
     * Scenario: an empty white space bundle name is added.
     * Expectation: the page ignores it, the whitelist keeps its size.
     */
    it('Assessment_StatePersistence_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_009, begin');
      page.reset();
      expect(page.addApp('')).assertFalse();
      expect(page.addApp('   ')).assertFalse();
      expect(page.appCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_009, end');
    });

    /**
     * Scenario: the whitelist reaches its limit.
     * Expectation: the twentieth entry fits and every further one is rejected.
     */
    it('Assessment_StatePersistence_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_010, begin');
      page.reset();
      let added: number = 0;
      for (let i = 0; i < MAX_ALLOWED_APPS + 5; i++) {
        if (page.addApp(`com.samples.app${i}`)) {
          added++;
        }
      }
      expect(added).assertEqual(MAX_ALLOWED_APPS - 1);
      expect(page.appCount()).assertEqual(MAX_ALLOWED_APPS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_010, end');
    });

    /**
     * Scenario: duration candidates are selected.
     * Expectation: the selected index maps to the candidate value.
     */
    it('Assessment_StatePersistence_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_011, begin');
      page.reset();
      expect(page.candidates().length).assertEqual(4);
      expect(page.selectDuration(0)).assertTrue();
      expect(page.selectedDurationMs()).assertEqual(DURATION_DEFAULT);
      expect(page.selectDuration(2)).assertTrue();
      expect(page.selectedDurationMs()).assertEqual(DURATION_THIRTY);
      expect(page.selectDuration(4)).assertFalse();
      expect(page.selectDuration(-1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_011, end');
    });

    /**
     * Scenario: the page is rebuilt after the default duration was selected.
     * Expectation: the stored duration equals the default and the page renders it as it is.
     */
    it('Assessment_StatePersistence_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_012, begin');
      store.reset();
      store.write(KEY_DURATION, `${DURATION_DEFAULT}`);
      const result: RebuildResult = rebuilder.rebuild(page);
      expect(result.durationMs).assertEqual(DURATION_DEFAULT);
      expect(result.durationMs).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_012, end');
    });

    /**
     * Scenario: the event log is written and restored.
     * Expectation: the entries survive a rebuild in their stored order.
     */
    it('Assessment_StatePersistence_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_013, begin');
      store.reset();
      const logs: string[] = [`${EVENT_BEGIN} code=0 message=`, `${EVENT_END} code=0 message=`];
      expect(store.writeList(KEY_LOGS, logs)).assertTrue();
      const restored: string[] = store.readList(KEY_LOGS);
      expect(restored.length).assertEqual(2);
      expect(restored[0]).assertContain(EVENT_BEGIN);
      expect(restored[1]).assertContain(EVENT_END);
      const result: RebuildResult = rebuilder.rebuild(page);
      expect(result.logSize).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_013, end');
    });

    /**
     * Scenario: the sequence counter survives a rebuild.
     * Expectation: the rebuilt page continues from the stored counter.
     */
    it('Assessment_StatePersistence_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_014, begin');
      store.reset();
      store.write(KEY_EVENT_SEQ, '12');
      const result: RebuildResult = rebuilder.rebuild(page);
      expect(result.seq).assertEqual(12);
      store.write(KEY_EVENT_SEQ, `${result.seq + 1}`);
      expect(store.readNumber(KEY_EVENT_SEQ)).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_014, end');
    });

    /**
     * Scenario: the active flag survives a rebuild.
     * Expectation: an active session is still reported as active after the rebuild.
     */
    it('Assessment_StatePersistence_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_015, begin');
      store.reset();
      store.write(KEY_ACTIVE, 'true');
      const active: RebuildResult = rebuilder.rebuild(page);
      expect(active.active).assertTrue();
      store.write(KEY_ACTIVE, 'false');
      const inactive: RebuildResult = rebuilder.rebuild(page);
      expect(inactive.active).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_015, end');
    });

    /**
     * Scenario: the changed key count is computed for a fresh store.
     * Expectation: no key differs from its default.
     */
    it('Assessment_StatePersistence_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_016, begin');
      store.reset();
      expect(rebuilder.changedKeyCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_016, end');
    });

    /**
     * Scenario: the changed key count is computed for a used store.
     * Expectation: the flag, the duration, the log and the sequence are all counted.
     */
    it('Assessment_StatePersistence_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_017, begin');
      store.reset();
      store.write(KEY_ACTIVE, 'true');
      store.write(KEY_DURATION, `${DURATION_TEN}`);
      store.writeList(KEY_LOGS, [`${EVENT_BEGIN} code=0 message=`]);
      store.write(KEY_EVENT_SEQ, '1');
      expect(rebuilder.changedKeyCount()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_017, end');
    });

    /**
     * Scenario: the input text of the page is set and cleared.
     * Expectation: the text lives only in the page and is not persisted.
     */
    it('Assessment_StatePersistence_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_018, begin');
      page.reset();
      page.setInput('com.samples.dictionary');
      expect(page.inputValue()).assertEqual('com.samples.dictionary');
      const rebuilt: IndexPageState = new IndexPageState();
      expect(rebuilt.inputValue()).assertEqual('');
      expect(store.has('assessmentInput')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_018, end');
    });

    /**
     * Scenario: a bundle is removed from the whitelist.
     * Expectation: the removal answers true once and false afterwards.
     */
    it('Assessment_StatePersistence_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_019, begin');
      page.reset();
      page.addApp('com.samples.dictionary');
      expect(page.removeApp('com.samples.dictionary')).assertTrue();
      expect(page.removeApp('com.samples.dictionary')).assertFalse();
      expect(page.appCount()).assertEqual(1);
      expect(page.removeApp(DEFAULT_ALLOWED_APP)).assertTrue();
      expect(page.appCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_019, end');
    });

    /**
     * Scenario: the last whitelist entry is removed.
     * Expectation: the empty whitelist is a valid page state and reports zero rows.
     */
    it('Assessment_StatePersistence_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_020, begin');
      page.reset();
      page.removeApp(DEFAULT_ALLOWED_APP);
      expect(page.appCount()).assertEqual(0);
      const rebuilt: IndexPageState = new IndexPageState();
      expect(rebuilt.appCount()).assertEqual(1);
      expect(rebuilt.apps()[0]).assertEqual(DEFAULT_ALLOWED_APP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_020, end');
    });

    /**
     * Scenario: the invalid duration sentinel is written.
     * Expectation: the placeholder survives the store and is not mistaken for a duration.
     */
    it('Assessment_StatePersistence_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_025, begin');
      store.reset();
      store.write(KEY_DURATION, `${INVALID_DURATION}`);
      expect(store.readNumber(KEY_DURATION)).assertEqual(INVALID_DURATION);
      expect(store.readNumber(KEY_DURATION) === INVALID_DURATION).assertTrue();
      store.reset();
      expect(store.readNumber(KEY_DURATION)).assertEqual(DURATION_DEFAULT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_025, end');
    });

    /**
     * Scenario: the persistent store is reset after a session.
     * Expectation: the seven keys keep their defaults and the write counter returns to zero.
     */
    it('Assessment_StatePersistence_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_026, begin');
      store.reset();
      store.write(KEY_DURATION, `${DURATION_TEN}`);
      store.write(KEY_EVENT_SEQ, '3');
      expect(store.writesDone()).assertEqual(2);
      store.reset();
      expect(store.writesDone()).assertEqual(0);
      expect(store.keyCount()).assertEqual(7);
      expect(store.readNumber(KEY_EVENT_SEQ)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', store.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StatePersistence_026, end');
    });
  });
}
