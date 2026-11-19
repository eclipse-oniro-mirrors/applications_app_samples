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
  measureElapsed,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_TEXT_APPEAR,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum RecoveryStatus {
  RESTORED = 'restored',
  MIGRATED = 'migrated',
  FALLBACK = 'fallback',
  REJECTED = 'rejected'
}

interface StateSnapshot {
  version: number;
  message: string;
  scrollPosition: number;
  selectedIndex: number;
  capturedAtMs: number;
}

interface RecoveryResult {
  status: RecoveryStatus;
  applied: StateSnapshot;
  droppedFields: number;
}

interface FieldDescriptor {
  name: string;
  minVersion: number;
}

const DEFAULT_MESSAGE: string = PAGE_TEXT_INITIAL;

const MIN_SUPPORTED_VERSION: number = 1;

const MAX_SUPPORTED_VERSION: number = 3;

const FIELD_DESCRIPTORS: FieldDescriptor[] = [
  { name: 'message', minVersion: 1 },
  { name: 'scrollPosition', minVersion: 2 },
  { name: 'selectedIndex', minVersion: 3 }
];

function recoveryError(name: string, message: string): Error {
  const error: Error = new Error(message);
  error.name = name;
  return error;
}

class SnapshotStore {
  private slots: Map<string, StateSnapshot> = new Map<string, StateSnapshot>();

  private order: string[] = [];

  private saveCount: number = 0;

  private corruptionCount: number = 0;

  public save(slot: string, snapshot: StateSnapshot): void {
    if (slot.length === 0) {
      throw recoveryError('SnapshotSlotError', 'empty slot name');
    }
    if (snapshot.version < MIN_SUPPORTED_VERSION || snapshot.version > MAX_SUPPORTED_VERSION) {
      throw recoveryError('SnapshotVersionError', `unsupported version ${snapshot.version}`);
    }
    if (!this.slots.has(slot)) {
      this.order.push(slot);
    }
    this.slots.set(slot, snapshot);
    this.saveCount++;
  }

  public load(slot: string): StateSnapshot | null {
    const snapshot: StateSnapshot | undefined = this.slots.get(slot);
    if (snapshot === undefined) {
      return null;
    }
    return snapshot;
  }

  public has(slot: string): boolean {
    return this.slots.has(slot);
  }

  private removeOrder(slot: string): void {
    const position: number = this.order.indexOf(slot);
    if (position >= 0) {
      this.order.splice(position, 1);
    }
  }

  public drop(slot: string): boolean {
    if (!this.slots.has(slot)) {
      return false;
    }
    this.slots.delete(slot);
    this.removeOrder(slot);
    return true;
  }

  public markCorrupt(slot: string): void {
    this.corruptionCount++;
    this.slots.delete(slot);
    this.removeOrder(slot);
  }

  public getSaveCount(): number {
    return this.saveCount;
  }

  public getCorruptionCount(): number {
    return this.corruptionCount;
  }

  public slotNames(): string[] {
    const names: string[] = [];
    const keys: string[] = this.order;
    for (let i: number = 0; i < keys.length; i++) {
      if (this.slots.has(keys[i])) {
        names.push(keys[i]);
      }
    }
    return names;
  }

  public size(): number {
    return this.slots.size;
  }
}

class SnapshotMigrator {
  public static needsMigration(snapshot: StateSnapshot): boolean {
    return snapshot.version < MAX_SUPPORTED_VERSION;
  }

  public static supportedFields(version: number): string[] {
    const fields: string[] = [];
    for (let i: number = 0; i < FIELD_DESCRIPTORS.length; i++) {
      if (FIELD_DESCRIPTORS[i].minVersion <= version) {
        fields.push(FIELD_DESCRIPTORS[i].name);
      }
    }
    return fields;
  }

  public static migrate(snapshot: StateSnapshot): RecoveryResult {
    if (snapshot.version < MIN_SUPPORTED_VERSION) {
      throw recoveryError('SnapshotVersionError', `version ${snapshot.version} below minimum`);
    }
    if (snapshot.version > MAX_SUPPORTED_VERSION) {
      throw recoveryError('SnapshotVersionError', `version ${snapshot.version} above maximum`);
    }
    if (snapshot.message.length === 0) {
      throw recoveryError('SnapshotCorruptError', 'message field empty');
    }
    if (snapshot.version === MAX_SUPPORTED_VERSION) {
      const unchanged: StateSnapshot = {
        version: snapshot.version,
        message: snapshot.message,
        scrollPosition: snapshot.scrollPosition,
        selectedIndex: snapshot.selectedIndex,
        capturedAtMs: snapshot.capturedAtMs
      };
      const result: RecoveryResult = {
        status: RecoveryStatus.RESTORED,
        applied: unchanged,
        droppedFields: 0
      };
      return result;
    }
    const migrated: StateSnapshot = {
      version: MAX_SUPPORTED_VERSION,
      message: snapshot.message,
      scrollPosition: snapshot.version >= 2 ? snapshot.scrollPosition : 0,
      selectedIndex: 0,
      capturedAtMs: snapshot.capturedAtMs
    };
    const result: RecoveryResult = {
      status: RecoveryStatus.MIGRATED,
      applied: migrated,
      droppedFields: MAX_SUPPORTED_VERSION - snapshot.version
    };
    return result;
  }

  public static fallback(): RecoveryResult {
    const defaults: StateSnapshot = {
      version: MAX_SUPPORTED_VERSION,
      message: DEFAULT_MESSAGE,
      scrollPosition: 0,
      selectedIndex: 0,
      capturedAtMs: 0
    };
    const result: RecoveryResult = {
      status: RecoveryStatus.FALLBACK,
      applied: defaults,
      droppedFields: 0
    };
    return result;
  }

  public static recover(snapshot: StateSnapshot | null): RecoveryResult {
    if (snapshot === null) {
      return SnapshotMigrator.fallback();
    }
    try {
      return SnapshotMigrator.migrate(snapshot);
    } catch (e) {
      return SnapshotMigrator.fallback();
    }
  }

  public static sameState(left: StateSnapshot, right: StateSnapshot): boolean {
    if (left.message !== right.message) {
      return false;
    }
    if (left.scrollPosition !== right.scrollPosition) {
      return false;
    }
    if (left.selectedIndex !== right.selectedIndex) {
      return false;
    }
    return true;
  }

  public static describe(result: RecoveryResult): string {
    return `${result.status}:v${result.applied.version}:${result.applied.message}`;
  }
}

export default function stateRecoveryTest(): void {
  describe('StateRecoveryTest', () => {
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
      logInfo('StateRecoveryTest: suite finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_0100
     * @tc.name testSaveAndLoadSnapshot
     * @tc.desc Verify snapshot round trip: save version 3 snapshot in slot main -> load returns identical message and counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSaveAndLoadSnapshot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: SnapshotStore = new SnapshotStore();
        const snapshot: StateSnapshot = {
          version: 3,
          message: PAGE_TEXT_CLICKED,
          scrollPosition: 120,
          selectedIndex: 2,
          capturedAtMs: 5000
        };
        store.save('main', snapshot);
        const loaded: StateSnapshot | null = store.load('main');
        expect(loaded !== null).assertTrue();
        if (loaded !== null) {
          expect(loaded.message).assertEqual(PAGE_TEXT_CLICKED);
          expect(loaded.scrollPosition).assertEqual(120);
          expect(loaded.selectedIndex).assertEqual(2);
          expect(loaded.version).assertEqual(3);
        }
        expect(store.getSaveCount()).assertEqual(1);
        expect(store.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_0200
     * @tc.name testLoadMissingSlotReturnsNull
     * @tc.desc Verify missing snapshot: load unknown slot -> null and has false, drop returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLoadMissingSlotReturnsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: SnapshotStore = new SnapshotStore();
        expect(store.load('absent')).assertEqual(null);
        expect(store.has('absent')).assertFalse();
        expect(store.drop('absent')).assertFalse();
        expect(store.size()).assertEqual(0);
        expect(store.slotNames().length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_0300
     * @tc.name testSaveRejectsUnsupportedVersion
     * @tc.desc Verify version bounds at save: version 0 and version 4 -> both throw SnapshotVersionError, version 1 accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSaveRejectsUnsupportedVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: SnapshotStore = new SnapshotStore();
        const tooOld: StateSnapshot = {
          version: 0,
          message: PAGE_TEXT_INITIAL,
          scrollPosition: 0,
          selectedIndex: 0,
          capturedAtMs: 0
        };
        try {
          store.save('main', tooOld);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('SnapshotVersionError');
          expect(e.message).assertEqual('unsupported version 0');
        }
        const tooNew: StateSnapshot = {
          version: 4,
          message: PAGE_TEXT_INITIAL,
          scrollPosition: 0,
          selectedIndex: 0,
          capturedAtMs: 0
        };
        try {
          store.save('main', tooNew);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('SnapshotVersionError');
          expect(e.message).assertEqual('unsupported version 4');
        }
        const valid: StateSnapshot = {
          version: 1,
          message: PAGE_TEXT_INITIAL,
          scrollPosition: 0,
          selectedIndex: 0,
          capturedAtMs: 1
        };
        store.save('main', valid);
        expect(store.has('main')).assertTrue();
        expect(store.getSaveCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_0400
     * @tc.name testSaveRejectsEmptySlotName
     * @tc.desc Verify slot name guard: saving with empty slot -> SnapshotSlotError with empty slot name message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSaveRejectsEmptySlotName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: SnapshotStore = new SnapshotStore();
        const snapshot: StateSnapshot = {
          version: 3,
          message: PAGE_TEXT_INITIAL,
          scrollPosition: 0,
          selectedIndex: 0,
          capturedAtMs: 0
        };
        try {
          store.save('', snapshot);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('SnapshotSlotError');
          expect(e.message).assertEqual('empty slot name');
        }
        expect(store.size()).assertEqual(0);
        expect(store.getSaveCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_0500
     * @tc.name testLatestVariationRestoresDirectly
     * @tc.desc Verify same version restore: version 3 snapshot with Welcome -> status restored and state identical
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLatestVariationRestoresDirectly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const snapshot: StateSnapshot = {
          version: 3,
          message: PAGE_TEXT_CLICKED,
          scrollPosition: 48,
          selectedIndex: 1,
          capturedAtMs: 900
        };
        const result: RecoveryResult = SnapshotMigrator.migrate(snapshot);
        expect(result.status).assertEqual(RecoveryStatus.RESTORED);
        expect(result.droppedFields).assertEqual(0);
        expect(SnapshotMigrator.sameState(result.applied, snapshot)).assertTrue();
        expect(result.applied.message).assertEqual(PAGE_TEXT_CLICKED);
        expect(SnapshotMigrator.describe(result)).assertEqual('restored:v3:Welcome');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_0600
     * @tc.name testVersionTwoSnapshotMigrates
     * @tc.desc Verify v2 to v3 migration: selectedIndex reset to 0 while scrollPosition preserved -> status migrated, dropped 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVersionTwoSnapshotMigrates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const snapshot: StateSnapshot = {
          version: 2,
          message: PAGE_TEXT_INITIAL,
          scrollPosition: 200,
          selectedIndex: 5,
          capturedAtMs: 700
        };
        expect(SnapshotMigrator.needsMigration(snapshot)).assertTrue();
        const result: RecoveryResult = SnapshotMigrator.migrate(snapshot);
        expect(result.status).assertEqual(RecoveryStatus.MIGRATED);
        expect(result.applied.version).assertEqual(3);
        expect(result.applied.scrollPosition).assertEqual(200);
        expect(result.applied.selectedIndex).assertEqual(0);
        expect(result.droppedFields).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_0700
     * @tc.name testVersionOneSnapshotResetsNewFields
     * @tc.desc Verify v1 to v3 migration: scrollPosition and selectedIndex both reset -> dropped fields 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVersionOneSnapshotResetsNewFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const snapshot: StateSnapshot = {
          version: 1,
          message: PAGE_TEXT_CLICKED,
          scrollPosition: 999,
          selectedIndex: 7,
          capturedAtMs: 100
        };
        const result: RecoveryResult = SnapshotMigrator.migrate(snapshot);
        expect(result.status).assertEqual(RecoveryStatus.MIGRATED);
        expect(result.applied.scrollPosition).assertEqual(0);
        expect(result.applied.selectedIndex).assertEqual(0);
        expect(result.droppedFields).assertEqual(2);
        expect(result.applied.message).assertEqual(PAGE_TEXT_CLICKED);
        expect(SnapshotMigrator.sameState(result.applied, snapshot)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_0800
     * @tc.name testSupportedFieldsPerVersion
     * @tc.desc Verify field compatibility matrix: v1 supports 1 field, v2 two fields, v3 all three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSupportedFieldsPerVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const v1Fields: string[] = SnapshotMigrator.supportedFields(1);
        const v2Fields: string[] = SnapshotMigrator.supportedFields(2);
        const v3Fields: string[] = SnapshotMigrator.supportedFields(3);
        expect(v1Fields.length).assertEqual(1);
        expect(v1Fields[0]).assertEqual('message');
        expect(v2Fields.length).assertEqual(2);
        expect(v2Fields[1]).assertEqual('scrollPosition');
        expect(v3Fields.length).assertEqual(3);
        expect(v3Fields[2]).assertEqual('selectedIndex');
        expect(FIELD_DESCRIPTORS.length).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_0900
     * @tc.name testNullSnapshotFallsBackToDefault
     * @tc.desc Verify null snapshot recovery: recover(null) -> fallback status with default message Hello World
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNullSnapshotFallsBackToDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const result: RecoveryResult = SnapshotMigrator.recover(null);
        expect(result.status).assertEqual(RecoveryStatus.FALLBACK);
        expect(result.applied.message).assertEqual(DEFAULT_MESSAGE);
        expect(result.applied.version).assertEqual(MAX_SUPPORTED_VERSION);
        expect(result.applied.scrollPosition).assertEqual(0);
        expect(result.applied.capturedAtMs).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_1000
     * @tc.name testCorruptSnapshotFallsBackToDefault
     * @tc.desc Verify corrupt snapshot fallback: empty message version 3 -> recover returns fallback instead of throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCorruptSnapshotFallsBackToDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const corrupt: StateSnapshot = {
          version: 3,
          message: '',
          scrollPosition: 10,
          selectedIndex: 1,
          capturedAtMs: 50
        };
        try {
          SnapshotMigrator.migrate(corrupt);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('SnapshotCorruptError');
          expect(e.message).assertEqual('message field empty');
        }
        const result: RecoveryResult = SnapshotMigrator.recover(corrupt);
        expect(result.status).assertEqual(RecoveryStatus.FALLBACK);
        expect(result.applied.message).assertEqual(DEFAULT_MESSAGE);
        expect(result.applied.scrollPosition).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_1100
     * @tc.name testOutOfRangeVersionThrowsOnMigrate
     * @tc.desc Verify version guard on migrate: version 0 and version 9 -> SnapshotVersionError with distinct messages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOutOfRangeVersionThrowsOnMigrate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const below: StateSnapshot = {
          version: 0,
          message: PAGE_TEXT_INITIAL,
          scrollPosition: 0,
          selectedIndex: 0,
          capturedAtMs: 0
        };
        try {
          SnapshotMigrator.migrate(below);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('SnapshotVersionError');
          expect(e.message).assertEqual('version 0 below minimum');
        }
        const above: StateSnapshot = {
          version: 9,
          message: PAGE_TEXT_INITIAL,
          scrollPosition: 0,
          selectedIndex: 0,
          capturedAtMs: 0
        };
        try {
          SnapshotMigrator.migrate(above);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('SnapshotVersionError');
          expect(e.message).assertEqual('version 9 above maximum');
        }
        expect(SnapshotMigrator.recover(above).status).assertEqual(RecoveryStatus.FALLBACK);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_1200
     * @tc.name testMarkCorruptDropsSlot
     * @tc.desc Verify corruption handling: mark corrupt on existing slot -> slot removed, corruption counter 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMarkCorruptDropsSlot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: SnapshotStore = new SnapshotStore();
        const snapshot: StateSnapshot = {
          version: 3,
          message: PAGE_TEXT_INITIAL,
          scrollPosition: 5,
          selectedIndex: 0,
          capturedAtMs: 20
        };
        store.save('main', snapshot);
        expect(store.has('main')).assertTrue();
        store.markCorrupt('main');
        expect(store.has('main')).assertFalse();
        expect(store.load('main')).assertEqual(null);
        expect(store.getCorruptionCount()).assertEqual(1);
        expect(store.size()).assertEqual(0);
        expect(store.getSaveCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_1300
     * @tc.name testMultiSlotIsolation
     * @tc.desc Verify slot isolation: two slots with different messages -> loads return their own values and drop one keeps the other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMultiSlotIsolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: SnapshotStore = new SnapshotStore();
        const first: StateSnapshot = {
          version: 3,
          message: PAGE_TEXT_INITIAL,
          scrollPosition: 1,
          selectedIndex: 0,
          capturedAtMs: 10
        };
        const second: StateSnapshot = {
          version: 3,
          message: PAGE_TEXT_CLICKED,
          scrollPosition: 2,
          selectedIndex: 1,
          capturedAtMs: 20
        };
        store.save('slotA', first);
        store.save('slotB', second);
        expect(store.size()).assertEqual(2);
        const loadedA: StateSnapshot | null = store.load('slotA');
        const loadedB: StateSnapshot | null = store.load('slotB');
        if (loadedA !== null && loadedB !== null) {
          expect(loadedA.message).assertEqual(PAGE_TEXT_INITIAL);
          expect(loadedB.message).assertEqual(PAGE_TEXT_CLICKED);
        }
        expect(store.drop('slotA')).assertTrue();
        expect(store.has('slotB')).assertTrue();
        expect(store.size()).assertEqual(1);
        expect(store.slotNames()[0]).assertEqual('slotB');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_1400
     * @tc.name testOverwriteSlotKeepsLatestSnapshot
     * @tc.desc Verify overwrite: saving twice into same slot -> load returns the second message and save count 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOverwriteSlotKeepsLatestSnapshot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: SnapshotStore = new SnapshotStore();
        const first: StateSnapshot = {
          version: 3,
          message: PAGE_TEXT_INITIAL,
          scrollPosition: 0,
          selectedIndex: 0,
          capturedAtMs: 10
        };
        const second: StateSnapshot = {
          version: 3,
          message: PAGE_TEXT_CLICKED,
          scrollPosition: 60,
          selectedIndex: 2,
          capturedAtMs: 30
        };
        store.save('main', first);
        store.save('main', second);
        const loaded: StateSnapshot | null = store.load('main');
        expect(store.getSaveCount()).assertEqual(2);
        expect(store.size()).assertEqual(1);
        if (loaded !== null) {
          expect(loaded.message).assertEqual(PAGE_TEXT_CLICKED);
          expect(loaded.scrollPosition).assertEqual(60);
          expect(loaded.capturedAtMs).assertEqual(30);
        }
        expect(SnapshotMigrator.sameState(first, second)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_1500
     * @tc.name testSameStateComparison
     * @tc.desc Verify state equality helper: identical snapshots true, differing message false, differing index false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSameStateComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const base: StateSnapshot = {
          version: 3,
          message: PAGE_TEXT_INITIAL,
          scrollPosition: 10,
          selectedIndex: 1,
          capturedAtMs: 5
        };
        const copy: StateSnapshot = {
          version: 3,
          message: PAGE_TEXT_INITIAL,
          scrollPosition: 10,
          selectedIndex: 1,
          capturedAtMs: 99
        };
        const otherMessage: StateSnapshot = {
          version: 3,
          message: PAGE_TEXT_CLICKED,
          scrollPosition: 10,
          selectedIndex: 1,
          capturedAtMs: 5
        };
        const otherIndex: StateSnapshot = {
          version: 3,
          message: PAGE_TEXT_INITIAL,
          scrollPosition: 10,
          selectedIndex: 2,
          capturedAtMs: 5
        };
        expect(SnapshotMigrator.sameState(base, copy)).assertTrue();
        expect(SnapshotMigrator.sameState(base, otherMessage)).assertFalse();
        expect(SnapshotMigrator.sameState(base, otherIndex)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_1600
     * @tc.name testUiTextRestoredAfterForeground
     * @tc.desc Verify process reuse recovery: click to Welcome, background, foreground -> Welcome text still restored on page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTextRestoredAfterForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForTextVisible(driver, PAGE_TEXT_INITIAL, TIMEOUT_TEXT_APPEAR);
        expect(await tapComponentByText(driver, PAGE_TEXT_INITIAL)).assertTrue();
        expect(await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR)).assertTrue();
        const store: SnapshotStore = new SnapshotStore();
        const snapshot: StateSnapshot = {
          version: 3,
          message: PAGE_TEXT_CLICKED,
          scrollPosition: 0,
          selectedIndex: 0,
          capturedAtMs: Date.now()
        };
        store.save('main', snapshot);
        await doAbilityBackground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_LAUNCH);
        const recovered: RecoveryResult = SnapshotMigrator.recover(store.load('main'));
        expect(recovered.status).assertEqual(RecoveryStatus.RESTORED);
        expect(recovered.applied.message).assertEqual(PAGE_TEXT_CLICKED);
        expect(await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_1700
     * @tc.name testUiDefaultTextAfterSnapshotLoss
     * @tc.desc Verify fallback rendering path: corrupt snapshot forces fallback -> Index page still shows a known message literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiDefaultTextAfterSnapshotLoss', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const result: RecoveryResult = SnapshotMigrator.recover(null);
        expect(result.status).assertEqual(RecoveryStatus.FALLBACK);
        expect(result.applied.message).assertEqual(PAGE_TEXT_INITIAL);
        const knownMessageVisible: boolean = await isIndexPageVisible(driver);
        expect(knownMessageVisible).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_1800
     * @tc.name testUiSnapshotMatchesRenderedText
     * @tc.desc Verify snapshot fidelity: captured rendered text in slot -> checkTextContent confirms and sameState holds against reload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiSnapshotMatchesRenderedText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const renderedInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const message: string = renderedInitial ? PAGE_TEXT_INITIAL : PAGE_TEXT_CLICKED;
        const store: SnapshotStore = new SnapshotStore();
        const snapshot: StateSnapshot = {
          version: 3,
          message: message,
          scrollPosition: 0,
          selectedIndex: 0,
          capturedAtMs: Date.now()
        };
        store.save('main', snapshot);
        const reloaded: StateSnapshot | null = store.load('main');
        if (reloaded !== null) {
          expect(SnapshotMigrator.sameState(reloaded, snapshot)).assertTrue();
        }
        expect(await checkTextContent(driver, message)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_1900
     * @tc.name testUiRepeatedRecoveryKeepsPageVisible
     * @tc.desc Verify 4 recovery rounds against live page: every round restores status and page remains visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testUiRepeatedRecoveryKeepsPageVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const store: SnapshotStore = new SnapshotStore();
        let restoredRounds: number = 0;
        for (let i: number = 0; i < 4; i++) {
          const version: number = 1 + (i % MAX_SUPPORTED_VERSION);
          const snapshot: StateSnapshot = {
            version: version,
            message: PAGE_TEXT_INITIAL,
            scrollPosition: i * 10,
            selectedIndex: i,
            capturedAtMs: i
          };
          store.save(`round_${i}`, snapshot);
          const result: RecoveryResult = SnapshotMigrator.recover(store.load(`round_${i}`));
          if (result.status === RecoveryStatus.RESTORED || result.status === RecoveryStatus.MIGRATED) {
            restoredRounds++;
          }
          await sleepMs(20);
        }
        expect(restoredRounds).assertEqual(4);
        expect(store.size()).assertEqual(4);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STATERECOVERY_2000
     * @tc.name testRecoveryThroughputWithinBudget
     * @tc.desc Verify snapshot overhead: 400 save and recover cycles -> elapsed within 1500 ms, save count 400, throughput stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testRecoveryThroughputWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        const store: SnapshotStore = new SnapshotStore();
        const startTime: number = Date.now();
        let recovered: number = 0;
        for (let i: number = 0; i < 400; i++) {
          const snapshot: StateSnapshot = {
            version: 1 + (i % MAX_SUPPORTED_VERSION),
            message: PAGE_TEXT_INITIAL,
            scrollPosition: i,
            selectedIndex: 0,
            capturedAtMs: i
          };
          store.save('bulk', snapshot);
          const result: RecoveryResult = SnapshotMigrator.recover(store.load('bulk'));
          if (result.applied.version === MAX_SUPPORTED_VERSION) {
            recovered++;
          }
        }
        const elapsed: number = measureElapsed(startTime);
        expect(recovered).assertEqual(400);
        expect(store.getSaveCount()).assertEqual(400);
        expect(elapsed <= 1500).assertTrue();
        expect(store.size()).assertEqual(1);
      } finally {
        done();
      }
    })
  })
}
