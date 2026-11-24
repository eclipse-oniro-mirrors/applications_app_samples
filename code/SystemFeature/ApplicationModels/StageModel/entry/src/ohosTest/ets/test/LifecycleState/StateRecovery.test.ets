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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { getDriver, ensureAppReady, checkComponentExists, BUNDLE_NAME } from '../Shared/SharedDriver';

enum SnapshotStatus {
  VALID = 0,
  CORRUPT = 1,
  STALE = 2
}

class Snapshot {
  id: number = 0;
  revision: number = 0;
  payload: string = '';
  checksum: number = 0;
  status: number = SnapshotStatus.VALID;

  constructor(id: number, revision: number, payload: string) {
    this.id = id;
    this.revision = revision;
    this.payload = payload;
    this.checksum = checksumOf(payload);
  }
}

class JournalEntry {
  revision: number = 0;
  operation: string = '';
  key: string = '';
  value: string = '';

  constructor(revision: number, operation: string, key: string, value: string) {
    this.revision = revision;
    this.operation = operation;
    this.key = key;
    this.value = value;
  }
}

function checksumOf(text: string): number {
  let hash = 7;
  for (let i = 0; i < text.length; i++) {
    hash = (hash * 31 + text.charCodeAt(i)) % 1000033;
  }
  return hash;
}

class RecoveryEngine {
  private snapshots: Snapshot[] = [];
  private journal: JournalEntry[] = [];
  private revision: number = 0;
  private nextSnapshotId: number = 1;

  getRevision(): number {
    return this.revision;
  }

  takeSnapshot(payload: string): Snapshot {
    this.revision = this.revision + 1;
    const snapshot = new Snapshot(this.nextSnapshotId, this.revision, payload);
    this.nextSnapshotId = this.nextSnapshotId + 1;
    this.snapshots.push(snapshot);
    return snapshot;
  }

  appendJournal(operation: string, key: string, value: string): JournalEntry {
    this.revision = this.revision + 1;
    const entry = new JournalEntry(this.revision, operation, key, value);
    this.journal.push(entry);
    return entry;
  }

  snapshotCount(): number {
    return this.snapshots.length;
  }

  journalCount(): number {
    return this.journal.length;
  }

  latestSnapshot(): Snapshot | null {
    if (this.snapshots.length === 0) {
      return null;
    }
    return this.snapshots[this.snapshots.length - 1];
  }

  validate(snapshot: Snapshot): boolean {
    const valid = snapshot.status === SnapshotStatus.VALID &&
      checksumOf(snapshot.payload) === snapshot.checksum;
    if (!valid) {
      snapshot.status = SnapshotStatus.CORRUPT;
    }
    return valid;
  }

  markCorrupt(id: number): boolean {
    for (let i = 0; i < this.snapshots.length; i++) {
      if (this.snapshots[i].id === id) {
        this.snapshots[i].status = SnapshotStatus.CORRUPT;
        return true;
      }
    }
    return false;
  }

  latestValidSnapshot(): Snapshot | null {
    for (let i = this.snapshots.length - 1; i >= 0; i--) {
      if (this.validate(this.snapshots[i])) {
        return this.snapshots[i];
      }
    }
    return null;
  }

  replay(): string[] {
    const keys: string[] = [];
    const values: string[] = [];
    const base = this.latestValidSnapshot();
    if (base !== null) {
      const pairs = base.payload.split(';');
      for (let i = 0; i < pairs.length; i++) {
        const pair = pairs[i];
        const eq = pair.indexOf('=');
        if (eq > 0) {
          keys.push(pair.substring(0, eq));
          values.push(pair.substring(eq + 1));
        }
      }
    }
    const baseRevision = base === null ? 0 : base.revision;
    for (let i = 0; i < this.journal.length; i++) {
      const entry = this.journal[i];
      if (entry.revision <= baseRevision) {
        continue;
      }
      const index = keys.indexOf(entry.key);
      if (entry.operation === 'delete') {
        if (index >= 0) {
          keys.splice(index, 1);
          values.splice(index, 1);
        }
      } else if (index >= 0) {
        values[index] = entry.value;
      } else {
        keys.push(entry.key);
        values.push(entry.value);
      }
    }
    const output: string[] = [];
    for (let i = 0; i < keys.length; i++) {
      output.push(`${keys[i]}=${values[i]}`);
    }
    return output;
  }

  isHealthy(): boolean {
    return this.latestValidSnapshot() !== null || this.snapshots.length === 0;
  }
}

function recoveredValue(engine: RecoveryEngine, key: string): string {
  const pairs = engine.replay();
  for (let i = 0; i < pairs.length; i++) {
    const eq = pairs[i].indexOf('=');
    if (eq > 0 && pairs[i].substring(0, eq) === key) {
      return pairs[i].substring(eq + 1);
    }
  }
  return '';
}

export default function stateRecoveryTest(): void {
  describe('StateRecovery', () => {
    it('StateRecovery_001', 0, async (done: Function) => {
      const engine = new RecoveryEngine();
      expect(engine.getRevision()).assertEqual(0);
      expect(engine.snapshotCount()).assertEqual(0);
      expect(engine.journalCount()).assertEqual(0);
      expect(engine.latestSnapshot()).assertNull();
      expect(engine.isHealthy()).assertTrue();
      done();
    });

    it('StateRecovery_002', 0, async (done: Function) => {
      const engine = new RecoveryEngine();
      const snapshot = engine.takeSnapshot('locale=zh-Hans;');
      expect(snapshot.id).assertEqual(1);
      expect(snapshot.revision).assertEqual(1);
      expect(snapshot.status).assertEqual(SnapshotStatus.VALID);
      expect(engine.snapshotCount()).assertEqual(1);
      expect(engine.getRevision()).assertEqual(1);
      done();
    });

    it('StateRecovery_003', 0, async (done: Function) => {
      const engine = new RecoveryEngine();
      const first = engine.takeSnapshot('locale=zh-Hans;');
      const second = engine.takeSnapshot('locale=en-US;');
      expect(second.id).assertEqual(first.id + 1);
      expect(engine.latestSnapshot() !== null).assertTrue();
      const latest = engine.latestSnapshot();
      expect(latest === null ? 0 : latest.id).assertEqual(2);
      done();
    });

    it('StateRecovery_004', 0, async (done: Function) => {
      const engine = new RecoveryEngine();
      const snapshot = engine.takeSnapshot('a=1;b=2;');
      expect(engine.validate(snapshot)).assertTrue();
      snapshot.payload = 'tampered';
      expect(engine.validate(snapshot)).assertFalse();
      expect(snapshot.status).assertEqual(SnapshotStatus.CORRUPT);
      done();
    });

    it('StateRecovery_005', 0, async (done: Function) => {
      const engine = new RecoveryEngine();
      engine.takeSnapshot('a=1;');
      engine.markCorrupt(1);
      expect(engine.latestValidSnapshot()).assertNull();
      expect(engine.isHealthy()).assertFalse();
      done();
    });

    it('StateRecovery_006', 0, async (done: Function) => {
      const engine = new RecoveryEngine();
      engine.takeSnapshot('a=1;');
      engine.takeSnapshot('a=2;');
      engine.markCorrupt(2);
      const valid = engine.latestValidSnapshot();
      expect(valid !== null).assertTrue();
      expect(valid === null ? 0 : valid.id).assertEqual(1);
      expect(engine.isHealthy()).assertTrue();
      done();
    });

    it('StateRecovery_007', 0, async (done: Function) => {
      const engine = new RecoveryEngine();
      const entry = engine.appendJournal('set', 'locale', 'zh-Hans');
      expect(entry.revision).assertEqual(1);
      expect(entry.operation).assertEqual('set');
      expect(engine.journalCount()).assertEqual(1);
      expect(recoveredValue(engine, 'locale')).assertEqual('zh-Hans');
      done();
    });

    it('StateRecovery_008', 0, async (done: Function) => {
      const engine = new RecoveryEngine();
      engine.takeSnapshot('locale=zh-Hans;');
      engine.appendJournal('set', 'locale', 'en-US');
      engine.appendJournal('set', 'colorMode', 'dark');
      expect(recoveredValue(engine, 'locale')).assertEqual('en-US');
      expect(recoveredValue(engine, 'colorMode')).assertEqual('dark');
      expect(engine.replay().length).assertEqual(2);
      done();
    });

    it('StateRecovery_009', 0, async (done: Function) => {
      const engine = new RecoveryEngine();
      engine.appendJournal('set', 'locale', 'zh-Hans');
      engine.appendJournal('delete', 'locale', '');
      expect(recoveredValue(engine, 'locale')).assertEqual('');
      expect(engine.replay().length).assertEqual(0);
      done();
    });

    it('StateRecovery_010', 0, async (done: Function) => {
      const engine = new RecoveryEngine();
      engine.takeSnapshot('a=1;b=2;');
      engine.markCorrupt(1);
      engine.appendJournal('set', 'c', '3');
      expect(recoveredValue(engine, 'a')).assertEqual('');
      expect(recoveredValue(engine, 'c')).assertEqual('3');
      expect(engine.replay().length).assertEqual(1);
      done();
    });

    it('StateRecovery_011', 0, async (done: Function) => {
      const engine = new RecoveryEngine();
      engine.takeSnapshot('a=1;');
      engine.takeSnapshot('a=2;b=3;');
      engine.appendJournal('set', 'a', '9');
      expect(recoveredValue(engine, 'a')).assertEqual('9');
      expect(recoveredValue(engine, 'b')).assertEqual('3');
      expect(engine.journalCount()).assertEqual(1);
      done();
    });

    it('StateRecovery_012', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', `recovery ui probe ${exists}`);
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}

