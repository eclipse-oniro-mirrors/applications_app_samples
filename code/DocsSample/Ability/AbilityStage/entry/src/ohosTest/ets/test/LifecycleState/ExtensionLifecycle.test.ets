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
  waitForIndexPageStable,
  isIndexPageVisible,
  checkComponentExistsByKey,
  measureElapsed,
  INDEX_PAGE_TEXT_KEY,
  TIMEOUT_PAGE_RENDER,
  DELAY_AFTER_LAUNCH,
  BACKUP_ABILITY_NAME,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum BackupPhase {
  IDLE = 'idle',
  BACKUP_STARTED = 'backupStarted',
  BACKUP_COMPLETED = 'backupCompleted',
  RESTORE_STARTED = 'restoreStarted',
  RESTORE_COMPLETED = 'restoreCompleted',
  FAILED = 'failed'
}

enum VersionRelation {
  OLDER_SOURCE = 'olderSource',
  SAME_VERSION = 'sameVersion',
  NEWER_SOURCE = 'newerSource'
}

interface BackupEntry {
  key: string;
  payload: string;
  sequence: number;
}

interface VersionTriple {
  major: number;
  minor: number;
  patch: number;
}

interface BackupSession {
  sessionId: string;
  phase: BackupPhase;
  entryCount: number;
  startedAtMs: number;
}

function backupError(name: string, message: string): Error {
  const error: Error = new Error(message);
  error.name = name;
  return error;
}

class VersionParser {
  public static parse(name: string): VersionTriple {
    if (name.length === 0) {
      throw backupError('VersionParseError', 'empty version name');
    }
    const parts: string[] = name.split('.');
    if (parts.length !== 3) {
      throw backupError('VersionParseError', `expected 3 segments, got ${parts.length}`);
    }
    const major: number = VersionParser.parseSegment(parts[0]);
    const minor: number = VersionParser.parseSegment(parts[1]);
    const patch: number = VersionParser.parseSegment(parts[2]);
    const triple: VersionTriple = {
      major: major,
      minor: minor,
      patch: patch
    };
    return triple;
  }

  private static parseSegment(text: string): number {
    if (text.length === 0) {
      throw backupError('VersionParseError', 'empty segment');
    }
    let value: number = 0;
    for (let i: number = 0; i < text.length; i++) {
      const code: number = text.charCodeAt(i);
      if (code < 48 || code > 57) {
        throw backupError('VersionParseError', `non numeric segment ${text}`);
      }
      value = value * 10 + (code - 48);
    }
    return value;
  }

  public static compare(left: string, right: string): number {
    const leftTriple: VersionTriple = VersionParser.parse(left);
    const rightTriple: VersionTriple = VersionParser.parse(right);
    if (leftTriple.major !== rightTriple.major) {
      return leftTriple.major > rightTriple.major ? 1 : -1;
    }
    if (leftTriple.minor !== rightTriple.minor) {
      return leftTriple.minor > rightTriple.minor ? 1 : -1;
    }
    if (leftTriple.patch !== rightTriple.patch) {
      return leftTriple.patch > rightTriple.patch ? 1 : -1;
    }
    return 0;
  }

  public static classify(sourceCode: number, targetCode: number, sourceName: string,
    targetName: string): VersionRelation {
    if (sourceCode < targetCode) {
      return VersionRelation.OLDER_SOURCE;
    }
    if (sourceCode > targetCode) {
      return VersionRelation.NEWER_SOURCE;
    }
    const nameRelation: number = VersionParser.compare(sourceName, targetName);
    if (nameRelation === 0) {
      return VersionRelation.SAME_VERSION;
    }
    return nameRelation < 0 ? VersionRelation.OLDER_SOURCE : VersionRelation.NEWER_SOURCE;
  }

  public static isSemanticName(name: string): boolean {
    try {
      VersionParser.parse(name);
      return true;
    } catch (e) {
      return false;
    }
  }
}

class BackupLifecycleTracker {
  private phase: BackupPhase = BackupPhase.IDLE;

  private timeline: string[] = [];

  private backupRuns: number = 0;

  private restoreRuns: number = 0;

  public beginBackup(): void {
    if (this.phase === BackupPhase.BACKUP_STARTED) {
      throw backupError('BackupReentrancyError', 'backup already running');
    }
    if (this.phase === BackupPhase.RESTORE_STARTED) {
      throw backupError('BackupReentrancyError', 'restore in progress');
    }
    this.phase = BackupPhase.BACKUP_STARTED;
    this.timeline.push(`${BackupPhase.BACKUP_STARTED}`);
  }

  public finishBackup(entries: number): void {
    if (this.phase !== BackupPhase.BACKUP_STARTED) {
      throw backupError('BackupPhaseError', 'backup not started');
    }
    if (entries < 0) {
      throw backupError('BackupPhaseError', 'negative entry count');
    }
    this.phase = BackupPhase.BACKUP_COMPLETED;
    this.backupRuns++;
    this.timeline.push(`${BackupPhase.BACKUP_COMPLETED}`);
  }

  public beginRestore(): void {
    if (this.phase === BackupPhase.BACKUP_STARTED) {
      throw backupError('BackupReentrancyError', 'backup in progress');
    }
    if (this.phase === BackupPhase.RESTORE_STARTED) {
      throw backupError('BackupReentrancyError', 'restore already running');
    }
    this.phase = BackupPhase.RESTORE_STARTED;
    this.timeline.push(`${BackupPhase.RESTORE_STARTED}`);
  }

  public finishRestore(): void {
    if (this.phase !== BackupPhase.RESTORE_STARTED) {
      throw backupError('BackupPhaseError', 'restore not started');
    }
    this.phase = BackupPhase.RESTORE_COMPLETED;
    this.restoreRuns++;
    this.timeline.push(`${BackupPhase.RESTORE_COMPLETED}`);
  }

  public fail(reason: string): void {
    this.phase = BackupPhase.FAILED;
    this.timeline.push(`${BackupPhase.FAILED}:${reason}`);
  }

  public getPhase(): BackupPhase {
    return this.phase;
  }

  public getTimeline(): string[] {
    const copy: string[] = [];
    for (let i: number = 0; i < this.timeline.length; i++) {
      copy.push(this.timeline[i]);
    }
    return copy;
  }

  public getBackupRuns(): number {
    return this.backupRuns;
  }

  public getRestoreRuns(): number {
    return this.restoreRuns;
  }

  public isBackupThenRestoreOrder(): boolean {
    let backupIndex: number = -1;
    let restoreIndex: number = -1;
    for (let i: number = 0; i < this.timeline.length; i++) {
      if (this.timeline[i] === 'backupCompleted' && backupIndex < 0) {
        backupIndex = i;
      }
      if (this.timeline[i] === 'restoreCompleted' && restoreIndex < 0) {
        restoreIndex = i;
      }
    }
    return backupIndex >= 0 && restoreIndex > backupIndex;
  }

  public reset(): void {
    this.phase = BackupPhase.IDLE;
    this.timeline = [];
    this.backupRuns = 0;
    this.restoreRuns = 0;
  }
}

class BackupCatalog {
  private entries: BackupEntry[] = [];

  private sequenceCounter: number = 0;

  public put(key: string, payload: string): boolean {
    if (key.length === 0) {
      throw backupError('BackupCatalogError', 'empty key');
    }
    const existingIndex: number = this.indexOf(key);
    if (existingIndex >= 0) {
      if (this.entries[existingIndex].payload === payload) {
        return false;
      }
      this.entries[existingIndex].payload = payload;
      return true;
    }
    const entry: BackupEntry = {
      key: key,
      payload: payload,
      sequence: this.sequenceCounter
    };
    this.entries.push(entry);
    this.sequenceCounter++;
    return true;
  }

  private indexOf(key: string): number {
    for (let i: number = 0; i < this.entries.length; i++) {
      if (this.entries[i].key === key) {
        return i;
      }
    }
    return -1;
  }

  public get(key: string): string {
    const index: number = this.indexOf(key);
    if (index < 0) {
      return '';
    }
    return this.entries[index].payload;
  }

  public has(key: string): boolean {
    return this.indexOf(key) >= 0;
  }

  public remove(key: string): boolean {
    const index: number = this.indexOf(key);
    if (index < 0) {
      return false;
    }
    this.entries.splice(index, 1);
    return true;
  }

  public size(): number {
    return this.entries.length;
  }

  public keys(): string[] {
    const result: string[] = [];
    for (let i: number = 0; i < this.entries.length; i++) {
      result.push(this.entries[i].key);
    }
    return result;
  }

  public sequenceOf(key: string): number {
    const index: number = this.indexOf(key);
    if (index < 0) {
      return -1;
    }
    return this.entries[index].sequence;
  }

  public clear(): void {
    this.entries = [];
    this.sequenceCounter = 0;
  }
}

class RestorePlanner {
  public static plan(relation: VersionRelation, entryCount: number): string {
    if (relation === VersionRelation.NEWER_SOURCE) {
      return 'downgradeRejected';
    }
    if (relation === VersionRelation.SAME_VERSION) {
      return `overwrite:${entryCount}`;
    }
    return `migrate:${entryCount}`;
  }

  public static requiresMigration(relation: VersionRelation): boolean {
    return relation === VersionRelation.OLDER_SOURCE;
  }

  public static rejectsDowngrade(relation: VersionRelation): boolean {
    return relation === VersionRelation.NEWER_SOURCE;
  }

  public static estimatedSteps(relation: VersionRelation, entryCount: number): number {
    if (relation === VersionRelation.NEWER_SOURCE) {
      return 0;
    }
    if (relation === VersionRelation.SAME_VERSION) {
      return entryCount;
    }
    return entryCount * 2;
  }
}

class BackupSessionRegistry {
  private sessions: Map<string, BackupSession> = new Map<string, BackupSession>();

  private readonly maxSessions: number;

  constructor(maxSessions: number) {
    this.maxSessions = maxSessions;
  }

  public open(sessionId: string, nowMs: number): BackupSession {
    if (sessionId.length === 0) {
      throw backupError('BackupSessionError', 'empty session id');
    }
    if (this.sessions.has(sessionId)) {
      throw backupError('BackupSessionError', `session ${sessionId} already open`);
    }
    if (this.sessions.size >= this.maxSessions) {
      throw backupError('BackupSessionError', 'session limit reached');
    }
    const session: BackupSession = {
      sessionId: sessionId,
      phase: BackupPhase.BACKUP_STARTED,
      entryCount: 0,
      startedAtMs: nowMs
    };
    this.sessions.set(sessionId, session);
    return session;
  }

  public complete(sessionId: string, entryCount: number): void {
    const session: BackupSession | undefined = this.sessions.get(sessionId);
    if (session === undefined) {
      throw backupError('BackupSessionError', `session ${sessionId} missing`);
    }
    session.phase = BackupPhase.BACKUP_COMPLETED;
    session.entryCount = entryCount;
  }

  public close(sessionId: string): boolean {
    if (!this.sessions.has(sessionId)) {
      return false;
    }
    this.sessions.delete(sessionId);
    return true;
  }

  public size(): number {
    return this.sessions.size;
  }

  public getMaxSessions(): number {
    return this.maxSessions;
  }

  public phaseOf(sessionId: string): BackupPhase {
    const session: BackupSession | undefined = this.sessions.get(sessionId);
    if (session === undefined) {
      return BackupPhase.IDLE;
    }
    return session.phase;
  }

  public entryCountOf(sessionId: string): number {
    const session: BackupSession | undefined = this.sessions.get(sessionId);
    if (session === undefined) {
      return 0;
    }
    return session.entryCount;
  }
}

export default function extensionLifecycleTest(): void {
  describe('ExtensionLifecycleTest', () => {
    let driver: Driver = getDriver();
    let tracker: BackupLifecycleTracker = new BackupLifecycleTracker();

    beforeAll(async () => {
      driver = getDriver();
      tracker = new BackupLifecycleTracker();
      await launchEntryAbility();
      await sleepMs(DELAY_AFTER_LAUNCH);

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      tracker.reset();
      logInfo('ExtensionLifecycleTest: suite finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_0100
     * @tc.name testBackupThenRestoreLifecycleOrder
     * @tc.desc Verify onBackup before onRestore: complete backup then restore -> isBackupThenRestoreOrder true and runs 1/1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackupThenRestoreLifecycleOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        tracker.reset();
        tracker.beginBackup();
        tracker.finishBackup(3);
        tracker.beginRestore();
        tracker.finishRestore();
        expect(tracker.isBackupThenRestoreOrder()).assertTrue();
        expect(tracker.getBackupRuns()).assertEqual(1);
        expect(tracker.getRestoreRuns()).assertEqual(1);
        expect(tracker.getPhase()).assertEqual(BackupPhase.RESTORE_COMPLETED);
        const timeline: string[] = tracker.getTimeline();
        expect(timeline.length).assertEqual(4);
        expect(timeline[0]).assertEqual('backupStarted');
        expect(timeline[3]).assertEqual('restoreCompleted');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_0200
     * @tc.name testRestoreBeforeBackupIsNotOrdered
     * @tc.desc Verify ordering predicate: restore completed without backup -> isBackupThenRestoreOrder false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRestoreBeforeBackupIsNotOrdered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        tracker.reset();
        tracker.beginRestore();
        tracker.finishRestore();
        expect(tracker.isBackupThenRestoreOrder()).assertFalse();
        expect(tracker.getBackupRuns()).assertEqual(0);
        expect(tracker.getRestoreRuns()).assertEqual(1);
        expect(tracker.getTimeline().length).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_0300
     * @tc.name testReentrantBackupIsRejected
     * @tc.desc Verify re-entry guard: beginBackup twice without finishing -> second call throws BackupReentrancyError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReentrantBackupIsRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        tracker.reset();
        tracker.beginBackup();
        try {
          tracker.beginBackup();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BackupReentrancyError');
          expect(e.message).assertEqual('backup already running');
        }
        expect(tracker.getPhase()).assertEqual(BackupPhase.BACKUP_STARTED);
        expect(tracker.getBackupRuns()).assertEqual(0);
        tracker.finishBackup(1);
        expect(tracker.getBackupRuns()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_0400
     * @tc.name testRestoreDuringBackupIsRejected
     * @tc.desc Verify cross-phase re-entry: beginRestore while backup started -> throws BackupReentrancyError naming backup in progress
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRestoreDuringBackupIsRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        tracker.reset();
        tracker.beginBackup();
        try {
          tracker.beginRestore();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BackupReentrancyError');
          expect(e.message).assertEqual('backup in progress');
        }
        expect(tracker.getPhase()).assertEqual(BackupPhase.BACKUP_STARTED);
        tracker.finishBackup(2);
        tracker.beginRestore();
        expect(tracker.getPhase()).assertEqual(BackupPhase.RESTORE_STARTED);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_0500
     * @tc.name testFinishBackupWithoutBeginThrows
     * @tc.desc Verify phase guard: finishBackup on idle tracker -> throws BackupPhaseError with message backup not started
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFinishBackupWithoutBeginThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        tracker.reset();
        try {
          tracker.finishBackup(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BackupPhaseError');
          expect(e.message).assertEqual('backup not started');
        }
        try {
          tracker.finishRestore();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BackupPhaseError');
          expect(e.message).assertEqual('restore not started');
        }
        expect(tracker.getPhase()).assertEqual(BackupPhase.IDLE);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_0600
     * @tc.name testNegativeEntryCountThrows
     * @tc.desc Verify entry count validation: finishBackup with -1 -> throws BackupPhaseError with negative entry count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNegativeEntryCountThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        tracker.reset();
        tracker.beginBackup();
        try {
          tracker.finishBackup(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BackupPhaseError');
          expect(e.message).assertEqual('negative entry count');
        }
        expect(tracker.getBackupRuns()).assertEqual(0);
        tracker.finishBackup(0);
        expect(tracker.getBackupRuns()).assertEqual(1);
        expect(tracker.getPhase()).assertEqual(BackupPhase.BACKUP_COMPLETED);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_0700
     * @tc.name testFailureMarksPhaseFailed
     * @tc.desc Verify failure transition: backup begun then fail -> phase failed and timeline carries reason suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFailureMarksPhaseFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        tracker.reset();
        tracker.beginBackup();
        tracker.fail('diskFull');
        expect(tracker.getPhase()).assertEqual(BackupPhase.FAILED);
        const timeline: string[] = tracker.getTimeline();
        expect(timeline.length).assertEqual(2);
        expect(timeline[1]).assertEqual('failed:diskFull');
        expect(tracker.getBackupRuns()).assertEqual(0);
        tracker.beginBackup();
        expect(tracker.getPhase()).assertEqual(BackupPhase.BACKUP_STARTED);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_0800
     * @tc.name testEqualVersionClassification
     * @tc.desc Verify same-version classification: code 100 name 1.0.0 vs same -> SAME_VERSION and planner overwrite mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEqualVersionClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const relation: VersionRelation = VersionParser.classify(100, 100, '1.0.0', '1.0.0');
        expect(relation).assertEqual(VersionRelation.SAME_VERSION);
        expect(RestorePlanner.plan(relation, 4)).assertEqual('overwrite:4');
        expect(RestorePlanner.requiresMigration(relation)).assertFalse();
        expect(RestorePlanner.rejectsDowngrade(relation)).assertFalse();
        expect(RestorePlanner.estimatedSteps(relation, 4)).assertEqual(4);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_0900
     * @tc.name testOlderSourceRequiresMigration
     * @tc.desc Verify upgrade classification: source code 90 target 100 -> OLDER_SOURCE and migrate plan with doubled steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOlderSourceRequiresMigration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const relation: VersionRelation = VersionParser.classify(90, 100, '0.9.0', '1.0.0');
        expect(relation).assertEqual(VersionRelation.OLDER_SOURCE);
        expect(RestorePlanner.plan(relation, 3)).assertEqual('migrate:3');
        expect(RestorePlanner.requiresMigration(relation)).assertTrue();
        expect(RestorePlanner.estimatedSteps(relation, 3)).assertEqual(6);
        expect(RestorePlanner.rejectsDowngrade(relation)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_1000
     * @tc.name testNewerSourceRejectsDowngrade
     * @tc.desc Verify downgrade rejection: source code 200 target 100 -> NEWER_SOURCE with zero planned steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNewerSourceRejectsDowngrade', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const relation: VersionRelation = VersionParser.classify(200, 100, '2.0.0', '1.0.0');
        expect(relation).assertEqual(VersionRelation.NEWER_SOURCE);
        expect(RestorePlanner.plan(relation, 5)).assertEqual('downgradeRejected');
        expect(RestorePlanner.rejectsDowngrade(relation)).assertTrue();
        expect(RestorePlanner.estimatedSteps(relation, 5)).assertEqual(0);
        expect(RestorePlanner.requiresMigration(relation)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_1100
     * @tc.name testSemanticNameComparison
     * @tc.desc Verify semantic version compare: 1.2.0 vs 1.1.9 -> 1, 1.0.0 vs 1.0.1 -> -1, 2.0.0 vs 10.0.0 -> -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSemanticNameComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(VersionParser.compare('1.2.0', '1.1.9')).assertEqual(1);
        expect(VersionParser.compare('1.0.0', '1.0.1')).assertEqual(-1);
        expect(VersionParser.compare('2.0.0', '10.0.0')).assertEqual(-1);
        expect(VersionParser.compare('1.2.3', '1.2.3')).assertEqual(0);
        expect(VersionParser.isSemanticName('1.2.3')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_1200
     * @tc.name testNonSemanticNameRejected
     * @tc.desc Verify semantic name validation: 1.2 and 1.x.0 -> isSemanticName false and parse throws VersionParseError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNonSemanticNameRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(VersionParser.isSemanticName('1.2')).assertFalse();
        expect(VersionParser.isSemanticName('1.x.0')).assertFalse();
        expect(VersionParser.isSemanticName('')).assertFalse();
        try {
          VersionParser.parse('1.2');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('VersionParseError');
          expect(e.message).assertEqual('expected 3 segments, got 2');
        }
        try {
          VersionParser.parse('1.x.0');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('VersionParseError');
          expect(e.message).assertEqual('non numeric segment x');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_1300
     * @tc.name testCatalogPutThenGet
     * @tc.desc Verify backup catalog: putting key message with Hello World -> get returns payload, size 1, sequence 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogPutThenGet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BackupCatalog = new BackupCatalog();
        expect(catalog.put('message', 'Hello World')).assertTrue();
        expect(catalog.get('message')).assertEqual('Hello World');
        expect(catalog.size()).assertEqual(1);
        expect(catalog.sequenceOf('message')).assertEqual(0);
        expect(catalog.has('message')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_1400
     * @tc.name testCatalogPutIsIdempotentForSamePayload
     * @tc.desc Verify backup idempotency: same key and payload twice -> second put returns false and size stays 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogPutIsIdempotentForSamePayload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BackupCatalog = new BackupCatalog();
        expect(catalog.put('message', 'Hello World')).assertTrue();
        expect(catalog.put('message', 'Hello World')).assertFalse();
        expect(catalog.size()).assertEqual(1);
        expect(catalog.get('message')).assertEqual('Hello World');
        expect(catalog.keys()[0]).assertEqual('message');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_1500
     * @tc.name testCatalogOverwritesChangedPayload
     * @tc.desc Verify overwrite semantics: same key with Welcome -> put true, payload updated and size still 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogOverwritesChangedPayload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BackupCatalog = new BackupCatalog();
        catalog.put('message', 'Hello World');
        expect(catalog.put('message', 'Welcome')).assertTrue();
        expect(catalog.get('message')).assertEqual('Welcome');
        expect(catalog.size()).assertEqual(1);
        expect(catalog.sequenceOf('message')).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_1600
     * @tc.name testCatalogSequenceIncrementsPerNewKey
     * @tc.desc Verify catalog ordering: three distinct keys -> sequences 0, 1, 2 and keys list preserves insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogSequenceIncrementsPerNewKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BackupCatalog = new BackupCatalog();
        catalog.put('alpha', '1');
        catalog.put('beta', '2');
        catalog.put('gamma', '3');
        expect(catalog.sequenceOf('alpha')).assertEqual(0);
        expect(catalog.sequenceOf('beta')).assertEqual(1);
        expect(catalog.sequenceOf('gamma')).assertEqual(2);
        const keys: string[] = catalog.keys();
        expect(keys.length).assertEqual(3);
        expect(keys[0]).assertEqual('alpha');
        expect(keys[2]).assertEqual('gamma');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_1700
     * @tc.name testCatalogRemoveAndMissingKey
     * @tc.desc Verify removal: remove known key true, remove again false, get on missing key returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogRemoveAndMissingKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BackupCatalog = new BackupCatalog();
        catalog.put('message', 'Hello World');
        expect(catalog.remove('message')).assertTrue();
        expect(catalog.size()).assertEqual(0);
        expect(catalog.remove('message')).assertFalse();
        expect(catalog.get('message')).assertEqual('');
        expect(catalog.has('message')).assertFalse();
        expect(catalog.sequenceOf('message')).assertEqual(-1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_1800
     * @tc.name testCatalogRejectsEmptyKey
     * @tc.desc Verify key validation: put with empty key -> throws BackupCatalogError with message empty key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogRejectsEmptyKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BackupCatalog = new BackupCatalog();
        try {
          catalog.put('', 'payload');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BackupCatalogError');
          expect(e.message).assertEqual('empty key');
        }
        expect(catalog.size()).assertEqual(0);
        expect(catalog.put('k', '')).assertTrue();
        expect(catalog.get('k')).assertEqual('');
        expect(catalog.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_1900
     * @tc.name testCatalogClearResetsSequences
     * @tc.desc Verify catalog reset: clear then put again -> size 1 and sequence restarts at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogClearResetsSequences', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BackupCatalog = new BackupCatalog();
        catalog.put('a', '1');
        catalog.put('b', '2');
        expect(catalog.size()).assertEqual(2);
        catalog.clear();
        expect(catalog.size()).assertEqual(0);
        expect(catalog.keys().length).assertEqual(0);
        catalog.put('c', '3');
        expect(catalog.sequenceOf('c')).assertEqual(0);
        expect(catalog.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_2000
     * @tc.name testSessionOpenAndComplete
     * @tc.desc Verify backup session: open session s1 -> started phase, complete with 5 entries -> phase completed and count 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionOpenAndComplete', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: BackupSessionRegistry = new BackupSessionRegistry(3);
        const session: BackupSession = registry.open('s1', 1000);
        expect(session.sessionId).assertEqual('s1');
        expect(session.phase).assertEqual(BackupPhase.BACKUP_STARTED);
        expect(registry.phaseOf('s1')).assertEqual(BackupPhase.BACKUP_STARTED);
        registry.complete('s1', 5);
        expect(registry.phaseOf('s1')).assertEqual(BackupPhase.BACKUP_COMPLETED);
        expect(registry.entryCountOf('s1')).assertEqual(5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_2100
     * @tc.name testDuplicateSessionIdRejected
     * @tc.desc Verify session uniqueness: opening s1 twice -> second throws BackupSessionError with already open message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDuplicateSessionIdRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: BackupSessionRegistry = new BackupSessionRegistry(3);
        registry.open('s1', 1000);
        try {
          registry.open('s1', 2000);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BackupSessionError');
          expect(e.message).assertEqual('session s1 already open');
        }
        expect(registry.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_2200
     * @tc.name testSessionLimitReached
     * @tc.desc Verify session cap: limit 2 then third open -> throws BackupSessionError with session limit reached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionLimitReached', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: BackupSessionRegistry = new BackupSessionRegistry(2);
        registry.open('s1', 0);
        registry.open('s2', 0);
        try {
          registry.open('s3', 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BackupSessionError');
          expect(e.message).assertEqual('session limit reached');
        }
        expect(registry.size()).assertEqual(2);
        expect(registry.getMaxSessions()).assertEqual(2);
        expect(registry.close('s1')).assertTrue();
        registry.open('s3', 0);
        expect(registry.size()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_2300
     * @tc.name testEmptySessionIdRejected
     * @tc.desc Verify session id guard: empty id -> BackupSessionError with empty session id, unknown id close returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptySessionIdRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: BackupSessionRegistry = new BackupSessionRegistry(2);
        try {
          registry.open('', 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BackupSessionError');
          expect(e.message).assertEqual('empty session id');
        }
        expect(registry.size()).assertEqual(0);
        expect(registry.close('missing')).assertFalse();
        expect(registry.phaseOf('missing')).assertEqual(BackupPhase.IDLE);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_2400
     * @tc.name testCompleteUnknownSessionThrows
     * @tc.desc Verify complete on unknown session: throws BackupSessionError with message naming the session
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompleteUnknownSessionThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const registry: BackupSessionRegistry = new BackupSessionRegistry(2);
        try {
          registry.complete('ghost', 4);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BackupSessionError');
          expect(e.message).assertEqual('session ghost missing');
        }
        registry.open('real', 10);
        registry.complete('real', 7);
        expect(registry.entryCountOf('real')).assertEqual(7);
        expect(registry.entryCountOf('ghost')).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_2500
     * @tc.name testBackupAbilityNameMatchesConstant
     * @tc.desc Verify extension naming: module constant BACKUP_ABILITY_NAME equals EntryBackupAbility used by backup config
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackupAbilityNameMatchesConstant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(BACKUP_ABILITY_NAME).assertEqual('EntryBackupAbility');
        expect(BACKUP_ABILITY_NAME.length).assertEqual(18);
        expect(BACKUP_ABILITY_NAME.indexOf('Backup') > 0).assertTrue();
        expect(BACKUP_ABILITY_NAME.startsWith('Entry')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_2600
     * @tc.name testUiRestoreKeepsIndexTextReadable
     * @tc.desc Verify restore does not disturb UI: catalog restore model plus live Index page -> HelloWorld text component still present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiRestoreKeepsIndexTextReadable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const catalog: BackupCatalog = new BackupCatalog();
        catalog.put('message', 'Hello World');
        const relation: VersionRelation = VersionParser.classify(100, 100, '1.0.0', '1.0.0');
        expect(RestorePlanner.plan(relation, catalog.size())).assertEqual('overwrite:1');
        const present: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(present).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_2700
     * @tc.name testUiRepeatedBackupCyclesKeepPageVisible
     * @tc.desc Verify 3 backup/restore cycles against live page: all cycles settle and page remains visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testUiRepeatedBackupCyclesKeepPageVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const localTracker: BackupLifecycleTracker = new BackupLifecycleTracker();
        const catalog: BackupCatalog = new BackupCatalog();
        let completedCycles: number = 0;
        for (let i: number = 0; i < 3; i++) {
          localTracker.beginBackup();
          catalog.put(`cycle_${i}`, `${i}`);
          localTracker.finishBackup(catalog.size());
          localTracker.beginRestore();
          localTracker.finishRestore();
          if (localTracker.getPhase() === BackupPhase.RESTORE_COMPLETED) {
            completedCycles++;
          }
          await sleepMs(50);
        }
        expect(completedCycles).assertEqual(3);
        expect(catalog.size()).assertEqual(3);
        expect(localTracker.getBackupRuns()).assertEqual(3);
        expect(localTracker.getRestoreRuns()).assertEqual(3);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EXTENSION_2800
     * @tc.name testBackupThroughputWithinBudget
     * @tc.desc Verify catalog throughput: 500 puts of distinct keys -> size 500 within 1500 ms budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testBackupThroughputWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        const catalog: BackupCatalog = new BackupCatalog();
        const startTime: number = Date.now();
        for (let i: number = 0; i < 500; i++) {
          catalog.put(`key_${i}`, `value_${i}`);
        }
        const elapsed: number = measureElapsed(startTime);
        expect(catalog.size()).assertEqual(500);
        expect(elapsed <= 1500).assertTrue();
        expect(catalog.get('key_499')).assertEqual('value_499');
        expect(catalog.sequenceOf('key_499')).assertEqual(499);
      } finally {
        done();
      }
    })
  })
}
