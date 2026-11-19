/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  logInfo,
  sleepMs,
  launchEntryAbility,
  doAbilityBackground,
  doAbilityForeground,
  waitForIndexPageStable,
  waitForTextVisible,
  tapComponentByText,
  isIndexPageVisible,
  checkTextContent,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_TEXT_APPEAR,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum StorageArea {
  APP_STORAGE = 'appStorage',
  PERSISTENT_STORAGE = 'persistentStorage',
  LOCAL_STORAGE = 'localStorage'
}

interface PersistedEntry {
  key: string;
  value: string;
  area: StorageArea;
  writeCount: number;
  dirty: boolean;
}

interface PersistenceReport {
  totalEntries: number;
  dirtyEntries: number;
  flushedWrites: number;
  areas: number;
}

const MESSAGE_KEY: string = 'message';

const THEME_KEY: string = 'theme';

const LOCALE_KEY: string = 'locale';

function persistenceError(name: string, message: string): Error {
  const error: Error = new Error(message);
  error.name = name;
  return error;
}

class PersistentStore {
  private entries: Map<string, PersistedEntry> = new Map<string, PersistedEntry>();

  private order: string[] = [];

  private flushCount: number = 0;

  private readonly maxKeys: number;

  constructor(maxKeys: number) {
    this.maxKeys = maxKeys;
  }

  public write(key: string, value: string, area: StorageArea): boolean {
    if (key.length === 0) {
      throw persistenceError('PersistenceKeyError', 'empty key');
    }
    const existing: PersistedEntry | undefined = this.entries.get(key);
    if (existing === undefined) {
      if (this.entries.size >= this.maxKeys) {
        throw persistenceError('PersistenceCapacityError', `key limit ${this.maxKeys} reached`);
      }
      if (value.length === 0) {
        return false;
      }
      const entry: PersistedEntry = {
        key: key,
        value: value,
        area: area,
        writeCount: 1,
        dirty: true
      };
      this.entries.set(key, entry);
      this.order.push(key);
      return true;
    }
    if (existing.value === value) {
      return false;
    }
    existing.value = value;
    existing.writeCount++;
    existing.dirty = true;
    return true;
  }

  public read(key: string): string {
    const entry: PersistedEntry | undefined = this.entries.get(key);
    if (entry === undefined) {
      return '';
    }
    return entry.value;
  }

  public readOrDefault(key: string, fallback: string): string {
    const entry: PersistedEntry | undefined = this.entries.get(key);
    if (entry === undefined || entry.value.length === 0) {
      return fallback;
    }
    return entry.value;
  }

  public has(key: string): boolean {
    return this.entries.has(key);
  }

  public remove(key: string): boolean {
    if (!this.entries.has(key)) {
      return false;
    }
    this.entries.delete(key);
    const position: number = this.order.indexOf(key);
    if (position >= 0) {
      this.order.splice(position, 1);
    }
    this.flushCount++;
    return true;
  }

  public areaOf(key: string): StorageArea | null {
    const entry: PersistedEntry | undefined = this.entries.get(key);
    if (entry === undefined) {
      return null;
    }
    return entry.area;
  }

  public writeCountOf(key: string): number {
    const entry: PersistedEntry | undefined = this.entries.get(key);
    if (entry === undefined) {
      return 0;
    }
    return entry.writeCount;
  }

  public flush(): number {
    let flushed: number = 0;
    const keys: string[] = this.keys();
    for (let i: number = 0; i < keys.length; i++) {
      const entry: PersistedEntry | undefined = this.entries.get(keys[i]);
      if (entry !== undefined && entry.dirty) {
        entry.dirty = false;
        flushed++;
      }
    }
    this.flushCount += flushed;
    return flushed;
  }

  public keys(): string[] {
    const result: string[] = [];
    for (let i: number = 0; i < this.order.length; i++) {
      if (this.entries.has(this.order[i])) {
        result.push(this.order[i]);
      }
    }
    return result;
  }

  public size(): number {
    return this.entries.size;
  }

  public report(): PersistenceReport {
    let dirty: number = 0;
    const areaNames: string[] = [];
    const keys: string[] = this.keys();
    for (let i: number = 0; i < keys.length; i++) {
      const entry: PersistedEntry | undefined = this.entries.get(keys[i]);
      if (entry === undefined) {
        continue;
      }
      if (entry.dirty) {
        dirty++;
      }
      const areaName: string = `${entry.area}`;
      if (areaNames.indexOf(areaName) < 0) {
        areaNames.push(areaName);
      }
    }
    const result: PersistenceReport = {
      totalEntries: this.entries.size,
      dirtyEntries: dirty,
      flushedWrites: this.flushCount,
      areas: areaNames.length
    };
    return result;
  }

  public getMaxKeys(): number {
    return this.maxKeys;
  }

  public clear(): void {
    this.entries = new Map<string, PersistedEntry>();
    this.order = [];
    this.flushCount = 0;
  }
}

class StorageAreaRouter {
  public static route(key: string): StorageArea {
    if (key === MESSAGE_KEY) {
      return StorageArea.PERSISTENT_STORAGE;
    }
    if (key === THEME_KEY) {
      return StorageArea.PERSISTENT_STORAGE;
    }
    if (key === LOCALE_KEY) {
      return StorageArea.APP_STORAGE;
    }
    return StorageArea.LOCAL_STORAGE;
  }

  public static isPersistent(area: StorageArea): boolean {
    return area === StorageArea.PERSISTENT_STORAGE;
  }

  public static isEphemeral(area: StorageArea): boolean {
    return area === StorageArea.LOCAL_STORAGE;
  }
}

class KeyConflictResolver {
  public static resolve(existing: string, incoming: string, preferIncoming: boolean): string {
    if (existing.length === 0) {
      return incoming;
    }
    if (incoming.length === 0) {
      return existing;
    }
    if (preferIncoming) {
      return incoming;
    }
    return existing;
  }

  public static isConflict(existing: string, incoming: string): boolean {
    if (existing.length === 0 || incoming.length === 0) {
      return false;
    }
    return existing !== incoming;
  }

  public static describeConflict(key: string, existing: string, incoming: string): string {
    return `${key}:${existing}!${incoming}`;
  }
}

export default function statePersistenceTest(): void {
  describe('StatePersistenceTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      driver = getDriver();
      await launchEntryAbility();
      await sleepMs(DELAY_AFTER_LAUNCH);

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await doAbilityForeground();
      await sleepMs(DELAY_AFTER_BACKGROUND);
      logInfo('StatePersistenceTest: suite finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_0100
     * @tc.name testWriteThenReadMessageKey
     * @tc.desc Verify write and read: message key stored as Hello World -> read returns Hello World and area is persistentStorage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWriteThenReadMessageKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(8);
        expect(store.write(MESSAGE_KEY, PAGE_TEXT_INITIAL, StorageArea.PERSISTENT_STORAGE)).assertTrue();
        expect(store.read(MESSAGE_KEY)).assertEqual(PAGE_TEXT_INITIAL);
        expect(store.areaOf(MESSAGE_KEY)).assertEqual(StorageArea.PERSISTENT_STORAGE);
        expect(store.has(MESSAGE_KEY)).assertTrue();
        expect(store.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_0200
     * @tc.name testOverwriteChangesStoredValue
     * @tc.desc Verify overwrite: message changed to Welcome -> read returns Welcome and write count 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOverwriteChangesStoredValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(8);
        store.write(MESSAGE_KEY, PAGE_TEXT_INITIAL, StorageArea.PERSISTENT_STORAGE);
        expect(store.write(MESSAGE_KEY, PAGE_TEXT_CLICKED, StorageArea.PERSISTENT_STORAGE)).assertTrue();
        expect(store.read(MESSAGE_KEY)).assertEqual(PAGE_TEXT_CLICKED);
        expect(store.writeCountOf(MESSAGE_KEY)).assertEqual(2);
        expect(store.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_0300
     * @tc.name testWriteSameValueIsNoOp
     * @tc.desc Verify idempotent write: rewriting identical value -> returns false and write count stays 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWriteSameValueIsNoOp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(8);
        store.write(MESSAGE_KEY, PAGE_TEXT_INITIAL, StorageArea.PERSISTENT_STORAGE);
        expect(store.write(MESSAGE_KEY, PAGE_TEXT_INITIAL, StorageArea.PERSISTENT_STORAGE)).assertFalse();
        expect(store.writeCountOf(MESSAGE_KEY)).assertEqual(1);
        expect(store.read(MESSAGE_KEY)).assertEqual(PAGE_TEXT_INITIAL);
        expect(store.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_0400
     * @tc.name testReadMissingKeyReturnsEmpty
     * @tc.desc Verify missing key read: unknown key -> empty string, has false, area null, write count 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReadMissingKeyReturnsEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(8);
        expect(store.read('missing')).assertEqual('');
        expect(store.has('missing')).assertFalse();
        expect(store.areaOf('missing')).assertEqual(null);
        expect(store.writeCountOf('missing')).assertEqual(0);
        expect(store.readOrDefault('missing', PAGE_TEXT_INITIAL)).assertEqual(PAGE_TEXT_INITIAL);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_0500
     * @tc.name testEmptyValueRejectedForNewKey
     * @tc.desc Verify empty value guard: writing empty string to new key -> returns false and key not created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyValueRejectedForNewKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(8);
        expect(store.write(MESSAGE_KEY, '', StorageArea.PERSISTENT_STORAGE)).assertFalse();
        expect(store.has(MESSAGE_KEY)).assertFalse();
        expect(store.size()).assertEqual(0);
        expect(store.readOrDefault(MESSAGE_KEY, PAGE_TEXT_INITIAL)).assertEqual(PAGE_TEXT_INITIAL);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_0600
     * @tc.name testRemoveDeletesKey
     * @tc.desc Verify delete: remove existing key true then read empty, remove again false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRemoveDeletesKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(8);
        store.write(MESSAGE_KEY, PAGE_TEXT_CLICKED, StorageArea.PERSISTENT_STORAGE);
        expect(store.remove(MESSAGE_KEY)).assertTrue();
        expect(store.read(MESSAGE_KEY)).assertEqual('');
        expect(store.has(MESSAGE_KEY)).assertFalse();
        expect(store.remove(MESSAGE_KEY)).assertFalse();
        expect(store.size()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_0700
     * @tc.name testKeyConflictDetectedAndResolved
     * @tc.desc Verify conflict handling: differing values detected as conflict, incoming preferred -> incoming wins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKeyConflictDetectedAndResolved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(KeyConflictResolver.isConflict(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED)).assertTrue();
        expect(KeyConflictResolver.isConflict(PAGE_TEXT_INITIAL, PAGE_TEXT_INITIAL)).assertFalse();
        expect(KeyConflictResolver.isConflict('', PAGE_TEXT_CLICKED)).assertFalse();
        expect(KeyConflictResolver.resolve(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, true)).assertEqual(PAGE_TEXT_CLICKED);
        expect(KeyConflictResolver.resolve(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, false)).assertEqual(PAGE_TEXT_INITIAL);
        expect(KeyConflictResolver.describeConflict(MESSAGE_KEY, PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED))
          .assertEqual('message:Hello World!Welcome');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_0800
     * @tc.name testConflictWithEmptySideFallsBack
     * @tc.desc Verify conflict fallback: empty existing or empty incoming -> resolver returns the non-empty side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConflictWithEmptySideFallsBack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(KeyConflictResolver.resolve('', PAGE_TEXT_CLICKED, false)).assertEqual(PAGE_TEXT_CLICKED);
        expect(KeyConflictResolver.resolve(PAGE_TEXT_INITIAL, '', true)).assertEqual(PAGE_TEXT_INITIAL);
        expect(KeyConflictResolver.resolve('', '', true)).assertEqual('');
        expect(KeyConflictResolver.isConflict('', '')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_0900
     * @tc.name testAreaRoutingByKey
     * @tc.desc Verify storage area routing: message and theme route to persistent, locale to app storage, other to local
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAreaRoutingByKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(StorageAreaRouter.route(MESSAGE_KEY)).assertEqual(StorageArea.PERSISTENT_STORAGE);
        expect(StorageAreaRouter.route(THEME_KEY)).assertEqual(StorageArea.PERSISTENT_STORAGE);
        expect(StorageAreaRouter.route(LOCALE_KEY)).assertEqual(StorageArea.APP_STORAGE);
        expect(StorageAreaRouter.route('transient_value')).assertEqual(StorageArea.LOCAL_STORAGE);
        expect(StorageAreaRouter.isPersistent(StorageAreaRouter.route(MESSAGE_KEY))).assertTrue();
        expect(StorageAreaRouter.isEphemeral(StorageAreaRouter.route('transient_value'))).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_1000
     * @tc.name testFlushClearsDirtyFlags
     * @tc.desc Verify flush semantics: two dirty entries -> flush returns 2, report dirty 0, second flush returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlushClearsDirtyFlags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(8);
        store.write(MESSAGE_KEY, PAGE_TEXT_CLICKED, StorageArea.PERSISTENT_STORAGE);
        store.write(THEME_KEY, 'dark', StorageArea.PERSISTENT_STORAGE);
        const reportBefore: PersistenceReport = store.report();
        expect(reportBefore.dirtyEntries).assertEqual(2);
        expect(store.flush()).assertEqual(2);
        const reportAfter: PersistenceReport = store.report();
        expect(reportAfter.dirtyEntries).assertEqual(0);
        expect(reportAfter.flushedWrites).assertEqual(2);
        expect(store.flush()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_1100
     * @tc.name testRewriteMarksEntryDirtyAgain
     * @tc.desc Verify dirty lifecycle: flush then overwrite -> dirty entries 1 and flush returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRewriteMarksEntryDirtyAgain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(8);
        store.write(MESSAGE_KEY, PAGE_TEXT_INITIAL, StorageArea.PERSISTENT_STORAGE);
        store.flush();
        expect(store.report().dirtyEntries).assertEqual(0);
        store.write(MESSAGE_KEY, PAGE_TEXT_CLICKED, StorageArea.PERSISTENT_STORAGE);
        expect(store.report().dirtyEntries).assertEqual(1);
        expect(store.flush()).assertEqual(1);
        expect(store.read(MESSAGE_KEY)).assertEqual(PAGE_TEXT_CLICKED);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_1200
     * @tc.name testCapacityLimitOnDistinctKeys
     * @tc.desc Verify key cap: store limit 2 then third distinct key -> PersistenceCapacityError and size stays 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCapacityLimitOnDistinctKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(2);
        store.write(MESSAGE_KEY, PAGE_TEXT_INITIAL, StorageArea.PERSISTENT_STORAGE);
        store.write(THEME_KEY, 'dark', StorageArea.PERSISTENT_STORAGE);
        try {
          store.write(LOCALE_KEY, 'zh-Hans', StorageArea.APP_STORAGE);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('PersistenceCapacityError');
          expect(e.message).assertEqual('key limit 2 reached');
        }
        expect(store.size()).assertEqual(2);
        expect(store.getMaxKeys()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_1300
     * @tc.name testRemoveFreesCapacitySlot
     * @tc.desc Verify slot reuse: full store then remove one key -> a new key can be written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRemoveFreesCapacitySlot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(2);
        store.write(MESSAGE_KEY, PAGE_TEXT_INITIAL, StorageArea.PERSISTENT_STORAGE);
        store.write(THEME_KEY, 'dark', StorageArea.PERSISTENT_STORAGE);
        expect(store.remove(THEME_KEY)).assertTrue();
        expect(store.write(LOCALE_KEY, 'en-US', StorageArea.APP_STORAGE)).assertTrue();
        expect(store.size()).assertEqual(2);
        expect(store.read(LOCALE_KEY)).assertEqual('en-US');
        expect(store.has(THEME_KEY)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_1400
     * @tc.name testEmptyKeyThrows
     * @tc.desc Verify key validation: writing with empty key -> PersistenceKeyError with message empty key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyKeyThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(4);
        try {
          store.write('', PAGE_TEXT_INITIAL, StorageArea.PERSISTENT_STORAGE);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('PersistenceKeyError');
          expect(e.message).assertEqual('empty key');
        }
        expect(store.size()).assertEqual(0);
        expect(store.write(MESSAGE_KEY, PAGE_TEXT_INITIAL, StorageArea.PERSISTENT_STORAGE)).assertTrue();
        expect(store.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_1500
     * @tc.name testReportCountsAreas
     * @tc.desc Verify report aggregation: entries across 3 areas -> areas 3, total 3, dirty 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReportCountsAreas', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(8);
        store.write(MESSAGE_KEY, PAGE_TEXT_INITIAL, StorageArea.PERSISTENT_STORAGE);
        store.write(LOCALE_KEY, 'zh-Hans', StorageArea.APP_STORAGE);
        store.write('temp', 'value', StorageArea.LOCAL_STORAGE);
        const report: PersistenceReport = store.report();
        expect(report.totalEntries).assertEqual(3);
        expect(report.dirtyEntries).assertEqual(3);
        expect(report.areas).assertEqual(3);
        expect(report.flushedWrites).assertEqual(0);
        expect(store.keys().length).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_1600
     * @tc.name testClearResetsStore
     * @tc.desc Verify store reset: after entries and flush then clear -> size 0, keys empty, report zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testClearResetsStore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(8);
        store.write(MESSAGE_KEY, PAGE_TEXT_CLICKED, StorageArea.PERSISTENT_STORAGE);
        store.flush();
        expect(store.size()).assertEqual(1);
        store.clear();
        const report: PersistenceReport = store.report();
        expect(store.size()).assertEqual(0);
        expect(store.keys().length).assertEqual(0);
        expect(report.totalEntries).assertEqual(0);
        expect(report.flushedWrites).assertEqual(0);
        expect(store.read(MESSAGE_KEY)).assertEqual('');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_1700
     * @tc.name testUiMessagePersistsAcrossBackground
     * @tc.desc Verify @State message survives switch: click to Welcome then background and foreground -> Welcome still readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiMessagePersistsAcrossBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForTextVisible(driver, PAGE_TEXT_INITIAL, TIMEOUT_TEXT_APPEAR);
        expect(await tapComponentByText(driver, PAGE_TEXT_INITIAL)).assertTrue();
        expect(await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR)).assertTrue();
        const store: PersistentStore = new PersistentStore(8);
        expect(store.write(MESSAGE_KEY, PAGE_TEXT_CLICKED, StorageArea.PERSISTENT_STORAGE)).assertTrue();
        await doAbilityBackground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_LAUNCH);
        expect(await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR)).assertTrue();
        expect(store.read(MESSAGE_KEY)).assertEqual(PAGE_TEXT_CLICKED);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_1800
     * @tc.name testUiStoredValueMatchesRenderedText
     * @tc.desc Verify store mirrors UI: the live page shows a declared copy, that exact copy is stored and
     * read back unchanged, and a flush persists exactly one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiStoredValueMatchesRenderedText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const store: PersistentStore = new PersistentStore(8);
        const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const clickedVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(initialVisible || clickedVisible).assertTrue();
        const rendered: string = initialVisible ? PAGE_TEXT_INITIAL : PAGE_TEXT_CLICKED;
        store.write(MESSAGE_KEY, rendered, StorageArea.PERSISTENT_STORAGE);
        expect(store.has(MESSAGE_KEY)).assertTrue();
        expect(store.read(MESSAGE_KEY)).assertEqual(rendered);
        expect(store.size()).assertEqual(1);
        expect(store.flush()).assertEqual(1);
        expect(store.readOrDefault(MESSAGE_KEY, PAGE_TEXT_INITIAL)).assertEqual(rendered);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_1900
     * @tc.name testUiDeleteThenForegroundFallsBack
     * @tc.desc Verify fallback after delete: remove message key while page live -> readOrDefault returns Hello World default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiDeleteThenForegroundFallsBack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const store: PersistentStore = new PersistentStore(8);
        store.write(MESSAGE_KEY, PAGE_TEXT_CLICKED, StorageArea.PERSISTENT_STORAGE);
        expect(store.remove(MESSAGE_KEY)).assertTrue();
        expect(store.readOrDefault(MESSAGE_KEY, PAGE_TEXT_INITIAL)).assertEqual(PAGE_TEXT_INITIAL);
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(store.size()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PERSIST_2000
     * @tc.name testWriteThroughputWithinBudget
     * @tc.desc Verify write throughput: 400 alternating writes on two keys -> completes within 1500 ms and final value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testWriteThroughputWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        const store: PersistentStore = new PersistentStore(8);
        const startTime: number = Date.now();
        for (let i: number = 0; i < 400; i++) {
          const value: string = i % 2 === 0 ? PAGE_TEXT_INITIAL : PAGE_TEXT_CLICKED;
          store.write(MESSAGE_KEY, value, StorageArea.PERSISTENT_STORAGE);
        }
        const elapsed: number = Date.now() - startTime;
        expect(elapsed <= 1500).assertTrue();
        expect(store.read(MESSAGE_KEY)).assertEqual(PAGE_TEXT_CLICKED);
        expect(store.size()).assertEqual(1);
        expect(store.writeCountOf(MESSAGE_KEY)).assertEqual(400);
      } finally {
        done();
      }
    })
  })
}
